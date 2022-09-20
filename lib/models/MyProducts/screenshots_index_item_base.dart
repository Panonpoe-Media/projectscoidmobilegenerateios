

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
part 'screenshots_index_item_base.g.dart';

class ItemIndexScreenshotsBase {
	ItemIndexScreenshots? item;
	Map<String, dynamic> json;
	ItemIndexScreenshotsBase(this.json){
		item = ItemIndexScreenshots.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget?>? buttonChildren = <Widget>[
		];
		for (var i = 0; i < item!.buttons!.length; i++) {
			buttonChildren!.add(itemButton( i, context));
		}
	}


	Widget itemButton( int? index, BuildContext context){
		return(
				TextButton(
					child: Text(item!.buttons![index!]!.text!, semanticsLabel: 'Share ${item!.ttl}'),
					style: ButtonStyle(
                                                textStyle:
                                                MaterialStateProperty.all<TextStyle>(
                                                    const TextStyle(color: CurrentTheme.MainAccentColor)),
                                                backgroundColor:
                                                MaterialStateProperty.all<Color>(
                                                  CurrentTheme.SecondaryAccentColor),
                                              ),
		
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item!.buttons![index!]!.url!));
					},
				)
		);
	}	
	
	
		    Widget viewProduct (BuildContext context) {  
	return(  ModelView(
		value: item!.product_id,
		caption: 'Product',
		idenum: item!.product_list,
		nameenum: item!.product_str,
	));} 
		    Widget viewDescription (BuildContext context) {  
	return(  MultilineView(
		value: item!.description,
		caption: 'Description',
	));}

}


@JsonSerializable()

class ItemIndexScreenshots{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? product_images_id;

  int? product_id;
  String? product_str;
  String? product_url;
  List<int?>? product_list;
  List<String?>? product_list_str;
  String? description;

	
	 ItemIndexScreenshots(
			this.buttons,
			this.product_images_id,
			
			this.product_id,
			this.product_str,
			this.product_url,
			this.product_list,
			this.product_list_str,
			this.description,

  );
	

	
  factory ItemIndexScreenshots.fromJson(Map<String, dynamic> json) => _$ItemIndexScreenshotsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemIndexScreenshotsToJson(this);
  

   
  
}












  














  

