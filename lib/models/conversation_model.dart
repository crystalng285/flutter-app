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
  name: dummyData[5].name,
  country: dummyData[5].country,
  avatarUrl: dummyData[5].avatarUrl,
);
//sender
final ChatModel sender = ChatModel(
  name: dummyData[4].name,
  avatarUrl: dummyData[4].avatarUrl,
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
];
