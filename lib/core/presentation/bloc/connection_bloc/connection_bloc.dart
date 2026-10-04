import 'dart:async';
import 'dart:developer';

import 'package:compassly/core/domain/entities/connection_data.dart';
import 'package:compassly/core/domain/entities/location_data.dart';
import 'package:compassly/core/domain/entities/member.dart';
import 'package:compassly/core/domain/entities/member_change.dart';
import 'package:compassly/core/domain/entities/peer_connection_data.dart';
import 'package:compassly/core/domain/entities/peer_status.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:compassly/core/presentation/bloc/location_bloc/location_bloc.dart';
import 'package:compassly/core/presentation/bloc/room_bloc/room_bloc.dart';
import 'package:compassly/core/presentation/usecase/offer_session.dart';
import 'package:compassly/core/presentation/usecase/session_answer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ribs_core/ribs_core.dart';

part 'connection_event.dart';
part 'connection_state.dart';
part 'connection_bloc.freezed.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final _peerConnections = <PeerConnectionData>[];

  /// Cache dello stato per membro: è la fonte di verità, gli stati emessi
  /// ne sono solo una proiezione. Sopravvive a qualsiasi altro stato emesso.
  final _peerStatuses = <String, ConnectionData>{};

  final RoomBloc _roomBloc;
  final AuthBloc _authBloc;
  final LocationBloc _locationBloc;
  final SessionRepository _sessionRepository;
  final SessionAnswerUsecase _sessionAnswer;
  final OfferSessionUsecase _offerSessionUsecase;

  StreamSubscription<RoomState>? _roomSub;

  int get _connectedCount => _peerStatuses.values
      .map((e) => e.status)
      .whereType<PeerConnected>()
      .length;

  ConnectionBloc({
    required this._roomBloc,
    required this._authBloc,
    required this._locationBloc,
    required this._sessionRepository,
    required this._sessionAnswer,
    required this._offerSessionUsecase,
  }) : super(const ConnectionState.init()) {
    _roomSub = _roomBloc.stream.listen((roomState) {
      roomState.maybeMap(
        data: (value) {
          for (final memberChange in value.members ?? []) {
            add(
              ConnectionEvent.memberChanged(
                roomCode: value.room!.code,
                change: memberChange,
              ),
            );
          }
        },
        orElse: () {},
      );
    });

    _locationBloc.stream.listen((locationState) {
      locationState.maybeMap(
        data: (value) {
          final destinationPeers = _peerConnections
              .where(
                (e) =>
                    e.dataChannel?.state ==
                    RTCDataChannelState.RTCDataChannelOpen,
              )
              .toList();

          final data = RTCDataChannelMessage(value.data);
          for (final peerConnectionData in destinationPeers) {
            peerConnectionData.dataChannel?.send(data);
          }
        },
        orElse: () {},
      );
    });

    on<_MemberChanged>((event, emit) async {
      switch (event.change) {
        case MemberJoined(:final member):
          _handleMemberJoined(
            roomCode: event.roomCode,
            member: member,
            emit: emit,
          );
          break;

        case MemberExisting(:final member):
          _handleMemberExisting(
            roomCode: event.roomCode,
            member: member,
            emit: emit,
          );
          break;

        case MemberLeft(:final member):
          _handleMemberLeft(member: member, emit: emit);
          break;
      }
    });

    on<_LocationReceived>((event, emit) {
      final oldStatus = _peerStatuses[event.uid];
      if (oldStatus == null) return;

      _peerStatuses[event.uid] = oldStatus.copyWith(
        locationData: event.locationData,
      );
      emit(ConnectionState.data(connections: _peerStatuses.values.toList()));
    });
  }

  void _handleMemberJoined({
    required String roomCode,
    required Member member,
    required Emitter<ConnectionState> emit,
  }) async {
    final pc = await _createPeerConnection(member: member, emit: emit);

    final currentConnection = PeerConnectionData(
      remoteMemberUid: member.uid,
      connection: pc,
      dataChannel: null,
    );
    pc.onDataChannel = (channel) {
      currentConnection.dataChannel ??= channel;
      _listenChannel(member.uid, channel);
    };

    _peerConnections.add(currentConnection);
    final foAnswer = await _sessionAnswer.call(
      SessionAnswerParams(
        code: roomCode,
        memberUid: member.uid,
        uid: _authBloc.user!.uid,
        peerConnection: pc,
      ),
    );
    if (foAnswer.isLeft) {
      log('Error: ${foAnswer.leftOption.getOrNull?.message}');
      await _closeMemberConnection(member.uid);
    }
    _setPeer(emit, member, _toStatus(foAnswer));
  }

  void _handleMemberExisting({
    required String roomCode,
    required Member member,
    required Emitter<ConnectionState> emit,
  }) async {
    final pc = await _createPeerConnection(member: member, emit: emit);

    final dataChannel = await pc.createDataChannel(
      'compassly',
      RTCDataChannelInit()..ordered = true,
    );
    _listenChannel(member.uid, dataChannel);
    final peerConnection = PeerConnectionData(
      remoteMemberUid: member.uid,
      connection: pc,
      dataChannel: dataChannel,
    );

    _peerConnections.add(peerConnection);
    var foCreateConnection = await _offerSessionUsecase.call(
      CreatePeerConnectionParams(
        peerConnectionData: peerConnection,
        roomCode: roomCode,
        uid: _authBloc.user!.uid,
      ),
    );
    if (foCreateConnection.isRight) {
      try {
        await _waitChannelOpen(dataChannel);
      } catch (e) {
        log('Error: ${e.toString()}');
        foCreateConnection = Left(SessionFailure.catched(e.toString()));
      }
    }

    if (foCreateConnection.isLeft) {
      log('Error: ${foCreateConnection.leftOption.getOrNull?.message}');
      await _closeMemberConnection(member.uid);
    }

    _setPeer(emit, member, _toStatus(foCreateConnection));
  }

  void _handleMemberLeft({
    required Member member,
    required Emitter<ConnectionState> emit,
  }) async {
    await _closeMemberConnection(member.uid);
    _removePeer(emit, member.uid);
  }

  Future<RTCPeerConnection> _createPeerConnection({
    required Member member,
    required Emitter<ConnectionState> emit,
  }) async {
    _setPeer(emit, member, const PeerStatus.connecting());
    return await createPeerConnection({
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ],
    });
  }

  PeerStatus _toStatus(Either<Failure, void> result) => result.fold<PeerStatus>(
    (failure) => PeerStatus.failed(failure: failure),
    (_) => const PeerStatus.connected(),
  );

  void _setPeer(
    Emitter<ConnectionState> emit,
    Member member,
    PeerStatus status,
  ) {
    final initPeerLength = _connectedCount;
    final oldStatus = _peerStatuses[member.uid];
    _peerStatuses[member.uid] =
        oldStatus?.copyWith(status: status) ??
        ConnectionData(member: member, status: status, locationData: null);
    _startLocationBloc(initPeerLength);

    _emitPeers(emit);
  }

  void _removePeer(Emitter<ConnectionState> emit, String uid) {
    final initPeerLength = _connectedCount;
    _peerStatuses.remove(uid);
    _closeLocationBloc(initPeerLength);
    _emitPeers(emit);
  }

  /// Si emette una copia: freezed incapsula la mappa in una view, non la
  /// duplica, e mutare la cache cambierebbe anche lo stato già emesso.
  void _emitPeers(Emitter<ConnectionState> emit) {
    emit(ConnectionState.data(connections: _peerStatuses.values.toList()));
  }

  void _startLocationBloc(int initPeerLength) {
    final startLcoationService = initPeerLength == 0 && _connectedCount > 0;
    if (startLcoationService) {
      _locationBloc.add(LocationEvent.start());
    }
  }

  void _closeLocationBloc(int initPeerLength) {
    if (initPeerLength > 0 && _connectedCount == 0) {
      _locationBloc.add(LocationEvent.stop());
    }
  }

  Future<void> _closeMemberConnection(String memberUid) async {
    final index = _peerConnections.indexWhere(
      (e) => e.remoteMemberUid == memberUid,
    );
    if (index == -1) return;

    final connection = _peerConnections.removeAt(index);

    await connection.dataChannel?.close();
    await connection.connection.close();
  }

  Future<void> _waitChannelOpen(RTCDataChannel channel) async {
    if (channel.state == RTCDataChannelState.RTCDataChannelOpen) {
      return;
    }

    await channel.stateChangeStream
        .timeout(const Duration(seconds: 30))
        .firstWhere((state) => state == RTCDataChannelState.RTCDataChannelOpen);
  }

  void _listenChannel(String uid, RTCDataChannel channel) async {
    try {
      channel.onMessage = (message) {
        final text = message.text;
        try {
          final data = LocationData.fromJson(message.text);
          add(ConnectionEvent.locationReceived(uid: uid, locationData: data));
        } catch (e) {
          log('Error: ${e.toString()}. Text: $text');
        }
      };

      await _waitChannelOpen(channel);
      final lastLocationData = _locationBloc.state.maybeMap(
        data: (value) => value.data,
        orElse: () => null,
      );
      if (lastLocationData != null) {
        await channel.send(RTCDataChannelMessage(lastLocationData));
      }
    } catch (e) {
      log('Error: ${e.toString()}');
    }
  }
}
