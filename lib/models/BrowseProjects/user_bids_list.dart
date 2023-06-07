import '../button.dart';
import '../meta.dart';
import 'user_bids_list_item.dart';
import 'user_bids_list_item_base.dart';
import '../photo.dart';
import '../paging.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user_bids_list_base.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_bids_list.g.dart';
/** AUTOGENERATE OFF **/

@JsonSerializable()
class UserBidsListingToolsRev{

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  Paging? paging;
  List<ItemUserBidsRev?>? items;
  UserBidsListingToolsRev(
      this.id,
      this.buttons,
      this.meta,
      this.paging,
      this.items,
      );


  factory UserBidsListingToolsRev.fromJson(Map<String, dynamic> json) => _$UserBidsListingToolsRevFromJson(json);


}



/*
UserBidsListingToolsRev _$UserBidsListingToolsRevFromJson(Map<String, dynamic> json) {
  return UserBidsListingToolsRev(
      json['id'] as String,
      (json['buttons'] as List)
          ?.map((e) =>
      e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
      (json['items'] as List)
          ?.map((e) => e == null
          ? null
          : ItemUserBidsRev.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

 */

class UserBidsListingModel extends UserBidsListingBase{
  Map<String, dynamic> json;
  UserBidsListingModel(Map<String, dynamic> this.json):super(json);  
}












  

