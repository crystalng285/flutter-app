import 'package:flutter_chat/models/chat_model.dart';

class ConversationModel {
  //Variable
  final ChatModel sender;
  final ChatModel currentUser;

  final String text;

  //Constructor
  ConversationModel({this.sender,this.currentUser, this.text});
}
//me
final ChatModel currentUser = ChatModel(
  name: dummyData[1].name,
  country: dummyData[1].country,
  avatarUrl: dummyData[1].avatarUrl,
);
//sender
final ChatModel sender = ChatModel(
  name: dummyData[2].name,
  avatarUrl: dummyData[2].avatarUrl,
);


List<ConversationModel> conversationData = [
  ConversationModel(
    sender: sender,
    text: 'Hey, how is it going? What did you do today?',
  ),
  ConversationModel(
    sender: currentUser,
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
  ),
  ConversationModel(
    sender: sender,
    text: 'How is the doggo?',
  ),
  ConversationModel(
    sender: currentUser,
    text: 'All the food',
  ),
  ConversationModel(
    sender: sender,
    text: 'See you later',
  ),
  ConversationModel(
    sender: currentUser,
    text: 'Bye',
  ),
];
