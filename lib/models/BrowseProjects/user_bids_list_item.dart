
import 'user_bids_list_item_base.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import '../photo.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_bids_list_item.g.dart';
/** AUTOGENERATE OFF **/

@JsonSerializable()
class ItemUserBidsRev{

 int?    age;
 int?    cnt;
 int?    page;
 String?id;
 String?ttl;
 String?pht;
 String?sbttl;

 List<ItemButton?>? buttons;
 String?bid_id;
 int? worker_user_id;
 String?worker_photo_url;
 Photo? worker_photo;
 String?worker_user_name;
 int?  worker_worker_rating;
 double?  worker_worker_rating_num;
 String?worker_worker_rating_num_str;
 int? worker_projects_won;
 int? worker_projects_completed;
 int? worker_projects_arbitrated;


 ItemUserBidsRev(
     this.buttons,
     this.bid_id,
     this.worker_user_id,
     this.worker_photo_url,
     this.worker_photo,
     this.worker_worker_rating_num,
     this.worker_worker_rating_num_str,
     this.worker_projects_won,
     this.worker_projects_completed,
     this.worker_projects_arbitrated,
     );



 factory ItemUserBidsRev.fromJson(Map<String, dynamic> json) => _$ItemUserBidsRevFromJson(json);



}
/*
ItemUserBidsRev _$ItemUserBidsRevFromJson(Map<String, dynamic> json) {
 return ItemUserBidsRev(
     (json['buttons'] as List)
         ?.map((e) =>
     e == null ? null : ItemButton.fromJson(e as Map<String, dynamic>))
         ?.toList(),
     json['bid_id'] as String,
     json['worker_user_id'] as int,
     json['worker_photo_url'] as String,
     json['worker_photo'] == null
         ? null
         : Photo.fromJson(json['worker_photo'] as Map<String, dynamic>),
     (json['worker_worker_rating_num'] as num)?.toDouble(),
     json['worker_worker_rating_num_str'] as String,
 json['worker_projects_won'] as int,
 json['worker_projects_completed'] as int,
 json['worker_projects_arbitrated'] as int)
  ..age = json['age'] as int
  ..cnt = json['cnt'] as int
  ..page = json['page'] as int
  ..id = json['id'] as String
  ..ttl = json['ttl'] as String
  ..pht = json['pht'] as String
  ..sbttl = json['sbttl'] as String
  ..worker_user_name = json['worker_user_name'] as String
  ..worker_worker_rating = json['worker_worker_rating'] as int;
}

 */



class ItemUserBidsModel extends ItemUserBidsBase{
 Map<String, dynamic> json;
 // ItemUserBidsModel(Map<String, dynamic> this.json):super(json);
 ItemUserBidsModel(Map<String, dynamic> this.json):super(json){item = ItemUserBidsRev.fromJson(json);}
}













  

