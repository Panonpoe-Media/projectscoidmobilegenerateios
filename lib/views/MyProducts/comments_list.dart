import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'comments_list_base.dart';

class CommentsList extends CommentsListBase{
  static const String PATH = '/public/Comments/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  CommentsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

