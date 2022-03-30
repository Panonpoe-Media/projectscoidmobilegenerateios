import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'cart_items_list_base.dart';

class CartItemsList extends CartItemsListBase{
  static const String PATH = '/public/CartItems/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  CartItemsList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

