
class ChatgptModel{

  String answer;

  ChatgptModel({
    required this.answer,
  });

  factory ChatgptModel.fromJsonMap(Map<String, dynamic> json) => 
    ChatgptModel(
      answer: json['answer'], 
    );

}