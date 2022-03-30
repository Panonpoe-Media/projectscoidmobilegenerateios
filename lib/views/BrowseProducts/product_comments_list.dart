import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'product_comments_list_base.dart';

class ProductCommentsList extends ProductCommentsListBase{
  static const String PATH = '/public/ProductComments/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ProductCommentsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

