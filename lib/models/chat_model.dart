
import 'package:intl/intl.dart';

class ChatModel {
  //Variable
  final String id;
  final String name;
  final String lastname;
  final String country;
  final String message;
  String time ;
  final String avatarUrl;
  final bool unread;
  //Constructor
  ChatModel({
    this.id,
    this.name,
    this.lastname,
    this.country,
    this.message,
    this.time,
    this.avatarUrl,
    this.unread,
  });

  factory ChatModel.fromJson(Map<String, dynamic> parsedJson) {
    return ChatModel(
      id: parsedJson['id'].toString(),
      name: parsedJson['name'].toString(),
      lastname: parsedJson['lastname'].toString(),
      message: parsedJson['message'].toString(),
      time: parsedJson['time'].toString(),
      avatarUrl: parsedJson['avatarUrl'].toString(),
      unread: parsedJson['unread'],
    );
  }
}

List<ChatModel> dummyData = [
  ChatModel(
    name: "Topon Chowdhury",
    lastname: "Chowdhury",
    country: "Toronto",
    message: "Yeah. that's what I'm saying",
    //time: 0,
    avatarUrl:
        "https://makeurdaysfresh.files.wordpress.com/2018/10/43555415_1660676994038879_3692270276407459840_n.jpg",
    unread: true,
  ),
  ChatModel(
    name: "Maria Jane",
    lastname: "Jane",
    country: "Vancouver",
    message: "are you there???",
    //time: 0,
    avatarUrl:
        "https://news.harvard.edu/wp-content/uploads/2014/10/hello-kitty-wallpaper-37_605.jpg?w=605",
    unread: false,
  ),
  ChatModel(
    name: "Tamanna Sadh",
    lastname: "Sadh",
    country: "Alberta",
    message: "i like to work with you.",
    //time: 0,
    avatarUrl:
        "https://s.yimg.com/ny/api/res/1.2/6MQA1iA69Kiee7vqVZZA2A--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9NjE4O2g9NDAw/https://media.zenfs.com/en-US/thewrap.com/ddd88f5e2c38de2a5eb2e7dae9e82f49",
    unread: true,
  ),
  ChatModel(
    name: "Jumon Sadik",
    lastname: "Sadik",
    country: "Yukon",
    message: "Do you want to work with me?",
    //time: 0,
    avatarUrl:
        "https://www.biography.com/.image/t_share/MTUzMzQzOTkxMDAwMDgxNzA2/jason-statham-attends-the-press-conference-of-director-f-gary-grays-film-the-fate-of-the-furious-on-march-23-2017-in-beijing-china-photo-by-vcg_vcg-via-getty-images-square.jpg",
    unread: false,
  ),
  ChatModel(
    name: "Sakira Jethi",
    lastname: "Jethi",
    country: "Sydney",
    message: "Got it",
    //time: 0,
    avatarUrl:
        "https://media.vanityfair.com/photos/5c992a871c3519239055da53/16:9/w_2560%2Cc_limit/bing-bing-april-2019-embed01.jpg",
    unread: true,
  ),
];
