import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'comments_index_base.dart';

class CommentsIndex extends CommentsIndexBase{
  static const String PATH = '/public/Comments/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  CommentsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

