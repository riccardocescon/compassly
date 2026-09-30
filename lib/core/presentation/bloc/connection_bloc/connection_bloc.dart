import 'dart:async';

import 'package:compassly/core/domain/entities/member_change.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:compassly/core/presentation/bloc/room_bloc/room_bloc.dart';
import 'package:compassly/core/presentation/usecase/session_answer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_event.dart';
part 'connection_state.dart';
part 'connection_bloc.freezed.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final Map<String, RTCPeerConnection> _peerConnections = {};
  final RoomBloc _roomBloc;
  final AuthBloc _authBloc;
  final SessionRepository _sessionRepository;
  final SessionAnswer _sessionAnswer;

  StreamSubscription<RoomState>? _roomSub;

  ConnectionBloc({
    required this._roomBloc,
    required this._authBloc,
    required this._sessionRepository,
    required this._sessionAnswer,
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
    on<_MemberChanged>((event, emit) async {
      switch (event.change) {
        case MemberJoined(:final member):
          final pc = await createPeerConnection({
            'iceServers': [
              {'urls': 'stun:stun.l.google.com:19302'},
            ],
          });
          _peerConnections[member.uid] = pc;
          final foAnswer = await _sessionAnswer.call(
            SessionAnswerParams(
              code: event.roomCode,
              memberUid: member.uid,
              uid: _authBloc.user!.uid,
            ),
          );
          break;

        case MemberExisting(:final member):
          final pc = await createPeerConnection({
            'iceServers': [
              {'urls': 'stun:stun.l.google.com:19302'},
            ],
          });
          _peerConnections[member.uid] = pc;
          break;

        case MemberLeft(:final member):
          await _peerConnections.remove(member.uid)?.close();
          break;
      }
    });
  }
}
