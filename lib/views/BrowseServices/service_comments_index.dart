import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'service_comments_index_base.dart';

class ServiceCommentsIndex extends ServiceCommentsIndexBase{
  static const String PATH = '/public/ServiceComments/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ServiceCommentsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

