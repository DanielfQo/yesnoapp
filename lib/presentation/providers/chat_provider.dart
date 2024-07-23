

import 'package:flutter/material.dart';
import 'package:yesnoapp/config/helpers/get_chatgpt_answer.dart';
import 'package:yesnoapp/config/helpers/get_yes_no_answer.dart';
import 'package:yesnoapp/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  final GetChatgptAnswer getChatgptAnswer = GetChatgptAnswer();

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Regresaste?', fromWho: FromWho.hers),

  ];

  Future<void> sendMessage(String text) async{
    if(text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    await herReply(text);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply(String message) async{
    final herMessage = await getChatgptAnswer.getAnswer(message);
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent ,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

}