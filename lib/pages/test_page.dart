import 'package:compassly/core/domain/entities/room.dart';
import 'package:compassly/features/presentation/bloc/test_page_bloc/test_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              ui: (value) => _data(uid: value.uid, room: value.room),
              error: (value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Error: ${value.message}')),
                    _data(uid: null, room: null),
                  ],
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _data({required String? uid, required Room? room}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (uid != null) Text('Uid: $uid'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () =>
              context.read<TestPageBloc>().add(TestPageEvent.createRoom()),
          child: Text('Create Room'),
        ),
        Column(
          children: [
            SizedBox(
              width: 300,
              height: 100,
              child: TextFormField(controller: _controller),
            ),
            ElevatedButton(
              onPressed: () => context.read<TestPageBloc>().add(
                TestPageEvent.joinRoom(_controller.text),
              ),
              child: Text('Join'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () =>
              context.read<TestPageBloc>().add(TestPageEvent.leaveRoom()),
          child: Text('Leave Room'),
        ),
        const SizedBox(height: 16),
        if (room != null) ...[
          Text('Room: ${room.code}'),
          const SizedBox(height: 16),
          Text('Members: ${room.members.length}'),
        ],
      ],
    );
  }
}
