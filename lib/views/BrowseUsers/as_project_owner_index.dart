import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'as_project_owner_index_base.dart';

class AsProjectOwnerIndex extends AsProjectOwnerIndexBase{
  static const String PATH = '/public/AsProjectOwner/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  AsProjectOwnerIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

