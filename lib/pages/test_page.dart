import 'package:compassly/features/presentation/bloc/test_page_bloc/test_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Page')),
      body: Center(
        child: BlocBuilder<TestPageBloc, TestPageState>(
          builder: (context, state) {
            return state.maybeMap(
              loading: (value) =>
                  const Center(child: CircularProgressIndicator()),
              ui: (value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Uid: ${value.uid}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<TestPageBloc>().add(
                        TestPageEvent.createRoom(),
                      ),
                      child: Text('Create Room'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<TestPageBloc>().add(
                        TestPageEvent.leaveRoom(),
                      ),
                      child: Text('Leave Room'),
                    ),
                    const SizedBox(height: 16),
                    if (value.room != null) ...[
                      Text('Room: ${value.room!.code}'),
                      const SizedBox(height: 16),
                      Text('Members: ${value.room!.members.length}'),
                    ],
                  ],
                );
              },
              error: (value) => Center(child: Text('Error: ${value.message}')),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
