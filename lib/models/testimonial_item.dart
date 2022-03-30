
import 'package:projectscoid/models/testimonial_item_base.dart';
import 'item_button.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'photo.dart';
/** AUTOGENERATE OFF **/


class ItemTestimonialRev{

 int?    age;
 int?    cnt;
 int?    page;
 String? id;
 String? ttl;
 String? pht;
 String? sbttl;

// List<ItemButton?>? buttons;
 String? testimony_id;
 String? feedback;
 int? user_id;
 String? user_str;
 //String user_url;
 String? user_photo_url;
  Photo? user_photo;
  List<int?>? user_list;
 List<String?>? user_list_str;
 DateTime? date;
 int? project_id;
 String? project_str;
// String? project_url;
 //List<int?>? project_list;
// List<String?>? project_list_str;


 ItemTestimonialRev(
    // this.buttons,
     this.testimony_id,
     this.feedback,
     this.user_id,
     this.user_str,
    // this.user_url,
     this.user_photo_url,
     this.user_photo,
     this.user_list,
     this.user_list_str,
     this.date,
     this.project_id,
     this.project_str,
    // this.project_url,
    // this.project_list,
    // this.project_list_str,

     );



 factory ItemTestimonialRev.fromJson(Map<String, dynamic> json) => _$ItemTestimonialRevFromJson(json);
 Map<String, dynamic> toJson() => _$ItemTestimonialRevToJson(this);

}


ItemTestimonialRev _$ItemTestimonialRevFromJson(Map<String, dynamic> json) {
 return ItemTestimonialRev(
    // (json['buttons'] as List)
    //     ?.map((e) =>
    // e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
     //    ?.toList(),
     json['testimony_id'] as String,
     json['feedback'] as String,
     json['user_id'] as int,
     json['user_str'] as String,
    // json['user_url'] as String,
     json['user_photo_url'] as String,
     json['user_photo'] == null
         ? null
         : Photo.fromJson(json['user_photo'] as Map<String, dynamic>),
     (json['user_list'] as List)?.map((e) => e as int)?.toList(),
     (json['user_list_str'] as List)?.map((e) => e as String)?.toList(),
     json['date'] == null ? null : DateTime.parse(json['date'] as String),
     json['project_id'] as int,
     json['project_str'] as String)
    // json['project_url'] as String,
    // (json['project_list'] as List)?.map((e) => e as int)?.toList(),
     //(json['project_list_str'] as List)?.map((e) => e as String)?.toList())
  ..age = json['age'] as int
  ..cnt = json['cnt'] as int
  ..page = json['page'] as int
  ..id = json['id'] as String
  ..ttl = json['ttl'] as String
  ..pht = json['pht'] as String
  ..sbttl = json['sbttl'] as String;
}

Map<String, dynamic> _$ItemTestimonialRevToJson(ItemTestimonialRev instance) =>
    <String, dynamic>{
     'age': instance.age,
     'cnt': instance.cnt,
     'page': instance.page,
     'id': instance.id,
     'ttl': instance.ttl,
     'pht': instance.pht,
     'sbttl': instance.sbttl,
     //'buttons': instance.buttons,
     'testimony_id': instance.testimony_id,
     'feedback': instance.feedback,
     'user_id': instance.user_id,
     'user_str': instance.user_str,
     //'user_url': instance.user_url,
     'user_photo_url': instance.user_photo_url,
     'user_list': instance.user_list,
     'user_list_str': instance.user_list_str,
     'date': instance.date?.toIso8601String(),
     'project_id': instance.project_id,
     'project_str': instance.project_str,
   //  'project_url': instance.project_url,
   //  'project_list': instance.project_list,
   //  'project_list_str': instance.project_list_str
    };

class ItemTestimonialModel extends ItemTestimonialBase{
 Map<String, dynamic> json;
  //ItemTestimonialModel(Map<String, dynamic> this.json):super(json);
ItemTestimonialModel(Map<String, dynamic> this.json):super(json){item = ItemTestimonialRev.fromJson(json);}
}








  






  

