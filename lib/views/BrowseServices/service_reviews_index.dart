import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'service_reviews_index_base.dart';

class ServiceReviewsIndex extends ServiceReviewsIndexBase{
  static const String PATH = '/public/ServiceReviews/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ServiceReviewsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

