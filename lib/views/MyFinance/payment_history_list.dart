import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'payment_history_list_base.dart';

class PaymentHistoryList extends PaymentHistoryListBase{
  static const String PATH = '/public/PaymentHistory/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PaymentHistoryList({Key? key, this.id, this.title, this.url}): super(key: key);  
}












  

