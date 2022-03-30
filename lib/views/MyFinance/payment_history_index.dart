import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'payment_history_index_base.dart';

class PaymentHistoryIndex extends PaymentHistoryIndexBase{
  static const String PATH = '/public/PaymentHistory/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  PaymentHistoryIndex({Key? key, this.id, this.title, this.url}): super(key: key);  
}















  

