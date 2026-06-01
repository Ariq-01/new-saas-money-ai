import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat/chat_bloc.dart';
import '../widgets/chat_loading/chat_field.dart';
import '../widgets/respons_ai.dart';
import '../widgets/chat_input.dart';
import '../widgets/features/calories/calories_section.dart';
import '../widgets/app_drawer.dart';
import '../widgets/home_header/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => ChatBloc(), child: const _HomeView());
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
  String? _fadingText;
  bool _showFading = false;

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    _controller.clear();
    context.read<ChatBloc>().add(ChatSend(text));
  }

  void _onStateChange(ChatState state) {
    if (!state.isLoading && _fadingText != null) {
      // AI done → trigger fade-out
      setState(() => _showFading = false);
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) setState(() => _fadingText = null);
      });
    } else if (state.isLoading && state.pendingText != null) {
      setState(() {
        _fadingText = state.pendingText;
        _showFading = true;
      });
    }

    if (!state.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scroll.hasClients) {
          _scroll.animateTo(
            _scroll.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final safePadding = mq.padding;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF3),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: BlocConsumer<ChatBloc, ChatState>(
                listener: (_, state) => _onStateChange(state),
                builder: (_, state) => ListView(
                  controller: _scroll,
                  padding: EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    16 + safePadding.bottom,
                  ),
                  children: [
                    const CaloriesSection(),
                    const SizedBox(height: 16),
                    for (final msg in state.messages) ...[
                      ResponsAI(text: msg.aiText),
                      const SizedBox(height: 16),
                    ],

                    if (_fadingText != null)
                      AnimatedOpacity(
                        opacity: _showFading ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 400),
                        child: ChatField(
                          textUser: _fadingText!,
                          isLoading: _showFading,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            ChatInput(controller: _controller, onSend: _send),
          ],
        ),
      ),
    );
  }
}
