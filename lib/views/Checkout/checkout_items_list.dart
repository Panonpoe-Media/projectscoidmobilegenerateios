import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'checkout_items_list_base.dart';

class CheckoutItemsList extends CheckoutItemsListBase{
  static const String PATH = '/public/CheckoutItems/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  CheckoutItemsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

