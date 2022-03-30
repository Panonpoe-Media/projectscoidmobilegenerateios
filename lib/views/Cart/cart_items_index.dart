import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'cart_items_index_base.dart';

class CartItemsIndex extends CartItemsIndexBase{
  static const String PATH = '/public/CartItems/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  CartItemsIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

