import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'services_index_base.dart';

class ServicesIndex extends ServicesIndexBase{
  static const String PATH = '/public/Services/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ServicesIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

