import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'sales_list_base.dart';

class SalesList extends SalesListBase{
  static const String PATH = '/public/Sales/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  SalesList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

