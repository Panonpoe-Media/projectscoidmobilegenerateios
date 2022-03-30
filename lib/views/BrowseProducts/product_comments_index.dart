import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'product_comments_index_base.dart';

class ProductCommentsIndex extends ProductCommentsIndexBase{
  static const String PATH = '/public/ProductComments/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ProductCommentsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

