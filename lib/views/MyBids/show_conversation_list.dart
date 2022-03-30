import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'show_conversation_list_base.dart';

class ShowConversationList extends ShowConversationListBase{
  static const String PATH = '/public/ShowConversation/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ShowConversationList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

