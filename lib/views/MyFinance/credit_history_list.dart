import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'credit_history_list_base.dart';

class CreditHistoryList extends CreditHistoryListBase{
  static const String PATH = '/public/CreditHistory/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  CreditHistoryList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

