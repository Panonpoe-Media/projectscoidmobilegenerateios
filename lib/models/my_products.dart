import 'my_products_item_base.dart';
import 'package:getwidget/getwidget.dart';
import 'package:projectscoid/models/my_products_base.dart';
import 'package:projectscoid/models/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import 'file_fields.dart';
import 'meta.dart';
import 'button.dart';
import 'my_products_item.dart';
import 'photo.dart';
import 'package:projectscoid/models/my_products_base.dart';
import 'MyProducts/screenshots_list_item_base.dart';
import 'package:projectscoid/models/MyProducts/screenshots_list_base.dart';
import 'package:projectscoid/models/MyProducts/comments_list_base.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expandable/expandable.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:projectscoid/app/Env.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:projectscoid/views/MyProducts/comments_list.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'my_products.g.dart';
/** AUTOGENERATE OFF **/

class AddNewProductMyProductsModel extends AddNewProductMyProductsBase{

  Map<String, dynamic> json;
  AddNewProductMyProductsModel(Map<String, dynamic> this.json):super(json);
  @override

  Map<String, dynamic> convertFormDataAction(var data, String?triger){

    String?logo = '';
    if (model.model.logo!= null) {
      if (model.model.logo.temp != null) {
        logo = '{"status":"1","name":"${model.model.logo.name}","temp":"${model.model.logo.temp}"}';
      }
    }

    String?deliverable = '';
    if (model.model.deliverable!= null) {
      if (model.model.deliverable[0].temp != '') {
        deliverable = '[{"name":"${model.model.deliverable[0].name}","size":${model.model.deliverable[0].size},"created":${model.model.deliverable[0].date},"modified":${model.model.deliverable[0].date},"temp":"${model.model.deliverable[0].temp}","remote":"${model.model.deliverable[0].remote}","dir":"${model.model.deliverable[0].dir}"}]';
      }
    }

    String?trial_version = '';
    if (model.model.trial_version!= null) {
      if (model.model.trial_version[0].temp != '') {
        trial_version = '[{"name":"${model.model.trial_version[0].name}","size":${model.model.trial_version[0].size},"created":${model.model.trial_version[0].date},"modified":${model.model.trial_version[0].date},"temp":"${model.model.trial_version[0].temp}","remote":"${model.model.trial_version[0].remote}","dir":"${model.model.trial_version[0].dir}"}]';
      }
    }

    String?tgr = triger!.toLowerCase().replaceAll(' ', '_');
    var formData = {
      "product[_trigger_]":"$tgr",
      "product[logo]": "$logo",
     // "product[logo]": "",
      "product[logo_lastval]": "",
      "product[title]": "${model.model.title }",
      "product[description]": "${model.model.description }",
      "product[deliverable]": "$deliverable",
      "product[deliverable_lastval]": "",
      //"product[trial_version]": "$trial_version",
      "product[trial_version]": "$trial_version",
      "product[trial_version_lastval]": "",
      "product[price]": "${model.model.price }"
    };
    int count = 0;
    for(var tag in model.model.tags_id){
      formData.addAll({"product[tags][selection][$count]": "$tag"});
      count++;
    }
    return( formData);
  }


}

class PublishProductMyProductsModel extends PublishProductMyProductsBase{

  Map<String, dynamic> json;
  PublishProductMyProductsModel(Map<String, dynamic> this.json):super(json); 
	  
}

class EditProductMyProductsModel extends EditProductMyProductsBase{

  Map<String, dynamic> json;
  EditProductMyProductsModel(Map<String, dynamic> this.json):super(json); 
	  
}

class BumpUpMyProductsModel extends BumpUpMyProductsBase{

  Map<String, dynamic> json;
  BumpUpMyProductsModel(Map<String, dynamic> this.json):super(json); 
	  
}

class UnlistMyProductsModel extends UnlistMyProductsBase{

  Map<String, dynamic> json;
  UnlistMyProductsModel(Map<String, dynamic> this.json):super(json); 
	  
}

class ReactivateProductMyProductsModel extends ReactivateProductMyProductsBase{

  Map<String, dynamic> json;
  ReactivateProductMyProductsModel(Map<String, dynamic> this.json):super(json); 
	  
}


class MyProductsModel extends MyProductsBase{
  Map<String, dynamic> json;
  MyProductsModel(Map<String, dynamic> this.json):super(json); 	

  
}
////////////////////////////////////////////////////////////
@JsonSerializable()

class ViewModelMyProductsRev {
  int?   age;
  int?   cnt;
  int?   page;
  String?id;
  String?ttl;
  String?pht;
  String?sbttl;


  int?seller_id;
  String?seller_str;
  String?seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  String?logo_url;
  Photo? logo;
  String?title;
  String?description;
  String?short_description;
  List<int?>? tags_id;
  List<String?>?  tags_str;
  List<String?>? tags_url;
  List<FileField?>? deliverable;
  String?deliverable_url;
  String?deliverable_name;
  List<FileField?>? trial_version;
  String?trial_version_url;
  String?trial_version_name;
  DateTime?  registered_date;
  DateTime?  published_date;
  DateTime?  last_bump;
  double? price;
  String?price_str;
  int?status_id;
  String?status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int?sales_count;
  String?sales_count_str;
  double? sales_amount;
  String?sales_amount_str;
  int?rating;
  int?points;
  String?points_str;
  int?ranking;
  String?ranking_str;
  String?admin_note;
  String?product_id;
  
  ViewModelMyProductsRev(
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
      this.deliverable,
      this.deliverable_url,
      this.deliverable_name,
      this.trial_version,
      this.trial_version_url,
      this.trial_version_name,
      this.registered_date,
      this.published_date,
      this.last_bump,
      this.price,
      this.price_str,
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
      this.product_id
      );


  factory ViewModelMyProductsRev.fromJson(Map<String, dynamic> json) => _$ViewModelMyProductsRevFromJson(json);

}

/*
ViewModelMyProductsRev  _$ViewModelMyProductsRevFromJson(Map<String, dynamic> json) {
  return ViewModelMyProductsRev(
      json['id'] as String,
      json['seller_id'] as int,
      json['seller_str'] as String,
      json['seller_url'] as String,
      (json['seller_list'] as List)?.map((e) => e as int)?.toList(),
      (json['seller_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['logo'] == null
          ? null
          : Photo?.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String,
      json['title'] as String,
      json['description'] as String,
      json['short_description'] as String,
      (json['tags_id'] as List)?.map((e) => e as int)?.toList(),
      (json['tags_str'] as List)?.map((e) => e as String)?.toList(),
      (json['tags_url'] as List)?.map((e) => e as String)?.toList(),
      (json['deliverable'] as List)
          ?.map((e) =>
      e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['deliverable_url'] as String,
      json['deliverable_name'] as String,
      (json['trial_version'] as List)
          ?.map((e) =>
      e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['trial_version_url'] as String,
      json['trial_version_name'] as String,
      json['registered_date'] == null
          ? null
          : DateTime?.parse(json['registered_date'] as String),
      json['published_date'] == null
          ? null
          : DateTime?.parse(json['published_date'] as String),
      json['last_bump'] == null
          ? null
          : DateTime?.parse(json['last_bump'] as String),
      (json['price'] as num)?.toDouble(),
      json['price_str'] as String,
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
      json['product_id'] as String)
    ..age = json['age'] as int
    ..cnt = json['cnt'] as int
    ..page = json['page'] as int
    ..ttl = json['ttl'] as String
    ..pht = json['pht'] as String
    ..sbttl = json['sbttl'] as String;
}

 */
@JsonSerializable()

class MyProductsViewRevSuperBase {

  String?id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyProductsRev? model;
  MyProductsViewRevSuperBase(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );





  factory MyProductsViewRevSuperBase.fromJson(Map<String, dynamic> json) => _$MyProductsViewRevSuperBaseFromJson(json);

}

/*
MyProductsViewRevSuperBase _$MyProductsViewRevSuperBaseFromJson(
    Map<String, dynamic> json) {
  return MyProductsViewRevSuperBase(
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
          : ViewModelMyProductsRev.fromJson(
          json['model'] as Map<String, dynamic>));
}

 */

class MyProductsViewModel  extends MyProductsViewBase{
  Map<String, dynamic> json;
  //MyProductsViewModel(Map<String, dynamic> this.json):super(json);
  MyProductsViewModel(Map<String, dynamic> this.json):super(json){model = MyProductsViewRevSuperBase.fromJson(this.json);}



  Widget viewHeader (BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5!;
    final mediaQueryData = MediaQuery.of(context);

    var dateformat = DateFormat('dd/MM/yyyy HH:mm:ss');
    final size =MediaQuery.of(context).size;
    final width =size.width;
    // String?sts = destination!.item.project_project_status_str.split('>')[1].split('<')[0];
    String?sts1 = this.model.model.status_str.split('>')[1].split('<')[0];



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
                    MaterialPageRoute(builder: (context) => ShowItemScreenshots2(image : this.model.model.logo_url)),
                  );
                },
                child:

                Image.network(
                  this.model.model.logo_url,
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
                      // return BidItemInfo(info : this.info);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowItemScreenshots2(image : this.model.model.logo_url)),
                      );
                    },

                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        this.model.model.logo_url,
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
                                // this.model.meta.title ,
                                data :model.meta.title,
                                style: {
                                  "html": Style(
                                    fontSize: FontSize.medium,
                                  ),
                                },
                                //useRichText: true, defaultTextStyle :  descriptionStyle.copyWith(  fontSize: model.meta.title.length < 75 ? 15 : model.meta.title.length < 150 ?  13 : 12),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(this.model.model.seller_url ));
                                },
                                child: Html(

                                  data :readText(this.model.model.seller_str , 54),
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

                                data :this.model.model.price_str,
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

  Widget viewHeader1 (BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    final mediaQueryData = MediaQuery.of(context);
    return(
        GFListTile(
            avatar:GFAvatar(
              shape: GFAvatarShape.standard,
              maxRadius: 45.0,
              size: GFSize.LARGE,
              backgroundImage: NetworkImage(
                this.model.model.logo_url,
                // fit: BoxFit.fitHeight,
                // height: 75.0,
                // width: 80.0,
              ),
            ),
            title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children : <Widget>[

                  Html  (
                    // this.model.meta.title ,
                    data :model.meta.title,
                    style: {
                      "html": Style(
                        fontSize: FontSize.small,
                        //color: Colors.black87,
                        //backgroundColor: CurrentTheme.BackgroundColor
                      ),
                    },
                    //useRichText: true, defaultTextStyle :  descriptionStyle.copyWith( fontSize: model.meta.title.length < 75 ? 15 : model.meta.title.length < 150 ?  13 : 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute(this.model.model.seller_url));
                    },
                    child: Html(

                      data :readText(this.model.model.seller_str , 54),
                      style: {
                        "html": Style(
                          fontSize: FontSize.small,
                          color: Colors.green,
                          // backgroundColor: CurrentTheme.BackgroundColor
                        ),
                      },
                      //useRichText: true, defaultTextStyle : descriptionStyle.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                    ),
                  ),

                  Html(

                    data :this.model.model.price_str,
                    style: {
                      "html": Style(
                        fontSize: FontSize.small,
                        fontWeight: FontWeight.w500,
                      ),
                    },

                    //  useRichText: true, defaultTextStyle : descriptionStyle.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                  ),

                  //
                  /*
                    Html(

                        data :readText(this.model.model.project_status_str , 54),
                        style: {
                          "html": Style(
                              fontSize: FontSize.small,
                              fontWeight: FontWeight.w500
                          ),
                        },
                      //  useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500 )
                    ),

                     */

                ]
            )

        )
    /*

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
                      // return BidItemInfo(info : this.info);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowItemScreenshots(image : this.model.model.logo_url)),
                      );
                    },

                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        this.model.model.logo_url,
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
                                // this.model.meta.title ,
                                data :model.meta.title,
                                style: {
                                  "html": Style(
                                    fontSize: FontSize.medium,
                                  ),
                                },
                                //useRichText: true, defaultTextStyle :  descriptionStyle.copyWith(  fontSize: model.meta.title.length < 75 ? 15 : model.meta.title.length < 150 ?  13 : 12),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(this.model.model.seller_url ));
                                },
                                child: Html(

                                  data :readText(this.model.model.seller_str , 54),
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

                                      data :this.model.model.price_str,
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

     */
    );
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
                              context, urlToRoute(model.url));
                          /*  Navigator.of(context).push(PageRouteBuilder(
                                          pageBuilder: (_, __, ___) => new flashSale(),
                                          transitionsBuilder:
                                              (_, Animation<double?> animation, __, Widget child) {
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
                                child: this.model.model.price < 100000 ?    Html(data: readText('Low price' , 46),

                                  //  defaultTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                                  style: {
                                    "html": Style(
                                      fontSize: FontSize.small,
                                      fontWeight: FontWeight.w300,

                                    ),
                                  },
                                )     :  this.model.model.price < 500000 ? Html(data: readText(' Medium price' , 46),
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
                              context, urlToRoute(model.url));
                          /*  Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => new flashSale(),
                                      transitionsBuilder:
                                          (_, Animation<double?> animation, __, Widget child) {
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
                                  Icons.note_add,
                                  size: 26.0,

                                ),
                              ),
                              Padding(
                                  padding:
                                  EdgeInsets.only(left: 10.0, right: 8.0, top: 1.0),
                                  child: model.model.trial_version == null ? Html(data: readText('No trial version', 46),
                                    // defaultTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                                    style: {
                                      "html": Style(
                                        fontSize: FontSize.small,
                                        fontWeight: FontWeight.w300,

                                      ),
                                    },
                                  ): Html(data: readText('Free sample', 46),
                                    // defaultTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                                    style: {
                                      "html": Style(
                                        fontSize: FontSize.small,
                                        fontWeight: FontWeight.w300,

                                      ),
                                    },
                                  )
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


  @override
  Widget viewTrialVersion (BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    if(model.model.trial_version == null){
      return(Container(height: 0, width: 0) );
    }
    if(model.model.trial_version_name != ''){

      return(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Sample File'),
              ),
              FileViewAtt(
                ctx : context,
                value: model.model.trial_version_name,
                value1: model.model.trial_version_url,
                caption: 'Sample',
              )
            ],
          )

         );
    }else{
      return( Container(height: 0, width: 0) );
    }

  }


  @override
  Widget viewDeliverable (BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    if(model.model.deliverable == null){
      return(Container(height: 0, width: 0) );
    }
    if(model.model.deliverable_name != ''){
      return(
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
           Padding(
             padding: EdgeInsets.only(left: 20.0),
             child: Text('Deliverable File'),
           ),

           FileViewAtt(
             ctx : context,
             value: model.model.deliverable_name,
             value1: model.model.deliverable_url,
             caption: 'Deliverable',
           )
           ],
         )
         );
    }else{
      return( Container(height: 0, width: 0) );
    }

  }




  Widget viewDesc(BuildContext context) {

    ScrollController controller;

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
                        child: Html(data: readText(this.model.model.title , 400) ,
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
                        child: Html(data: this.model.model.short_description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ,
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
                  HtmlWidget( readText(this.model.model.description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 100)),

                ]
            )

        ),
        expanded:
        SingleChildScrollView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            reverse: false,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //header
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 2.0),
                      child : HtmlWidget(this.model.model.description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
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
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    final mediaQueryData = MediaQuery.of(context);

    var dateformat = DateFormat('dd/MM/yyyy HH:mm:ss');
    final size =MediaQuery.of(context).size;
    final width =size.width;
    ScrollController controller;

    return(
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Container(
                // height:  120.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                  child: Text('${this.model.model.price_str},-' , style: TextStyle(fontSize: 15, color: Colors.red))
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
                        child: Html(data: 'Long Description: ' + this.model.model.description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>') ,
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
                    Text(this.model.model.registered_date == null ? 'Registered Date: -' :  'Registered Date: ${dateformat.format(this.model.model.registered_date)} WIB', style: TextStyle(fontSize: 15)),
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
                    Text(this.model.model.published_date == null ? 'Published Date: -' :  'Published Date: ${dateformat.format(this.model.model.published_date)} WIB', style: TextStyle(fontSize: 15)),
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
                    Text(this.model.model.last_bump == null ? 'Last Bump:  -':'Last Bump: ${ dateformat.format(this.model.model.last_bump)} WIB', style: TextStyle(fontSize: 15)),
                  )
              ),




              Container(
                // height:  120.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                  child: Text('Sales Count: ${this.model.model.sales_count == null ? '-' : this.model.model.sales_count.toString()}' , style: TextStyle(fontSize: 15))
              ),

              Container(
                // height:  120.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                  child: Text('Sales Amount: ${this.model.model.sales_amount == null ? '-' : this.model.model.sales_amount_str}' , style: TextStyle(fontSize: 15))
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
                      rating: this.model.model.rating.toDouble()/2-0.01,
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
                  child: Text('Points: ${this.model.model.points == 0 ? '-' : this.model.model.points_str}' , style: TextStyle(fontSize: 15))
              ),

              Container(
                // height:  120.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 0.0),
                  child: Text('Rankings: ${this.model.model.ranking == 0 ? '-' : this.model.model.ranking_str}' , style: TextStyle(fontSize: 15))
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
                        child: Html(data: 'Admin Note: ' + this.model.model.admin_note  ,
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
                  HtmlWidget( readText(this.model.model.description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 100)),

                ]
            )

        ),
        expanded:
        SingleChildScrollView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            reverse: false,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //header
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 2.0),
                      child : HtmlWidget(this.model.model.description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
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




  @override
  Widget view (BuildContext context, ScrollController controller, bool? account, bool _isBannerAdReady,  _bannerAd) {


    viewChildren.clear();
   // viewChildren.add(viewHeader(context));
   // viewChildren.add(viewInfo(context));





    viewChildren.add(viewHeader(context));

    viewChildren.add(viewDesc(context));
    viewChildren.add( Padding(
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: viewTags(context))
    );
    viewChildren.add(viewTrialVersion(context));
    viewChildren.add(viewDeliverable(context));
    viewChildren.add(viewBody(context));
    viewChildren!.add(

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_isBannerAdReady)
              const SizedBox(
                height: 10,
              ),
            if (_isBannerAdReady)
              Center(
                child: Container(
                  width: _bannerAd.size.width.toDouble(),
                  height: _bannerAd.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
              ),


            if (_isBannerAdReady)
              const SizedBox(
                height: 10,
              ),
            const SizedBox(
              height: 10,
            ),
          ],
        )
    );

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
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        reverse: false,

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: viewChildren
        )
    ));
  }

}


///////////////////////////////////////////////////


class MyProductsListingModel extends MyProductsListingBase{
  Map<String, dynamic> json;
  MyProductsListingModel(Map<String, dynamic> this.json):super(json);
  Widget viewItem (ItemMyProductsModel item,String?search, bool? account) {
    ShapeBorder? shape;
    // double? height = 302;
    double? height = 260;


    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemMyProductsCard1(destination :item, search : search, shape : shape, height : height, account:account)
      //  child:  ItemMyProductsCard2(destination :item, search : search, shape : shape, height : height)
    );
  }

}

class ItemMyProductsCard1 extends StatelessWidget {
  const ItemMyProductsCard1({ Key?  key, @required this.destination, this.search, this.shape, this.height, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyProductsModel? destination;
  final String?search;
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

          child:  ItemMyProductsContent1(destination: destination, account : account),

        ),

      ),
    );

    /*

    return Card(
      //padding:EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      elevation: 5.0,
      child: Center(
        child:

        ItemMyProductsContent1(destination: destination, account : account),

      ),
      margin: EdgeInsets.all(5.0),
    );

     */

  }
}


class ItemMyProductsContent1 extends StatelessWidget {
  const ItemMyProductsContent1({ Key?  key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemMyProductsModel? destination;

  final bool? account;


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    final mediaQueryData = MediaQuery.of(context);
    var dateformat = DateFormat('dd/MM/yyyy HH:mm:ss');
    final size =MediaQuery.of(context).size;
    final width =size.width;
    // String?sts = destination!.item.project_project_status_str.split('>')[1].split('<')[0];
    String?sts1 = destination!.item.status_str.split('>')[1].split('<')[0];

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
                      onSelected: (int?value) {
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
                      onSelected: (int?value) {
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
                      onSelected: (int?value) {
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
                      onSelected: (int?value) {
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
                      onSelected: (int?value) {
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
                      onSelected: (int?value) {
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
                      onSelected: (int?value) {
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
                      onSelected: (int?value) {
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
    final List<Widget> children = <Widget>[
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
                      onTap: () {

                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(destination!.item.buttons[destination!.item.buttons.length - 1].url ));

                        /*
                        if(destination!.item.buttons.length == 4){
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(destination!.item.buttons[3].url ));
                        }
                        if(destination!.item.buttons.length == 3){
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(destination!.item.buttons[2].url ));

                        }

                         */



                      },
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

     */

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
                                  onSelected: (int?value) {
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
                                  onSelected: (int?value) {
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
                                  onSelected: (int?value) {
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
                                  onSelected: (int?value) {
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
                                  onSelected: (int?value) {
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
                                  onSelected: (int?value) {
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
                                  onSelected: (int?value) {
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
                                  onSelected: (int?value) {
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

                                /*
                                PopupMenuButton<int>(
                                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                                  onSelected: (int?value) {

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
                                      child: Text( destination!.item.buttons[0].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Text( destination!.item.buttons[1].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 3,
                                      child: Text( destination!.item.buttons[2].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 4,
                                      child: Text( destination!.item.buttons[3].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 5,
                                      child: Text( destination!.item.buttons[4].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 6,
                                      child: Text( destination!.item.buttons[5].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 7,
                                      child: Text( destination!.item.buttons[6].text),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 8,
                                      child: Text( destination!.item.buttons[7].text),
                                    ),


                                  ],
                                ),

                                     */

                              ),
                            ])
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
                                          destination!.item.title.replaceAll('&amp;','&')  + ' . ' , overflow : TextOverflow.ellipsis ,style: TextStyle(fontSize: 10),

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

                                            destination!.item.last_bump == null ?
                                            Text(' last bump' +'.' , style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 8))
                                                :Text(
                                              ' last bump' +  timeago.format(destination!.item.last_bump) + ' . ',
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
        /*
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // three line description


              //newly added
              Flexible(
                  fit : FlexFit.tight,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0.0 , 0.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children : <Widget>[
                            GestureDetector(
                              onTap: () {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(destination!.item.buttons[2].url ));
                              },
                              child: Html(

                                  data :readText(destination!.item.title , 30),
                                  useRichText: false, defaultTextStyle : descriptionStyle.copyWith(color: Colors.black,fontSize: 9, fontWeight: FontWeight.w500 )
                              ),
                            ),

                            Row(
                                children: <Widget>[
                                  // three line description
                                  Text(
                                    destination!.item.seller_str ,
                                    style: descriptionStyle.copyWith(color: Colors.black87, fontSize: 8),
                                  ),



                                ]
                            ),
                            Row(
                                children: <Widget>[
                                  // three line description
                                  Text(
                                    ratingMean(destination!.item.rating_num)  + ' . ' ,
                                    style: descriptionStyle.copyWith(color: Colors.black54, fontSize: 8),
                                  ),

                                  Text(
                                    destination!.item.sales_count.toString() + ' sales' + ' . ',
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

             /*
              Container(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0 , 0.0),
              child: Column(
              children : <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0 , 0.0),
                  child: PopupMenuButton<int>(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 12.0),
                    onSelected: (int?value) {

                      if(value == 1) {
                        if(account){
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(destination!.item.buttons[0].url ));
                        }else{
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              '/login/1');
                        }
                      }
                      if(value == 2) {
                        if(account){
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(destination!.item.buttons[1].url ));
                        }else{
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              '/login/1');
                        }
                      }
                      if(value == 3) {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(destination!.item.buttons[2].url ));
                      }


                    },
                    itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Chat with seller'),
                      ),
                      const PopupMenuItem<int>(
                        value: 2,
                        child: Text('Add to chart'),
                      ),
                      const PopupMenuItem<int>(
                        value: 3,
                        child: Text('View'),
                      ),


                    ],
                  ),
                ),
                ])
              )
              */
            ]

        ),
        */


      )

    ];


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

//class ItemMyProducts extends class ItemMyProductsBase{
//
//}



////////////////////////////
