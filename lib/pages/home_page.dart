import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat/chat_bloc.dart';
import '../widgets/chat_loading/chat_field.dart';
import '../widgets/respons_ai.dart';
import '../widgets/chat_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  final _controller = TextEditingController();
  final _scroll = ScrollController();

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    _controller.clear();
    context.read<ChatBloc>().add(ChatSend(text));
  }

  @override
  void dispose() {
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatBloc, ChatState>(
              listener: (_, state) {
                if (!state.isLoading) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scroll.animateTo(_scroll.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  });
                }
              },
              builder: (_, state) => ListView(
                controller: _scroll,
                padding: const EdgeInsets.all(16),
                children: [
                  for (final msg in state.messages) ...[
                    ChatField(textUser: msg.userText),
                    const SizedBox(height: 8),
                    ResponsAI(text: msg.aiText),
                    const SizedBox(height: 16),
                  ],
                  if (state.pendingText != null)
                    ChatField(textUser: state.pendingText!, isLoading: true),
                ],
              ),
            ),
          ),
          ChatInput(controller: _controller, onSend: _send),
        ],
      ),
    );
  }
}
