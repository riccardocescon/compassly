import 'package:compassly/core/data/repositories/firebase_auth_repository.dart';
import 'package:compassly/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:compassly/features/presentation/bloc/test_page_bloc/test_page_bloc.dart';
import 'package:compassly/firebase_options.dart';
import 'package:compassly/pages/test_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            authRepository: FirebaseAuthRepository(
              firebaseAuth: FirebaseAuth.instance,
            ),
          ),
        ),
      ],
      child: MaterialApp(
        home: BlocProvider(
          create: (context) =>
              TestPageBloc(authBloc: context.read())
                ..add(TestPageEvent.setup()),
          child: const TestPage(),
        ),
      ),
    ),
  );
}
