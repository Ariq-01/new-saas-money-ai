import 'dart:convert';
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
      final raw = await _ai.chat(event.text);
      final msg = _parseResponse(event.text, raw);
      emit(state.copyWith(messages: [...state.messages, msg], clearPending: true));
    } catch (e) {
      emit(state.copyWith(
        messages: [...state.messages, ChatMessage(userText: event.text, aiText: 'Error: $e')],
        clearPending: true,
      ));
    }
  }

  ChatMessage _parseResponse(String userText, String raw) {
    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      if (json['type'] == 'nutrition') {
        return ChatMessage(userText: userText, nutritionData: NutritionData.fromJson(json));
      }
      return ChatMessage(userText: userText, aiText: json['message'] as String? ?? raw);
    } catch (_) {
      return ChatMessage(userText: userText, aiText: raw);
    }
  }
}
