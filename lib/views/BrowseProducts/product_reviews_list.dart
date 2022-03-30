import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'product_reviews_list_base.dart';

class ProductReviewsList extends ProductReviewsListBase{
  static const String PATH = '/public/ProductReviews/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ProductReviewsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

