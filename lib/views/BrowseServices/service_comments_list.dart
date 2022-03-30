import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'service_comments_list_base.dart';

class ServiceCommentsList extends ServiceCommentsListBase{
  static const String PATH = '/public/ServiceComments/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ServiceCommentsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

