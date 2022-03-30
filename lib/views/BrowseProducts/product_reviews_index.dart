import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'product_reviews_index_base.dart';

class ProductReviewsIndex extends ProductReviewsIndexBase{
  static const String PATH = '/public/ProductReviews/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ProductReviewsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

