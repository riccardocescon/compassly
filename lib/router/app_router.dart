import 'package:compassly/features/presentation/bloc/test_page_bloc/test_page_bloc.dart';
import 'package:compassly/pages/test_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) =>
            TestPageBloc(authBloc: context.read(), roomBloc: context.read())
              ..add(TestPageEvent.setup()),
        child: const TestPage(),
      ),
    ),
  ],
);
