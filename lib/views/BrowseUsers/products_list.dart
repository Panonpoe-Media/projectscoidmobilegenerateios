import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'products_list_base.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';

/** AUTOGENERATE OFF **/

class ProductsList extends ProductsListBase{
  static const String PATH = '/public/Products/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ChatBloc? cb;
  ProductsList({Key? key, this.id,  this.title,  this.url, this.cb}): super(key: key);
}












  

