import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'show_conversation_index_base.dart';

class ShowConversationIndex extends ShowConversationIndexBase{
  static const String PATH = '/public/ShowConversation/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ShowConversationIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

