import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'as_project_owner_list_base.dart';

class AsProjectOwnerList extends AsProjectOwnerListBase{
  static const String PATH = '/public/AsProjectOwner/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  AsProjectOwnerList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

