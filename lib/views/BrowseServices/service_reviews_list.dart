import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'service_reviews_list_base.dart';

class ServiceReviewsList extends ServiceReviewsListBase{
  static const String PATH = '/public/ServiceReviews/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ServiceReviewsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

