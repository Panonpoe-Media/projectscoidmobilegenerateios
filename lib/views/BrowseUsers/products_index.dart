import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'products_index_base.dart';

class ProductsIndex extends ProductsIndexBase{
  static const String PATH = '/public/Products/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ProductsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

