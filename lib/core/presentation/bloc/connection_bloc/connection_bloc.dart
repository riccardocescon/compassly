import 'dart:async';
import 'dart:developer';

import 'package:compassly/core/domain/entities/member_change.dart';
import 'package:compassly/core/domain/entities/peer_connection_data.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:compassly/core/presentation/bloc/room_bloc/room_bloc.dart';
import 'package:compassly/core/presentation/usecase/create_peer_connection.dart';
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
  final RoomBloc _roomBloc;
  final AuthBloc _authBloc;
  final SessionRepository _sessionRepository;
  final SessionAnswer _sessionAnswer;
  final CreatePeerConnectionUsecase _createPeerConnectionUsecase;

  StreamSubscription<RoomState>? _roomSub;

  ConnectionBloc({
    required this._roomBloc,
    required this._authBloc,
    required this._sessionRepository,
    required this._sessionAnswer,
    required this._createPeerConnectionUsecase,
  }) : super(const ConnectionState.init()) {
    print('[DBG-RTC] ConnectionBloc created');
    _roomSub = _roomBloc.stream.listen((roomState) {
      print('[DBG-RTC] roomState=${roomState.runtimeType}');
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
    on<_MemberChanged>((event, emit) async {
      print('[DBG-RTC] memberChanged ${event.change.runtimeType}');
      switch (event.change) {
        case MemberJoined(:final member):
          final pc = await createPeerConnection({
            'iceServers': [
              {'urls': 'stun:stun.l.google.com:19302'},
            ],
          });
          final foAnswer = await _sessionAnswer.call(
            SessionAnswerParams(
              code: event.roomCode,
              memberUid: member.uid,
              uid: _authBloc.user!.uid,
              peerConnection: pc,
            ),
          );
          print('[DBG-RTC] sessionAnswer result isLeft=${foAnswer.isLeft}');
          break;

        case MemberExisting(:final member):
          final pc = await createPeerConnection({
            'iceServers': [
              {'urls': 'stun:stun.l.google.com:19302'},
            ],
          });

          final dataChannel = await pc.createDataChannel(
            'compassly',
            RTCDataChannelInit()..ordered = true,
          );
          final peerConnection = PeerConnectionData(
            remoteMemberUid: member.uid,
            connection: pc,
            dataChannel: dataChannel,
          );

          _peerConnections.add(peerConnection);
          final foCreateConnection = await _createPeerConnectionUsecase.call(
            CreatePeerConnectionParams(
              peerConnectionData: peerConnection,
              roomCode: event.roomCode,
              uid: _authBloc.user!.uid,
            ),
          );
          print('[DBG-RTC] createPeerConnection result isLeft=${foCreateConnection.isLeft}');
          if (foCreateConnection.isLeft) {
            log('Error: ${foCreateConnection.leftOption.getOrNull?.message}');
            await _closeMemberConnection(member.uid);
          }

          break;

        case MemberLeft(:final member):
          await _closeMemberConnection(member.uid);
          break;
      }
    });
  }

  Future<void> _closeMemberConnection(String memberUid) async {
    final index = _peerConnections.indexWhere(
      (e) => e.remoteMemberUid == memberUid,
    );
    if (index == -1) return;

    final connection = _peerConnections.removeAt(index);

    await connection.dataChannel.close();
    await connection.connection.close();
  }
}
