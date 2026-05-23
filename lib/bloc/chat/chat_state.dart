part of 'chat_bloc.dart';

class ChatState {
  final List<ChatMessage> messages;
  final String? pendingText;

  const ChatState({this.messages = const [], this.pendingText});

  bool get isLoading => pendingText != null;

  ChatState copyWith({List<ChatMessage>? messages, String? pendingText, bool clearPending = false}) {
    return ChatState(
      messages: messages ?? this.messages,
      pendingText: clearPending ? null : pendingText ?? this.pendingText,
    );
  }
}
