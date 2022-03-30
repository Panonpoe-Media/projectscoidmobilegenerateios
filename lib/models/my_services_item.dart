
import 'package:projectscoid/models/my_services_item_base.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';

/** AUTOGENERATE OFF **/
class ItemMyServicesModel extends ItemMyServicesBase{
 Map<String, dynamic> json;
  ItemMyServicesModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget viewTitle (BuildContext context) {
   return(  TitleView(
    value: item.title,
    caption: 'Title ini hasil override view field',
   ));}
}








  






  

