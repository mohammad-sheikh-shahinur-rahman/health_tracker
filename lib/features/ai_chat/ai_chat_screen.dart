
import 'package:flutter/material.dart';
import 'package:health_tracker/features/ai_chat/ai_chat_viewmodel.dart';
import 'package:health_tracker/features/ai_chat/widgets/chat_bubble.dart';
import 'package:health_tracker/features/ai_chat/widgets/chat_input_field.dart';
import 'package:provider/provider.dart';

class AiChatScreen extends StatelessWidget {
  const AiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AiChatViewModel(),
      child: Consumer<AiChatViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('AI Health Assistant'),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.messages.length,
                    itemBuilder: (context, index) {
                      final message = viewModel.messages[index];
                      return ChatBubble(
                        message: message.text,
                        isMe: message.isMe,
                      );
                    },
                  ),
                ),
                ChatInputField(
                  onSendMessage: (message) {
                    viewModel.sendMessage(message);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
