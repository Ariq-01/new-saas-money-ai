part of 'chat_bloc.dart';

sealed class ChatEvent {}

class ChatSend extends ChatEvent {
  final String text;
  ChatSend(this.text);
}
