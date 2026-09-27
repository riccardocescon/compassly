import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compassly/core/data/api/room_api.dart';
import 'package:compassly/core/data/api/session_api.dart';
import 'package:compassly/core/data/repositories/firebase_auth_repository.dart';
import 'package:compassly/core/data/repositories/room_repository_impl.dart';
import 'package:compassly/core/data/repositories/session_repository_impl.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:compassly/core/presentation/bloc/room_bloc/room_bloc.dart';
import 'package:compassly/core/presentation/usecase/create_room.dart';
import 'package:compassly/core/presentation/usecase/join_room.dart';
import 'package:compassly/core/presentation/usecase/leave_room.dart';
import 'package:compassly/core/presentation/usecase/watch_members.dart';
import 'package:compassly/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            authRepository: FirebaseAuthRepository(
              firebaseAuth: FirebaseAuth.instance,
            ),
          )..add(AuthEvent.setup()),
        ),
        BlocProvider(
          create: (context) {
            final roomRepository = RoomRepositoryImpl(
              roomApi: RoomApi(firebase: FirebaseFirestore.instance),
            );
            final sessionRepository = SessionRepositoryImpl(
              sessionApi: SessionApi(firebase: FirebaseFirestore.instance),
            );

            return RoomBloc(
              authBloc: context.read(),
              createRoom: CreateRoomUsecase(roomRepository: roomRepository),
              joinRoom: JoinRoomUsecase(
                roomRepository: roomRepository,
                sessionRepository: sessionRepository,
              ),
              watchMembers: WatchMembersUsecase(
                roomRepository: roomRepository,
                sessionRepository: sessionRepository,
              ),
              leaveRoom: LeaveRoomUsecase(
                roomRepository: roomRepository,
                sessionRepository: sessionRepository,
              ),
            );
          },
        ),
      ],
      child: MaterialApp.router(routerConfig: appRouter),
    );
  }
}
