import 'package:json_annotation/json_annotation.dart';
import 'package:projectscoid/models/model.dart';
import 'past_projects_item_base.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'file_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'past_projects_item.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'past_projects_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:projectscoid/models/BrowseProjects/user_bids_list_base.dart';
import 'BrowseProjects/user_bids_list_item.dart';
import 'BrowseProjects/user_bids_list_item_base.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
//import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'past_projects_item_base.dart';
import 'package:projectscoid/models/past_projects_base.dart';
import 'package:getwidget/getwidget.dart';
import 'package:expandable/expandable.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/style.dart';
import 'package:html/parser.dart' show parse;
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:html/dom.dart' as dom;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:projectscoid/views/PastProjects/past_projects_listing.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
part 'past_projects.g.dart';
/** AUTOGENERATE OFF **/

class PastProjectsModel extends PastProjectsBase {
  Map<String, dynamic> json;
  PastProjectsModel(Map<String, dynamic> this.json) : super(json);
}

///////////////////////////////////////////////////
//PastProjects Views
@JsonSerializable()
class ViewModelPastProjectsRev {
  int? age;
  int? cnt;
  int? page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? description;
  List<int?>? channels_id;
  List<String?>? channels_str;
  List<String?>? channels_url;
  int? project_class_id;
  String? project_class_str;
  List<int?>? project_class_list;
  List<String?>? project_class_list_str;
  String? budget_range_min_str;
  String? budget_range_max_str;
  String? budget_range_str;
  double? published_budget;
  String? published_budget_str;
  int? finish_days;
  String? finish_days_str;
  DateTime? published_date;
  DateTime? start_date;
  int? project_status_id;
  String? project_status_str;
  List<int?>? project_status_list;
  List<String?>? project_status_list_str;
  int? accepted_worker_id;
  String? accepted_worker_str;
  String? accepted_worker_url;
  List<int?>? accepted_worker_list;
  List<String?>? accepted_worker_list_str;
  double? accepted_budget;
  String? accepted_budget_str;
  int? project_ending_id;
  String? project_ending_str;
  List<int?>? project_ending_list;
  List<String?>? project_ending_list_str;
  DateTime? finish_date;
  int? owner_id;
  String? owner_str;
  String? owner_url;
  List<int?>? owner_list;
  List<String?>? owner_list_str;
  String? owner_photo_url;
  Photo? owner_photo;
  String? owner_user_name;
  int? owner_kabupaten_id;
  String? owner_kabupaten_str;
  int? owner_owner_rating;
  double? owner_owner_rating_num;
  String? owner_owner_rating_num_str;
  int? owner_owner_point;
  String? owner_owner_point_str;
  int? owner_owner_ranking;
  String? owner_owner_ranking_str;
  double? worker_rating_num;
  String? worker_rating_num_str;
  String? worker_feedback;
  String? accepted_worker_photo_url;
  String? accepted_worker_user_name;
  String? accepted_worker_kabupaten_str;
  int? accepted_worker_worker_rating;
  double? accepted_worker_worker_rating_num;
  String? accepted_worker_worker_rating_num_str;
  int? accepted_worker_worker_point;
  String? accepted_worker_worker_point_str;
  int? accepted_worker_worker_ranking;
  String? accepted_worker_worker_ranking_str;
  String? owner_feedback;
  double? owner_rating_num;
  String? owner_rating_num_str;
  int? arbitration_id;
  String? arbitration_str;
  String? arbitration_url;
  String? attachments_name;
  String? attachments_url;
  List<FileField?>? attachments;

  List<int?>? arbitration_list;
  List<String?>? arbitration_list_str;
  UserBidsListingToolsRev? user_bids;
  String? project_id;


  //
  ViewModelPastProjectsRev(
    this.id,
    this.description,
    this.channels_id,
    this.channels_str,
    this.channels_url,
    this.project_class_id,
    this.project_class_str,
    this.project_class_list,
    this.project_class_list_str,
    this.budget_range_min_str,
    this.budget_range_max_str,
    this.budget_range_str,
    this.published_budget,
    this.published_budget_str,
    this.finish_days,
    this.finish_days_str,
    this.published_date,
    this.start_date,
    this.project_status_id,
    this.project_status_str,
    this.project_status_list,
    this.project_status_list_str,
    this.accepted_worker_id,
    this.accepted_worker_str,
    this.accepted_worker_url,
    this.accepted_worker_list,
    this.accepted_worker_list_str,
    this.accepted_budget,
    this.accepted_budget_str,
    this.project_ending_id,
    this.project_ending_str,
    this.project_ending_list,
    this.project_ending_list_str,
    this.finish_date,
    this.owner_id,
    this.owner_str,
    this.owner_url,
    this.owner_list,
    this.owner_list_str,
    this.owner_photo_url,
    this.owner_photo,
    this.owner_kabupaten_id,
    this.owner_kabupaten_str,
    this.owner_owner_rating_num,
    this.owner_owner_rating_num_str,
    this.owner_owner_point,
    this.owner_owner_point_str,
    this.owner_owner_ranking,
    this.owner_owner_ranking_str,
       this.worker_rating_num,
    this.worker_rating_num_str,
    this.worker_feedback,
         this.accepted_worker_photo_url,
    this.accepted_worker_user_name,
    this.accepted_worker_kabupaten_str,
    this.accepted_worker_worker_rating,
    this.accepted_worker_worker_rating_num,
    this.accepted_worker_worker_rating_num_str,
    this.accepted_worker_worker_point,
    this.accepted_worker_worker_point_str,
       this.accepted_worker_worker_ranking,
    this.accepted_worker_worker_ranking_str,
       this.owner_feedback,
    this.owner_rating_num,
    this.owner_rating_num_str,
       this.arbitration_id,
    this.arbitration_str,
    this.arbitration_url,
     this.attachments_url,
    this.attachments,
    this.attachments_name,
          this.arbitration_list,
    this.arbitration_list_str,
    this.user_bids,
    this.project_id,




  );

  factory ViewModelPastProjectsRev.fromJson(Map<String, dynamic> json) =>
      _$ViewModelPastProjectsRevFromJson(json);
}
/*
ViewModelPastProjectsRev _$ViewModelPastProjectsRevFromJson(Map<String, dynamic> json) {
  return ViewModelPastProjectsRev(
      json['id'] as String,
      json['description'] as String,
      (json['channels_id'] as List)?.map((e) => e as int)?.toList(),
      (json['channels_str'] as List)?.map((e) => e as String)?.toList(),
      (json['channels_url'] as List)?.map((e) => e as String)?.toList(),
      json['project_class_id'] as int,
      json['project_class_str'] as String,
      (json['project_class_list'] as List)?.map((e) => e as int)?.toList(),
      (json['project_class_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      json['budget_range_min_str'] as String,
      json['budget_range_max_str'] as String,
      json['budget_range_str'] as String,
      (json['published_budget'] as num)?.toDouble(),
      json['published_budget_str'] as String,
      json['finish_days'] as int,
      json['finish_days_str'] as String,
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      json['project_status_id'] as int,
      json['project_status_str'] as String,
      (json['project_status_list'] as List)?.map((e) => e as int)?.toList(),
      (json['project_status_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      json['accepted_worker_id'] as int,
      json['accepted_worker_str'] as String,
      json['accepted_worker_url'] as String,
      (json['accepted_worker_list'] as List)?.map((e) => e as int)?.toList(),
      (json['accepted_worker_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      (json['accepted_budget'] as num)?.toDouble(),
      json['accepted_budget_str'] as String,
      json['project_ending_id'] as int,
      json['project_ending_str'] as String,
      (json['project_ending_list'] as List)?.map((e) => e as int)?.toList(),
      (json['project_ending_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      json['finish_date'] == null
          ? null
          : DateTime.parse(json['finish_date'] as String),

      json['owner_id'] as int,
      json['owner_str'] as String,
      json['owner_url'] as String,
      (json['owner_list'] as List)?.map((e) => e as int)?.toList(),
      (json['owner_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['owner_photo_url'] as String,
      json['owner_photo'] == null
          ? null
          : Photo.fromJson(json['owner_photo'] as Map<String, dynamic>),
      json['owner_kabupaten_id'] as int,
      json['owner_kabupaten_str'] as String,
      (json['owner_owner_rating_num'] as num)?.toDouble(),
      json['owner_owner_rating_num_str'] as String,
      json['owner_owner_point'] as int,
      json['owner_owner_point_str'] as String,
      json['owner_owner_ranking'] as int,
      json['owner_owner_ranking_str'] as String,
      (json['worker_rating_num'] as num)?.toDouble(),
      json['worker_rating_num_str'] as String,
      json['worker_feedback'] as String,

      json['accepted_worker_photo_url'] as String,
      json['accepted_worker_user_name'] as String,
      json['accepted_worker_kabupaten_str'] as String,
      json['accepted_worker_worker_rating'] as int,
      (json['accepted_worker_worker_rating_num'] as num)?.toDouble(),
      json['accepted_worker_worker_rating_num_str'] as String,
      json['accepted_worker_worker_point'] as int,
      json['accepted_worker_worker_point_str'] as String,
      json['accepted_worker_worker_ranking'] as int,
      json['accepted_worker_worker_ranking_str'] as String,

      json['owner_feedback'] as String,
      (json['owner_rating_num'] as num)?.toDouble(),

      json['owner_rating_num_str'] as String,
      json['arbitration_id'] as int,
      json['arbitration_str'] as String,


      json['arbitration_url'] as String,
      json['attachments_url'] as String,

      json['attachments'] == ''? null :
      (json['attachments'] as List)
          ?.map((e) =>
      e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['attachments_name'] as String,
      (json['arbitration_list'] as List)?.map((e) => e as int)?.toList(),
      (json['arbitration_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['user_bids'] == null
          ? null
          : UserBidsListingToolsRev?.fromJson(json['user_bids'] as Map<String, dynamic>)



          )

    ..age = json['age'] as int
    ..cnt = json['cnt'] as int
    ..page = json['page'] as int
    ..ttl = json['ttl'] as String
    ..pht = json['pht'] as String
    ..sbttl = json['sbttl'] as String
    ..owner_user_name = json['owner_user_name'] as String
    ..owner_owner_rating = json['owner_owner_rating'] as int
    ..accepted_worker_worker_rating =
    json['accepted_worker_worker_rating'] as int;
}

 */

@JsonSerializable()
class PastProjectsViewSuperBaseRev {
  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelPastProjectsRev? model;
  PastProjectsViewSuperBaseRev(
    this.id,
    this.buttons,
    this.meta,
    this.model,
  );

  factory PastProjectsViewSuperBaseRev.fromJson(Map<String, dynamic> json) =>
      _$PastProjectsViewSuperBaseRevFromJson(json);
}
/*
PastProjectsViewSuperBaseRev _$PastProjectsViewSuperBaseRevFromJson(
    Map<String, dynamic> json) {
  return PastProjectsViewSuperBaseRev(
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
          : ViewModelPastProjectsRev.fromJson(
          json['model'] as Map<String, dynamic>));
}

 */

class PastProjectsViewModel extends PastProjectsViewBase {
  Map<String, dynamic> json;
  // PastProjectsViewModel(Map<String, dynamic> this.json):super(json);
  PastProjectsViewModel(Map<String, dynamic> this.json) : super(json) {
    model = PastProjectsViewSuperBaseRev.fromJson(this.json);
  }

  Widget viewHeader(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.subtitle1;
    final mediaQueryData = MediaQuery.of(context);
    var document = parse(this.model.model.project_status_str);
    //  var recentNews = document.getElementsByClassName('col-md-4 col-sm-4 recent-news');

    return (
            // SizedBox(
            //   height:model.meta.title.length > 20 ? 180 : 160.0,
            //   child:
            GFListTile(
                avatar: GFAvatar(
                  shape: GFAvatarShape.standard,
                  maxRadius: 45.0,
                  size: GFSize.LARGE,
                  backgroundImage: NetworkImage(
                    this.model.model.owner_photo_url,
                    // fit: BoxFit.fitHeight,
                    // height: 75.0,
                    // width: 80.0,
                  ),
                ),
                title:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: <
                        Widget>[
                  Html(
                    // this.model.meta.title ,
                    data: model.meta.title,
                    style: {
                      "html": Style(
                        fontSize: FontSize.small,
                        //color: Colors.black87,
                        //backgroundColor: CurrentTheme.BackgroundColor
                      ),
                    },
                    //useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith( fontSize: model.meta.title.length < 75 ? 15 : model.meta.title.length < 150 ?  13 : 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppProvider.getRouter(context)!.navigateTo(
                          context, urlToRoute(this.model.model.owner_url));
                    },
                    child: Html(
                      data: readText(this.model.model.owner_user_name, 54),
                      style: {
                        "html": Style(
                          fontSize: FontSize.small,
                          color: Colors.green,
                          // backgroundColor: CurrentTheme.BackgroundColor
                        ),
                      },
                      //useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                    ),
                  ), //
                  /*
                    Html(

                        data :readText(this.model.model.project_status_str , 54),
                        style: {
                          "html": Style(
                              fontSize: FontSize.small,
                              fontWeight: FontWeight.w500
                          ),
                        },
                      //  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(fontSize: 12, fontWeight: FontWeight.w500 )
                    ),

                     */
                  Row(children: <Widget>[
                    // three line description
                    /*
                          Text(
                            this.model.model.project_status_str,
                            style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 11),
                          ),

                           */

                    // Container(width: 60,
                    // child:
                    /*
                          Html(

                            data :document.children[0].text,
                            style: {
                              "html": Style(
                                  fontSize: FontSize.small,
                                  fontWeight: FontWeight.w500
                              ),
                            },
                            //  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(fontSize: 12, fontWeight: FontWeight.w500 )
                          ),

                           */
                    //),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(document.children[0].text,
                          style: descriptionStyle!.copyWith(fontSize: 11)),
                    ),

                    this.model.model.project_class_str == 'Open to Suggestions'
                        ? Container(
                            width: 0.0,
                            height: 0.0,
                          )
                        : Text(
                            ' . ',
                            style: descriptionStyle!.copyWith(fontSize: 11),
                          ),
                    this.model.model.project_class_str == 'Open to Suggestions'
                        ? Container(
                            width: 0.0,
                            height: 0.0,
                          )
                        : Text(
                            this.model.model.project_ending_str,
                            style: descriptionStyle!.copyWith(fontSize: 11),
                          )
                  ]),
                  Row(children: <Widget>[
                    // three line description
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        this.model.model.project_class_str,
                        style: descriptionStyle!.copyWith(fontSize: 11),
                      ),
                    ),

                    this.model.model.project_class_str == 'Open to Suggestions'
                        ? Container(
                            width: 0.0,
                            height: 0.0,
                          )
                        : Text(
                            ' . ',
                            style: descriptionStyle!.copyWith(fontSize: 11),
                          ),
                    this.model.model.project_class_str == 'Open to Suggestions'
                        ? Container(
                            width: 0.0,
                            height: 0.0,
                          )
                        : Text(
                            this.model.model.project_class_id == 10
                                ? this.model.model.budget_range_str
                                : this.model.model.published_budget_str,
                            style: descriptionStyle!.copyWith(fontSize: 11),
                          )
                  ]),
                ]))
        /*
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // three line description

                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0 , 0.0),
                  child:      InkWell(
                    onTap: () {
                      // return BidItemInfo(info : info);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowItemScreenshots(image : this.model.model.owner_photo_url)),
                      );

                    },

                    child:
                          GFAvatar(
                                    shape: GFAvatarShape.standard,
                                    maxRadius: 40.0,
                                    size: GFSize.LARGE,
                                    child: Image.network(
                                    this.model.model.owner_photo_url,
                                            fit: BoxFit.fitHeight,
                                           // height: 75.0,
                                           // width: 80.0,
                                          ),
                          ),

                    /*
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        this.model.model.owner_photo_url,
                        fit: BoxFit.fitHeight,
                        height: 75.0,
                        width: 80.0,
                      ),
                    ),
                    */
                  ),
                ),
                //newly added
                Flexible(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 35.0, 30.0 , 0.0),
                        child: Column(
                            children : <Widget>[

                              Html  (
                                // this.model.meta.title ,
                                data :model.meta.title,
                                useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith(color: Colors.black87,  fontSize: model.meta.title.length < 75 ? 15 : model.meta.title.length < 150 ?  13 : 12),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(this.model.model.owner_url ));
                                },
                                child: Html(

                                    data :readText(this.model.model.owner_user_name , 54),
                                    useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                                ),
                              ),//
                              Html(

                                  data :readText(this.model.model.project_status_str , 54),
                                  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(fontSize: 12, fontWeight: FontWeight.w500 )
                              ),
                              Row(
                                  children: <Widget>[
                                    // three line description
                                    Text(
                                      this.model.model.project_type_str,
                                      style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 11),
                                    ),

                                    this.model.model.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      ' . ',
                                      style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 11),
                                    ),
                                    this.model.model.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      this.model.model.project_ending_str,
                                      style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 11),
                                    )


                                  ]
                              ),
                              Row(
                                  children: <Widget>[
                                    // three line description
                                    Text(
                                      this.model.model.project_class_str ,
                                      style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 11),
                                    ),

                                    this.model.model.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      ' . ',
                                      style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 11),
                                    ),
                                    this.model.model.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      this.model.model.published_budget_str,
                                      style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 11),
                                    )


                                  ]
                              ),
                            ]
                        )
                    )
                ),


              ]



          ),

               */

        //  )
        );
  }

  Widget viewHeader1(BuildContext context) {
    return (Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Html(
          // this.model.meta.title ,
          data: model.meta.title,
          style: {
            "html": Style(
              fontSize: FontSize(25.0),
              // fontWeight: FontWeight.w300
            ),
          }
          // useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith(  fontSize: model.meta.title.length < 75 ? 15 : model.meta.title.length < 150 ?  13 : 12),
          ),
    ));
  }

  Widget viewDesc(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;
    YoutubePlayerController _controller;
    var document = parse(this
        .model
        .model
        .description!
        .replaceAll('<div>', '')
        .replaceAll('<\/div>', '')
        .replaceAll('<br>', ' ')
        .replaceAll('<p>', '')
        .replaceAll('<\/p>', '<br>'));
    var videoList = document.querySelectorAll("iframe");
    List<String?>? id = [];
    for (dom.Element video in videoList) {
      // print('ini list video' + video.attributes["src"]);

      // id.add(YoutubePlayer.convertUrlToId(video.attributes["src"]));
      if (video.attributes["src"]!.contains('youtube')) {
        if (video.attributes["src"]!.contains('https')) {
          // print('ini list video id' + YoutubePlayer.convertUrlToId(video.attributes["src"]));
          id.add(YoutubePlayer.convertUrlToId(video.attributes["src"]!));
        } else {
          // print('ini list video id' + YoutubePlayer.convertUrlToId('https:' + video.attributes["src"]));
          id.add(YoutubePlayer.convertUrlToId(
              'https:' + video.attributes["src"]!));
        }
      }

      // print(video.toString());
    }

    final List<YoutubePlayerController> _controllers = id
        .map<YoutubePlayerController>(
          (videoId) => YoutubePlayerController(
            initialVideoId: videoId!,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
            ),
          ),
        )
        .toList();

    ScrollController? controller =  ScrollController();
    return Column(
      children: [
        ExpandablePanel(
            header: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                child: Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ]),
                ])),
            collapsed: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
                child: Column(children: <Widget>[
                  HtmlWidget(
                      readText(
                          this
                              .model
                              .model
                              .description!
                              .replaceAll('<div>', '')
                              .replaceAll('<\/div>', '')
                              .replaceAll('<br>', ' ')
                              .replaceAll('<p>', '')
                              .replaceAll('<\/p>', '<br>'),
                          1000),
                      isSelectable: true),
                ])),
            expanded: SingleChildScrollView(
                controller: controller!,
                physics: const NeverScrollableScrollPhysics(),
                reverse: false,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //header
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 2.0),
                          child: HtmlWidget(
                            this
                                .model
                                .model
                                .description!
                                .replaceAll('<div>', '')
                                .replaceAll('<\/div>', '')
                                .replaceAll('<br>', ' ')
                                .replaceAll('<p>', '')
                                .replaceAll('<\/p>', '<br>'),
                            isSelectable: true,
                            onTapUrl: (url) async {
                              if (url!.contains('projects.co.id')) {
                                if (url!.contains(RegExp(r'[0-9]'))) {
                                  if (url!.contains('show_conversation')) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context, urlToRoute(url + '/'));
                                  } else {
                                    AppProvider.getRouter(context)!
                                        .navigateTo(context, urlToRoute(url))
                                        .catchError((onError) {
                                      AppProvider.getRouter(context)!
                                          .pop(context);
                                    });
                                  }
                                } else {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context, urlToRoute(url + '/listing/'));
                                }
                              } else {
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }
                              throw 'Could not launch ';
                            },
                            onTapImage: (src) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowItemScreenshots(
                                      image: '${src.sources.first.url}')),
                            ),
                          )),
                    ]))),
        id.length == 0 ? Container() : Text('List Video:'),
        id.length == 0
            ? Container()
            : Container(
                height: id.length * 250.0,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return YoutubePlayer(
                      key: ObjectKey(_controllers[index]),
                      controller: _controllers[index],
                      actionsPadding: const EdgeInsets.only(left: 16.0),
                      bottomActions: [
                        CurrentPosition(),
                        const SizedBox(width: 10.0),
                        ProgressBar(isExpanded: true),
                        const SizedBox(width: 10.0),
                        RemainingDuration(),
                        FullScreenButton(),
                      ],
                    );
                  },
                  itemCount: _controllers.length,
                  separatorBuilder: (context, _) =>
                      const SizedBox(height: 10.0),
                ),
              ),
        ButtonBarTheme(
          data: ButtonBarThemeData(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 0.6 * width,
          ),
          child: ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.6 * width,
              children: <Widget>[

                ElevatedButton(
                    child: Text('Report '),
                    style: ButtonStyle(
                      textStyle:
                      MaterialStateProperty.all<TextStyle>(
                          const TextStyle(color: Colors.white)),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.red),
                    ),
                    onPressed: () {
                      //print('helooooooooooo');
                      AppProvider.getRouter(
                          context)!
                          .navigateTo(
                        context,
                        '/public/support/contact_form/1/contact_formReportaViolationhttps:**projects.co.id*public*past_projects*view*${ this.model.model.project_id}*${ this.model.meta.title.replaceAll('/', ' ')}',
                      );
                    }),
                ElevatedButton(
                    child: Text('Block'),
                    style: ButtonStyle(
                      textStyle:
                      MaterialStateProperty.all<TextStyle>(
                          const TextStyle(color: Colors.white)),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.red),
                    ),
                    onPressed: () async{
                      return await showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                              title: Text('Block',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              content: Text('Apakah Anda blok halaman ini?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () async{
                                    await apiRepProvider!.loadAndSaveBlacklist('black', this.model.model.project_id + 'PastProjects');
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PublicPastProjectsListing(id: '0')),
                                          (Route<dynamic> route) => false,
                                    );
                                    // Navigator.pop(context); Navigator.pop(context);
                                  },
                                  /*Navigator.of(context).pop(true)*/
                                  child: Text('Ya'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: Text('Tidak'),
                                ),


                              ],
                            ),
                      );
                    }
                  //print('helooooooooooo');
                  //  await apiRepProvider!.loadAndSaveBlacklist('black', this.model!.model!.project_id + 'BrowseProjects');

                ),
              ]),
        ),
      ],
    );
  }

  Widget viewAcceptedWorker(BuildContext context) {
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model.model.accepted_worker_user_name == null
        ? Container(
            width: 0.0,
            height: 0.0,
            color: Colors.white,
          )
        : GFCard(
            titlePosition: GFPosition.start,
            title: GFListTile(
                avatar: GFAvatar(
                  maxRadius: 40.0,
                  backgroundImage: NetworkImage(
                    this.model.model.accepted_worker_photo_url,
                  ),
                  shape: GFAvatarShape.circle,
                ),
                title: Text(
                  this.model.model.accepted_worker_user_name,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                subTitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Worker',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0, top: 3.0),
                      child: RatingBarIndicator(
                        rating: this.model.model.worker_rating_num / 2 - 0.01,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: CurrentTheme.PrimaryLightColor,
                        ),
                        itemCount: 5,
                        itemSize: 14.0,
                        unratedColor: Colors.black26,
                        direction: Axis.horizontal,
                      ),

                      /*
                        SmoothStarRating(
                        rating: double.tryParse(this.model.model.accepted_worker_worker_rating.toString())!,
                        size: 14,
                        starCount: 5,
                        // allowHalfRating: true,
                        allowHalfRating: true,
 
                      )

                       */
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 3.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.stars,
                            size: 11.0,
                            color: Colors.orange,
                          ),
                          Text(
                            ' ' +
                                this
                                    .model
                                    .model
                                    .accepted_worker_worker_rating_num_str,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(this.model.model.accepted_worker_kabupaten_str,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                  ],
                ),
                icon: GFIconButton(
                  onPressed: null,
                  icon: Icon(Icons.work),
                  type: GFButtonType.transparent,
                )),
            boxFit: BoxFit.contain,
            image: Image.asset(
              'assets/img/workerbg5.jpg',
              fit: BoxFit.fitHeight,
              // height: 75.0,
              // width: 80.0,
            ),

            // '${dateformat.format(model.model.birth_date)}'

            content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text('Rated Owner: ${model.model.accepted_worker_worker_rating_num_str} '),

                  this.model.model.finish_date == null
                      ? Container(
                          width: 0.0,
                          height: 0.0,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              RatingBarIndicator(
                                rating: double.tryParse(this
                                            .model
                                            .model
                                            .accepted_worker_worker_rating
                                            .toString())! /
                                        2 -
                                    0.01,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: CurrentTheme.PrimaryLightColor,
                                ),
                                itemCount: 5,
                                itemSize: 15.0,
                                unratedColor: Colors.black26,
                                direction: Axis.horizontal,
                              ),

                              // Text('  ${dateformat.format(this.model.model.finish_date)}'),
                            ]),

                  this.model.model.finish_date == null
                      ? Container(
                          width: 0.0,
                          height: 0.0,
                        )
                      : HtmlWidget(this
                          .model
                          .model
                          .worker_feedback
                          .replaceAll('<div>', '')
                          .replaceAll('<\/div>', '')
                          .replaceAll('<br>', ' ')
                          .replaceAll('<p>', '')
                          .replaceAll('<\/p>', '<br>')),
                ]),
            //Text(this.model.model.worker_feedback),
            buttonBar: GFButtonBar(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute(
                            '${Env.value!.baseUrl!}/public/browse_users/view/${encode(this.model.model.accepted_worker_id)}/usr'));
                    // urlToRoute(this.model.model.accepted_worker_url ));
                  },
                  text: 'About worker',
                ),
                /* GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model.model.owner_url  ));
            },
            text: 'About owner',
          ),

          */
              ],
            ),
          );
    /*
    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 20.0, 8.0),
        child:
            Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Rated worker',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),

                      ]

                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text( this.model.model.worker_rating_num_str),
                      ]

                  ),

                  this.model.model.worker_feedback == null? Container(width: 0.0, height: 0.0, color: Colors.white,): Html(data: readText(this.model.model.worker_feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),
                ]
            )



    );

     */
  }

  Widget viewProjectOwner(BuildContext context) {
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model.model.owner_owner_rating_num_str == null
        ? Container(
            width: 0.0,
            height: 0.0,
            color: Colors.white,
          )
        : GFCard(
            titlePosition: GFPosition.start,
            title: GFListTile(
                avatar: GFAvatar(
                  maxRadius: 40.0,
                  backgroundImage: NetworkImage(
                    this.model.model.owner_photo_url,
                  ),
                  shape: GFAvatarShape.circle,
                ),
                title: Text(
                  this.model.model.owner_user_name,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                subTitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Owner',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0, top: 3.0),
                      child: RatingBarIndicator(
                        rating:
                            this.model.model.owner_owner_rating_num / 2 - 0.01,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: CurrentTheme.PrimaryLightColor,
                        ),
                        itemCount: 5,
                        itemSize: 14.0,
                        unratedColor: Colors.black26,
                        direction: Axis.horizontal,
                      ),

                      /*
                        SmoothStarRating(
                        rating: double.tryParse(this.model.model.accepted_worker_worker_rating.toString())!,
                        size: 14,
                        starCount: 5,
                        // allowHalfRating: true,
                        allowHalfRating: true,

                      )

                       */
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 3.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.stars,
                            size: 11.0,
                            color: Colors.orange,
                          ),
                          Text(
                            ' ' + this.model.model.owner_owner_rating_num_str,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans",
                              //color: Colors.black54
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(this.model.model.owner_kabupaten_str,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                  ],
                ),
                icon: GFIconButton(
                  onPressed: null,
                  icon: Icon(Icons.monetization_on),
                  type: GFButtonType.transparent,
                )),
            boxFit: BoxFit.contain,
            image: Image.asset(
              'assets/img/workerbg4.jpg',
              fit: BoxFit.fitHeight,
              // height: 75.0,
              // width: 80.0,
            ),

            // '${dateformat.format(model.model.birth_date)}'
            // json['owner_rating_num'] as int,
            //  json['owner_rating_num_str'] as String,

            content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text('Rated Owner: ${model.model.owner_rating_num_str} '),

                  this.model.model.finish_date == null
                      ? Container(
                          width: 0.0,
                          height: 0.0,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              RatingBarIndicator(
                                rating: double.tryParse(this
                                            .model
                                            .model
                                            .owner_rating_num
                                            .toString())! /
                                        2 -
                                    0.01,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: CurrentTheme.PrimaryLightColor,
                                ),
                                itemCount: 5,
                                itemSize: 15.0,
                                unratedColor: Colors.black26,
                                direction: Axis.horizontal,
                              ),
                              Text(
                                  '  ${dateformat.format(this.model.model.finish_date)}'),
                            ]),

                  this.model.model.finish_date == null
                      ? Container(
                          width: 0.0,
                          height: 0.0,
                        )
                      : // Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // children: <Widget>[
                      HtmlWidget(this
                          .model
                          .model
                          .owner_feedback
                          .replaceAll('<div>', '')
                          .replaceAll('<\/div>', '')
                          .replaceAll('<br>', ' ')
                          .replaceAll('<p>', '')
                          .replaceAll('<\/p>', '<br>')),
                  //   ]
                  // ),
                ]),
            //Text(this.model.model.worker_feedback),
            buttonBar: GFButtonBar(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[
                /*
          this.model.model.finish_date == null ? Container(width: 0.0, height: 0.0,) : GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model.model.accepted_worker_url ));
            },
            text: 'About worker',
          ),

           */
                GFButton(
                  onPressed: () {
                    AppProvider.getRouter(context)!.navigateTo(
                        context, urlToRoute(this.model.model.owner_url));
                  },
                  text: 'About owner',
                ),
              ],
            ),
          );
    /*
    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 20.0, 8.0),
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Rated owner',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                  ]

              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text( this.model.model.owner_owner_rating_num_str),
                  ]

              ),

              this.model.model.owner_feedback == null? Container(width: 0.0, height: 0.0, color: Colors.white,): Html(data: readText(this.model.model.owner_feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),
            ]
        )



    );

     */
  }

  @override
  Widget viewAttachments(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    if (model.model.attachments == null) {
      return (Container(height: 0, width: 0));
    }
    if (model.model.attachments_name != '') {
      return (FileViewAtt(
        ctx: context,
        value: model.model.attachments_name,
        value1: model.model.attachments_url,
        caption: 'Attachments',
      ));
      /*
      return( FileViewRev(
       // ctx : context,
        value: model.model.attachments_name,
        value1: model.model.attachments_url,
        caption: 'Attachments',
      )
      );

       */
    } else {
      return (Container(height: 0, width: 0));
    }
  }

  Widget viewChannels1(BuildContext context) {
    if (this.model.model.channels_url != null) {
      return (ChannelRouteTagsWidget(
        value: this.model.model.channels_id,
        caption: '',
        hint: ' ',
        required: true,
        idroutetags: this.model.model.channels_id,
        nameroutetags: this.model.model.channels_str,
        urlroutetags: this.model.model.channels_url,
        getValue: (String? val) {
          // Navigator.pushReplacementNamed(context, "/projectscoid");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PublicPastProjectsListing(id: val!.split('?')[1])),
          );
          // AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val));
        },
      ));
    } else {
      return (ChannelNonURLRouteWidget(
        value: this.model.model.channels_id,
        caption: '',
        hint: ' ',
        required: true,
        idroutetags: this.model.model.channels_id,
        nameroutetags: this.model.model.channels_str,
      ));
    }
  }

  Widget viewOwner(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, bottom: 5),
            child: Text(
              'Project Owner:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            )),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context, urlToRoute(this.model.model.owner_url));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 12),
                child: ShowAvatar(avatar: this.model.model.owner_photo_url),
                /*
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    this.model.model.owner_photo_url,
                    fit: BoxFit.cover,
                    height: 75.0,
                    width: 80.0,
                  ),
                ),

                 */
              ),
            ),
            GestureDetector(
              onTap: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context, urlToRoute(this.model.model.owner_url));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${filterShortcodes(this.model.model.owner_str)} ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),

                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: RatingBarIndicator(
                                    rating: this
                                                .model
                                                .model
                                                .owner_owner_rating_num
                                                .toDouble() /
                                            2 -
                                        0.01,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: CurrentTheme.PrimaryLightColor,
                                    ),
                                    itemCount: 5,
                                    itemSize: 18.0,
                                    unratedColor: Colors.black26,
                                    direction: Axis.horizontal,
                                  ),
                                  /*
                                        SmoothStarRating(
                                          rating: this.model.model.seller_seller_rating.toDouble()/2-0.01,
                                          size: 18,
                                          color: CurrentTheme.PrimaryLightColor,
                                          starCount: 5,
                                          allowHalfRating: true,
                                        )

                                             */
                                ),
                                Text(
                                  '(${this.model.model.owner_owner_rating_num.toStringAsPrecision(2)}/10.00)',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ]),
                              //  Text('23 project'),
                              //  Text('last seen 10 minutes ago' , style: TextStyle(fontSize: 15)),

                              //  Text('${this.model.model.owner_projects_owned} project'),
                              //  this.model.model.owner_last_seen == null? Container():Text('last seen ' +timeago.format(this.model.model.owner_last_seen), style: TextStyle(fontSize: 15)),
                              // Text('last seen dummy ago', style: TextStyle(fontSize: 15)),
                            ]),
                      ),
                      /*
                          Row(
                            children:<Widget>[
                              Padding(
                                  padding:
                                  EdgeInsets.only(left: 8.0, top: 2.0),
                                  child:  SmoothStarRating(
                                    rating: destination!.item!.rating.toDouble(),
                                    size: 12,
                                    color: CurrentTheme.PrimaryLightColor,
                                    starCount: 5,
                                    allowHalfRating: true,
                                  )
                              ),

                            ]
                          )

                           */

                      //owner_owner_point
                    ]),
              ),
            ),
          ],
        ),
        //project_status_id
        this.model.model.project_status_id == 9
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                    'Rated Worker: ${this.model.model.worker_rating_num.toString()}/10.00'))
            : Container(),

        this.model.model.project_status_id == 9
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: HtmlWidget(this
                    .model
                    .model
                    .worker_feedback
                    .replaceAll('<div>', '')
                    .replaceAll('<\/div>', '')
                    .replaceAll('<br>', ' ')
                    .replaceAll('<p>', '')
                    .replaceAll('<\/p>', '<br>')))
            : Container(),

        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget viewWorker(BuildContext context) {
    return this.model.model.accepted_worker_str == ''
        ? SizedBox(
            height: 30,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 5, top: 20),
                  child: Text(
                    'Project Worker:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  )),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      AppProvider.getRouter(context)!.navigateTo(context,
                          urlToRoute(this.model.model.accepted_worker_url));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5, left: 12),
                      child: ShowAvatar(
                          avatar: this.model.model.accepted_worker_photo_url),
                      /*
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    this.model.model.owner_photo_url,
                    fit: BoxFit.cover,
                    height: 75.0,
                    width: 80.0,
                  ),
                ),

                 */
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppProvider.getRouter(context)!.navigateTo(context,
                          urlToRoute(this.model.model.accepted_worker_url));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 0.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${filterShortcodes(this.model.model.accepted_worker_str)} ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    Row(children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(top: 2.0),
                                        child: RatingBarIndicator(
                                          rating: this
                                                      .model
                                                      .model
                                                      .accepted_worker_worker_rating_num
                                                      .toDouble() /
                                                  2 -
                                              0.01,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color:
                                                CurrentTheme.PrimaryLightColor,
                                          ),
                                          itemCount: 5,
                                          itemSize: 18.0,
                                          unratedColor: Colors.black26,
                                          direction: Axis.horizontal,
                                        ),
                                        /*
                                        SmoothStarRating(
                                          rating: this.model.model.seller_seller_rating.toDouble()/2-0.01,
                                          size: 18,
                                          color: CurrentTheme.PrimaryLightColor,
                                          starCount: 5,
                                          allowHalfRating: true,
                                        )

                                             */
                                      ),
                                      Text(
                                        '(${this.model.model.accepted_worker_worker_rating_num.toStringAsPrecision(2)}/10)',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ]),
                                    //  Text('23 project'),
                                    //  Text('last seen 10 minutes ago' , style: TextStyle(fontSize: 15)),
                                    //  Text('${this.model.model.owner_projects_owned} project'),
                                    //  this.model.model.owner_last_seen == null? Container():Text('last seen ' +timeago.format(this.model.model.owner_last_seen), style: TextStyle(fontSize: 15)),
                                    // Text('last seen dummy ago', style: TextStyle(fontSize: 15)),
                                  ]),
                            ),
                            /*
                          Row(
                            children:<Widget>[
                              Padding(
                                  padding:
                                  EdgeInsets.only(left: 8.0, top: 2.0),
                                  child:  SmoothStarRating(
                                    rating: destination!.item!.rating.toDouble(),
                                    size: 12,
                                    color: CurrentTheme.PrimaryLightColor,
                                    starCount: 5,
                                    allowHalfRating: true,
                                  )
                              ),

                            ]
                          )

                           */

                            //owner_owner_point
                          ]),
                    ),
                  ),
                ],
              ),
              this.model.model.project_status_id == 9
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Text(
                          'Rated Owner: ${this.model.model.owner_rating_num.toString()}/10'))
                  : Container(),
              this.model.model.project_status_id == 9
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: HtmlWidget(this
                          .model
                          .model
                          .owner_feedback
                          .replaceAll('<div>', '')
                          .replaceAll('<\/div>', '')
                          .replaceAll('<br>', ' ')
                          .replaceAll('<p>', '')
                          .replaceAll('<\/p>', '<br>')))
                  : Container(),
              SizedBox(
                height: 10,
              ),
            ],
          );
  }

  projectInfo(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.subtitle1;
    var dateformat = DateFormat('dd/MM/yyyy');
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: Container(
            height: 150,
            color: CurrentTheme.PrimaryLightColor,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Published Budget: ',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                        (this.model.model.budget_range_str ?? '') != '' && this.model.model.budget_range_min_str != null
                            ? Text(
                                'Rp ${this.model.model.budget_range_min_str} - Rp ${this.model.model.budget_range_max_str}',
                                style: descriptionStyle!.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w200),
                              )
                            : Text(
                                '${this.model.model.published_budget_str}',
                                style: descriptionStyle!.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w200),
                              ),
                      ]),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Finish Days: ',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                        Text(
                          '${this.model.model.finish_days.toString()}',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                      ]),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Published Date: ',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),

                        /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                        Text(
                          '${dateformat.format(this.model.model.published_date)}',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                      ]),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Start Date: ',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),

                        /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                        this.model.model.start_date == null
                            ? Container()
                            : Text(
                                '${dateformat.format(this.model.model.start_date)}',
                                style: descriptionStyle!.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w200),
                              ),
                      ]),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Finish Date: ',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),

                        /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                        this.model.model.finish_date == null
                            ? Container()
                            : Text(
                                '${dateformat.format(this.model.model.finish_date)}',
                                style: descriptionStyle!.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w200),
                              ),
                      ]),
                ),
              ],
            )));
  }

  projectStatus(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.subtitle1;
    var dateformat = DateFormat('dd/MM/yyyy');
    String? sts =
        this.model.model.project_status_str.split('>')[1].split('<')[0];
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
        child: Container(
            height: 120,
            color: CurrentTheme.PrimaryLightColor,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Project status: ',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                        Text(
                          '$sts',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                      ]),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Accepted Worker: ',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                        Text(
                          '${this.model.model.accepted_worker_user_name}',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                      ]),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Accepted Budget: ',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),

                        /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                        Text(
                          '${this.model.model.accepted_budget_str}',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                      ]),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Project Ending: ',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),

                        /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                        Text(
                          '${this.model.model.project_ending_str}',
                          style: descriptionStyle!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w200),
                        ),
                      ]),
                ),
              ],
            )));
  }

  Widget viewBidder(BuildContext context) {
    if (this.model.model.user_bids.items.length == 0 ||
        this.model.model.description!.contains('This is a private project.')) {
      return Container(height: 0, width: 0);
    } else {
      return Container(
        height: 245.0,
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: this.model.model.user_bids.items.length == 0
            ? Container(width: 0.0, height: 0.0)
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10, top: 3),
                        child: Text(
                          'User Bids:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )),
                    Container(
                      height: 222.0, //375
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int? index) {
                          return index!! >=
                                  this.model.model.user_bids.items.length
                              ? Container(width: 0.0, height: 0.0)
                              : BidItem(
                                  model:
                                      this.model.model.user_bids.items[index],
                                  info: this.model.model.user_bids);
                        },
                        // itemCount: this.model.model.user_bids.items.length <= 8
                        //     ? this.model.model.user_bids.items.length
                        //     : 8,
                        itemCount: this.model.model.user_bids.items.length,
                        // controller: controller1,
                      ),
                    )
                  ]),
      );
    }
  }

  @override
  Widget view(
      BuildContext context, ScrollController controller, bool? account) {
    viewChildren.clear();

    //viewHeader
    viewChildren.add(viewHeader1(context));
    viewChildren.add(viewAttachments(context));

    viewChildren.add(viewDesc(context));

    viewChildren.add(SizedBox(
      height: 5,
    ));
    viewChildren.add(Padding(
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: viewChannels1(context)));


    viewChildren.add(projectInfo(context));
    viewChildren.add(projectStatus(context));

    viewChildren.add(viewOwner(context));
    viewChildren.add(viewWorker(context));
    viewChildren.add(viewBidder(context));

    // viewChildren.add(viewAcceptedWorker(context));
    // viewChildren.add(viewProjectOwner(context));

    // viewChildren.add(viewInfo(context));

    if (this.model.meta.after_content != null) {
      viewChildren.add(Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
        child: Html(data: this.model.meta.after_content),
      ));
    }

    return (SingleChildScrollView(
        controller: controller!,
        physics: const AlwaysScrollableScrollPhysics(),
        reverse: false,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: viewChildren)));
  }
}

class DescPastProjectsInfo extends StatelessWidget {
  final ViewModelPastProjectsRev? info;
  final String? title;
  ScrollController? controller;
  DescPastProjectsInfo({this.info, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: CurrentTheme.MainAccentColor,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      info!.owner_photo_url!,
                      fit: BoxFit.fill,
                      height: 35.0,
                      width: 35.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 2.0, 0.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          readText(title!, 30),
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontSize: 13.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Detail',
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
              ],
            )),
        body: SingleChildScrollView(
            controller: controller!,
            physics: const AlwaysScrollableScrollPhysics(),
            reverse: false,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 2.0),
                    child: Html(
                        data: info!.description!
                            .replaceAll('<div>', '')
                            .replaceAll('<\/div>', '')
                            .replaceAll('<br>', ' ')
                            .replaceAll('<p>', '')
                            .replaceAll('<\/p>', '<br>'),
                        onLinkTap: (url, _, __, ___) async {
                          if (url!.contains('projects.co.id')) {
                            if (url!.contains(RegExp(r'[0-9]'))) {
                              if (url!.contains('show_conversation')) {
                                AppProvider.getRouter(context)!
                                    .navigateTo(context, urlToRoute(url + '/'));
                              } else {
                                AppProvider.getRouter(context)!
                                    .navigateTo(context, urlToRoute(url))
                                    .catchError((onError) {
                                  AppProvider.getRouter(context)!.pop(context);
                                });
                              }
                            } else {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context, urlToRoute(url + '/listing/'));
                            }
                          } else {
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                        },
                        onImageTap: (src, _, __, ___) {
                          // print('pr int? source : $src');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ShowItemScreenshots(image: '$src')),
                          );
                        }),
                  ),
                ])));
  }
}
///////////////////////////////////////////////////

class PastProjectsListingModel extends PastProjectsListingBase {
  Map<String, dynamic> json;
  PastProjectsListingModel(Map<String, dynamic> this.json) : super(json);

  @override
  Widget viewItemIndex(
      ItemPastProjectsModel item, String? search, int? index, bool? account) {
    // Widget viewItem (ItemPastProjectsModel item,String? search, bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemPastProjectsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child: ItemPastProjectsCard1(
            index: index,
            destination: item,
            search: search,
            shape: shape,
            height: height,
            account: account));
  }
}

class ItemPastProjectsCard1 extends StatefulWidget {
  const ItemPastProjectsCard1(
      {Key? key,
      @required this.destination,
      this.search,
      this.shape,
      this.height,
      this.index,
      this.account})
      : assert(destination != null),
        super(key: key);

// This height will allow for all the Card's content to fit comfortably within the card.
  final double? height;
  final ItemPastProjectsModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;

  @override
  _ItemPastProjectsCard1State createState() => _ItemPastProjectsCard1State();
}

class _ItemPastProjectsCard1State extends State<ItemPastProjectsCard1> {
  late BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;
  @override
  void initState() {
    super.initState();

    if (widget.index! % 10 == 0 && widget.index != 0) {
      _bannerAd = BannerAd(
        adUnitId: AdHelper.bannerAdUnitId,
        request: AdRequest(),
        size: AdSize.mediumRectangle,
        listener: BannerAdListener(
          onAdLoaded: (_) {
            setState(() {
              _isBannerAdReady = true;
            });
          },
          onAdFailedToLoad: (ad, err) {
            print('Failed to load a banner ad: ${err.message}');
            _isBannerAdReady = false;
            ad.dispose();
          },
        ),
      );

      _bannerAd.load();
    }
  }

  @override
  void dispose() {
    if (widget.index! % 10 == 0 && widget.index != 0) {
      _bannerAd.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 10.0,

            borderOnForeground: false,
            margin: EdgeInsets.all(6.0),
            child: _isBannerAdReady
                ? ItemPastProjectsContent2(
                    bannerAd: _bannerAd,
                    isBanner: _isBannerAdReady,
                    destination: widget.destination,
                    account: widget.account)
                : ItemPastProjectsContent2(
                    bannerAd: null,
                    isBanner: _isBannerAdReady,
                    destination: widget.destination,
                    account: widget.account),
            //  child: index == 0 ? ItemPastProjectsContent2(destination: destination,  account : account) :ItemPastProjectsContent1(destination: destination, account : account),
            //   ),
          ),
        ),
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
      ],
    ));
    /*
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
          child: Column(
            children: <Widget>[
              // const SectionTitle(title: ''),

              SizedBox(
                // height:index == 0 ?  315 : height,
                height: widget.destination!.item!.published_date == null? 315 : widget.destination!.item!.short_description!.length < 100? 240 :widget.destination!.item!.short_description!.length < 200? 285 : 330,
                /*  height: destination!.item!.short_description!.length < 200 ?  destination!.item!.short_description!.length.toDouble()*3.3
                     : destination!.item!.short_description!.length < 400 ?  destination!.item!.short_description!.length.toDouble()*3.7/4
                     : destination!.item!.short_description!.length < 600 ?  destination!.item!.short_description!.length.toDouble()*3.4/4
                     : destination!.item!.short_description!.length.toDouble()*3.6/4 ,
                     */

                /*   child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                margin: EdgeInsets.all(0.0),
                borderOnForeground : false, */
                child: _isBannerAdReady? ItemPastProjectsContent2(bannerAd: _bannerAd, isBanner:_isBannerAdReady,destination: widget.destination,  account : widget.account):
                ItemPastProjectsContent2(bannerAd: null, isBanner:_isBannerAdReady,destination: widget.destination,  account : widget.account),
                //  child: index == 0 ? ItemPastProjectsContent2(destination: destination,  account : account) :ItemPastProjectsContent1(destination: destination, account : account),
                //   ),
              ),

              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                alignment: Alignment.center,
                height: 10.0,
                decoration: BoxDecoration(
                  //color: Colors.lightBlue[100],
                  color:CurrentTheme.ListColor,
                ),
              )
            ],
          )
      ),
    );

     */
  }
}

class ItemPastProjectsContent2 extends StatelessWidget {
  const ItemPastProjectsContent2(
      {Key? key,
      this.bannerAd,
      this.isBanner,
      @required this.destination,
      this.account})
      : assert(destination != null),
        super(key: key);

  final ItemPastProjectsModel? destination;
  final bool? account;
  final BannerAd? bannerAd;
  final bool? isBanner;


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;

    final List<Widget> children = <Widget>[
      //  destination.viewChannels(context),
      // Photo? and title.
      SizedBox(
        height: 35.0,
        child: Stack(
          children: <Widget>[
            //  Positioned.fill(
            // In order to have the ink splash appear above the image, you
            // must use Ink.image. This allows the image to be painted as part
            // of the Material and display ink effects above it. Using a
            // standard Image will obscure the ink splash.

            //child: //Ink.image(
            // alignment: FractionalOffset.centerLeft,

            // image: AssetImage(destination.UserName, package: destination.assetPackage),
            //fit: BoxFit.cover,
            //height: 41.0,
            //width: 30.0,
            //   child: Container()

            //  ),
            //  ),
            Positioned(
              bottom: 0.0,
              left: 16.0,
              right: 16.0,
              //top: 0.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle!,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // three line description
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          destination!.item!.owner_photo_url,
                          fit: BoxFit.cover,
                          height: 22.0,
                          width: 22.0,
                        ),
                      ),

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 0.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      destination!.item!.owner_user_name,
                                      style: descriptionStyle!
                                          .copyWith(fontSize: 12),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 0.0),
                              child: RatingBarIndicator(
                                rating: destination!.item!.owner_owner_rating
                                    .toDouble(),
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: CurrentTheme.PrimaryLightColor,
                                ),
                                itemCount: 5,
                                itemSize: 12.0,
                                unratedColor: Colors.black26,
                                direction: Axis.horizontal,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Photo? and title.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: destination!.item!.published_date == null
                    ? Html(
                        data: destination!.item!.project_status_str,
                        //defaultTextStyle: TextStyle(color: CurrentTheme.ErrorColor),
                        style: {
                          "html": Style(
                            // fontSize: FontSize.medium,
                            // fontWeight: FontWeight.w800,
                            color: CurrentTheme.ErrorColor,
                          ),
                        },
                      )
                    : Container(
                        height: 0.0,
                        width: 0.0,
                        color: Colors.white,
                      ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          AppProvider.getRouter(context)!.navigateTo(
              context,
              urlToRoute(destination!
                  .item!.buttons[destination!.item!.buttons.length - 1].url));
        },
        child: SizedBox(
          height: 70.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                bottom: 5.0,
                left: 16.0,
                right: 16.0,

                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                child: Ink(
                    child: Html(
                  data: readText(destination!.item!.title, 150),
                  style: {
                    "html": Style(
                      fontSize: FontSize.medium,
                      fontWeight: FontWeight.w500,
                      //color: CurrentTheme.DarkAccentColor,
                    ),
                  },
                  // useRichText: true, defaultTextStyle : titleStyle )
                )),
              )
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          AppProvider.getRouter(context)!.navigateTo(
              context,
              urlToRoute(destination!
                  .item!.buttons[destination!.item!.buttons.length - 1].url));
        },
        child: SizedBox(
          height: destination!.item!.short_description!.length < 150
              ? 50
              : destination!.item!.short_description!.length < 200
                  ? 100.0
                  : 110.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  bottom: 0.0,
                  left: 16.0,
                  right: 16.0,
                  // In order to have the ink splash appear above the image, you
                  // must use Ink.image. This allows the image to be painted as part
                  // of the Material and display ink effects above it. Using a
                  // standard Image will obscure the ink splash.
                  child: Ink(

                      // child: Html(data: destination!.item!.short_description ,useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.black87,fontSize: 12 ), backgroundColor: CurrentTheme.BackgroundColor, )
                      child: Html(
                    data: readText(
                        destination!.item!.short_description!
                            .replaceAll('<div>', '')
                            .replaceAll('<\/div>', '')
                            .replaceAll('<br>', ' ')
                            .replaceAll('<p>', '')
                            .replaceAll('<\/p>', '<br>'),
                        400),
                    style: {
                      "html": Style(
                        fontSize: FontSize.small,
                      ),
                    },
                  ))),
            ],
          ),
        ),
      ),
      ButtonBarTheme(
        data: ButtonBarThemeData(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.6 * width,
        ),
        child: ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 0.6 * width,
            children: <Widget>[

              ElevatedButton(
                  child: Text('Report '),
                  style: ButtonStyle(
                    textStyle:
                    MaterialStateProperty.all<TextStyle>(
                        const TextStyle(color: Colors.white)),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(
                        Colors.red),
                  ),
                  onPressed: () {
                    //print('helooooooooooo');
                    AppProvider.getRouter(
                        context)!
                        .navigateTo(
                      context,
                      '/public/support/contact_form/1/contact_formReportaViolationhttps:**projects.co.id*public*past_projects*view*${destination!.item!.project_id}*${destination!.item!.title.replaceAll('/', ' ')}',
                    );
                  }),
              ElevatedButton(
                  child: Text('Block'),
                  style: ButtonStyle(
                    textStyle:
                    MaterialStateProperty.all<TextStyle>(
                        const TextStyle(color: Colors.white)),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(
                        Colors.red),
                  ),
                  onPressed: () async{
                    return await showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(
                            title: Text('Block',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            content: Text('Apakah Anda blok halaman ini?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () async{
                                  await apiRepProvider!.loadAndSaveBlacklist('black', destination!.item!.project_id + 'PastProjects');
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PublicPastProjectsListing(id: '0')),
                                        (Route<dynamic> route) => false,
                                  );
                                  // Navigator.pop(context); Navigator.pop(context);
                                },
                                /*Navigator.of(context).pop(true)*/
                                child: Text('Ya'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: Text('Tidak'),
                              ),


                            ],
                          ),
                    );
                  }
                //print('helooooooooooo');
                //  await apiRepProvider!.loadAndSaveBlacklist('black', this.model!.model!.project_id + 'BrowseProjects');

              ),
            ]),
      ),
      // Description and share/explore buttons.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 2.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle!,
          child: Row(
            children: <Widget>[
              // three line description
              //  destination!.item!.published_date == null? Container(height: 0.0, width: 0.0, color: Colors.white ,) :  Text(
              //    'Published . ',
              //    style: descriptionStyle!.copyWith( fontSize: 13),
              //  ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: destination!.item!.published_date == null
                    ? Container(
                        height: 0.0,
                        width: 0.0,
                        color: Colors.white,
                      )
                    : Text(
                        timeago.format(destination!.item!.published_date),
                        style: descriptionStyle!.copyWith(fontSize: 13),
                      ),
              ),
              destination!.item!.published_date == null
                  ? Container(
                      height: 0.0,
                      width: 0.0,
                      color: Colors.white,
                    )
                  : Text(
                      ' . ',
                      style: descriptionStyle!.copyWith(fontSize: 13),
                    ),
              destination!.item!.published_date == null
                  ? Container(
                      height: 0.0,
                      width: 0.0,
                      color: Colors.white,
                    )
                  : destination!.item!.project_class_str ==
                          'Open to Suggestions'
                      ? Text('Open to Suggestions',
                          style: descriptionStyle!.copyWith(fontSize: 13))
                      : Text(
                          destination!.item!.published_budget_str,
                          style: descriptionStyle!.copyWith(fontSize: 13),
                        ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      destination!.item!.buttons != null
                          ? destination!.item!.buttons.length == 1
                              ? PopupMenuButton<int>(
                                  onSelected: (int? value) {
                                    if (value == 1) {
                                      AppProvider.getRouter(context)!
                                          .navigateTo(
                                              context,
                                              urlToRoute(destination!
                                                  .item!.buttons[0].url));
                                    }
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuItem<int>>[
                                    PopupMenuItem<int>(
                                      value: 1,
                                      child: Text(
                                          destination!.item!.buttons[0].text),
                                    ),
                                  ],
                                )
                              : destination!.item!.buttons.length == 2
                                  ? PopupMenuButton<int>(
                                      onSelected: (int? value) {
                                        if (value == 1) {
                                          AppProvider.getRouter(context)!
                                              .navigateTo(
                                                  context,
                                                  urlToRoute(destination!
                                                      .item!.buttons[0].url));
                                        }
                                        if (value == 2) {
                                          AppProvider.getRouter(context)!
                                              .navigateTo(
                                                  context,
                                                  urlToRoute(destination!
                                                      .item!.buttons[1].url));
                                        }
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuItem<int>>[
                                        PopupMenuItem<int>(
                                          value: 1,
                                          child: Text(destination!
                                              .item!.buttons[0].text),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 2,
                                          child: Text(destination!
                                              .item!.buttons[1].text),
                                        ),
                                      ],
                                    )
                                  : destination!.item!.buttons.length == 3
                                      ? PopupMenuButton<int>(
                                          onSelected: (int? value) {
                                            if (value == 1) {
                                              AppProvider.getRouter(context)!
                                                  .navigateTo(
                                                      context,
                                                      urlToRoute(destination!
                                                          .item!
                                                          .buttons[0]
                                                          .url));
                                            }
                                            if (value == 2) {
                                              AppProvider.getRouter(context)!
                                                  .navigateTo(
                                                      context,
                                                      urlToRoute(destination!
                                                          .item!
                                                          .buttons[1]
                                                          .url));
                                            }
                                            if (value == 3) {
                                              AppProvider.getRouter(context)!
                                                  .navigateTo(
                                                      context,
                                                      urlToRoute(destination!
                                                          .item!
                                                          .buttons[2]
                                                          .url));
                                            }
                                          },
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuItem<int>>[
                                            PopupMenuItem<int>(
                                              value: 1,
                                              child: Text(destination!
                                                  .item!.buttons[0].text),
                                            ),
                                            PopupMenuItem<int>(
                                              value: 2,
                                              child: Text(destination!
                                                  .item!.buttons[1].text),
                                            ),
                                            PopupMenuItem<int>(
                                              value: 3,
                                              child: Text(destination!
                                                  .item!.buttons[2].text),
                                            ),
                                          ],
                                        )
                                      : destination!.item!.buttons.length == 4
                                          ? PopupMenuButton<int>(
                                              onSelected: (int? value) {
                                                if (value == 1) {
                                                  AppProvider.getRouter(
                                                          context)!
                                                      .navigateTo(
                                                          context,
                                                          urlToRoute(
                                                              destination!
                                                                  .item!
                                                                  .buttons[0]
                                                                  .url));
                                                }
                                                if (value == 2) {
                                                  AppProvider.getRouter(
                                                          context)!
                                                      .navigateTo(
                                                          context,
                                                          urlToRoute(
                                                              destination!
                                                                  .item!
                                                                  .buttons[1]
                                                                  .url));
                                                }
                                                if (value == 3) {
                                                  AppProvider.getRouter(
                                                          context)!
                                                      .navigateTo(
                                                          context,
                                                          urlToRoute(
                                                              destination!
                                                                  .item!
                                                                  .buttons[2]
                                                                  .url));
                                                }
                                                if (value == 4) {
                                                  AppProvider.getRouter(
                                                          context)!
                                                      .navigateTo(
                                                          context,
                                                          urlToRoute(
                                                              destination!
                                                                  .item!
                                                                  .buttons[3]
                                                                  .url));
                                                }
                                              },
                                              itemBuilder:
                                                  (BuildContext context) =>
                                                      <PopupMenuItem<int>>[
                                                PopupMenuItem<int>(
                                                  value: 1,
                                                  child: Text(destination!
                                                      .item!.buttons[0].text),
                                                ),
                                                PopupMenuItem<int>(
                                                  value: 2,
                                                  child: Text(destination!
                                                      .item!.buttons[1].text),
                                                ),
                                                PopupMenuItem<int>(
                                                  value: 3,
                                                  child: Text(destination!
                                                      .item!.buttons[2].text),
                                                ),
                                                PopupMenuItem<int>(
                                                  value: 4,
                                                  child: Text(destination!
                                                      .item!.buttons[3].text),
                                                ),
                                              ],
                                            )
                                          : destination!.item!.buttons.length ==
                                                  5
                                              ? PopupMenuButton<int>(
                                                  onSelected: (int? value) {
                                                    if (value == 1) {
                                                      AppProvider.getRouter(
                                                              context)!
                                                          .navigateTo(
                                                              context,
                                                              urlToRoute(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          0]
                                                                      .url));
                                                    }
                                                    if (value == 2) {
                                                      AppProvider.getRouter(
                                                              context)!
                                                          .navigateTo(
                                                              context,
                                                              urlToRoute(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          1]
                                                                      .url));
                                                    }
                                                    if (value == 3) {
                                                      AppProvider.getRouter(
                                                              context)!
                                                          .navigateTo(
                                                              context,
                                                              urlToRoute(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          2]
                                                                      .url));
                                                    }
                                                    if (value == 4) {
                                                      AppProvider.getRouter(
                                                              context)!
                                                          .navigateTo(
                                                              context,
                                                              urlToRoute(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          3]
                                                                      .url));
                                                    }
                                                    if (value == 5) {
                                                      AppProvider.getRouter(
                                                              context)!
                                                          .navigateTo(
                                                              context,
                                                              urlToRoute(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          4]
                                                                      .url));
                                                    }
                                                  },
                                                  itemBuilder:
                                                      (BuildContext context) =>
                                                          <PopupMenuItem<int>>[
                                                    PopupMenuItem<int>(
                                                      value: 1,
                                                      child: Text(destination!
                                                          .item!
                                                          .buttons[0]
                                                          .text),
                                                    ),
                                                    PopupMenuItem<int>(
                                                      value: 2,
                                                      child: Text(destination!
                                                          .item!
                                                          .buttons[1]
                                                          .text),
                                                    ),
                                                    PopupMenuItem<int>(
                                                      value: 3,
                                                      child: Text(destination!
                                                          .item!
                                                          .buttons[2]
                                                          .text),
                                                    ),
                                                    PopupMenuItem<int>(
                                                      value: 4,
                                                      child: Text(destination!
                                                          .item!
                                                          .buttons[3]
                                                          .text),
                                                    ),
                                                    PopupMenuItem<int>(
                                                      value: 5,
                                                      child: Text(destination!
                                                          .item!
                                                          .buttons[4]
                                                          .text),
                                                    ),
                                                  ],
                                                )
                                              : destination!.item!.buttons
                                                          .length ==
                                                      6
                                                  ? PopupMenuButton<int>(
                                                      onSelected: (int? value) {
                                                        if (value == 1) {
                                                          AppProvider.getRouter(
                                                                  context)!
                                                              .navigateTo(
                                                                  context,
                                                                  urlToRoute(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              0]
                                                                          .url));
                                                        }
                                                        if (value == 2) {
                                                          AppProvider.getRouter(
                                                                  context)!
                                                              .navigateTo(
                                                                  context,
                                                                  urlToRoute(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              1]
                                                                          .url));
                                                        }
                                                        if (value == 3) {
                                                          AppProvider.getRouter(
                                                                  context)!
                                                              .navigateTo(
                                                                  context,
                                                                  urlToRoute(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              2]
                                                                          .url));
                                                        }
                                                        if (value == 4) {
                                                          AppProvider.getRouter(
                                                                  context)!
                                                              .navigateTo(
                                                                  context,
                                                                  urlToRoute(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              3]
                                                                          .url));
                                                        }
                                                        if (value == 5) {
                                                          AppProvider.getRouter(
                                                                  context)!
                                                              .navigateTo(
                                                                  context,
                                                                  urlToRoute(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              4]
                                                                          .url));
                                                        }
                                                        if (value == 6) {
                                                          AppProvider.getRouter(
                                                                  context)!
                                                              .navigateTo(
                                                                  context,
                                                                  urlToRoute(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              5]
                                                                          .url));
                                                        }
                                                      },
                                                      itemBuilder: (BuildContext
                                                              context) =>
                                                          <PopupMenuItem<int>>[
                                                        PopupMenuItem<int>(
                                                          value: 1,
                                                          child: Text(
                                                              destination!
                                                                  .item!
                                                                  .buttons[0]
                                                                  .text),
                                                        ),
                                                        PopupMenuItem<int>(
                                                          value: 2,
                                                          child: Text(
                                                              destination!
                                                                  .item!
                                                                  .buttons[1]
                                                                  .text),
                                                        ),
                                                        PopupMenuItem<int>(
                                                          value: 3,
                                                          child: Text(
                                                              destination!
                                                                  .item!
                                                                  .buttons[2]
                                                                  .text),
                                                        ),
                                                        PopupMenuItem<int>(
                                                          value: 4,
                                                          child: Text(
                                                              destination!
                                                                  .item!
                                                                  .buttons[3]
                                                                  .text),
                                                        ),
                                                        PopupMenuItem<int>(
                                                          value: 5,
                                                          child: Text(
                                                              destination!
                                                                  .item!
                                                                  .buttons[4]
                                                                  .text),
                                                        ),
                                                        PopupMenuItem<int>(
                                                          value: 6,
                                                          child: Text(
                                                              destination!
                                                                  .item!
                                                                  .buttons[5]
                                                                  .text),
                                                        ),
                                                      ],
                                                    )
                                                  : destination!.item!.buttons
                                                              .length ==
                                                          7
                                                      ? PopupMenuButton<int>(
                                                          onSelected:
                                                              (int? value) {
                                                            if (value == 1) {
                                                              AppProvider.getRouter(
                                                                      context)!
                                                                  .navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              0]
                                                                          .url));
                                                            }
                                                            if (value == 2) {
                                                              AppProvider.getRouter(
                                                                      context)!
                                                                  .navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              1]
                                                                          .url));
                                                            }
                                                            if (value == 3) {
                                                              AppProvider.getRouter(
                                                                      context)!
                                                                  .navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              2]
                                                                          .url));
                                                            }
                                                            if (value == 4) {
                                                              AppProvider.getRouter(
                                                                      context)!
                                                                  .navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              3]
                                                                          .url));
                                                            }
                                                            if (value == 5) {
                                                              AppProvider.getRouter(
                                                                      context)!
                                                                  .navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              4]
                                                                          .url));
                                                            }
                                                            if (value == 6) {
                                                              AppProvider.getRouter(
                                                                      context)!
                                                                  .navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              5]
                                                                          .url));
                                                            }
                                                            if (value == 7) {
                                                              AppProvider.getRouter(
                                                                      context)!
                                                                  .navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              6]
                                                                          .url));
                                                            }
                                                          },
                                                          itemBuilder: (BuildContext
                                                                  context) =>
                                                              <
                                                                  PopupMenuItem<
                                                                      int>>[
                                                            PopupMenuItem<int>(
                                                              value: 1,
                                                              child: Text(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          0]
                                                                      .text),
                                                            ),
                                                            PopupMenuItem<int>(
                                                              value: 2,
                                                              child: Text(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          1]
                                                                      .text),
                                                            ),
                                                            PopupMenuItem<int>(
                                                              value: 3,
                                                              child: Text(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          2]
                                                                      .text),
                                                            ),
                                                            PopupMenuItem<int>(
                                                              value: 4,
                                                              child: Text(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          3]
                                                                      .text),
                                                            ),
                                                            PopupMenuItem<int>(
                                                              value: 5,
                                                              child: Text(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          4]
                                                                      .text),
                                                            ),
                                                            PopupMenuItem<int>(
                                                              value: 6,
                                                              child: Text(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          5]
                                                                      .text),
                                                            ),
                                                            PopupMenuItem<int>(
                                                              value: 7,
                                                              child: Text(
                                                                  destination!
                                                                      .item!
                                                                      .buttons[
                                                                          6]
                                                                      .text),
                                                            ),
                                                          ],
                                                        )
                                                      : destination!
                                                                  .item!
                                                                  .buttons
                                                                  .length ==
                                                              8
                                                          ? PopupMenuButton<
                                                              int>(
                                                              onSelected:
                                                                  (int? value) {
                                                                if (value ==
                                                                    1) {
                                                                  AppProvider.getRouter(context)!.navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              0]
                                                                          .url));
                                                                }
                                                                if (value ==
                                                                    2) {
                                                                  AppProvider.getRouter(context)!.navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              1]
                                                                          .url));
                                                                }
                                                                if (value ==
                                                                    3) {
                                                                  AppProvider.getRouter(context)!.navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              2]
                                                                          .url));
                                                                }
                                                                if (value ==
                                                                    4) {
                                                                  AppProvider.getRouter(context)!.navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              3]
                                                                          .url));
                                                                }
                                                                if (value ==
                                                                    5) {
                                                                  AppProvider.getRouter(context)!.navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              4]
                                                                          .url));
                                                                }
                                                                if (value ==
                                                                    6) {
                                                                  AppProvider.getRouter(context)!.navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              5]
                                                                          .url));
                                                                }
                                                                if (value ==
                                                                    7) {
                                                                  AppProvider.getRouter(context)!.navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              6]
                                                                          .url));
                                                                }
                                                                if (value ==
                                                                    8) {
                                                                  AppProvider.getRouter(context)!.navigateTo(
                                                                      context,
                                                                      urlToRoute(destination!
                                                                          .item!
                                                                          .buttons[
                                                                              7]
                                                                          .url));
                                                                }
                                                              },
                                                              itemBuilder: (BuildContext
                                                                      context) =>
                                                                  <
                                                                      PopupMenuItem<
                                                                          int>>[
                                                                PopupMenuItem<
                                                                    int>(
                                                                  value: 1,
                                                                  child: Text(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              0]
                                                                          .text),
                                                                ),
                                                                PopupMenuItem<
                                                                    int>(
                                                                  value: 2,
                                                                  child: Text(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              1]
                                                                          .text),
                                                                ),
                                                                PopupMenuItem<
                                                                    int>(
                                                                  value: 3,
                                                                  child: Text(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              2]
                                                                          .text),
                                                                ),
                                                                PopupMenuItem<
                                                                    int>(
                                                                  value: 4,
                                                                  child: Text(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              3]
                                                                          .text),
                                                                ),
                                                                PopupMenuItem<
                                                                    int>(
                                                                  value: 5,
                                                                  child: Text(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              4]
                                                                          .text),
                                                                ),
                                                                PopupMenuItem<
                                                                    int>(
                                                                  value: 6,
                                                                  child: Text(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              5]
                                                                          .text),
                                                                ),
                                                                PopupMenuItem<
                                                                    int>(
                                                                  value: 7,
                                                                  child: Text(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              6]
                                                                          .text),
                                                                ),
                                                                PopupMenuItem<
                                                                    int>(
                                                                  value: 8,
                                                                  child: Text(
                                                                      destination!
                                                                          .item!
                                                                          .buttons[
                                                                              7]
                                                                          .text),
                                                                ),
                                                              ],
                                                            )
                                                          : Container(
                                                              height: 0.0,
                                                              width: 0.0,
                                                              color:
                                                                  Colors.white,
                                                            )
                          : Container(
                              height: 0.0,
                              width: 0.0,
                              color: Colors.white,
                            ),
                    ]),
                //settingsRow,
              ),
            ],
          ),
        ),
      ),
    ];

    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class SearchPastProjectsListing extends StatefulWidget {
  //static const String?  PATH = '/public/past_projects/listing/:id';
  final String? id;
  final String? title;
  bool? account;
  SearchPastProjectsListing({Key? key, this.id, this.title, this.account})
      : super(key: key);
  @override
  SearchPastProjectsListingState createState() =>
      SearchPastProjectsListingState();
}

class SearchPastProjectsListingState extends State<SearchPastProjectsListing>
    with RestorationMixin {
  String? title = 'Past Projects';
  bool _dialVisible = true;
  bool search = false;
  String? getPath =
      Env.value!.baseUrl! + '/public/past_projects/listing?page=%d';
  ScrollController? scrollController;
  PastProjectsController? past_projects;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  bool isopen  = false;
  String? searchText = '';

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'SearchPastProjects';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'SearchPastProjects');
  }

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController();
    scrollController!.addListener(_onScroll);
    search = true;
    if (widget.id == '') {
      getPath = Env.value!.baseUrl! +
          '/public/past_projects/listing?page=%d&' +
          'search=' +
          searchText!;
    } else {
      getPath = Env.value!.baseUrl! +
          '/public/past_projects/listing/' +
          widget.id! +
          '?page=%d';
    }

    past_projects = PastProjectsController(AppProvider.getApplication(context),
        getPath, AppAction.listing, '', '', '', search);
    past_projects!.listing!.add(PastProjectsList());
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: widget.id == ''
              ? TextField(
                  textInputAction: TextInputAction.search,
                  // textInputAction: TextInputAction.search ,
                  onTap: () {},
                  autofocus: true,
                  onSubmitted: (String value) {
                    _onSubmited(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search Projects',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        right: 10.0, left: 0.0, top: 10.0, bottom: 10.0),
                  ),
                )
              : Text(
                  widget.title!,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
        body: buildListingBar());
  }

  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  void _onSubmited(String value) {
    setState(() {
      searchText = value;
    });
  }

  void open(bool val){
    // setState(() {
    isopen = val;
    //});
  }
  Widget buildSearchBar(String tiltle) {
    return Container(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
          style: TextStyle(fontSize: 14.0, height: 0.2, color: Colors.black),
          onChanged: (String value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

            //hasFloatingPlaceholder: false,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gapPadding: 20.0),
          ),
        ));
  }

  // @override
  Widget buildListingBar() {
    return BlocBuilder<PastProjectsListing, PastProjectsState>(
      builder: (BuildContext context, PastProjectsState state) {
        if (state is PastProjectsListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is PastProjectsListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is PastProjectsListingLoaded) {
          if (state.past_projects!.items.items.isEmpty) {
            if (state.past_projects!.tools.buttons.length == 0) {
              return Scaffold(
                body: Center(
                  child: Text('no ' + title!),
                ),
              );
            } else {
              return Scaffold(
                  body: Center(
                    child: Text('no ' + title!),
                  ),
                  floatingActionButton: state.past_projects!
                      .Buttons(context, _dialVisible, widget.account, open)
                  //floatingActionButton: isLoading? null :  state.past_projects!.Buttons(context, _dialVisible, controller,past_projects,  this, Env.value!.baseUrl!, '', title!)
                  );
            }
          }
          if (state.past_projects!.tools.buttons.length == 0) {
            return Scaffold(
                body: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int? index) {
                  return index! >= state.past_projects!.items.items.length
                      ? SearchPastProjectsBottomLoader()
                      : state.past_projects!.viewItemIndex(
                          state.past_projects!.items.items[index],
                          searchText,
                          index,
                          widget.account);
                },
                itemCount: state.hasReachedMax!
                    ? state.past_projects!.items.items.length
                    : state.past_projects!.items.items.length + 1,
                controller: scrollController,
              ),
              onRefresh: _onRefresh,
            ));
          }
          return Scaffold(
            body: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int? index) {
                  return index! >= state.past_projects!.items.items.length
                      ? SearchPastProjectsBottomLoader()
                      : state.past_projects!.viewItemIndex(
                          state.past_projects!.items.items[index],
                          searchText,
                          index,
                          widget.account);
                },
                itemCount: state.hasReachedMax!
                    ? state.past_projects!.items.items.length
                    : state.past_projects!.items.items.length + 1,
                controller: scrollController,
              ),
              onRefresh: _onRefresh,
            ),

            //floatingActionButton: state.past_projects!.Buttons(context, _dialVisible)
            //floatingActionButton: isLoading? null :  state.past_projects!.Buttons(context, _dialVisible, controller,past_projects,  this, Env.value!.baseUrl!, '', title!)
          );
        }

        return Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ));
      },
    );
  }

  @override
  void dispose() {
    past_projects!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = Completer<Null>();
    past_projects!.listing!.add(PastProjectsListingRefresh());

    Timer timer = Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    cs.value = currentScroll;
    if (maxScroll - currentScroll <= scrollThreshold) {
      past_projects!.listing!.add(PastProjectsList());
    }
  }
}

class SearchPastProjectsListing1 extends StatefulWidget {
  //static const String?  PATH = '/public/past_projects/listing/:id';
  final String? id;
  final String? title;
  bool? account;
  SearchPastProjectsListing1({Key? key, this.id, this.title, this.account})
      : super(key: key);
  @override
  SearchPastProjectsListing1State createState() =>
      SearchPastProjectsListing1State();
}

class SearchPastProjectsListing1State extends State<SearchPastProjectsListing1>
    with RestorationMixin {
  String? title = 'Past Projects';
  bool _dialVisible = true;
  bool search = false;
  String? getPath =
      Env.value!.baseUrl! + '/public/past_projects/listing?page=%d';
  ScrollController? scrollController;
  PastProjectsController? past_projects;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool isopen = false;
  bool selected = false;
  String? searchText = '';

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'SearchPastProjects';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'SearchPastProjects');
  }

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController();
    scrollController!.addListener(_onScroll);
    search = true;
    if (widget.id == '') {
      getPath = Env.value!.baseUrl! +
          '/public/past_projects/listing?page=%d&' +
          'search=' +
          searchText!;
    } else {
      getPath = Env.value!.baseUrl! +
          '/public/past_projects/listing/' +
          widget.id! +
          '?page=%d';
    }

    past_projects = PastProjectsController(AppProvider.getApplication(context),
        getPath, AppAction.listing, '', '', '', search);
    past_projects!.listing!.add(PastProjectsList());
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: widget.id == ''
              ? TextField(
                  textInputAction: TextInputAction.search,
                  // textInputAction: TextInputAction.search ,
                  onTap: () {},
                  autofocus: true,
                  onSubmitted: (String value) {
                    _onSubmited(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Projects',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        right: 10.0, left: 0.0, top: 10.0, bottom: 10.0),
                  ),
                )
              : Text(
                  widget.title!,
                  style: TextStyle(color: Colors.white),
                ),
        ),
        body: buildListingBar());
  }

  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  void _onSubmited(String value) {
    setState(() {
      searchText = value;
    });
  }
  void open(bool val){
    // setState(() {
    isopen = val;
    //});
  }
  Widget buildSearchBar(String tiltle) {
    return Container(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
          style: TextStyle(fontSize: 14.0, height: 0.2, color: Colors.black),
          onChanged: (String value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

            //hasFloatingPlaceholder: false,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gapPadding: 20.0),
          ),
        ));
  }

  // @override
  Widget buildListingBar() {
    return BlocBuilder<PastProjectsListing, PastProjectsState>(
      bloc: past_projects!.listing,
      builder: (BuildContext context, PastProjectsState state) {
        if (state is PastProjectsListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is PastProjectsListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is PastProjectsListingLoaded) {
          if (state.past_projects!.items.items.isEmpty) {
            if (state.past_projects!.tools.buttons.length == 0) {
              return Scaffold(
                body: Center(
                  child: Text('no ' + title!),
                ),
              );
            } else {
              return Scaffold(
                  body: Center(
                    child: Text('no ' + title!),
                  ),
                  floatingActionButton: state.past_projects!
                      .Buttons(context, _dialVisible, widget.account, open)
                  //floatingActionButton: isLoading? null :  state.past_projects!.Buttons(context, _dialVisible, controller,past_projects,  this, Env.value!.baseUrl!, '', title!)
                  );
            }
          }
          if (state.past_projects!.tools.buttons.length == 0) {
            return Scaffold(
                body: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int? index) {
                  return index! >= state.past_projects!.items.items.length
                      ? SearchPastProjectsBottomLoader()
                      : state.past_projects!.viewItemIndex(
                          state.past_projects!.items.items[index],
                          searchText,
                          index,
                          widget.account);
                },
                itemCount: state.hasReachedMax!
                    ? state.past_projects!.items.items.length
                    : state.past_projects!.items.items.length + 1,
                controller: scrollController,
              ),
              onRefresh: _onRefresh,
            ));
          }
          return Scaffold(
            body: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int? index) {
                  return index! >= state.past_projects!.items.items.length
                      ? SearchPastProjectsBottomLoader()
                      : state.past_projects!.viewItemIndex(
                          state.past_projects!.items.items[index],
                          searchText,
                          index,
                          widget.account);
                },
                itemCount: state.hasReachedMax!
                    ? state.past_projects!.items.items.length
                    : state.past_projects!.items.items.length + 1,
                controller: scrollController,
              ),
              onRefresh: _onRefresh,
            ),

            //floatingActionButton: state.past_projects!.Buttons(context, _dialVisible)
            //floatingActionButton: isLoading? null :  state.past_projects!.Buttons(context, _dialVisible, controller,past_projects,  this, Env.value!.baseUrl!, '', title!)
          );
        }

        return Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ));
      },
    );
  }

  @override
  void dispose() {
    past_projects!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = Completer<Null>();
    past_projects!.listing!.add(PastProjectsListingRefresh());

    Timer timer = Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    cs.value = currentScroll;
    if (maxScroll - currentScroll <= scrollThreshold) {
      past_projects!.listing!.add(PastProjectsList());
    }
  }
}

class SearchPastProjectsBottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}


//class ItemPastProjects extends class ItemPastProjectsBase{
//
//}



////////////////////////////
