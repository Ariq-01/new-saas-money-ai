import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/chat_message.dart';
import '../../services/ai_service.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final _ai = AiService();

  ChatBloc() : super(const ChatState()) {
    on<ChatSend>(_onSend);
  }

  Future<void> _onSend(ChatSend event, Emitter<ChatState> emit) async {
    emit(state.copyWith(pendingText: event.text));

    try {
      final aiResponse = await _ai.chat(event.text);
      emit(state.copyWith(
        messages: [...state.messages, ChatMessage(userText: event.text, aiText: aiResponse)],
        clearPending: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        messages: [...state.messages, ChatMessage(userText: event.text, aiText: 'Error: $e')],
        clearPending: true,
      ));
    }
  }
}
