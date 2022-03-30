import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'portofolio_list_base.dart';

class PortofolioList extends PortofolioListBase{
  static const String PATH = '/public/Portofolio/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PortofolioList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

