
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
part 'product_reviews_list_item_base.g.dart';

class ItemProductReviewsBase {
	var item;
	Map<String, dynamic> json;
	ItemProductReviewsBase(this.json){
		item = ItemProductReviews.fromJson(json);
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
	
	
		    Widget viewRating (BuildContext context) {  
	return(  RatingView(
		value: item.rating,
		caption: 'Rating'
	));}
		    Widget viewTestimony (BuildContext context) {  
	return(  ArticleView(
		value: item.testimony,
		caption: 'Testimony',
	));}
		    Widget viewBuyer (BuildContext context) {  
	return(  ModelView(
		value: item.buyer_id,
		caption: 'Buyer',
		idenum: item.buyer_list,
		nameenum: item.buyer_str,
	));} 
   Widget viewPhoto (BuildContext context) {  
	return(  ImageView(
		value: item.buyer_photo_url,
		caption: 'Photo',
	));} 
		    Widget viewDate (BuildContext context) {  
	return(  DateTimeView(
		value: item.date,
		caption: 'Date',
	));} 

}


@JsonSerializable()

class ItemProductReviews{

  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? order_item_id;
  int? rating;
  String? testimony;
  int? buyer_id;
  String? buyer_str;
  String? buyer_url;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  String? buyer_photo_url;
  Photo? buyer_photo; 
  DateTime? date;

	
	 ItemProductReviews(
			this.buttons,
			this.order_item_id,			
			this.rating,
			this.testimony,
			this.buyer_id,
			this.buyer_str,
			this.buyer_url,
			this.buyer_list,
			this.buyer_list_str,
			this.buyer_photo_url,
			this.buyer_photo,
			this.date,

  );
	

	
  factory ItemProductReviews.fromJson(Map<String, dynamic> json) => _$ItemProductReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemProductReviewsToJson(this);
  

   
  
}












  

