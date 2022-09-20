
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
part 'screenshots_list_item_base.g.dart';

class ItemScreenshotsBase {
	var item;
	Map<String, dynamic> json;
	ItemScreenshotsBase(this.json){
		item = ItemScreenshots.fromJson(json);
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
	
	
		    Widget viewProduct (BuildContext context) {  
	return(  ModelView(
		value: item.product_id,
		caption: 'Product',
		idenum: item.product_list,
		nameenum: item.product_str,
	));} 
		    Widget viewImage (BuildContext context) {  
	return(  ImageView(
		value: item.image_url,
		caption: 'Image',
	));} 
		    Widget viewDescription (BuildContext context) {  
	return(  MultilineView(
		value: item.description,
		caption: 'Description',
	));}

}


@JsonSerializable()

class ItemScreenshots{

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
  String? image_url;
  Photo? image;
  String? description;

	
	 ItemScreenshots(
			this.buttons,
			this.product_images_id,			
			this.product_id,
			this.product_str,
			this.product_url,
			this.product_list,
			this.product_list_str,
			this.image,
			this.image_url,
			this.description,

  );
	

	
  factory ItemScreenshots.fromJson(Map<String, dynamic> json) => _$ItemScreenshotsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemScreenshotsToJson(this);
  

   
  
}












  

