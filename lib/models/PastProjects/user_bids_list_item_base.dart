
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import '../image_fields.dart';
import '../file_fields.dart';
import '../option_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import '../photo.dart';
import '../paging.dart';
part 'user_bids_list_item_base.g.dart';

class ItemUserBidsBase {
	var item;
	Map<String, dynamic> json;
	ItemUserBidsBase(this.json){
		item = ItemUserBids.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget?>? buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons!.length; i++) {
			buttonChildren!.add(itemButton( i, context));
		}
	}


	Widget itemButton( int? index, BuildContext context){
		return(
				TextButton(
					child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
                    style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color:  CurrentTheme.MainAccentColor)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  CurrentTheme.SecondaryAccentColor),
                                              ),
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item.buttons[index].url));
					},
				)
		);
	}	
	
	
   Widget viewPhoto (BuildContext context) {  
	return(  ImageView(
		value: item.worker_photo_url,
		caption: 'Photo',
	));} 

}


@JsonSerializable()

class ItemUserBids{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? bid_id;
  String? worker_photo_url;
  Photo? worker_photo; 

	
	 ItemUserBids(
			this.buttons,
			this.bid_id,			
			this.worker_photo_url,
			this.worker_photo,

  );
	

	
  factory ItemUserBids.fromJson(Map<String, dynamic> json) => _$ItemUserBidsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemUserBidsToJson(this);
  

   
  
}












  

