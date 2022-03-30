import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'checkout_items_index_base.dart';

class CheckoutItemsIndex extends CheckoutItemsIndexBase{
  static const String PATH = '/public/CheckoutItems/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  CheckoutItemsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

