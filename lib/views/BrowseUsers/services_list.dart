import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'services_list_base.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';

/** AUTOGENERATE OFF **/
class ServicesList extends ServicesListBase{
  static const String PATH = '/public/Services/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  ChatBloc? cb;
  ServicesList({Key? key, this.id,  this.title,  this.url, this.cb}): super(key: key);
}












  

