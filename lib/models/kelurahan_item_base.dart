

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'image_fields.dart';
import 'file_fields.dart';
import 'option_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'selection.dart';
import 'photo.dart';
import 'paging.dart';
part 'kelurahan_item_base.g.dart';
//


class ItemKelurahanBase {
	var item;
	Map<String, dynamic> json;
	ItemKelurahanBase(this.json){
		item = ItemKelurahan.fromJson(json);
	}	
	
	List<Widget?>?  listButtonAction(BuildContext context) {
		final List<Widget> buttonChildren = <Widget>[
		];
		for (var i = 0; i < item.buttons.length; i++) {
			buttonChildren.add(itemButton( i, context));
		}
	}


	Widget itemButton( int?index, BuildContext context){
		return(
				FlatButton(
					child: Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
					textColor: CurrentTheme.MainAccentColor,
					splashColor : CurrentTheme.ShadeColor,
					color : CurrentTheme.SecondaryAccentColor,
					onPressed: () {
						AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(item.buttons[index].url));
					},
				)
		);
	}	
	
	
		    Widget viewProvinsi (BuildContext context) {  
	return(  ModelView(
		value: item.provinsi_id,
		caption: 'Provinsi',
		idenum: item.provinsi_list,
		nameenum: item.provinsi_str,
	));} 
		    Widget viewKabupaten (BuildContext context) {  
	return(  ModelView(
		value: item.kabupaten_id,
		caption: 'Kabupaten',
		idenum: item.kabupaten_list,
		nameenum: item.kabupaten_str,
	));} 
		    Widget viewKecamatan (BuildContext context) {  
	return(  ModelView(
		value: item.kecamatan_id,
		caption: 'Kecamatan',
		idenum: item.kecamatan_list,
		nameenum: item.kecamatan_str,
	));} 
		    Widget viewNamaKelurahan (BuildContext context) { 
	return(  DisplayNameView(
		value: item.kelurahan_name,
		caption: 'Nama Kelurahan',
	));}
		    Widget viewKodePos (BuildContext context) { 
	return(  DisplayNameView(
		value: item.kode_pos,
		caption: 'Kode Pos',
	));}

}


@JsonSerializable()

class ItemKelurahan{

  int?   age;
  int?   cnt;
  int?   page;
  String?  id;
  String?  ttl;
  String?  pht;
  String?  sbttl;

  List<ItemButton?>? buttons;
  String?  kelurahan_id;
  int?provinsi_id;
  String?  provinsi_str;
  String?  provinsi_url;
  List<int?>? provinsi_list;
  List<String?>? provinsi_list_str;
  int?kabupaten_id;
  String?  kabupaten_str;
  String?  kabupaten_url;
  List<int?>? kabupaten_list;
  List<String?>? kabupaten_list_str;
  int?kecamatan_id;
  String?  kecamatan_str;
  String?  kecamatan_url;
  List<int?>? kecamatan_list;
  List<String?>? kecamatan_list_str;
  String?  kelurahan_name;
  String?  kode_pos;

	
	 ItemKelurahan(
			this.buttons,
			this.kelurahan_id,			
			this.provinsi_id,
			this.provinsi_str,
			this.provinsi_url,
			this.provinsi_list,
			this.provinsi_list_str,
			this.kabupaten_id,
			this.kabupaten_str,
			this.kabupaten_url,
			this.kabupaten_list,
			this.kabupaten_list_str,
			this.kecamatan_id,
			this.kecamatan_str,
			this.kecamatan_url,
			this.kecamatan_list,
			this.kecamatan_list_str,
			this.kelurahan_name,
			this.kode_pos,

  );
	

	
  factory ItemKelurahan.fromJson(Map<String, dynamic> json) => _$ItemKelurahanFromJson(json);

  Map<String, dynamic> toJson() => _$ItemKelurahanToJson(this);
  

   
  
}



////////////////////////////////////////////////
///





///
////////////////////////////////////////////////





  






  

