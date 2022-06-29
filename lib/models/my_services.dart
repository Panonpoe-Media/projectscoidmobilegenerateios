import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:photo_view/photo_view.dart';
import 'BrowseServices/screenshots_list_item_base.dart';
import 'package:projectscoid/models/BrowseServices/screenshots_list_base.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expandable/expandable.dart';
import 'package:string_mask/string_mask.dart';
import 'package:string_mask/src/mask_pattern.dart';
import 'package:timeago/timeago.dart' as timeago;
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'option_fields.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'image_fields.dart';
import 'file_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'credit.dart';
import 'payment.dart';
import 'selection.dart';
import 'my_services_item.dart';
import 'my_services_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'my_services_item_base.dart';
import 'package:projectscoid/models/my_services_base.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_services.g.dart';
/** AUTOGENERATE OFF **/

class AddNewServiceMyServicesModel extends AddNewServiceMyServicesBase{

  Map<String, dynamic> json;
  AddNewServiceMyServicesModel(Map<String, dynamic> this.json):super(json); 
	  
}

class PublishServiceMyServicesModel extends PublishServiceMyServicesBase{

  Map<String, dynamic> json;
  PublishServiceMyServicesModel(Map<String, dynamic> this.json):super(json); 
	  
}

class BumpUpMyServicesModel extends BumpUpMyServicesBase{

  Map<String, dynamic> json;
  BumpUpMyServicesModel(Map<String, dynamic> this.json):super(json); 
	  
}

class EditServiceMyServicesModel extends EditServiceMyServicesBase{

  Map<String, dynamic> json;
  EditServiceMyServicesModel(Map<String, dynamic> this.json):super(json); 
	  
}

class UnlistMyServicesModel extends UnlistMyServicesBase{

  Map<String, dynamic> json;
  UnlistMyServicesModel(Map<String, dynamic> this.json):super(json); 
	  
}

class ReactivateServiceMyServicesModel extends ReactivateServiceMyServicesBase{

  Map<String, dynamic> json;
  ReactivateServiceMyServicesModel(Map<String, dynamic> this.json):super(json); 
	  
}


class MyServicesModel extends MyServicesBase{
  Map<String, dynamic> json;
  MyServicesModel(Map<String, dynamic> this.json):super(json); 	

  
}
@JsonSerializable()
class ViewModelMyServicesRev {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  int? seller_id;
  String? seller_str;
  String? seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  String? logo_url;
  Photo? logo;
  String? title;
  String? description;
  String? short_description;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
  DateTime?registered_date;
  DateTime?published_date;
  DateTime?last_bump;
  double?price;
  String? price_str;
  List<OptionField?>? options;
  int? finish_days;
  String? finish_days_str;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? sales_count;
  String? sales_count_str;
  double?sales_amount;
  String? sales_amount_str;
  int? rating;
  int? points;
  String? points_str;
  int? ranking;
  String? ranking_str;
  String? admin_note;
  String? service_id;
  //
  ViewModelMyServicesRev(
      this.id,
      this.seller_id,
      this.seller_str,
      this.seller_url,
      this.seller_list,
      this.seller_list_str,
      this.logo,
      this.logo_url,
      this.title,
      this.description,
      this.short_description,
      this.tags_id,
      this.tags_str,
      this.tags_url,
      this.registered_date,
      this.published_date,
      this.last_bump,
      this.price,
      this.price_str,
      this.options,
      this.finish_days,
      this.finish_days_str,
      this.status_id,
      this.status_str,
      this.status_list,
      this.status_list_str,
      this.sales_count,
      this.sales_count_str,
      this.sales_amount,
      this.sales_amount_str,
      this.rating,
      this.points,
      this.points_str,
      this.ranking,
      this.ranking_str,
      this.admin_note,
      this.service_id
      );


  factory ViewModelMyServicesRev.fromJson(Map<String, dynamic> json) => _$ViewModelMyServicesRevFromJson(json);

}
/*
ViewModelMyServicesRev _$ViewModelMyServicesRevFromJson(Map<String, dynamic> json) {
  return ViewModelMyServicesRev(
      json['id'] as String,
      json['seller_id'] as int,
      json['seller_str'] as String,
      json['seller_url'] as String,
      (json['seller_list'] as List)?.map((e) => e as int)?.toList(),
      (json['seller_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String,
      json['title'] as String,
      json['description'] as String,
      json['short_description'] as String,
      (json['tags_id'] as List)?.map((e) => e as int)?.toList(),
      (json['tags_str'] as List)?.map((e) => e as String)?.toList(),
      (json['tags_url'] as List)?.map((e) => e as String)?.toList(),
      json['registered_date'] == null
          ? null
          : DateTime.parse(json['registered_date'] as String),
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String),
      (json['price'] as num)?.toDouble(),
      json['price_str'] as String,
      (json['options'] as List)
          ?.map((e) =>
      e == null ? null : OptionField.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['finish_days'] as int,
      json['finish_days_str'] as String,
      json['status_id'] as int,
      json['status_str'] as String,
      (json['status_list'] as List)?.map((e) => e as int)?.toList(),
      (json['status_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['sales_count'] as int,
      json['sales_count_str'] as String,
      (json['sales_amount'] as num)?.toDouble(),
      json['sales_amount_str'] as String,
      json['rating'] as int,
      json['points'] as int,
      json['points_str'] as String,
      json['ranking'] as int,
      json['ranking_str'] as String,
      json['admin_note'] as String,
       json['service_id'] as String)
    ..age = json['age'] as int
    ..cnt = json['cnt'] as int
    ..page = json['page'] as int
    ..ttl = json['ttl'] as String
    ..pht = json['pht'] as String
    ..sbttl = json['sbttl'] as String;
}

 */
@JsonSerializable()
class MyServicesViewRevSuperBase {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyServicesRev? model;
  MyServicesViewRevSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );


  factory MyServicesViewRevSuperBase.fromJson(Map<String, dynamic> json) => _$MyServicesViewRevSuperBaseFromJson(json);
}
/*
MyServicesViewRevSuperBase _$MyServicesViewRevSuperBaseFromJson(
    Map<String, dynamic> json) {
  return MyServicesViewRevSuperBase(
      json['id'] as String,
      (json['buttons'] as List)
          ?.map((e) =>
      e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : ViewModelMyServicesRev.fromJson(
          json['model'] as Map<String, dynamic>));
}

 */


class MyServicesViewModel  extends MyServicesViewBase{
  Map<String, dynamic> json;
//  MyServicesViewModel(Map<String, dynamic> this.json):super(json);
  MyServicesViewModel(Map<String, dynamic> this.json):super(json){model = MyServicesViewRevSuperBase.fromJson(this.json);}

  Widget viewHeader (BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final mediaQueryData = MediaQuery.of(context);

    var dateformat = DateFormat('dd/MM/yyyy HH:mm:ss');
    final size =MediaQuery.of(context).size;
    final width =size.width;
    // String? sts = destination!.item.project_project_status_str.split('>')[1].split('<')[0];
    String? sts1 =  this.model.model.status_str.split('>')[1].split('<')[0];



    return(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 2.0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle!,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // three line description
                      Container(
                        width: 250,
                        child: Stack(

                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0,2.0, 0.0, 0.0),
                              child: DefaultTextStyle(
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                style: descriptionStyle!,
                                child: Container(
                                  width: 250,
                                  child:
                                  // three line description
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child:    Html(data: sts1!.toUpperCase(),
                                      //  defaultTextStyle: TextStyle(color: CurrentTheme.ErrorColor),
                                      style: {
                                        "html": Style(
                                          color: CurrentTheme.SecondaryColor,
                                          fontSize: FontSize.xLarge,
                                        ),
                                      },
                                    ) ,

                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // height:  120.0,
                              padding:  const EdgeInsets.fromLTRB(8.0, 32.0, 16.0, 0.0),
                              child:
                              Text('Status' , style: TextStyle(fontSize: 14)),


                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ClipRRect(
                //borderRadius: BorderRadius.circular(20),
                child:

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShowItemScreenshots2(image : model!.model!.logo_url)),
                    );
                  },
                  child:

                  Image.network(
                    model!.model!.logo_url,
                    fit: BoxFit.cover,
                    height: size.height * 0.25,
                    width: size.width,

                  ),
                ),
              ),
            ],
          )
    );

    /*
    return(
        SizedBox(
          height: 140.0,
          child:
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // three line description
                Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 40.0, 20.0 , 0.0),
                  child:
                  InkWell(
                    onTap: () {
                      // return BidItemInfo(info : info);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowItemScreenshots2(image : model!.model!.logo_url)),
                      );
                    },

                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        model!.model!.logo_url,
                        fit: BoxFit.fitHeight,
                        height: 75.0,
                        width: 80.0,

                      ),
                    ),
                  ),
                ),
                //newly added
                Flexible(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 30.0 , 0.0),
                        child: Column(
                            children : <Widget>[

                              Html(
                                // model!.meta.title ,
                                data :model!.meta.title,
                                style: {
                                  "html": Style(
                                    fontSize: FontSize.medium,
                                  ),
                                },
                                //useRichText: true, defaultTextStyle :  descriptionStyle.copyWith(  fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(model!.model!.seller_url ));
                                },
                                child: Html(

                                  data :readText(model!.model!.seller_str , 54),
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.small,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green,
                                    ),
                                  },

                                  //  useRichText: true, defaultTextStyle : descriptionStyle.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                                ),
                              ),

                              // three line description

                              Html(

                                data :model!.model!.price_str,
                                style: {
                                  "html": Style(
                                    fontSize: FontSize.small,
                                    fontWeight: FontWeight.w500,
                                  ),
                                },

                                //  useRichText: true, defaultTextStyle : descriptionStyle.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                              ),



                            ]
                        )
                    )
                ),

              ]

          ),

        )
    );

     */
  }
  Widget? viewHeader1 (BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final mediaQueryData = MediaQuery.of(context);


    /*
    return(
        SizedBox(
          height: 140.0,
          child:
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // three line description
                Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 40.0, 20.0 , 0.0),
                  child:
                  InkWell(
                    onTap: () {
                      // return BidItemInfo(info : info);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowItemScreenshots2(image : model!.model!.logo_url)),
                      );
                    },

                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        model!.model!.logo_url,
                        fit: BoxFit.fitHeight,
                        height: 75.0,
                        width: 80.0,

                      ),
                    ),
                  ),
                ),
                //newly added
                Flexible(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 30.0 , 0.0),
                        child: Column(
                            children : <Widget>[

                              Html(
                                // model!.meta.title ,
                                data :model!.meta.title,
                                style: {
                                  "html": Style(
                                    fontSize: FontSize.medium,
                                  ),
                                },
                                //useRichText: true, defaultTextStyle :  descriptionStyle.copyWith(  fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(model!.model!.seller_url ));
                                },
                                child: Html(

                                  data :readText(model!.model!.seller_str , 54),
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.small,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green,
                                    ),
                                  },

                                  //  useRichText: true, defaultTextStyle : descriptionStyle.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                                ),
                              ),

                              // three line description

                              Html(

                                data :model!.model!.price_str,
                                style: {
                                  "html": Style(
                                    fontSize: FontSize.small,
                                    fontWeight: FontWeight.w500,
                                  ),
                                },

                                //  useRichText: true, defaultTextStyle : descriptionStyle.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                              ),



                            ]
                        )
                    )
                ),

              ]

          ),

        )
    );

     */
  }


  Widget viewInfo (BuildContext context){
    return
      Container(
          height: 68.0,
          padding:EdgeInsets.only(bottom : 10) ,
          child:
          ListView(
            scrollDirection: Axis.horizontal,

            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 1,

                    child: Center(
                      child: Container(
                        width: 1,
                        margin: EdgeInsetsDirectional.only(top: 20, bottom: 15),
                        decoration: BoxDecoration(
                          border: Border(
                            left: Divider.createBorderSide(context, color: Colors.grey, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          AppProvider.getRouter(context)!.navigateTo(
                              context, urlToRoute(model!.url));
                          /*  Navigator.of(context).push(PageRouteBuilder(
                                          pageBuilder: (_, __, ___) => new flashSale(),
                                          transitionsBuilder:
                                              (_, Animation<double> animation, __, Widget child) {
                                            return Opacity(
                                              opacity: animation.value,
                                              child: child,
                                            );
                                          },
                                          transitionDuration: Duration(milliseconds: 850))); */
                        },
                        child: Container(
                          height: 58.0,
                          width: 130.0,


                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                EdgeInsets.only(left: 10.0, right: 8.0, top: 0.0),
                                child: Icon(
                                  Icons.attach_money,
                                  size: 26.0,

                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: 10.0, right: 8.0, top: 1.0),
                                child: model!.model!.price < 100000 ?    Html(data: readText('Low price' , 46),

                                  //  defaultTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.small,
                                      fontWeight: FontWeight.w300,

                                    ),
                                  },
                                )     :  model!.model!.price < 500000 ? Html(data: readText(' Medium price' , 46),
                                  //  defaultTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.small,
                                      fontWeight: FontWeight.w300,

                                    ),
                                  },
                                ):
                                Html(data: readText('High price' , 46),
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.small,
                                      fontWeight: FontWeight.w300,

                                    ),
                                  },
                                  // defaultTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                                ),
                              ),


                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            
            ],
          )
      );
  }



  List<Widget> getOptions(){
    var maskOptions = new MaskOptions()
      ..reverse = true;
    var formatter = new StringMask('#,##0', options: maskOptions);
    List<Widget> OptionsTextFields = [];
  if(model!.model!.options != null){
    for(int i=0; i< model!.model!.options.length; i++){

      if(model!.model!.options[i].description != ''){
        if(i == 0){
          OptionsTextFields.add(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                child:
                Text('Fitur Tambahan'),
              )
          );
        }
        var val = model!.model!.options[i].price.toString().replaceAll('.0','');
        OptionsTextFields.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 18.0),
              child: Row(
                //  crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.check_box,
                        color : Colors.amber,
                      ),
                      Text('  ${model!.model!.options[i].description}'),
                    ],
                  ),

                  Text(' Rp. ${formatter.apply(val)},-'),


                  //  Expanded(child: OptionViewFields(i, this.optiondata)),
                  //  SizedBox(width: 16,),
                  // we need add button at last Options row
                ],
              ),
            )
        );
      }

    }
  }

    return OptionsTextFields;
  }



  Widget viewDesc(BuildContext context) {

    ScrollController? controller;

    return(
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Container(
                // height:  120.0,
                padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
                child:
                GestureDetector(
                    onTap: () {

                    },
                    child:
                    Ink(
                        child: Html(data: readText(model!.model!.title , 400) ,
                          // useRichText: true, defaultTextStyle : titleStyle )
                          style: {
                            "html": Style(
                              display: Display.BLOCK,
                              fontSize: FontSize.large,
                              fontWeight: FontWeight.w500,

                            ),
                          },
                        )

                    )
                ),
              ),
              Container(
                // height:  120.0,
                padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
                child:
                GestureDetector(
                    onTap: () {

                    },
                    child:
                    Ink(
                        child: Html(data: model!.model!.short_description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ,
                          // useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 ),
                          style: {
                            "html": Style(
                              display: Display.BLOCK,
                              fontSize: FontSize.medium,
                            ),
                          },
                        )

                    )
                ),
              ),
            ]
        )
    );


    /*
    return ExpandablePanel(
        header:
        Padding(
            padding: const EdgeInsets.fromLTRB(
                20.0, 8.0, 20.0, 0.0),
            child:
            Column(
                children: <Widget>[
                  ...getOptions(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('About this service',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                      ]
                  ),

                ]
            )
        ),
        collapsed:
        Padding(
            padding: const EdgeInsets.fromLTRB(
                20.0, 0.0, 20.0, 40.0),
            child:
            Column(
                children: <Widget>[
                  HtmlWidget( readText(model!.model!.description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 100)),

                ]
            )

        ),
        expanded:
        SingleChildScrollView(
            controller: controller!,
            physics: const NeverScrollableScrollPhysics(),
            reverse: false,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //header
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 2.0),
                      child : HtmlWidget(model!.model!.description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                        onTapUrl: (url) async{
                          if(url!.contains('projects.co.id')){


                            if(url!.contains(new RegExp(r'[0-9]'))){
                              if(url!.contains('show_conversation')){
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url+ '/' ));
                              }else{
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url )).catchError((onError){

                                  AppProvider.getRouter(context)!.pop(context);
                                });
                              }

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(url + '/listing/'));
                            }


                          }else
                          {

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }


                          }


                        },
                        onTapImage:(src) =>  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowItemScreenshots2(image:'$src')),
                        ),
                      )
                  ),


                ]
            )

        )

    );

     */


  }


  Widget viewBody(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final mediaQueryData = MediaQuery.of(context);

    var dateformat = DateFormat('dd/MM/yyyy HH:mm:ss');
    final size =MediaQuery.of(context).size;
    final width =size.width;
    ScrollController? controller;

    return(
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Container(
                // height:  120.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                  child: Text('${model!.model!.price_str},-' , style: TextStyle(fontSize: 15, color: Colors.red))
              ),

              SizedBox(height: 10,),
              /*
              Padding(
                //accepted_worker_url
                  padding:  const EdgeInsets.fromLTRB(20.0, 0.0, 16.0, 0.0),
                  child:

                  GestureDetector(
                    onTap: () {

                    },
                    child:
                    Text('Long Description:', style: TextStyle(fontSize: 15)),
                  )
              ),

               */
              Container(
                // height:  120.0,
                padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
                child:
                GestureDetector(
                    onTap: () {

                    },
                    child:
                    Ink(
                        child: Html(data: 'Long Description: ' + model!.model!.description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ,
                          // useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 ),
                          style: {
                            "html": Style(
                              display: Display.BLOCK,
                              fontSize: FontSize(15),
                            ),
                          },
                        )

                    )
                ),
              ),

              Padding(
                //accepted_worker_url
                  padding:  const EdgeInsets.fromLTRB(20.0, 0.0, 16.0, 0.0),
                  child:

                  GestureDetector(
                    onTap: () {

                    },
                    child:
                    Text(model!.model!.registered_date == null ? 'Registered Date: -' :  'Registered Date: ${dateformat.format(model!.model!.registered_date)} WIB', style: TextStyle(fontSize: 15)),
                  )
              ),
              Padding(
                //accepted_worker_url
                  padding:  const EdgeInsets.fromLTRB(20.0, 5.0, 16.0, 0.0),
                  child:

                  GestureDetector(
                    onTap: () {

                    },
                    child:
                    Text(model!.model!.published_date == null ? 'Published Date: -' :  'Published Date: ${dateformat.format(model!.model!.published_date)} WIB', style: TextStyle(fontSize: 15)),
                  )
              ),
              Padding(
                //accepted_worker_url
                  padding:  const EdgeInsets.fromLTRB(20.0, 5.0, 16.0, 0.0),
                  child:

                  GestureDetector(
                    onTap: () {

                    },
                    child:
                    Text(model!.model!.last_bump == null ? 'Last Bump:  -':'Last Bump: ${ dateformat.format(model!.model!.last_bump)} WIB', style: TextStyle(fontSize: 15)),
                  )
              ),

              Padding(
                //accepted_worker_url
                padding:  const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Options: ', style: TextStyle(fontSize: 15)),
                    ...getOptions(),

                  ],
                ),
              ),




              Container(
                // height:  120.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                  child: Text('Finish Days: ${model!.model!.finish_days == null ? '-' : model!.model!.finish_days.toString()}' , style: TextStyle(fontSize: 15))
              ),

              Container(
                // height:  120.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                  child: Text('Sales Count: ${model!.model!.sales_count == null ? '-' : model!.model!.sales_count.toString()}' , style: TextStyle(fontSize: 15))
              ),

              Container(
                // height:  120.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                  child: Text('Sales Amount: ${model!.model!.sales_amount == null ? '-' : model!.model!.sales_amount_str}' , style: TextStyle(fontSize: 15))
              ),

              Padding(
                //accepted_worker_url
                padding:  const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Rating: ', style: TextStyle(fontSize: 15)),
                    RatingBarIndicator(
                      rating: model!.model!.rating.toDouble()/2-0.01,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: CurrentTheme.PrimaryLightColor,
                      ),
                      itemCount: 5,
                      itemSize: 12.0,
                      unratedColor: Colors.black26,
                      direction:  Axis.horizontal,
                    ),
                  ],
                ),
              ),



              Container(
                // height:  120.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                  child: Text('Points: ${model!.model!.points == 0 ? '-' : model!.model!.points.toString()}' , style: TextStyle(fontSize: 15))
              ),

              Container(
                // height:  120.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                  child: Text('Rankings: ${model!.model!.ranking == 0 ? '-' : model!.model!.ranking_str}' , style: TextStyle(fontSize: 15))
              ),

              Container(
                // height:  120.0,
                padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
                child:
                GestureDetector(
                    onTap: () {

                    },
                    child:
                    Ink(
                        child: Html(data: 'Admin Note: ' + model!.model!.admin_note  ,
                          // useRichText: true, defaultTextStyle : titleStyle )
                          style: {
                            "html": Style(
                              display: Display.BLOCK,
                              fontSize: FontSize(15),
                              fontWeight: FontWeight.w500,

                            ),
                          },
                        )

                    )
                ),
              ),

              SizedBox(height: 30,),
              // description

            ]
        )
    );


    /*
    return ExpandablePanel(
        header:
        Padding(
            padding: const EdgeInsets.fromLTRB(
                20.0, 8.0, 20.0, 0.0),
            child:
            Column(
                children: <Widget>[
                  ...getOptions(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('About this service',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                      ]
                  ),

                ]
            )
        ),
        collapsed:
        Padding(
            padding: const EdgeInsets.fromLTRB(
                20.0, 0.0, 20.0, 40.0),
            child:
            Column(
                children: <Widget>[
                  HtmlWidget( readText(model!.model!.description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 100)),

                ]
            )

        ),
        expanded:
        SingleChildScrollView(
            controller: controller!,
            physics: const NeverScrollableScrollPhysics(),
            reverse: false,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //header
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 2.0),
                      child : HtmlWidget(model!.model!.description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                        onTapUrl: (url) async{
                          if(url!.contains('projects.co.id')){


                            if(url!.contains(new RegExp(r'[0-9]'))){
                              if(url!.contains('show_conversation')){
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url+ '/' ));
                              }else{
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url )).catchError((onError){

                                  AppProvider.getRouter(context)!.pop(context);
                                });
                              }

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(url + '/listing/'));
                            }


                          }else
                          {

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }


                          }


                        },
                        onTapImage:(src) =>  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowItemScreenshots2(image:'$src')),
                        ),
                      )
                  ),


                ]
            )

        )

    );

     */


  }


  Widget viewDesc1(BuildContext context) {

    ScrollController? controller;
    return ExpandablePanel(
        header:
        Padding(
            padding: const EdgeInsets.fromLTRB(
                20.0, 8.0, 20.0, 0.0),
            child:
            Column(
                children: <Widget>[
                  ...getOptions(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('About this service',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                      ]
                  ),

                ]
            )
        ),
        collapsed:
        Padding(
            padding: const EdgeInsets.fromLTRB(
                20.0, 0.0, 20.0, 40.0),
            child:
            Column(
                children: <Widget>[
                  HtmlWidget( readText(model!.model!.description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 100)),

                ]
            )

        ),
        expanded:
        SingleChildScrollView(
            controller: controller!,
            physics: const NeverScrollableScrollPhysics(),
            reverse: false,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //header
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 2.0),
                      child : HtmlWidget(model!.model!.description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                        onTapUrl: (url) async{
                          if(url!.contains('projects.co.id')){


                            if(url!.contains(new RegExp(r'[0-9]'))){
                              if(url!.contains('show_conversation')){
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url+ '/' ));
                              }else{
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url )).catchError((onError){

                                  AppProvider.getRouter(context)!.pop(context);
                                });
                              }

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(url + '/listing/'));
                            }


                          }else
                          {

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }


                          }

                          throw 'Could not launch ';
                        },
                        onTapImage:(src) =>  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowItemScreenshots2(image:'$src')),
                        ),
                      )
                  ),


                ]
            )

        )

    );

    /*
    return Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DescServiceInfo(info : model!.model, title: model!.meta.title)),
              );
            },
            child:
            Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('About this service',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  HtmlWidget( readText(model!.model!.description, 150)),
                ]
            )


        )
    );

     */
  }


  @override
  Widget view (BuildContext context, ScrollController? controller, bool? account) {


    viewChildren.clear();

    viewChildren.add(viewHeader(context));

    viewChildren.add(viewDesc(context));
    viewChildren.add( Padding(
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: viewTags(context))
    );

    viewChildren.add(viewBody(context));
   // viewChildren.add(viewInfo(context));


    /*
    viewChildren.add(viewInfo(context));
    viewChildren.add(viewTrialVersion(context));
    viewChildren.add(viewButton(context, account));
    viewChildren.add(viewScreenshots(context));
    viewChildren.add(viewDesc(context));
    viewChildren.add( Padding(
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: viewTags(context))
    );

    viewChildren.add(viewReview(context));
    viewChildren.add(viewComment(context, account));
    viewChildren.add(viewOwnerInfo(context));

     */


    //product_reviews
    //product-comments


    return(  SingleChildScrollView(
        controller: controller!,
        physics: const AlwaysScrollableScrollPhysics(),
        reverse: false,

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: viewChildren
        )
    ));
  }



}


class ShowItemScreenshots2 extends StatelessWidget {
  final String? image;
  ShowItemScreenshots2({this.image});
  var _appbar = AppBar(
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    backgroundColor: CurrentTheme.MainAccentColor,
    elevation: 0.0,
    title: Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
      child: Text(
        'View',
        style: TextStyle(
            fontFamily: "Gotik",
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _appbar,
      //resizeToAvoidBottomPadding: false,
      body: PhotoView(
        imageProvider: NetworkImage(
          this.image!,
        ),
        // Contained = the smallest possible size to fit one dimension of the screen
        minScale: PhotoViewComputedScale.contained * 0.8,
        // Covered = the smallest possible size to fit the whole screen
        maxScale: PhotoViewComputedScale.covered * 2.7,
        enableRotation: true,
        // Set the background color to the "classic white"
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenshotsItem2 extends StatelessWidget {
  final ItemScreenshots? model;
  final ScreenshotsListingTools? info;
  ScreenshotsItem2({this.model, this.info});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                // return BidItemInfo(info : info);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowItemScreenshots2(image : model!.image_url)),
                );
              },
              child: Container(
                height: 120.0,
                width: 160.0,
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 110.0,
                      width: 150.0,
                      child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                // In order to have the ink splash appear above the image, you
                                // must use Ink.image. This allows the image to be painted as part
                                // of the Material and display ink effects above it. Using a
                                // standard Image will obscure the ink splash.
                                child:
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:Image.network(
                                      model!.image_url!,
                                      fit: BoxFit.fitHeight,
                                    )
                                )
                            ),
                          ]
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class DescServiceInfo1 extends StatelessWidget {
  final ViewModelMyServicesRev? info;
  final String? title;
  ScrollController? controller;
  DescServiceInfo1({this.info, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: CurrentTheme.MainAccentColor,
            elevation: 0.0,
            title: Row (
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0 , 0.0),
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      info!.logo_url!,
                      fit: BoxFit.fill,
                      height: 35.0,
                      width: 35.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0 , 0.0),
                  child:
                  Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Text(
                          readText(title!, 30),
                          style: const TextStyle(
                              fontFamily: "Gotik",
                              fontSize: 13.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontSize: 12.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
              ],
            )
        ),
        body:
        SingleChildScrollView(
            controller: controller!,
            physics: const AlwaysScrollableScrollPhysics(),
            reverse: false,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //header
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 2.0),
                      child : HtmlWidget(info!.description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                        onTapUrl: (url) async{
                          if(url!.contains('projects.co.id')){
                            if(url!.contains(new RegExp(r'[0-9]'))){
                              if(url!.contains('show_conversation')){
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url+ '/' ));
                              }else{
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url )).catchError((onError){
                                  AppProvider.getRouter(context)!.pop(context);
                                });
                              }
                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(url + '/listing/'));
                            }
                          }else
                          {
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                          throw 'Could not launch ';
                        },
                        onTapImage:(src) =>  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowItemScreenshots2(image:'$src')),
                        ),
                      )
                  ),
                ]
            )
        )
    );
  }
}

///////////////////////////////////////////////////


class MyServicesListingModel extends MyServicesListingBase{
  Map<String, dynamic> json;
  MyServicesListingModel(Map<String, dynamic> this.json):super(json);
  Widget viewItem (ItemMyServicesModel item,String? search, bool? account) {
    ShapeBorder? shape;
    // double?height = 302;
    double?height = 260;


    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyServicesCard1(destination :item, search : search, shape : shape, height : height, account:account)
      //  child:  ItemMyServicesCard2(destination :item, search : search, shape : shape, height : height)
    );
  }

}

class ItemMyServicesCard1 extends StatelessWidget {
  const ItemMyServicesCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double?height ;
  final ItemMyServicesModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final bool? account;



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
        child:
        Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          //  shadowColor: CurrentTheme.ListColor,

          child: ItemMyServicesContent1(destination: destination, account : account),

        ),

      ),
    );

    /*

    return Card(
      //padding:EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      elevation: 5.0,
      child: Center(
        child:

        ItemMyServicesContent1(destination: destination, account : account),

      ),
      margin: EdgeInsets.all(5.0),
    );

     */

  }
}


class ItemMyServicesContent1 extends StatelessWidget {
  const ItemMyServicesContent1({ Key? key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemMyServicesModel? destination;

  final bool? account;


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final mediaQueryData = MediaQuery.of(context);
    var dateformat = DateFormat('dd/MM/yyyy HH:mm:ss');
    final size =MediaQuery.of(context).size;
    final width =size.width;
   // String? sts = destination!.item.project_project_status_str.split('>')[1].split('<')[0];
    String? sts1 = destination!.item.status_str.split('>')[1].split('<')[0];

    final List<Widget> children = <Widget>[

      Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 2.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle!,
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // three line description
              Container(
                width: 250,
                child: Stack(

                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,2.0, 0.0, 0.0),
                      child: DefaultTextStyle(
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: descriptionStyle!,
                        child: Container(
                          width: 250,
                          child:
                          // three line description
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child:    Html(data: sts1!.toUpperCase(),
                              //  defaultTextStyle: TextStyle(color: CurrentTheme.ErrorColor),
                              style: {
                                "html": Style(
                                  color: CurrentTheme.SecondaryColor,
                                  fontSize: FontSize.xLarge,
                                ),
                              },
                            ) ,

                          ),
                        ),
                      ),
                    ),
                    Container(
                      // height:  120.0,
                      padding:  const EdgeInsets.fromLTRB(8.0, 32.0, 16.0, 0.0),
                      child:
                      Text('Status' , style: TextStyle(fontSize: 14)),


                    ),
                  ],
                ),
              ),




              new Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[


                      destination!.item.buttons != null?
                      destination!.item.buttons.length == 1?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[0].url ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item.buttons[0].text),
                          ),
                        ],
                      ):
                      destination!.item.buttons.length == 2?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[0].url ));
                          }
                          if(value == 2) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[1].url ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item.buttons[0].text),
                          ),

                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item.buttons[1].text),
                          ),

                        ],
                      ):
                      destination!.item.buttons.length == 3?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[0].url ));
                          }
                          if(value == 2) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[1].url ));
                          }
                          if(value == 3) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[2].url ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item.buttons[0].text),
                          ),

                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item.buttons[1].text),
                          ),

                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item.buttons[2].text),
                          ),

                        ],
                      ):
                      destination!.item.buttons.length == 4?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[0].url ));
                          }
                          if(value == 2) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[1].url ));
                          }
                          if(value == 3) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[2].url ));
                          }
                          if(value == 4) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[3].url ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item.buttons[0].text),
                          ),

                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item.buttons[1].text),
                          ),

                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item.buttons[2].text),
                          ),

                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item.buttons[3].text),
                          ),

                        ],
                      ):
                      destination!.item.buttons.length == 5?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[0].url ));
                          }
                          if(value == 2) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[1].url ));
                          }
                          if(value == 3) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[2].url ));
                          }
                          if(value == 4) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[3].url ));
                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[4].url ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item.buttons[0].text),
                          ),

                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item.buttons[1].text),
                          ),

                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item.buttons[2].text),
                          ),

                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item.buttons[3].text),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item.buttons[4].text),
                          ),
                        ],
                      ):
                      destination!.item.buttons.length == 6?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[0].url ));
                          }
                          if(value == 2) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[1].url ));
                          }
                          if(value == 3) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[2].url ));
                          }
                          if(value == 4) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[3].url ));
                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[4].url ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[5].url ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item.buttons[0].text),
                          ),

                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item.buttons[1].text),
                          ),

                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item.buttons[2].text),
                          ),

                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item.buttons[3].text),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item.buttons[4].text),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item.buttons[5].text),
                          ),
                        ],
                      ):
                      destination!.item.buttons.length == 7?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[0].url ));
                          }
                          if(value == 2) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[1].url ));
                          }
                          if(value == 3) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[2].url ));
                          }
                          if(value == 4) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[3].url ));
                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[4].url ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[5].url ));
                          }
                          if(value == 7) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[6].url ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item.buttons[0].text),
                          ),

                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item.buttons[1].text),
                          ),

                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item.buttons[2].text),
                          ),

                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item.buttons[3].text),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item.buttons[4].text),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item.buttons[5].text),
                          ),
                          PopupMenuItem<int>(
                            value: 7,
                            child: Text(destination!.item.buttons[6].text),
                          ),
                        ],
                      ):

                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[0].url ));
                          }
                          if(value == 2) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[1].url ));
                          }
                          if(value == 3) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[2].url ));
                          }
                          if(value == 4) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[3].url ));
                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[4].url ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[5].url ));
                          }
                          if(value == 7) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[6].url ));
                          }
                          if(value == 8) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[7].url ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item.buttons[0].text),
                          ),

                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item.buttons[1].text),
                          ),

                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item.buttons[2].text),
                          ),

                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item.buttons[3].text),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item.buttons[4].text),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item.buttons[5].text),
                          ),
                          PopupMenuItem<int>(
                            value: 7,
                            child: Text(destination!.item.buttons[6].text),
                          ),
                          PopupMenuItem<int>(
                            value: 8,
                            child: Text(destination!.item.buttons[7].text),
                          ),
                        ],
                      ): Container(height: 0.0, width: 0.0, color: Colors.white,),



                    //settingsRow,
                  ],
                ),

              )
            ],
          ),
        ),
      ),
      SizedBox(height: 20,),
      ClipRRect(
        //borderRadius: BorderRadius.circular(20),
        child:

            GestureDetector(
            onTap: () {
            AppProvider.getRouter(context)!.navigateTo(
            context,
            urlToRoute(destination!.item.buttons[destination!.item.buttons.length-1].url ));
            },
            child:

                Image.network(
                  this.destination!.item.logo_url,
                  fit: BoxFit.cover,
                  height: size.height * 0.25,
                  width: size.width,

                ),
            ),
      ),
      SizedBox(height: 20,),
      Container(
        // height:  120.0,
        padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
        child:
        GestureDetector(
            onTap: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item.buttons[destination!.item.buttons.length-1].url ));
            },
            child:
            Ink(
                child: Html(data: readText(destination!.item.title , 400) ,
                  // useRichText: true, defaultTextStyle : titleStyle )
                  style: {
                    "html": Style(
                      display: Display.BLOCK,
                      fontSize: FontSize.large,
                      fontWeight: FontWeight.w500,

                    ),
                  },
                )

            )
        ),
      ),
      Container(
        // height:  120.0,
        padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
        child:
        GestureDetector(
            onTap: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item.buttons[destination!.item.buttons.length-1].url ));
            },
            child:
            Ink(
                child: Html(data: destination!.item.short_description ,
                  // useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 ),
                  style: {
                    "html": Style(
                      display: Display.BLOCK,
                      fontSize: FontSize.medium,
                    ),
                  },
                )

            )
        ),
      ),

      GestureDetector(
      onTap: () {
      AppProvider.getRouter(context)!.navigateTo(
      context,
      urlToRoute(destination!.item.buttons[destination!.item.buttons.length-1].url ));
      },
      child:
        Padding(
            padding: EdgeInsets.only(left: 10.0, top: 0.0),
            child: ChannelNonURLRouteWidget(
              value: destination!.item.tags_id,
              caption: '',
              hint: ' ',
              required: false,
              idroutetags: destination!.item.tags_id,
              nameroutetags: destination!.item.tags_str,
            )),
      ),
      GestureDetector(
      onTap: () {
      AppProvider.getRouter(context)!.navigateTo(
      context,
      urlToRoute(destination!.item.buttons[destination!.item.buttons.length-1].url ));
      },
      child:

        Container(
          // height:  120.0,
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
            child: Text('${destination!.item.price_str},-' , style: TextStyle(fontSize: 15, color: Colors.red))
        ),
      ),
      SizedBox(height: 10,),
      Padding(
        //accepted_worker_url
          padding:  const EdgeInsets.fromLTRB(20.0, 5.0, 16.0, 0.0),
          child:

          GestureDetector(
            onTap: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item.buttons[destination!.item.buttons.length-1].url ));
            },
            child:
            Text(destination!.item.published_date == null ? 'Published Date: -' :  'Published Date: ${dateformat.format(destination!.item.published_date)} WIB', style: TextStyle(fontSize: 15)),
          )
      ),
      Padding(
        //accepted_worker_url
          padding:  const EdgeInsets.fromLTRB(20.0, 5.0, 16.0, 0.0),
          child:

          GestureDetector(
            onTap: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item.buttons[destination!.item.buttons.length-1].url ));
            },
            child:
            Text(destination!.item.last_bump == null ? 'Last Bump:  -':'Last Bump: ${ dateformat.format(destination!.item.last_bump)} WIB', style: TextStyle(fontSize: 15)),
          )
      ),
      GestureDetector(
      onTap: () {
      AppProvider.getRouter(context)!.navigateTo(
      context,
      urlToRoute(destination!.item.buttons[destination!.item.buttons.length-1].url ));
      },
      child:
        Container(
          // height:  120.0,
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
            child: Text('Finish Days: ${destination!.item.finish_days == null ? '-' : destination!.item.finish_days.toString()}' , style: TextStyle(fontSize: 15))
        ),
      ),


      Container(
        // height:  120.0,
        padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
        child:
        GestureDetector(
            onTap: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item.buttons[destination!.item.buttons.length-1].url ));
            },
            child:
            Ink(
                child: Html(data: 'Admin Note: ' + destination!.item.admin_note  ,
                  // useRichText: true, defaultTextStyle : titleStyle )
                  style: {
                    "html": Style(
                      display: Display.BLOCK,
                      fontSize: FontSize(15),
                      fontWeight: FontWeight.w500,

                    ),
                  },
                )

            )
        ),
      ),

      SizedBox(height: 30,),
    ];

    /*

    final List<Widget> children2 = <Widget>[
      // Photo? and title.
      SizedBox(
        height: mediaQueryData.size.height < 720 ?  130 : 150,
        child: Stack(

          children: <Widget>[

            Positioned.fill(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                top : 5.0,
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                child:
                Image.network(
                  destination!.item.logo_url,
                  fit: BoxFit.none,
                )
            ),



            Positioned.fill(
                child: new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      splashColor: Colors.lightGreenAccent,
                    /*  onTap: () {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(destination!.item.buttons[2].url ));
                      },*/
                    )
                )
            ),
            /*
            Positioned.fill(
                bottom: 17,
                left: 0.22 * mediaQueryData.size.width - destination!.item.price_str.length.toDouble() * 0.35,
                top:  75,
                right: 15,
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                child:
                Container(
                  // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  alignment: Alignment.center,
                  height: 10.0,
                  decoration: new BoxDecoration(
                    //color: Colors.lightBlue[100],
                    color:CurrentTheme.NormalTextColor,
                  ),
                  child: Text( destination!.item.price_str ,style: TextStyle(color: CurrentTheme.BackgroundColor, fontSize: 10),

                  ),
                )
            ),

            */
          ],
        ),
      ),


    ];




    final List<Widget> children1 = <Widget>[
      // Photo? and title.

      SizedBox(
          height: 78,
          // padding: const EdgeInsets.fromLTRB(5.0, 2.0, 0.0 , 0.0),
          child:
          Stack(

              children: <Widget>[
                Positioned.fill(
                    bottom: 0.0,
                    left:mediaQueryData.size.width < 350 ?  mediaQueryData.size.width * 1/3 : mediaQueryData.size.width * 1/2.8,
                    right: 0.0,
                    top : 10.0,
                    // In order to have the ink splash appear above the image, you
                    // must use Ink.image. This allows the image to be painted as part
                    // of the Material and display ink effects above it. Using a
                    // standard Image will obscure the ink splash.
                    child:  Container(
                        padding: const EdgeInsets.fromLTRB(14.0, 20.0, 0.0 , 0.0),
                        child: Column(
                            children : <Widget>[
                              Container(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0 , 0.0),
                                child:
                                destination!.item.buttons != null?
                                destination!.item.buttons.length == 1?
                                PopupMenuButton<int>(
                                  onSelected: (int value) {
                                    if(value == 1) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[0].url ));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text(destination!.item.buttons[0].text),
                                    ),
                                  ],
                                ):
                                destination!.item.buttons.length == 2?
                                PopupMenuButton<int>(
                                  onSelected: (int value) {
                                    if(value == 1) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[0].url ));
                                    }
                                    if(value == 2) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[1].url ));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text(destination!.item.buttons[0].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text(destination!.item.buttons[1].text),
                                    ),

                                  ],
                                ):
                                destination!.item.buttons.length == 3?
                                PopupMenuButton<int>(
                                  onSelected: (int value) {
                                    if(value == 1) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[0].url ));
                                    }
                                    if(value == 2) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[1].url ));
                                    }
                                    if(value == 3) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[2].url ));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text(destination!.item.buttons[0].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text(destination!.item.buttons[1].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 3,
                                      child: Text(destination!.item.buttons[2].text),
                                    ),

                                  ],
                                ):
                                destination!.item.buttons.length == 4?
                                PopupMenuButton<int>(
                                  onSelected: (int value) {
                                    if(value == 1) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[0].url ));
                                    }
                                    if(value == 2) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[1].url ));
                                    }
                                    if(value == 3) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[2].url ));
                                    }
                                    if(value == 4) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[3].url ));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text(destination!.item.buttons[0].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text(destination!.item.buttons[1].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 3,
                                      child: Text(destination!.item.buttons[2].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 4,
                                      child: Text(destination!.item.buttons[3].text),
                                    ),

                                  ],
                                ):
                                destination!.item.buttons.length == 5?
                                PopupMenuButton<int>(
                                  onSelected: (int value) {
                                    if(value == 1) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[0].url ));
                                    }
                                    if(value == 2) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[1].url ));
                                    }
                                    if(value == 3) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[2].url ));
                                    }
                                    if(value == 4) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[3].url ));
                                    }
                                    if(value == 5) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[4].url ));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text(destination!.item.buttons[0].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text(destination!.item.buttons[1].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 3,
                                      child: Text(destination!.item.buttons[2].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 4,
                                      child: Text(destination!.item.buttons[3].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 5,
                                      child: Text(destination!.item.buttons[4].text),
                                    ),
                                  ],
                                ):
                                destination!.item.buttons.length == 6?
                                PopupMenuButton<int>(
                                  onSelected: (int value) {
                                    if(value == 1) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[0].url ));
                                    }
                                    if(value == 2) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[1].url ));
                                    }
                                    if(value == 3) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[2].url ));
                                    }
                                    if(value == 4) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[3].url ));
                                    }
                                    if(value == 5) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[4].url ));
                                    }
                                    if(value == 6) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[5].url ));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text(destination!.item.buttons[0].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text(destination!.item.buttons[1].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 3,
                                      child: Text(destination!.item.buttons[2].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 4,
                                      child: Text(destination!.item.buttons[3].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 5,
                                      child: Text(destination!.item.buttons[4].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 6,
                                      child: Text(destination!.item.buttons[5].text),
                                    ),
                                  ],
                                ):
                                destination!.item.buttons.length == 7?
                                PopupMenuButton<int>(
                                  onSelected: (int value) {
                                    if(value == 1) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[0].url ));
                                    }
                                    if(value == 2) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[1].url ));
                                    }
                                    if(value == 3) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[2].url ));
                                    }
                                    if(value == 4) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[3].url ));
                                    }
                                    if(value == 5) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[4].url ));
                                    }
                                    if(value == 6) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[5].url ));
                                    }
                                    if(value == 7) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[6].url ));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text(destination!.item.buttons[0].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text(destination!.item.buttons[1].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 3,
                                      child: Text(destination!.item.buttons[2].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 4,
                                      child: Text(destination!.item.buttons[3].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 5,
                                      child: Text(destination!.item.buttons[4].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 6,
                                      child: Text(destination!.item.buttons[5].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 7,
                                      child: Text(destination!.item.buttons[6].text),
                                    ),
                                  ],
                                ):

                                PopupMenuButton<int>(
                                  onSelected: (int value) {
                                    if(value == 1) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[0].url ));
                                    }
                                    if(value == 2) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[1].url ));
                                    }
                                    if(value == 3) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[2].url ));
                                    }
                                    if(value == 4) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[3].url ));
                                    }
                                    if(value == 5) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[4].url ));
                                    }
                                    if(value == 6) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[5].url ));
                                    }
                                    if(value == 7) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[6].url ));
                                    }
                                    if(value == 8) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(destination!.item.buttons[7].url ));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text(destination!.item.buttons[0].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text(destination!.item.buttons[1].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 3,
                                      child: Text(destination!.item.buttons[2].text),
                                    ),

                                    PopupMenuItem<int>(
                                      value: 4,
                                      child: Text(destination!.item.buttons[3].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 5,
                                      child: Text(destination!.item.buttons[4].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 6,
                                      child: Text(destination!.item.buttons[5].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 7,
                                      child: Text(destination!.item.buttons[6].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 8,
                                      child: Text(destination!.item.buttons[7].text),
                                    ),
                                  ],
                                ): Container(height: 0.0, width: 0.0, color: Colors.white,),


                              ),
                            ]
                        )
                    )

                ),
                Positioned.fill(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  top : 20.0,
                  // In order to have the ink splash appear above the image, you
                  // must use Ink.image. This allows the image to be painted as part
                  // of the Material and display ink effects above it. Using a
                  // standard Image will obscure the ink splash.
                  child:   Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // three line description


                        //newly added
                        Flexible(
                            fit : FlexFit.tight,
                            child: Container(
                                padding: const EdgeInsets.fromLTRB(5.0, 20.0, 0.0 , 0.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children : <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          AppProvider.getRouter(context)!.navigateTo(
                                              context,
                                              urlToRoute(destination!.item.buttons[2].url ));
                                        },
                                        child: Text(
                                          destination!.item.title  + ' . ' , overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10),

                                        ),

                                      ),
                                      Row(
                                          children: <Widget>[
                                            // three line description


                                            HtmlWidget(
                                              destination!.item.status_str  + ' . ' ,
                                              textStyle: TextStyle(fontSize: 9),
                                              //bodyPadding: EdgeInsets.all(0.0),
                                            ),


                                          ]
                                      ),

                                      Row(
                                          children: <Widget>[
                                            // three line description


                                            destination!.item.last_bump==null?
                                            Text(' last bump'+'.' , style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 8))
                                            :Text(
                                              ' last bump' + timeago.format(destination!.item.last_bump) + ' . ',
                                              style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 8),
                                            ),
                                            Text(
                                              destination!.item.price_str ,
                                              style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 8),
                                            ),



                                          ]
                                      ),

                                    ]
                                )
                            )
                        ),

                      ]

                  ),

                ),

              ])



      )

    ];

     */


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );

    /*
    return GridTile(
      footer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children1,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );

     */

  }

}

//class ItemMyServices extends class ItemMyServicesBase{
//
//}



////////////////////////////
