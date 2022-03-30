import 'package:flutter/material.dart';
import '../models/user_model.dart';

Color myColor = const Color(0xFFFFC64B);
Color myGreen = const Color (0xff4bb17b);

enum MessageType {sent, received}

class ChatModel {
  final User? sender;
  final MessageType? status;
  final String?message;
  final String? time;

  ChatModel(
      {this.sender,
      this.status,
      this.message,
      this.time,
      }
  );
}

// Example messages in chat screen
List<ChatModel> messages = [
  ChatModel(
    sender: james,
    status: MessageType.received,
    message: 'hello, how are you?',
    time: '8:30 AM',
  ),
  ChatModel(
    sender: currentUser,
    status: MessageType.sent,
    message: 'hello mate, i am fine. Where have you been?',
    time: '8:35 AM',
  ),
  ChatModel(
    sender: james,
    status: MessageType.received,
    message: 'i have been searching for a job. Hmm',
    time: '8:36 AM',
  ),
  ChatModel(
    sender: james,
    status: MessageType.received,
    message: 'i heard that there is a new food court nearby, why don’t we go there?',
    time: '8:36 AM',
  ),
  ChatModel(
    sender: currentUser,
    status: MessageType.sent,
    message: 'that’s a good idea, lets go!',
    time: '8:38 AM',
  ),
  ChatModel(
    sender: james,
    status: MessageType.received,
    message: 'okay lets go!',
    time: '8:39 AM',
  ),
];


/* contoh deklarasi 
List<Map<String, dynamic>> friendsList = [
  {
    'imgUrl':
        'https://cdn.pixabay.com/photo/2019/11/06/17/26/gear-4606749_960_720.jpg',
    'username': 'Cybdom Tech',
    'lastMsg': 'Hey, checkout my website: cybdom.tech ;)',
    'seen': true,
    'hasUnSeenMsgs': false,
    'unseenCount': 0,
    'lastMsgTime': '18:44',
    'isOnline': true
  }
];

List<Map<String, dynamic>> messages = [
  {
    'status' : MessageType.received,
    'contactImgUrl' : 'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg',
    'contactName' : 'Client',
    'message' : 'Sure, let me send you a document that explains everything.' ,
    'time' : '08:47 AM'
  },
  {
    'status' : MessageType.sent,
    'message' : 'Ok.' ,
    'time' : '08:45 AM'
  },
];
*/