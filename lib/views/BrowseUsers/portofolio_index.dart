import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'portofolio_index_base.dart';

class PortofolioIndex extends PortofolioIndexBase{
  static const String PATH = '/public/Portofolio/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PortofolioIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

