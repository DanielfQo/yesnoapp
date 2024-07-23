import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnoapp/presentation/providers/chat_provider.dart';
import 'package:yesnoapp/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yesnoapp/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yesnoapp/presentation/widgets/shared/message_field_box.dart';
import 'package:yesnoapp/domain/entities/message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG52hK-Gou7RoiB7M3u5YtzeRddpARPF--rg&s'),
          ),
        ),
        title: const Text('Random'),
      ),
      body: _ChatView() ,
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children:[
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context,index){
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.hers)
                ? HerMessageBubble(message: message)
                : MyMessageBubble(message: message);
              },)
            ),
             MessageFieldBox(
              onValue: chatProvider.sendMessage,
             ),
          ],
        ),
      ),
    );
  }
}