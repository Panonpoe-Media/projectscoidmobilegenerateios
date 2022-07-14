import 'package:projectscoid/models/model.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/controllers/controllers.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'file_fields.dart';
import 'meta.dart';
import 'button.dart';
import 'browse_projects_item.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'photo.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/models/browse_projects_base.dart';
import 'package:projectscoid/models/BrowseProjects/user_bids_list_base.dart';
import 'BrowseProjects/user_bids_list_item.dart';
import 'BrowseProjects/user_bids_list_item_base.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
//import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';
import 'package:badges/badges.dart';
import 'package:projectscoid/views/BrowseProjects/browse_projects_listing.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:projectscoid/views/BrowseProjects/browse_projects_view.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:admob_flutter/admob_flutter.dart';
part 'browse_projects.g.dart';

/** AUTOGENERATE OFF **/

class PlaceNewBidBrowseProjectsModel extends PlaceNewBidBrowseProjectsBase {
  Map<String, dynamic> json;
  PlaceNewBidBrowseProjectsModel(Map<String, dynamic> this.json) : super(json);
}

class AskOwnerBrowseProjectsModel extends AskOwnerBrowseProjectsBase {
  Map<String, dynamic> json;
  AskOwnerBrowseProjectsModel(Map<String, dynamic> this.json) : super(json);
}

class GuestCreateProjectBrowseProjectsModel
    extends GuestCreateProjectBrowseProjectsBase {
  Map<String, dynamic> json;
  GuestCreateProjectBrowseProjectsModel(Map<String, dynamic> this.json)
      : super(json);
}

class BrowseProjectsModel extends BrowseProjectsBase {
  Map<String, dynamic> json;
  BrowseProjectsModel(Map<String, dynamic> this.json) : super(json);
}

///////////////////////////////////////////////////
@JsonSerializable()
class ViewModelBrowseProjectsRev {
  int? age;
  int? cnt;
  int? page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  String? description;
  List<FileField?>? attachments;
  String? attachments_url;
  String? attachments_name;
  List<int?>? channels_id;
  List<String?>? channels_str;
  List<String?>? channels_url;
  int? project_class_id;
  String? project_class_str;
  List<int?>? project_class_list;
  List<String?>? project_class_list_str;
  String? budget_range;
  double? budget_range_min;
  String? budget_range_min_str;
  double? budget_range_max;
  String? budget_range_max_str;
  String? budget_range_str;
  double? published_budget;
  String? published_budget_str;
  int? finish_days;
  String? finish_days_str;
  bool? need_weekly_report;
  DateTime? published_date;
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
  DateTime? start_date;
  DateTime? finish_date;
  int? bid_count;
  String? bid_count_str;
  DateTime? select_deadline;
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
  double? owner_arbitration_rate;
  DateTime? owner_last_seen;
  int? owner_projects_owned;
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
  int? accepted_worker_worker_rating;
  int? accepted_worker_worker_point;
  String? accepted_worker_worker_point_str;
  int? accepted_worker_worker_ranking;
  String? accepted_worker_worker_ranking_str;
  String? owner_feedback;
  UserBidsListingToolsRev? user_bids;
  String? project_id;

  //
  ViewModelBrowseProjectsRev(
      this.id,
      this.description,
      this.attachments,
      this.attachments_url,
      this.attachments_name,
      this.channels_id,
      this.channels_str,
      this.channels_url,
      this.project_class_id,
      this.project_class_str,
      this.project_class_list,
      this.project_class_list_str,
      this.budget_range,
      this.budget_range_min,
      this.budget_range_min_str,
      this.budget_range_max,
      this.budget_range_max_str,
      this.budget_range_str,
      this.published_budget,
      this.published_budget_str,
      this.finish_days,
      this.finish_days_str,
      this.need_weekly_report,
      this.published_date,
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
      this.start_date,
      this.finish_date,
      this.bid_count,
      this.bid_count_str,
      this.select_deadline,
      this.owner_id,
      this.owner_str,
      this.owner_url,
      this.owner_list,
      this.owner_list_str,
      this.owner_photo_url,
      this.owner_photo,
      this.owner_kabupaten_id,
      this.owner_kabupaten_str,
      this.owner_arbitration_rate,
      this.owner_projects_owned,
      this.owner_last_seen,
      this.owner_owner_rating_num,
      this.owner_owner_rating_num_str,
      this.owner_owner_point,
      this.owner_owner_point_str,
      this.owner_owner_ranking,
      this.owner_owner_ranking_str,
      this.worker_rating_num,
      this.worker_rating_num_str,
      this.worker_feedback,
      this.accepted_worker_worker_point,
      this.accepted_worker_worker_point_str,
      this.accepted_worker_worker_ranking,
      this.accepted_worker_worker_ranking_str,
      this.owner_feedback,
      this.user_bids,
      this.project_id);

  factory ViewModelBrowseProjectsRev.fromJson(Map<String, dynamic> json) =>
      _$ViewModelBrowseProjectsRevFromJson(json);
}

/*
ViewModelBrowseProjectsRev _$ViewModelBrowseProjectsRevFromJson(Map<String, dynamic> json) {
  return ViewModelBrowseProjectsRev(

      json['id'] as String,
      json['description'] as String,

      (json['attachments'] == ''? null  : json['attachments'] as List)
          ?.map((e) =>
      e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          ?.toList(),


      json['attachments_url'] as String,
      json['attachments_name'] as String,
      (json['channels_id'] as List)?.map((e) => e as int)?.toList(),
      (json['channels_str'] as List)?.map((e) => e as String)?.toList(),
      (json['channels_url'] as List)?.map((e) => e as String)?.toList(),



      json['project_class_id'] as int,
      json['project_class_str'] as String,
      (json['project_class_list'] as List)?.map((e) => e as int)?.toList(),
      (json['project_class_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),

      json['budget_range'] as String,
      (json['budget_range_min'] as num)?.toDouble(),
      json['budget_range_min_str'] as String,
      (json['budget_range_max'] as num)?.toDouble(),
      json['budget_range_max_str'] as String,
      json['budget_range_str'] as String,

      (json['published_budget'] as num)?.toDouble(),
      json['published_budget_str'] as String,
      json['finish_days'] as int,
      json['finish_days_str'] as String,



      json['need_weekly_report'] as bool,
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
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
      json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      json['finish_date'] == null
          ? null
          : DateTime.parse(json['finish_date'] as String),


      json['bid_count'] as int,
      json['bid_count_str'] as String,
      json['select_deadline'] == null
          ? null
          : DateTime.parse(json['select_deadline'] as String),
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
      (json['owner_arbitration_rate'] as num)?.toDouble(),
      json['owner_projects_owned'] as int,

      json['owner_last_seen'] == null
      ? null
      : DateTime.parse(json['owner_last_seen'] as String),
      (json['owner_owner_rating_num'] as num)?.toDouble(),
      json['owner_owner_rating_num_str'] as String,
      json['owner_owner_point'] as int,
      json['owner_owner_point_str'] as String,
      json['owner_owner_ranking'] as int,
      json['owner_owner_ranking_str'] as String,
      (json['worker_rating_num'] as num)?.toDouble(),
      json['worker_rating_num_str'] as String,
      json['worker_feedback'] as String,
      json['accepted_worker_worker_point'] as int,
      json['accepted_worker_worker_point_str'] as String,
      json['accepted_worker_worker_ranking'] as int,
      json['accepted_worker_worker_ranking_str'] as String,
      json['owner_feedback'] as String,

      json['user_bids'] == null
      ? null
      : UserBidsListingToolsRev.fromJson(json['user_bids'] as Map<String, dynamic>


      ),




      json['project_id'] as String)
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
class BrowseProjectsViewSuperBaseRev {
  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelBrowseProjectsRev? model;
  BrowseProjectsViewSuperBaseRev(
    this.id,
    this.buttons,
    this.meta,
    this.model,
  );
  factory BrowseProjectsViewSuperBaseRev.fromJson(Map<String, dynamic> json) =>
      _$BrowseProjectsViewSuperBaseRevFromJson(json);
}
/*
BrowseProjectsViewSuperBaseRev _$BrowseProjectsViewSuperBaseRevFromJson(Map<String, dynamic> json) {
  return BrowseProjectsViewSuperBaseRev(
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
          : ViewModelBrowseProjectsRev.fromJson(
          json['model'] as Map<String, dynamic>));
}

 */

class BrowseProjectsViewModel extends BrowseProjectsViewBase {
  Map<String, dynamic> json;
  // BrowseProjectsViewModel(Map<String, dynamic> this.json):super(json);
  BrowseProjectsViewModel(this.json) : super(json) {
    model = BrowseProjectsViewSuperBaseRev.fromJson(json);
  }

//  ChatBloc _chatBloc;
  Widget viewHeader(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    final mediaQueryData = MediaQuery.of(context);
    return (
            //  SizedBox(
            //  height: 140.0,
            ///  child:
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
          // three line description
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 20.0, 0.0),
            child: InkWell(
              onTap: () {
                // return BidItemInfo(info : this.info);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowItemScreenshots(
                          image: this.model!.model!.owner_photo_url)),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  this.model!.model!.owner_photo_url,
                  fit: BoxFit.fitHeight,
                  height: 75.0,
                  width: 80.0,
                ),
              ),
            ),
          ),
          // ly added
          Flexible(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 40.0, 30.0, 0.0),
                  child: Column(children: <Widget>[
                    Html(
                      // this.model!.meta.title ,
                      data: model!.meta.title,
                      style: {
                        "html": Style(
                          fontSize: FontSize.medium,
                        ),
                      },
                      //  useRichText: true, defaultTextStyle :  descriptionStyle.copyWith( fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppProvider.getRouter(context)!.navigateTo(
                            context, urlToRoute(this.model!.model!.owner_url));
                      },
                      child: Html(
                        data: readText(this.model!.model!.owner_str, 54),
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
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(children: <Widget>[
                        // three line description
                        Text(
                          this.model!.model!.project_class_str,
                          style: descriptionStyle.copyWith(fontSize: 9),
                        ),

                        this.model!.model!.project_class_str ==
                                'Open to Suggestions'
                            ? Container(
                                width: 0.0,
                                height: 0.0,
                              )
                            : Text(
                                ' . ',
                                style: descriptionStyle.copyWith(fontSize: 9),
                              ),
                        this.model!.model!.project_class_str ==
                                'Open to Suggestions'
                            ? Container(
                                width: 0.0,
                                height: 0.0,
                              )
                            : Text(
                                this.model!.model!.project_class_str ==
                                        "Specific Range"
                                    ? this.model!.model!.budget_range_str
                                    : this.model!.model!.published_budget_str,
                                //        "project_class_str": "Specific Range",
                                style: descriptionStyle.copyWith(fontSize: 9),
                              )
                      ]),
                    ),
                    SizedBox(height: 10),
                  ]))),
        ])
        //)
        );
  }

  Widget viewInfo(BuildContext context) {
    return Container(
        height: 98.0,
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        AppProvider.getRouter(context)!
                            .navigateTo(context, urlToRoute(model!.url));
                      },
                      child: Container(
                        height: 60.0,
                        width: 130.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, right: 8.0, top: 0.0),
                              child: Icon(
                                Icons.publish,
                                size: 26.0,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0, right: 8.0, top: 1.0),
                                child: Html(
                                  data: readText(
                                      this.model!.model!.project_status_str,
                                      100),
                                  style: {
                                    "html": Style(
                                        // fontSize: FontSize.small,
                                        fontWeight: FontWeight.w300),
                                  },
                                  shrinkWrap: true,
                                )),
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
                          left: Divider.createBorderSide(context,
                              color: Colors.grey, width: 1),
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
                        AppProvider.getRouter(context)!
                            .navigateTo(context, urlToRoute(model!.url));
                      },
                      child: Container(
                        height: 58.0,
                        width: 130.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 8.0, top: 0.0),
                              child: Icon(
                                Icons.file_download,
                                size: 26.0,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 8.0, top: 1.0),
                                child: this.model!.model!.bid_count == null
                                    ? Html(
                                        data: readText('No' + ' bids', 46),
                                        style: {
                                            "html": Style(
                                                //  fontSize: FontSize.small,
                                                fontWeight: FontWeight.w300),
                                          })
                                    : Html(
                                        data: readText(
                                            this
                                                    .model!
                                                    .model!
                                                    .bid_count
                                                    .toString() +
                                                ' bids',
                                            46),
                                        style: {
                                            "html": Style(
                                                fontSize: FontSize.small,
                                                fontWeight: FontWeight.w300),
                                          })),
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
                          left: Divider.createBorderSide(context,
                              color: Colors.grey, width: 1),
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
                        AppProvider.getRouter(context)!
                            .navigateTo(context, urlToRoute(model!.url));
                      },
                      child: Container(
                        height: 60.0,
                        width: 130.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 8.0, top: 0.0),
                              child: Icon(
                                Icons.timer,
                                size: 26.0,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 8.0, top: 1.0),
                                child: Html(
                                    data: readText(
                                        this
                                                .model!
                                                .model!
                                                .finish_days
                                                .toString() +
                                            ' days',
                                        46),
                                    style: {
                                      "html": Style(
                                          //fontSize: FontSize.small,
                                          fontWeight: FontWeight.w300),
                                    })),
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
                          left: Divider.createBorderSide(context,
                              color: Colors.grey, width: 1),
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
                        AppProvider.getRouter(context)!
                            .navigateTo(context, urlToRoute(model!.url));
                      },
                      child: Container(
                        height: 62.0,
                        width: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 0.0, top: 0.0),
                              child: Icon(
                                Icons.event_note,
                                size: 26.0,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 8.0, top: 1.0),
                                child: this.model!.model!.need_weekly_report ==
                                        null
                                    ? Html(
                                        data: readText('No weekly report', 46),
                                        style: {
                                            "html": Style(
                                                // fontSize: FontSize.small,
                                                fontWeight: FontWeight.w300),
                                          })
                                    : this.model!.model!.need_weekly_report
                                        ? Html(
                                            data: readText(
                                                'Need weekly report', 46),
                                            style: {
                                                "html": Style(
                                                    // fontSize: FontSize.small,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              })
                                        : Html(
                                            data: readText(
                                                'No weekly report', 46),
                                            style: {
                                                "html": Style(
                                                    // fontSize: FontSize.small,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              })),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }

  @override
  Widget viewAttachments(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    if (model!.model!.attachments == null) {
      return (Container(height: 0, width: 0));
    }
    if (model!.model!.attachments_name != '') {
      return (FileViewAtt(
        ctx: context,
        value: model!.model!.attachments_name,
        value1: model!.model!.attachments_url,
        caption: 'Attachments',
      ));
    } else {
      return (Container(height: 0, width: 0));
    }
  }

  Widget viewButton(BuildContext context, bool account) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return (this.model!.model!.project_status_id != 3
        ? Container()
        : ButtonBarTheme(
            data: ButtonBarThemeData(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.6 * width,
            ),
            child: ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 0.6 * width,
                children: <Widget>[
                  RaisedButton(
                      child: Text('Bid This Project'),
                      textColor: Colors.white,
                      splashColor: CurrentTheme.ShadeColor,
                      color: Color(0xFF037f51),
                      onPressed: () {
                        //print('helooooooooooo');
                        if (account!) {
                          // print('helooooooooooo');
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(
                                  'public/browse_projects/place_new_bid/${this.model!.model!.project_id}/${this.model!.meta.title.replaceAll('/', ' ')}'));
                        } else {
                          // print('helooooooooooo1');
                          AppProvider.getRouter(context)!
                              .navigateTo(context, '/login/1');
                        }
                      }),
                ]),
          ));
  }

  Widget viewBidder(BuildContext context) {
    if (this.model!.model!.user_bids.items.length == 0) {
      return Container(height: 0, width: 0);
    } else {
      return Container(
        height: 245.0,
        padding: EdgeInsets.only(top: 0.0),
        child: this.model!.model!.user_bids.items.length == 0
            ? Container(width: 0.0, height: 0.0)
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 3),
                        child: Text(
                          'Current Bidder:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )),
                    Container(
                      height: 222.0, //375
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int? index) {
                          return index! >=
                                  this.model!.model!.user_bids.items.length
                              ? Container(width: 0.0, height: 0.0)
                              : BidItem(
                                  model:
                                      this.model!.model!.user_bids.items[index],
                                  info: this.model!.model!.user_bids);
                        },
                        // itemCount: this.model!.model!.user_bids.items.length <= 8
                        //     ? this.model!.model!.user_bids.items.length
                        //     : 8,
                        itemCount: this.model!.model!.user_bids.items.length,
                        // controller: controller1,
                      ),
                    )
                  ]),
      );
    }
  }

  Widget viewDesc(BuildContext context) {
    YoutubePlayerController? _controller;
    var document = parse(this
        .model!
        .model!
        .description!
        .replaceAll('<div>', '')
        .replaceAll('<\/div>', '')
        .replaceAll('<br>', ' ')
        .replaceAll('<p>', '')
        .replaceAll('<\/p>', '<br>'));
    var videoList = document.querySelectorAll("iframe");
    List<String?> id = [];
    for (dom.Element video in videoList) {
      // print('ini list video' + video!.attributes["src"]);

      // id.add(YoutubePlayer.convertUrlToId(video!.attributes["src"]));
      if (video!.attributes["src"]!.contains('youtube')) {
        if (video!.attributes["src"]!.contains('https')) {
          // print('ini list video id' + YoutubePlayer.convertUrlToId(video!.attributes["src"]));
          id.add(YoutubePlayer.convertUrlToId(video!.attributes["src"]!));
        } else {
          // print('ini list video id' + YoutubePlayer.convertUrlToId('https:' + video!.attributes["src"]));
          id.add(YoutubePlayer.convertUrlToId(
              'https:' + video!.attributes["src"]!));
        }
      }

      // print(video!.toString());
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

    ScrollController? controller;
    return
        //   Text('ahaaa');

        Column(
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
                            .model!
                            .model!
                            .description!
                            .replaceAll('<div>', '')
                            .replaceAll('<\/div>', '')
                            .replaceAll('<br>', ' ')
                            .replaceAll('<p>', '')
                            .replaceAll('<\/p>', '<br>'),
                        1000),
                    isSelectable: true,
                  ),
                ])),
            expanded: SingleChildScrollView(
                controller: controller,
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
                                .model!
                                .model!
                                .description!
                                .replaceAll('<div>', '')
                                .replaceAll('<\/div>', '')
                                .replaceAll('<br>', ' ')
                                .replaceAll('<p>', '')
                                .replaceAll('<\/p>', '<br>'),
                            isSelectable: true,
                            onTapUrl: (url) async {
                              if (url.contains('projects.co.id')) {
                                if (url.contains(RegExp(r'[0-9]'))) {
                                  if (url.contains('show_conversation')) {
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
        id.isEmpty ? Container() : Text('List Video:'),
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
              )
      ],
    );
  }

  Widget viewOwnerInfo(BuildContext context) {
    return ExpandablePanel(
      header: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
          child: Column(children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'About this owner',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ]),
          ])),
      collapsed: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
          child: Column(children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'This owner rating and ranking',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]),
          ])),
      expanded: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
        child: Container(
            height: 400.0,
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 300.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Icon(
                                      Icons.account_circle,
                                      size: 20.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 8.0, top: 5.0),
                                      child: Text('Username',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500))),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 55.0, right: 8.0, top: 5.0),
                                  child: Html(
                                      data: this.model!.model!.owner_user_name,
                                      style: {
                                        "html": Style(
                                            fontSize: FontSize.small,
                                            fontWeight: FontWeight.w400),
                                      })),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 300.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Icon(
                                      Icons.location_city,
                                      size: 20.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 8.0, top: 5.0),
                                      child: Text('Kabupaten',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500))),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 55.0, right: 8.0, top: 5.0),
                                  child: this
                                              .model!
                                              .model!
                                              .owner_kabupaten_str ==
                                          ''
                                      ? Html(data: 'Unavailable', style: {
                                          "html": Style(
                                              fontSize: FontSize.small,
                                              fontWeight: FontWeight.w400),
                                        })
                                      : Html(
                                          data: this
                                              .model!
                                              .model!
                                              .owner_kabupaten_str,
                                          style: {
                                              "html": Style(
                                                  fontSize: FontSize.small,
                                                  fontWeight: FontWeight.w400),
                                            })),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 300.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Icon(
                                      Icons.star,
                                      size: 20.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 8.0, top: 5.0),
                                      child: Text('Rating',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500))),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 55.0, right: 8.0, top: 5.0),
                                  child: RatingBarIndicator(
                                    rating: model!.model!.owner_owner_rating
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
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 300.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Icon(
                                      Icons.business,
                                      size: 20.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 8.0, top: 5.0),
                                      child: Text('Rating detail',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500))),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 55.0, right: 8.0, top: 5.0),
                                  child: model!.model!
                                              .owner_owner_rating_num_str ==
                                          ''
                                      ? Html(data: 'Unavailable', style: {
                                          "html": Style(
                                              fontSize: FontSize.small,
                                              fontWeight: FontWeight.w400),
                                        })
                                      : Html(
                                          data: model!.model!
                                              .owner_owner_rating_num_str,
                                          style: {
                                              "html": Style(
                                                  fontSize: FontSize.small,
                                                  fontWeight: FontWeight.w400),
                                            })),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 300.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Icon(
                                      Icons.favorite,
                                      size: 20.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 8.0, top: 5.0),
                                      child: Text('Point',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500))),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 55.0, right: 8.0, top: 5.0),
                                  child: model!.model!.owner_owner_point!
                                                  .toString() ==
                                              '' ||
                                          model!.model!.owner_owner_point! !=
                                              null
                                      ? Html(data: 'Unavailable', style: {
                                          "html": Style(
                                              fontSize: FontSize.small,
                                              fontWeight: FontWeight.w400),
                                        })
                                      : Html(
                                          data: model!.model!.owner_owner_point!
                                              .toString(),
                                          style: {
                                              "html": Style(
                                                  fontSize: FontSize.small,
                                                  fontWeight: FontWeight.w400),
                                            })),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 300.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Icon(
                                      Icons.people,
                                      size: 20.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 8.0, top: 5.0),
                                      child: Text('Ranking',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500))),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 55.0, right: 8.0, top: 5.0),
                                  child: model!
                                              .model!.owner_owner_ranking_str ==
                                          ''
                                      ? Html(data: 'Unavailable', style: {
                                          "html": Style(
                                              fontSize: FontSize.small,
                                              fontWeight: FontWeight.w400),
                                        })
                                      : Html(
                                          data: model!
                                              .model!.owner_owner_ranking_str,
                                          style: {
                                              "html": Style(
                                                  fontSize: FontSize.small,
                                                  fontWeight: FontWeight.w400),
                                            })),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
      //  tapHeaderToExpand: true,
      // hasIcon: true,
    );
  }

  Widget viewDeadline(BuildContext context) {
    if (model!.model!.select_deadline == null) {
      return (Container(
        height: 0,
        width: 0,
      ));
    } else {
      return Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
          child: Column(children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text(
                'Deadline pilih freelancer: ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              Text(toDay(model!.model!.select_deadline).toString() + ' hari',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
              //  DateFormat('dd/MM/yyyy HH:mm:ss').format(
              //  model!.model!.select_deadline)),
            ]),
          ]));
    }
  }

  Widget viewBudget(BuildContext context) {
    if (model!.model!.select_deadline == null) {
      return (Container(
        height: 0,
        width: 0,
      ));
    } else {
      return Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Column(children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text(
                'Budget: ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              Text(
                  '${this.model!.meta.title.contains('Service Order') ? this.model!.model!.published_budget_str : this.model!.model!.budget_range_str}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
              //  DateFormat('dd/MM/yyyy HH:mm:ss').format(
              //  model!.model!.select_deadline)),
            ]),
          ]));
    }
  }

  @override
  PreferredSizeWidget appBar(BuildContext context, String? idHash) {
    return (AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text('',
            style: TextStyle(
              color: Colors.white,
            )),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Share.share(
                      '${model!.meta.title} https://projects.co.id/public/browse_projects/view/${this.model!.model!.project_id}/project',
                      subject: '${model!.meta.title}');
                },
                child: Icon(
                  Icons.share,
                  size: 26.0,
                ),
              )),
          /*
              PopupMenuButton<int>(
                onSelected: (int?value) {

                  if(value == 1) {
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute('public/browse_projects/ask_owner/${this.model!.model!.project_id}/${this.model!.meta.title}'));
                  }

                  if(value == 2) {

                    if(idHash.isNotEmpty){
                      _chatBloc =   ChatBloc();
                      // if(widget.id == '')

                      _chatBloc.wsSetHandlers();
                      //_chatBloc.lgn(widget.id);
                      _chatBloc.lg(idHash!);
                      //$idHash/${encode(this.model!.model!.owner_id)}
                      String? thread = '';
                      if(decode(idHash!)>this.model!.model!.owner_id ){
                        thread = '${encode(this.model!.model!.owner_id)}/$idHash';
                      }else{
                        thread = '$idHash/${encode(this.model!.model!.owner_id)}';
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(
                              user: {

                                "thread":"$thread",
                                "username":"${this.model!.model!.owner_user_name}",
                                "userid":"${encode(this.model!.model!.owner_id)}",
                                "display":"${this.model!.model!.owner_str}",
                                "avatar":"${this.model!.model!.owner_photo_url}",
                                "lastmessage":""


                              },
                              userID : idHash,
                              chatBloc : _chatBloc,
                              trans : true,
                              ctx: context,
                            ),
                          )
                      );
                    }else{
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          '/login/1');
                    }



                }


                },
                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Ask owner'),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text('Chat owner'),
                  ),


                ],
              ),

               */
        ]));
  }

  Widget viewBanner(BuildContext context, String? idHash, ChatBloc cb) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Stack(children: [
        Container(
          height: 110,
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 20,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /*
                               TextButton(
                                 onPressed: () {

                                 },
                                 child:   Icon(
                                   Icons.arrow_forward,
                                   color: Colors.white,
                                   size: 20.0,
                                 ),
                                 style: ButtonStyle(

                                   backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
                                 ),

                               ),

                                */

                        GestureDetector(
                          onTap: () {
                            Share.share(
                                '${model!.meta.title} https://projects.co.id/public/browse_projects/view/${this.model!.model!.project_id}/project',
                                subject: '${model!.meta.title}');
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black12,
                            radius: 20,
                            child: Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(
                                    'public/browse_projects/ask_owner/${this.model!.model!.project_id}/${this.model!.meta.title}'));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black12,
                            radius: 20,
                            child: Icon(
                              Icons.question_answer,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (idHash!.isNotEmpty) {
                              //_chatBloc =   ChatBloc();
                              // if(widget.id == '')

                              // _chatBloc.wsSetHandlers();
                              //_chatBloc.lgn(widget.id);
                              // _chatBloc.lg(idHash!);
                              //$idHash/${encode(this.model!.model!.owner_id)}
                              String? thread = '';
                              if (decode(idHash!) >
                                  this.model!.model!.owner_id) {
                                thread =
                                    '${encode(this.model!.model!.owner_id)}/$idHash';
                              } else {
                                thread =
                                    '$idHash/${encode(this.model!.model!.owner_id)}';
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChatScreen(
                                      user: {
                                        "thread": "$thread",
                                        "username":
                                            "${this.model!.model!.owner_user_name}",
                                        "userid":
                                            "${encode(this.model!.model!.owner_id)}",
                                        "display":
                                            "${this.model!.model!.owner_str}",
                                        "avatar":
                                            "${this.model!.model!.owner_photo_url}",
                                        "lastmessage":
                                            "<b>Konteks Percakapan: ${model!.meta.title}</b>",
                                        "lastseen": (this
                                                    .model!
                                                    .model!
                                                    .owner_last_seen
                                                    .toLocal()
                                                    .millisecondsSinceEpoch /
                                                1000)
                                            .round(),
                                        "lasttime": (this
                                                    .model!
                                                    .model!
                                                    .owner_last_seen
                                                    .toLocal()
                                                    .millisecondsSinceEpoch /
                                                1000)
                                            .round()
                                      },
                                      userID: idHash,
                                      chatBloc: cb,
                                      trans: true,
                                      ctx: context,
                                    ),
                                  )).then((value) async {
                                // _chatBloc.dispose();
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('chatlink', true);
                              });
                            } else {
                              AppProvider.getRouter(context)!
                                  .navigateTo(context, '/login/1');
                            }
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black12,
                            radius: 20,
                            child: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }

  Widget viewHeader1(BuildContext context) {
    return (Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Html(
          // this.model!.meta.title ,
          data: model!.meta.title,
          style: {
            "html": Style(
              fontSize: FontSize(25.0),
              // fontWeight: FontWeight.w300
            ),
          }
          // useRichText: true, defaultTextStyle :  descriptionStyle.copyWith(  fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
          ),
    ));
  }

  Widget viewButton1(BuildContext context, bool account, State state,
      String? idHash, ChatBloc? cb) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    //this.model!.model!.price_str
    return this.model!.model!.project_status_id != 3
        ? Container()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 80,
                  child: Stack(
                    children: [
                      ButtonBarTheme(
                        data: ButtonBarThemeData(
                          alignment: MainAxisAlignment.center,
                          buttonMinWidth: 0.43 * width,
                        ),
                        child: ButtonBar(
                            alignment: MainAxisAlignment.center,
                            buttonMinWidth: 0.43 * width,
                            children: <Widget>[
                              RaisedButton(
                                  //  child: Text('Buy ' +   'Rp 100.000.000,-'),
                                  child: Row(
                                    children: [
                                      Icon(Icons.question_answer, size: 20),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Ask Owner'),
                                    ],
                                  ),
                                  textColor: Colors.white,
                                  splashColor: CurrentTheme.ShadeColor,
                                  color: Color(0xFF037f51),
                                  onPressed: () {
                                    if (account!) {
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(
                                              'public/browse_projects/ask_owner/${this.model!.model!.project_id}/${this.model!.meta.title}'));
                                    } else {
                                      AppProvider.getRouter(context)!
                                          .navigateTo(context, '/login/1');
                                    }
                                  }),
                              RaisedButton(
                                  child: Row(
                                    children: [
                                      Icon(Icons.chat_bubble, size: 18),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Chat With Owner '),
                                    ],
                                  ),
                                  textColor: Colors.white,
                                  splashColor: CurrentTheme.ShadeColor,
                                  color: Color(0xFF037f51),
                                  onPressed: () {
                                    if (account!) {
                                      // _chatBloc =   ChatBloc();
                                      // if(widget.id == '')

                                      // _chatBloc.wsSetHandlers();
                                      //_chatBloc.lgn(widget.id);
                                      // _chatBloc.lg(idHash!);
                                      //$idHash/${encode(this.model!.model!.owner_id)}

                                      if (cb != null) {
                                        String? thread = '';
                                        if (decode(idHash!) >
                                            this.model!.model!.owner_id) {
                                          thread =
                                              '${encode(this.model!.model!.owner_id)}/$idHash';
                                        } else {
                                          thread =
                                              '$idHash/${encode(this.model!.model!.owner_id)}';
                                        }
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ChatScreen(
                                                user: {
                                                  "thread": "$thread",
                                                  "username":
                                                      "${this.model!.model!.owner_user_name}",
                                                  "userid":
                                                      "${encode(this.model!.model!.owner_id)}",
                                                  "display":
                                                      "${this.model!.model!.owner_str}",
                                                  "avatar":
                                                      "${this.model!.model!.owner_photo_url}",
                                                  "lastmessage":
                                                      "<b>Konteks Percakapan: ${model!.meta.title}</b>",
                                                  "lastseen": (this
                                                              .model!
                                                              .model!
                                                              .owner_last_seen
                                                              .toLocal()
                                                              .millisecondsSinceEpoch /
                                                          1000)
                                                      .round(),
                                                  "lasttime": (this
                                                              .model!
                                                              .model!
                                                              .owner_last_seen
                                                              .toLocal()
                                                              .millisecondsSinceEpoch /
                                                          1000)
                                                      .round()
                                                },
                                                userID: idHash,
                                                chatBloc: cb,
                                                trans: false,
                                                ctx: context,
                                              ),
                                            )).then((value) async {
                                          //  _chatBloc.dispose();
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setBool('chatlink', true);
                                        });
                                      } else {
                                        var cb1 =
                                            AppProvider.getApplication(context)
                                                .chat;
                                        String? thread = '';
                                        if (decode(idHash!) >
                                            this.model!.model!.owner_id) {
                                          thread =
                                              '${encode(this.model!.model!.owner_id)}/$idHash';
                                        } else {
                                          thread =
                                              '$idHash/${encode(this.model!.model!.owner_id)}';
                                        }
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ChatScreen(
                                                user: {
                                                  "thread": "$thread",
                                                  "username":
                                                      "${this.model!.model!.owner_user_name}",
                                                  "userid":
                                                      "${encode(this.model!.model!.owner_id)}",
                                                  "display":
                                                      "${this.model!.model!.owner_str}",
                                                  "avatar":
                                                      "${this.model!.model!.owner_photo_url}",
                                                  "lastmessage":
                                                      "<b>Konteks Percakapan: ${model!.meta.title}</b>",
                                                  "lastseen": (this
                                                              .model!
                                                              .model!
                                                              .owner_last_seen
                                                              .toLocal()
                                                              .millisecondsSinceEpoch /
                                                          1000)
                                                      .round(),
                                                  "lasttime": (this
                                                              .model!
                                                              .model!
                                                              .owner_last_seen
                                                              .toLocal()
                                                              .millisecondsSinceEpoch /
                                                          1000)
                                                      .round()
                                                },
                                                userID: idHash,
                                                chatBloc: cb1,
                                                trans: false,
                                                ctx: context,
                                              ),
                                            )).then((value) async {
                                          //  _chatBloc.dispose();
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setBool('chatlink', true);
                                        });
                                      }
                                    } else {
                                      AppProvider.getRouter(context)!
                                          .navigateTo(context, '/login/1');
                                    }
                                  }),
                            ]),
                      ),
                    ],
                  )),
              SizedBox(
                height: 5,
              ),
            ],
          );
  }

  Widget viewOwner(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, bottom: 5, top: 20),
            child: Text(
              'Project Owner:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            )),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context, urlToRoute(this.model!.model!.owner_url));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 12),
                child: ShowAvatar(avatar: this.model!.model!.owner_photo_url),
                /*
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    this.model!.model!.owner_photo_url,
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
                    context, urlToRoute(this.model!.model!.owner_url));
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
                                '${filterShortcodes(this.model!.model!.owner_str)} ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),

                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: RatingBarIndicator(
                                    rating: this
                                                .model!
                                                .model!
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
                                          rating: this.model!.model!.seller_seller_rating.toDouble()/2-0.01,
                                          size: 18,
                                          color: CurrentTheme.PrimaryLightColor,
                                          starCount: 5,
                                          allowHalfRating: true,
                                        )

                                             */
                                ),
                                Text(
                                  '(${this.model!.model!.owner_owner_rating_num.toStringAsPrecision(2)}/10)',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ]),
                              Text(
                                  '${this.model!.model!.owner_projects_owned} project'),
                              this.model!.model!.owner_last_seen == null
                                  ? Container()
                                  : Text(
                                      'last seen ' +
                                          timeago.format(this
                                              .model!
                                              .model!
                                              .owner_last_seen),
                                      style: TextStyle(fontSize: 15)),
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
                                    rating: destination!.item.rating.toDouble(),
                                    size: 12,
                                    color: CurrentTheme.PrimaryLightColor,
                                    starCount: 5,
                                    allowHalfRating: true,
                                  )
                              ),

                            ]
                          )

                           */

                      //owner_owner_point!
                    ]),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /*
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.date_range_outlined, size: 50, color: CurrentTheme.PrimaryLightColor),
               // Text(DateFormat('dd/MM/yyyy').format(this.model!.model!.owner_date_registered)),
                Text('11/01/2021'),
                Text('Dummy sejak'),
              //  Text('Anggota sejak'),
              ],
            ),

             */
            this.model!.model!.owner_arbitration_rate == null
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(Icons.date_range_outlined, size: 50, color: CurrentTheme.PrimaryLightColor),
                      //    this.model!.model!.owner_arbitration_rate == null?
                      CircularPercentIndicator(
                        progressColor:
                            this.model!.model!.owner_arbitration_rate / 100 >
                                    0.5
                                ? Colors.blue
                                : this.model!.model!.owner_arbitration_rate /
                                            100 >
                                        0.25
                                    ? Colors.yellow
                                    : Colors.blue,
                        percent: this.model!.model!.owner_arbitration_rate <= 0
                            ? 0.0
                            : this.model!.model!.owner_arbitration_rate / 100,
                        animation: true,
                        radius: 50.0,
                        lineWidth: 6.0,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      /*
                    :
                CircularPercentIndicator(

                  progressColor:  Colors.blue,
                  percent: 0.0 ,
                  animation: true,
                  radius: 50.0,
                  lineWidth: 6.0,
                  circularStrokeCap: CircularStrokeCap.round,

                )

                     */

                      // this.model!.model!.owner_arbitration_rate == null?

                      Text(this.model!.model!.owner_arbitration_rate <= 0
                          ? '-'
                          : '${this.model!.model!.owner_arbitration_rate.toStringAsFixed(2)}%'),
                      //  : Text('-'),

                      // Text('100 %'),
                      Text('Arbitrase'),
                    ],
                  ),
            /*
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.date_range_outlined, size: 50, color: CurrentTheme.PrimaryLightColor),
                /*
                CircularPercentIndicator(

                  progressColor: this.model!.model!.owner_completion_rate / 100 > 0.5 ? Colors.blue: this.model!.model!.owner_completion_rate / 100 > 0.25? Colors.yellow : Colors.blue,
                  percent: this.model!.model!.owner_completion_rate < 0 ? 0.0 : this.model!.model!.owner_completion_rate / 100 ,
                  animation: true,
                  radius: 50.0,
                  lineWidth: 6.0,
                  circularStrokeCap: CircularStrokeCap.round,

                ),
                Text( this.model!.model!.seller_completion_rate < 0? '-' : '${this.model!.model!.owner_completion_rate.toStringAsFixed(2)}%'),
                */
                Text('Dummy %'),
                Text('Penyelesaian'),


              ],
            ),

             */
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget viewChannels1(BuildContext context, ChatBloc? cb) {
    if (this.model!.model!.channels_url != null) {
      return (ChannelRouteTagsWidget(
        value: this.model!.model!.channels_id,
        caption: '',
        hint: ' ',
        required: true,
        idroutetags: this.model!.model!.channels_id,
        nameroutetags: this.model!.model!.channels_str,
        urlroutetags: this.model!.model!.channels_url,
        getValue: (String? val) {
          // Navigator.pushReplacementNamed(context, "/projectscoid");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PublicBrowseProjectsListing(
                    id: val!.split('?')[1], cb: cb)),
          );
          // AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val));
        },
      ));
    } else {
      return (ChannelNonURLRouteWidget(
        value: this.model!.model!.channels_id,
        caption: '',
        hint: ' ',
        required: true,
        idroutetags: this.model!.model!.channels_id,
        nameroutetags: this.model!.model!.channels_str,
      ));
    }
  }

  Widget view1(BuildContext context, ScrollController controller, bool account,
      State state, String? idHash, ChatBloc? cb) {
    viewChildren.clear();

    // viewChildren.add(viewBanner(context, idHash));

    viewChildren.add(viewHeader1(context));

    viewChildren.add(viewDesc(context));

    viewChildren.add(Padding(
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: viewChannels1(context, cb)));
    viewChildren.add(SizedBox(
      height: 15,
    ));
    viewChildren.add(viewBudget(context));
    viewChildren.add(viewDeadline(context));
    viewChildren.add(viewInfo(context));

    viewChildren.add(viewAttachments(context));

    viewChildren.add(viewBidder(context));
    viewChildren.add(viewOwner(context));

    viewChildren.add(viewButton(context, account));
    viewChildren.add(viewButton1(context, account, state, idHash, cb));

    // viewChildren.add(viewHeader(context));

    /*

    //viewHeader
    viewChildren.add(viewHeader(context));
    viewChildren.add(viewInfo(context));

    viewChildren.add(viewAttachments(context));
    //button add   bid
    viewChildren.add(viewButton(context, account));
    //bid detail
    //list bid
    viewChildren.add(viewBidder(context));

    //description detail
    viewChildren.add(viewDesc(context));
   // viewChildren.add(viewDescription(context));
    viewChildren.add( Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 0.0),
                        child: viewChannels(context))
    );
    //Owner Info
  //  viewChildren.add(viewOwnerInfo(context));
    viewChildren.add(viewDeadline(context));

    */

    if (this.model!.meta.after_content != null) {
      viewChildren.add(Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
        child: Html(data: this.model!.meta.after_content),
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

class BidItemInfo extends StatelessWidget {
  final UserBidsListingTools? info;
  BidItemInfo({this.info});
  var _appbar = AppBar(
    backgroundColor: CurrentTheme.MainAccentColor,
    elevation: 0.0,
    title: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Text(
        'User Bids',
        style: TextStyle(
            fontFamily: "Gotik",
            fontSize: 20.0,
            color: Colors.black54,
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
        body: GridView.builder(
          shrinkWrap: true,
          itemCount: info!.items!.length,
          //  physics: AlwaysScrollableScrollPhysics(),
          //  padding: EdgeInsets.symmetric(horizontal: 19, vertical: 40),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            //   mainAxisSpacing: 8,
            //   crossAxisSpacing: 8,
            childAspectRatio:
                mediaQueryData.size.width / (mediaQueryData.size.height / 1.8),
          ),
          itemBuilder: (context, index) {
            return ItemInfo(model: info!.items![index]);
          },
        ));
  }
}

class ItemInfo extends StatelessWidget {
  final ItemUserBids? model;
  ItemInfo({this.model});
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ShowItemScreenshots(image: model!.worker_photo_url)),
                );
              },
              child: Container(
                height: 160,
                width: 145.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 150.0,
                      width: 115.0,
                      child: Stack(children: <Widget>[
                        Positioned.fill(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            // In order to have the ink splash appear above the image, you
                            // must use Ink.image. This allows the image to be painted as part
                            // of the Material and display ink effects above it. Using a
                            // standard Image will obscure the ink splash.
                            child: ShowWorkerWithRating(
                              username: model!.worker_user_name,
                              avatar: model!.worker_photo_url,
                              rating: model!.worker_worker_rating_num,
                              viewRating: model!.worker_worker_rating_num_str,
                              projects: '',
                            )),
                      ]),
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

class BidItem extends StatelessWidget {
  final ItemUserBidsRev? model;
  final UserBidsListingToolsRev? info;
  BidItem({this.model, this.info});
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
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(Env.value!.baseUrl! +
                        '/public/browse_users/view/' +
                        encode(model!.worker_user_id!) +
                        '/zzz'));
              },
              child: Container(
                height: 222.0,
                width: 165.0,
                padding: const EdgeInsets.fromLTRB(10.0, 3.0, 0.0, 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 217.0,
                      width: 155.0,
                      child: Stack(children: <Widget>[
                        Positioned.fill(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            // In order to have the ink splash appear above the image, you
                            // must use Ink.image. This allows the image to be painted as part
                            // of the Material and display ink effects above it. Using a
                            // stan
                            // dard Image will obscure the ink splash.
                            child: Container(
                              height: 215.0,
                              width: 155.0,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 18,
                                  ),
                                  SizedBox(
                                    height: 92.0,
                                    width: 115.0,
                                    child: Stack(children: <Widget>[
                                      Positioned.fill(
                                          bottom: 0.0,
                                          left: 20.0,
                                          right: 0.0,
                                          // In order to have the ink splash appear above the image, you
                                          // must use Ink.image. This allows the image to be painted as part
                                          // of the Material and display ink effects above it. Using a
                                          // standard Image will obscure the ink splash.
                                          child: ShowAvatar(
                                            avatar: model!.worker_photo_url,
                                            ishuge: false,
                                          )),
                                    ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0, right: 10.0, top: 5.0),
                                    child: //Html(data:readText(model!.user_name, 35),defaultTextStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500 ))
                                        Text(model!.worker_user_name!,
                                            softWrap: false,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, top: 5.0),
                                        child: RatingBarIndicator(
                                          rating:
                                              model!.worker_worker_rating_num! /
                                                      2 -
                                                  0.01,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color:
                                                CurrentTheme.PrimaryLightColor,
                                          ),
                                          itemCount: 5,
                                          itemSize: 11.0,
                                          unratedColor: Colors.black26,
                                          direction: Axis.horizontal,
                                        ),
                                      ),
                                      Text(
                                          '(${model!.worker_worker_rating_num_str})',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          )),
                                    ],
                                  ),
                                  /*

                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0, top: 5.0,right: 3.0),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.sort,
                                              size: 11.0,
                                            ),
                                            Text(
                                              ' ' + viewRating,
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

                                       */

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 2.0, right: 3.0),
                                    child: Text(
                                        '${model!.worker_projects_completed.toString()} Project Selesai',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 2.0, right: 3.0),
                                    child: model!.worker_projects_won! >= 1
                                        ? Text(
                                            '${((model!.worker_projects_completed! / model!.worker_projects_won!) * 100).toStringAsFixed(2)} % Penyelesaian',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                            ))
                                        : Container(),
                                  ),
                                ],
                              ),
                            )

                            /*
                                      ShowWorkerWithRating(username : model!.worker_user_name,
                                      avatar: model!.worker_photo_url,
                                      rating: model!.worker_worker_rating_num,
                                      viewRating: model!.worker_worker_rating_num_str,
                                      projects: '',
                                      )

                                     */
                            ),
                      ]),
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

class DescInfo extends StatelessWidget {
  final ViewModelBrowseProjectsRev? info;
  final String? title;
  ScrollController? controller;
  DescInfo({this.info, this.title});

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
                      this.info!.owner_photo_url!,
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
                      child: HtmlWidget(
                        this
                            .info!
                            .description!
                            .replaceAll('<div>', '')
                            .replaceAll('<\/div>', '')
                            .replaceAll('<br>', ' ')
                            .replaceAll('<p>', '')
                            .replaceAll('<\/p>', '<br>'),
                        onTapUrl: (url) async {
                          if (url.contains('projects.co.id')) {
                            if (url.contains(RegExp(r'[0-9]'))) {
                              if (url.contains('show_conversation')) {
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
                          throw 'Could not launch ';
                        },
                        onTapImage: (src) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowItemScreenshots(
                                  image: '${src.sources.first.url}')),
                        ),
                      )),
                ])));
  }
}

///////////////////////////////////////////////////

class BrowseProjectsListingModel extends BrowseProjectsListingBase {
  Map<String, dynamic> json;
  BrowseProjectsListingModel(Map<String, dynamic> this.json) : super(json);

/*
  @override
  Widget viewItemIndex(ItemBrowseProjectsModel item,String? search, int?index, bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemBrowseProjectsCard1(destination :item, search : search, shape : shape, height : height, index : index, account : account)
    );
  }


  @override
  Widget viewItem (ItemBrowseProjectsModel item,String? search, bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
      //  child:  ItemBrowseProjectsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemBrowseProjectsCard1(destination :item, search : search, shape : shape, height : height, account : account, idHash : '')
    );
  }
  
 */

  //@override
  Widget viewItemId1(ItemBrowseProjectsModel item, String? search, int? index,
      bool account, String? id, ChatBloc? cb) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemBrowseProjectsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child: ItemBrowseProjectsCard1(
            destination: item,
            search: search,
            shape: shape,
            index: index,
            height: height,
            account: account,
            idHash: id,
            cb: cb));
  }

  SpeedDialChild floatChild(BuildContext context) {
    return SpeedDialChild(
      child: Icon(Icons.search),
      backgroundColor: Colors.green,
      label: 'Search',
      labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SearchBrowseProjectsListing(id: '', title: '')),
        )
      },
    );
  }

  @override
  List<SpeedDialChild> listButton(BuildContext context, bool? account) {
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[];
    buttonChildren.add(floatChild(context));
    for (var i = 0; i < tools.buttons.length; i++) {
      buttonChildren.add(
          ListButtonBrowseProjectsWidget(tools.buttons[i], context, account));
    }

    return (buttonChildren);
  }
//@override

}

//class ItemBrowseProjects extends class ItemBrowseProjectsBase{
//
//}

class SearchBrowseProjectsListing extends StatefulWidget {
  //static const String? PATH = '/public/browse_projects/listing/:id';
  final String? id;
  final String? title;
  bool? account;
  ChatBloc? cb;
  SearchBrowseProjectsListing(
      {Key? key, this.id, this.title, this.account, this.cb})
      : super(key: key);
  @override
  SearchBrowseProjectsListingState createState() =>
      SearchBrowseProjectsListingState();
}

class SearchBrowseProjectsListingState
    extends State<SearchBrowseProjectsListing> with RestorationMixin {
  String? title = 'Browse Projects';
  bool _dialVisible = true;
  bool search = false;
  String? getPath =
      Env.value!.baseUrl! + '/public/browse_projects/listing?page=%d';
  ScrollController? scrollController;
  BrowseProjectsController? browse_projects;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  String? searchText = '';
  double? initscroll = 0.0;
  String? userid;

  void initState() {
    super.initState();
  }
  //SearchBrowseProjectsListingState() {
  // scrollController!.addListener(_onScroll);
  // }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'BrowseProjectsscr';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'BrowseProjectsscr');
  }

  @override
  Widget build(BuildContext context) {
    search = true;
    if (widget.id == '') {
      getPath = Env.value!.baseUrl! +
          '/public/browse_projects/listing?page=%d&' +
          'search=' +
          searchText!;
    } else {
      getPath = Env.value!.baseUrl! +
          '/public/browse_projects/listing/' +
          widget.id! +
          '?page=%d';
    }
    final prefs = SharedPreferences.getInstance();
    prefs.then((val) {
      initscroll = val.getDouble("position");
      if (initscroll != 0.0 || initscroll != null) {
        scrollController = ScrollController(
            initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false);
        scrollController!.addListener(_onScroll);
      } else {
        scrollController = ScrollController(
            initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false);
        scrollController!.addListener(_onScroll);
      }
    });

    accountController =
        AccountController(AppProvider.getApplication(context), AppAction.view);

    List listAccount = [];
    final future = accountController!.getAccount();
    future.then((val) {
      listAccount.addAll(val);
      if (listAccount.length == 0) {
        account = false;
      } else {
        account = true;
        userid = val.asMap()[0]['user_hash'];
      }
    });
    browse_projects = BrowseProjectsController(
        AppProvider.getApplication(context),
        getPath,
        AppAction.listing,
        '',
        '',
        '',
        search);
    browse_projects!.listing!.add(BrowseProjectsList());
    return WillPopScope(
        onWillPop: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setDouble("position", 0.0);
          if (search) {
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
          }
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setDouble("position", 0.0);
                    Navigator.pop(context);
                  }),
              // iconTheme: IconThemeData(
              //  color: Colors.white, //change your color here
              // ),
              title: widget.id == ''
                  ? TextField(
                      textInputAction: TextInputAction.search,
                      // textInputAction: TextInputAction.search ,
                      onTap: () {},
                      autofocus: true,
                      onSubmitted: (String? value) {
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
            body: buildListingBar()));
  }

  void _onChanged(String? value) {
    setState(() {
      searchText = value;
    });
  }

  void _onSubmited(String? value) {
    setState(() {
      searchText = value;
    });
  }

  Widget buildSearchBar(String? title) {
    return Container(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
          style: TextStyle(fontSize: 14.0, height: 0.2, color: Colors.black),
          onChanged: (String? value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,
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

  Widget buildListingBar() {
    return BlocBuilder<BrowseProjectsListing, BrowseProjectsState>(
      bloc: browse_projects!.listing,
      builder: (BuildContext context, BrowseProjectsState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseProjectsListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is BrowseProjectsListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is BrowseProjectsListingLoaded) {
          if (state.browse_projects!.items.items.isEmpty) {
            if (state.browse_projects!.tools.buttons.length == 0) {
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
                  floatingActionButton: state.browse_projects!
                      .Buttons(context, _dialVisible, account)
                  //floatingActionButton: isLoading? null :  state.browse_projects!.Buttons(context, _dialVisible, controller,browse_projects,  this, Env.value!.baseUrl!, '', title!)
                  );
            }
          }
          if (state.browse_projects!.tools.buttons.length == 0) {
            return Scaffold(
                body: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int? index) {
                  return index! >= state.browse_projects!.items.items.length
                      ? state.browse_projects!.tools.paging.total_pages ==
                              state.browse_projects!.tools.paging.current_page
                          ? Container(
                              height: 0.0,
                              width: 0.0,
                            )
                          : SearchBrowseProjectsBottomLoader()
                      : state.browse_projects!.viewItemId1(
                          state.browse_projects!.items.items[index],
                          searchText,
                          index,
                          account,
                          userid,
                          widget.cb);
                },
                itemCount: state.hasReachedMax!
                    ? state.browse_projects!.items.items.length
                    : state.browse_projects!.items.items.length + 1,
                controller: scrollController,
              ),
              onRefresh: _onRefresh,
            ));
          }
          return Scaffold(
              body: RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int? index) {
                    return index! >= state.browse_projects!.items.items.length
                        ? state.browse_projects!.tools.paging.total_pages ==
                                state.browse_projects!.tools.paging.current_page
                            ? Container(
                                height: 0.0,
                                width: 0.0,
                              )
                            : SearchBrowseProjectsBottomLoader()
                        // viewItemIndex(ItemBlogModel item,String? search, int?index, bool account)
                        : state.browse_projects!.viewItemId1(
                            state.browse_projects!.items.items[index],
                            searchText,
                            index,
                            account,
                            userid,
                            widget.cb);
                  },
                  itemCount: state.hasReachedMax!
                      ? state.browse_projects!.items.items.length
                      : state.browse_projects!.items.items.length + 1,
                  controller: scrollController,
                ),
                onRefresh: _onRefresh,
              ),
              floatingActionButton:
                  state.browse_projects!.Buttons(context, _dialVisible, account)
              //floatingActionButton: isLoading? null :  state.browse_projects!.Buttons(context, _dialVisible, controller,browse_projects,  this, Env.value!.baseUrl!, '', title, account)

              );
        }

        return Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ));
      },
    );
  }

  // @override
  /*
  Widget buildListingBar(){
    return BlocBuilder(
      cubit: browse_projects!.listing,
      builder: (BuildContext context, BrowseProjectsState state) {
        if (state is BrowseProjectsListingUninitialized) {
          return   Center(
              child:CircularProgressIndicator(
                valueColor:   AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
        if (state is BrowseProjectsListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is BrowseProjectsListingLoaded) {
          if (state.browse_projects!.items.items.isEmpty) {
            if (state.browse_projects!.tools.buttons.length == 0){
              return
                Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
                );
            }else{
              return
                Scaffold(
                    body:
                    Center(
                      child: Text('no ' + title!),
                    ),
                    floatingActionButton: state.browse_projects!.Buttons(context, _dialVisible, widget.account)
                  //floatingActionButton: isLoading? null :  state.browse_projects!.Buttons(context, _dialVisible, controller,browse_projects,  this, Env.value!.baseUrl!, '', title!)
                );
            }
          }
          if (state.browse_projects!.tools.buttons.length == 0){
            return
              Scaffold(
                  body:
                  RefreshIndicator(
                    child:   ListView.builder(
                      itemBuilder: (BuildContext context, int?index) {
                        return index! >= state.browse_projects!.items.items.length
                            ?  SearchBrowseProjectsBottomLoader()
                            : state.browse_projects!.viewItem (state.browse_projects!.items.items[index] , searchText, widget.account );
                      },
                      itemCount: .state.hasReachedMax!
                          ? state.browse_projects!.items.items.length
                          : state.browse_projects!.items.items.length + 1,
                      controller: scrollController,
                    ),
                    onRefresh: _onRefresh,
                  )
              );
          }
          return
            Scaffold(
              body:
              RefreshIndicator(
                child:   ListView.builder(
                  itemBuilder: (BuildContext context, int?index) {
                    return index! >= state.browse_projects!.items.items.length
                        ?  SearchBrowseProjectsBottomLoader()
                        : state.browse_projects!.viewItem (state.browse_projects!.items.items[index] , searchText, widget.account );
                  },
                  itemCount: .state.hasReachedMax!
                      ? state.browse_projects!.items.items.length
                      : state.browse_projects!.items.items.length + 1,
                  controller: scrollController,
                ),
                onRefresh: _onRefresh,
              ),
              floatingActionButton: state.browse_projects!.Buttons(context, _dialVisible, widget.account),
              //floatingActionButton: isLoading? null :  state.browse_projects!.Buttons(context, _dialVisible, controller,browse_projects,  this, Env.value!.baseUrl!, '', title!)
            );
        }
        return   Center(
            child:CircularProgressIndicator(
              valueColor:   AlwaysStoppedAnimation<Color>(
                  Colors.green),
            ));
      },
    );
  }

   */

  @override
  void dispose() {
    browse_projects!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = Completer<Null>();
    browse_projects!.listing!.add(BrowseProjectsListingRefresh());
    Timer timer = Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  void _onScroll() async {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    cs.value = currentScroll;
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("position", scrollController!.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
      browse_projects!.listing!.add(BrowseProjectsList());
    }
  }
}

class SearchBrowseProjectsBottomLoader extends StatelessWidget {
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

////////////////////////////

class ItemBrowseProjectsCard1 extends StatefulWidget {
  const ItemBrowseProjectsCard1(
      {Key? key,
      @required this.destination,
      this.search,
      this.shape,
      this.height,
      this.index,
      this.account,
      this.idHash,
      this.cb})
      : assert(destination != null),
        super(key: key);
  final double? height;
  final ItemBrowseProjectsModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;
  final String? idHash;
  final ChatBloc? cb;

  @override
  _ItemBrowseProjectsCard1State createState() =>
      _ItemBrowseProjectsCard1State();
}

class _ItemBrowseProjectsCard1State extends State<ItemBrowseProjectsCard1> {
  // const ItemBrowseProjectsCard1({ Key? key, @required this.destination, this.isBanner,this.bannerAd,  this.search, this.shape, this.height, this.index, this.account, this.idHash, this.cb})
  //    : assert(destination != null),
  //      super(key: key);
  // This height will allow for all the Card's content to fit comfortably within the card.
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
    // return (const Text('ocehhhhhhh'));

    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
          child: Column(children: [
            Card(
                elevation: 6.0,
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(4),
                ),
                //  shadowColor: CurrentTheme.ListColor,
                child:
                    //   [4,5,6].contains(index)? ItemBrowseProjectsContent3( destination: destination,  account : account, idHash: idHash, cb: cb):
                    //   [7,8,9].contains(index)? ItemBrowseProjectsContent4( destination: destination,  account : account, idHash: idHash, cb: cb):
                    _isBannerAdReady
                        ? ItemBrowseProjectsContent2(
                            index: widget.index,
                            isBanner: _isBannerAdReady,
                            bannerAd: _bannerAd,
                            destination: widget.destination,
                            account: widget.account,
                            idHash: widget.idHash,
                            cb: widget.cb)
                        : ItemBrowseProjectsContent2(
                            index: widget.index,
                            isBanner: _isBannerAdReady,
                            bannerAd: null,
                            destination: widget.destination,
                            account: widget.account,
                            idHash: widget.idHash,
                            cb: widget.cb)),
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
          ])

          /*
        Column(
          children: <Widget>[
            // const SectionTitle(title: ''),
           Container(
                      child: ItemBrowseProjectsContent2( destination: destination,  account : account, idHash: idHash) ,
            ),
          Container(
            // padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            alignment: Alignment.center,
            height: 10.0,
            decoration:   BoxDecoration(
              //color: Colors.lightBlue[100],
              color:CurrentTheme.ListColor,
            ),
           )
          ],
        )

         */
          ),
    );
  }
}

class ItemBrowseProjectsCard2 extends StatelessWidget {
  const ItemBrowseProjectsCard2(
      {Key? key,
      @required this.destination,
      this.search,
      this.shape,
      this.height,
      this.account})
      : assert(destination != null),
        super(key: key);
  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height;
  final ItemBrowseProjectsModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final bool? account;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
        child: Column(
          children: <Widget>[
            // const SectionTitle(title: ''),
            SizedBox(
              height: height,
              // child: Card(
              // This ensures that the Card's children are clipped correctly.
              //   clipBehavior: Clip.antiAlias,
              //   shape: shape,
              //  margin: EdgeInsets.all(0.0),
              child: ItemBrowseProjectsContent1(
                  destination: destination, account: account),
            ),
            // ),
            Container(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              alignment: Alignment.center,
              height: 10.0,
              decoration: BoxDecoration(
                //color: Colors.lightBlue[100],
                color: CurrentTheme.ListColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemBrowseProjectsContent1 extends StatelessWidget {
  const ItemBrowseProjectsContent1(
      {Key? key, @required this.destination, this.account})
      : assert(destination != null),
        super(key: key);

  final ItemBrowseProjectsModel? destination;
  final bool? account;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(
        color: CurrentTheme.NormalTextColor,
        fontSize: 15,
        fontWeight: FontWeight.w500);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    final List<Widget> children = <Widget>[
      // Photo and title.
      SizedBox(
        height: 35.0,
        child: Stack(
          children: <Widget>[
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
                  style: descriptionStyle,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // three line description
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          destination!.item.owner_photo_url,
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
                                      destination!.item.owner_user_name,
                                      style: descriptionStyle.copyWith(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0, top: 0.0),
                              child: RatingBarIndicator(
                                rating: destination!.item.owner_owner_rating
                                            .toDouble() /
                                        2 -
                                    0.01,
                                itemBuilder: (context, index) => Icon(
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
      // Photo and title.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          AppProvider.getRouter(context)!.navigateTo(
              context, urlToRoute(destination!.item.buttons[3].url));
        },
        child: SizedBox(
          height: 70.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  bottom: 2.0,
                  left: 16.0,
                  right: 16.0,
                  // In order to have the ink splash appear above the image, you
                  // must use Ink.image. This allows the image to be painted as part
                  // of the Material and display ink effects above it. Using a
                  // standard Image will obscure the ink splash.
                  child: Ink(
                      child: Html(
                    data: readText(destination!.item.title, 90),
                    style: {
                      "html": Style(
                          color: CurrentTheme.NormalTextColor,
                          fontSize: FontSize.medium,
                          fontWeight: FontWeight.w500),
                    },
                    // useRichText: true, defaultTextStyle : titleStyle
                  ))),
            ],
          ),
        ),
      ),
      // Description and share/explore buttons.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 2.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Row(
            children: <Widget>[
              // three line description
              //  Text(
              //    'Published . ',
              //   style: descriptionStyle.copyWith(color: Colors.black87, fontSize: 13),
              //  ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  timeago.format(destination!.item.published_date),
                  style: descriptionStyle.copyWith(
                      color: Colors.black54, fontSize: 13),
                ),
              ),
              Text(
                ' . ',
                style: descriptionStyle.copyWith(
                    color: Colors.black54, fontSize: 13),
              ),
              destination!.item.project_class_str == 'Open to Suggestions'
                  ? Text('Open to Suggestions',
                      style: descriptionStyle.copyWith(
                          color: Colors.black54, fontSize: 13))
                  : Text(
                      destination!.item.project_class_str == "Specific Range"
                          ? destination!.item.budget_range_str
                          : destination!.item.published_budget_str,
                      style: descriptionStyle.copyWith(
                          color: Colors.black54, fontSize: 13),
                    ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      PopupMenuButton<int>(
                        onSelected: (int? value) {
                          if (value == 1) {
                            if (account!) {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item.buttons[0].url));
                            } else {
                              AppProvider.getRouter(context)!
                                  .navigateTo(context, '/login/1');
                            }
                          }
                          if (value == 2) {
                            if (account!) {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item.buttons[1].url));
                            } else {
                              AppProvider.getRouter(context)!
                                  .navigateTo(context, '/login/1');
                            }
                          }
                          if (value == 3) {
                            if (account!) {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item.buttons[2].url));
                            } else {
                              AppProvider.getRouter(context)!
                                  .navigateTo(context, '/login/1');
                            }
                          }
                          if (value == 4) {
                            AppProvider.getRouter(context)!.navigateTo(context,
                                urlToRoute(destination!.item.buttons[3].url));
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          const PopupMenuItem<int>(
                            value: 1,
                            child: Text('Place   bid'),
                          ),
                          const PopupMenuItem<int>(
                            value: 2,
                            child: Text('Ask owner'),
                          ),
                          const PopupMenuItem<int>(
                            value: 3,
                            child: Text('Chat with owner'),
                          ),
                          const PopupMenuItem<int>(
                            value: 4,
                            child: Text('View'),
                          ),
                        ],
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

class ItemBrowseProjectsContent2 extends StatelessWidget {
  ItemBrowseProjectsContent2(
      {Key? key,
      this.index,
      this.isBanner,
      this.bannerAd,
      @required this.destination,
      this.account,
      this.idHash,
      this.cb})
      : assert(destination != null),
        super(key: key);

  final ItemBrowseProjectsModel? destination;
  final bool? account;
  final String? idHash;
  final int? index;
  final BannerAd? bannerAd;
  final bool? isBanner;
  ChatBloc? cb;

  int? getViewBackground(int? userid) {
    int? i = 0;
    if (userid! % 13 == 0) {
      i = 3;
    } else if (userid! % 12 == 0) {
      i = 4;
    } else if (userid! % 9 == 0) {
      i = 5;
    } else if (userid! % 14 == 0) {
      i = 6;
    } else if (userid! % 7 == 0) {
      i = 7;
    } else {
      i = 1;
    }
    return i;
  }

  Widget _buildCoverImage(Size screenSize, int? number) {
    List<String> image = [
      'assets/img/workerbg1.jpg',
      'assets/img/quote.jpg',
      'assets/img/workerbg3.jpg',
      'assets/img/workerbg7.jpg',
      'assets/img/facts.jpg',
      'assets/img/workerbg6.jpg',
      'assets/img/workerbg7.jpg',
    ];

    return Container(
      height: screenSize.height / 4.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: [0, 1, 2, 3, 4, 5, 6].contains(number)
              ? AssetImage(image[number!])
              : AssetImage(image[1]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String? readDate(DateTime? dt) {
    var now = DateTime.now();
    var format = DateFormat('dd MMMM yyyy');
    // var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(dt!);
    var time = '';
    var day = DateFormat('EE').format(dt!);

    time = '  $day, ${format.format(dt!)}';
    return time;
  }

  Widget viewHeader(BuildContext context, bool account, ChatBloc cb) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    // final rng =   Random();
    var owner_id_str =
        destination!.item.buttons[2].url.replaceAll(RegExp(r'[^0-9]'), '');
    int? owner_id = int.parse(owner_id_str) ?? 1;
    final itm =
        owner_id == null ? getViewBackground(1) : getViewBackground(owner_id);
    final mediaQueryData = MediaQuery.of(context);
    return (Stack(children: <Widget>[
      _buildCoverImage(mediaQueryData.size, itm),
      // _buildStatContainer1(context),
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(children: <Widget>[
                    Text(destination!.item.channels_str[0],
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Expanded(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            PopupMenuButton<int>(
                              padding: EdgeInsets.only(left: 10, right: 8),
                              icon: Icon(Icons.more_horiz, color: Colors.white),
                              // color: Colors.white,
                              onSelected: (int? value) {
                                if (value == 1) {
                                  if (account!) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(
                                            destination!.item.buttons[0].url));
                                  } else {
                                    AppProvider.getRouter(context)!
                                        .navigateTo(context, '/login/1');
                                  }
                                }
                                if (value == 2) {
                                  if (account!) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(
                                            destination!.item.buttons[1].url));
                                  } else {
                                    AppProvider.getRouter(context)!
                                        .navigateTo(context, '/login/1');
                                  }
                                }
                                if (value == 3) {
                                  if (account!) {
                                    var owner_id_str = destination!
                                        .item.buttons[2].url
                                        .replaceAll(RegExp(r'[^0-9]'), '');

                                    int? owner_id = int.parse(owner_id_str);
                                    // cb =   ChatBloc();

                                    // if(widget.id == '')

                                    //  cb!.wsSetHandlers();
                                    //_chatBloc.lgn(widget.id);
                                    // cb!.lg(idHash!);
                                    //$idHash/${encode(this.model!.model!.owner_id)}
                                    String? thread = '';
                                    if (decode(idHash!) > owner_id) {
                                      thread = '${encode(owner_id)}/$idHash';
                                    } else {
                                      thread = '$idHash/${encode(owner_id)}';
                                    }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ChatScreen(
                                            user: {
                                              "thread": "$thread",
                                              "username":
                                                  "${destination!.item.owner_user_name}",
                                              "userid": "${encode(owner_id)}",
                                              "display":
                                                  "${destination!.item.owner_user_name}",
                                              "avatar":
                                                  "${destination!.item.owner_photo_url}",
                                              "lastmessage":
                                                  "<b>Konteks Percakapan: ${destination!.item.title.replaceAll('&amp;', '&')}</b>",
                                            },
                                            userID: idHash,
                                            chatBloc: cb,
                                            trans: true,
                                            ctx: context,
                                          ),
                                        )).then((value) async {
                                      cb!.dispose();
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setBool('chatlink', true);
                                    });
                                  } else {
                                    AppProvider.getRouter(context)!
                                        .navigateTo(context, '/login/1');
                                  }
                                }
                                if (value == 4) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PublicBrowseProjectsView(
                                            id:
                                                '${urlToRoute(destination!.item.buttons[3].url).split('/')[4]}',
                                            title:
                                                '${urlToRoute(destination!.item.buttons[3].url).split('/')[5]}',
                                            cb: cb)),
                                  );
                                  /*
                                              AppProvider.getRouter(context)!.navigateTo(
                                                  context,
                                                  urlToRoute(destination!.item.buttons[3].url ));

                                               */
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuItem<int>>[
                                const PopupMenuItem<int>(
                                  value: 1,
                                  child: Text('Place   bid'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 2,
                                  child: Text('Ask owner'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 3,
                                  child: Text('Chat with owner'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 4,
                                  child: Text('View'),
                                ),
                              ],
                            ),
                          ]),
                      //settingsRow,
                    ),
                  ]),
                ),
              ]),
        ),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(height: mediaQueryData.size.height / 18),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PublicBrowseProjectsView(
                      id:
                          '${urlToRoute(destination!.item.buttons[3].url).split('/')[4]}',
                      title:
                          '${urlToRoute(destination!.item.buttons[3].url).split('/')[5]}',
                      cb: cb)),
            );
            /*
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(destination!.item.buttons[3].url ));

                         */
          },
          child: HtmlWidget(
            readText(destination!.item.title, 120),
            //bodyPadding: EdgeInsets.only(left:15, right: 8, bottom: 5, top: 1),
            textStyle: TextStyle(fontSize: 20, color: Colors.white),
            onTapUrl: (url) async {
              if (url.contains('projects.co.id')) {
                if (url.contains(RegExp(r'[0-9]'))) {
                  if (url.contains('show_conversation')) {
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
                  AppProvider.getRouter(context)!
                      .navigateTo(context, urlToRoute(url + '/'));
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
          ),
          /*
                                Html(data: readText(destination!.item.title , 150) ,
                                    style: {
                                      "html": Style(
                                          fontSize: FontSize.xLarge,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                      ),
                                    }
                                  // useRichText: true, defaultTextStyle : titleStyle
                                )

                                     */
        ),
      ]),

      Column(children: <Widget>[
        Container(height: mediaQueryData.size.height / 6.0),
        Row(children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Text(
            readDate(destination!.item.published_date!)!,
            style: descriptionStyle.copyWith(fontSize: 13, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                destination!.item.owner_photo_url,
                fit: BoxFit.cover,
                height: 30.0,
                width: 32.0,
              ),
            ),
          ),
        ]),
      ]),
    ]));
  }

  static String? _capitalize(String? name) {
    assert(name != null && name!.isNotEmpty);

    return name!.substring(0, 1).toUpperCase() + name!.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    // ChatBloc _chatBloc;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    // var owner_id_str1 = destination!.item.buttons[2].url.replaceAll(  RegExp(r'[^0-9]'),'');
    var owner_id_str1 = destination!.item.buttons[2].url.split('/')[4];
    // _loadRewardedAd();
    // print('owner str $owner_id_str1');
    // int?owner_id1 = int.parse(owner_id_str1);
    var ownerID = owner_id_str1; //encode(owner_id1);
    final List<Widget> children = <Widget>[
      //viewHeader(context, account, _chatBloc),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print('ini owner $ownerID');
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    //urlToRoute(Env.value!.baseUrl! + '/public/browse_users/view/' + ownerID +'/zzz'));
                    urlToRoute(destination!.item.owner_url));
              },
              child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 12),
                  child: Container(
                    width: 60,
                    height: 63,
                    decoration: ShapeDecoration(
                      shadows: [
                        BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0)),
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        side: BorderSide(width: 3, color: Colors.white),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(destination!.item.owner_photo_url),
                        fit: BoxFit.contain,
                      ),
                    ),
                  )

                  /*
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        destination!.item.owner_photo_url,
                        fit: BoxFit.cover,
                        height: 63.0,
                        width: 60.0,
                      ),
                    ),

                         */

                  ),
            ),
            GestureDetector(
              onTap: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    // urlToRoute(Env.value!.baseUrl! + '/public/browse_users/view/' + ownerID +'/zzz'));
                    urlToRoute(destination!.item.owner_url));
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
                                destination!.item.owner_user_name,
                                style: descriptionStyle.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w800),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 2.0),
                        child:
                            //  owner_projects_owned

                            Row(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 2.0),
                            child: RatingBarIndicator(
                              rating: destination!.item.owner_owner_rating
                                          .toDouble() /
                                      2 -
                                  0.01,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: CurrentTheme.PrimaryLightColor,
                              ),
                              itemCount: 5,
                              itemSize: 12.0,
                              unratedColor: Colors.black26,
                              direction: Axis.horizontal,
                            ),
                          ),
                          Text(
                            '(${destination!.item.owner_projects_owned.toString()})',
                            style: descriptionStyle.copyWith(fontSize: 13),
                          ),
                        ]),

                        /*
                                SmoothStarRating(
                                  rating: destination!.item.owner_owner_rating.toDouble()/2-0.01,
                                  size: 12,
                                  color: CurrentTheme.PrimaryLightColor,
                                  starCount: 5,
                                  allowHalfRating: true,
                                )

                               */
                      ),

                      //owner_owner_point!

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${destination!.item.owner_owner_point!.toString()} Points',
                                style: descriptionStyle.copyWith(
                                    fontSize: 11, fontWeight: FontWeight.w400),
                              ),
                            ]),
                      ),
                    ]),
              ),
            ),
          ],
        ),
        Expanded(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            GestureDetector(
              onTap: () {
                if (account!) {
                  AppProvider.getRouter(context)!.navigateTo(
                      context, urlToRoute(destination!.item.buttons[1].url));
                } else {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, '/login/1');
                }
              },
              child: Container(
                height: 60.0,
                width: 44.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Icon(
                        Icons.perm_identity,
                        size: 20.0,
                        color: Colors.black38,
                      ),
                    ),
                    Text('Ask',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                if (account!) {
                  //  var owner_id_str = destination!.item.buttons[2].url.replaceAll(  RegExp(r'[^0-9]'),'');
                  // destination!.item.buttons[2].url.split('/')[4]

                  int? owner_id =
                      decode(destination!.item.buttons[2].url.split('/')[4]);
                  //  print('owner id yang hilang $owner_id_str');
                  // cb =   ChatBloc();

                  // if(widget.id == '')

                  // cb!.wsSetHandlers();
                  //cb!.lgn(widget.id);
                  //cb!.lg(idHash!);
                  //$idHash/${encode(this.model!.model!.owner_id)}
                  String? thread = '';
                  if (decode(idHash!) > owner_id) {
                    thread = '${encode(owner_id)}/$idHash';
                  } else {
                    thread = '$idHash/${encode(owner_id)}';
                  }

                  if (cb != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            user: {
                              "thread": "$thread",
                              "username":
                                  "${destination!.item.owner_user_name}",
                              "userid": "${encode(owner_id)}",
                              "display": "${destination!.item.owner_user_name}",
                              "avatar": "${destination!.item.owner_photo_url}",
                              "lastmessage":
                                  "<b>Konteks Percakapan: ${destination!.item.title.replaceAll('&amp;', '&')}</b>",
                              "lasttime": 1234567890
                            },
                            userID: idHash,
                            chatBloc: cb,
                            trans: true,
                            ctx: context,
                          ),
                        )).then((value) async {
                      cb!.dispose();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('chatlink', true);
                    });
                  } else {
                    var cb1 = AppProvider.getApplication(context).chat;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            user: {
                              "thread": "$thread",
                              "username":
                                  "${destination!.item.owner_user_name}",
                              "userid": "${encode(owner_id)}",
                              "display": "${destination!.item.owner_user_name}",
                              "avatar": "${destination!.item.owner_photo_url}",
                              "lastmessage":
                                  "<b>Konteks Percakapan: ${destination!.item.title.replaceAll('&amp;', '&')}</b>",
                              "lasttime": 1234567890
                            },
                            userID: idHash,
                            chatBloc: cb1,
                            trans: true,
                            ctx: context,
                          ),
                        )).then((value) async {
                      cb!.dispose();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('chatlink', true);
                    });
                  }
                } else {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, '/login/1');
                }
              },
              child: Container(
                height: 60.0,
                width: 44.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Icon(
                        Icons.chat_bubble_outline,
                        size: 20.0,
                        color: Colors.black38,
                      ),
                    ),
                    Text('Chat',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
            ),
            // if(_isRewardedAdReady)
            GestureDetector(
              onTap: () {
                if (account!) {
                  AppProvider.getRouter(context)!.navigateTo(
                      context, urlToRoute(destination!.item.buttons[0].url));
                  //  _rewardedAd?.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
                  // Reward the user for watching an ad.
                  //  });
                } else {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, '/login/1');
                  //  _rewardedAd?.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
                  // Reward the user for watching an ad.
                  // });
                }
              },
              child: Container(
                height: 60.0,
                width: 58.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Icon(
                        Icons.send,
                        size: 19.0,
                        color: Colors.green,
                      ),
                    ),
                    Text('Bid',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.green,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ]),
      Container(
        height: 0.3,
        color: Colors.grey,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PublicBrowseProjectsView(
                    id:
                        '${urlToRoute(destination!.item.buttons[2].url).split('/')[4]}',
                    title:
                        '${urlToRoute(destination!.item.buttons[2].url).split('/')[5]}',
                    cb: cb)),
          );
          /*
                      AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute(destination!.item.buttons[3].url ));

                   */
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 8.0),
          child:
              /*
                         Html(data: readText(destination!.item.title, 45),
                             style: {
                               "html": Style(
                                   alignment: Alignment.bottomLeft,
                                   textAlign: TextAlign.left,
                                   fontSize: FontSize(13),
                                   fontWeight: FontWeight.w600
                               ),
                             })

                          */
              Text(destination!.item.title.replaceAll('&amp;', '&'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        ),
      ),
      Container(
        // height:  120.0,
        padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 8.0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PublicBrowseProjectsView(
                        id:
                            '${urlToRoute(destination!.item.buttons[2].url).split('/')[4]}',
                        title:
                            '${urlToRoute(destination!.item.buttons[2].url).split('/')[5]}',
                        cb: cb)),
              );
              /*
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item.buttons[3].url ));

               */
            },
            child: Ink(
              // child: Html(data: destination!.item.short_description ,useRichText: true, defaultTextStyle : descriptionStyle.copyWith(color: Colors.black87,fontSize: 12 ), backgroundColor: CurrentTheme.BackgroundColor, )
              child: HtmlWidget(
                readText(
                    destination!.item.short_description!
                        .replaceAll('<div>', '')
                        .replaceAll('<\/div>', '')
                        .replaceAll('<br>', ' ')
                        .replaceAll('<p>', '')
                        .replaceAll('<\/p>', '<br>'),
                    250),
                //bodyPadding: EdgeInsets.only(left:0.0,  bottom: 12, top: 1),
                textStyle: TextStyle(fontSize: 12),
                onTapUrl: (url) async {
                  if (url.contains('projects.co.id')) {
                    if (url.contains(RegExp(r'[0-9]'))) {
                      if (url.contains('show_conversation')) {
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
                      AppProvider.getRouter(context)!
                          .navigateTo(context, urlToRoute(url + '/'));
                    }
                  } else {
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }

                  throw 'Could not launch';
                },
              ),
              /*
                Html(data: readText(destination!.item.short_description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),400) ,
                    //useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 )
                    style: {
                      "html": Style(
                        fontSize: FontSize.small,
                      ),
                    }
                )

                 */
            )),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 5, left: 8),
        child: destination!.item.channels_str.length >= 2
            ? Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0.0, right: 6),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PublicBrowseProjectsListing(
                                          id: destination!.item.channels_url[0]
                                              .split('?')[1],
                                          cb: cb)),
                            );
                          },
                          child: Badge(
                            toAnimate: false,
                            shape: BadgeShape.square,
                            badgeColor: Colors.black12,
                            borderRadius: BorderRadius.circular(8),
                            badgeContent: Text(
                                _capitalize(destination!.item.channels_str[0])!,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ),
                          /*
                            Chip(
                              key: ValueKey<String>(destination!.item.channels_str[0]),
                                padding: const EdgeInsets.only(top : 0,bottom : 0),
                              shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                              backgroundColor: Colors.white70,
                              label: Text(_capitalize(destination!.item.channels_str[0]), style:TextStyle(
                                  fontSize: 11,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300) ),
                            ),
                            */

                          /*
                            Text(destination!.item.channels_str[0], style: TextStyle(
                                fontSize: 11,
                                color: Colors.black54,
                                fontWeight: FontWeight.w300))

                             */
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PublicBrowseProjectsListing(
                                          id: destination!.item.channels_url[1]
                                              .split('?')[1],
                                          cb: cb)),
                            );
                          },
                          child: Badge(
                            toAnimate: false,
                            shape: BadgeShape.square,
                            badgeColor: Colors.black12,
                            borderRadius: BorderRadius.circular(8),
                            badgeContent: Text(
                                _capitalize(destination!.item.channels_str[1])!,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])
            : destination!.item.channels_str.length == 1
                ? Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 0.0, right: 6),
                            child:
                                // destination!.item.channels_str[0]
                                // destination!.item.channels_strText(),
                                GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PublicBrowseProjectsListing(
                                              id: destination!
                                                  .item.channels_url[0]
                                                  .split('?')[1],
                                              cb: cb)),
                                );
                              },
                              child: Badge(
                                toAnimate: false,
                                shape: BadgeShape.square,
                                badgeColor: Colors.black12,
                                borderRadius: BorderRadius.circular(8),
                                badgeContent: Text(
                                    _capitalize(
                                        destination!.item.channels_str[0])!,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])
                : Container(),
      ),

      Container(
        height: 0.3,
        color: Colors.white,
      ),

      //  if(index! % 10 == 0 )

      Padding(
        padding: const EdgeInsets.only(bottom: 15.0, top: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(
                          Icons.money_sharp,
                          size: 20.0,
                          color: Colors.black87,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 3.0, right: 10, bottom: 6),
                        child: destination!.item.project_class_str ==
                            'Open to Suggestions'
                            ? Text('Open to Suggestions',
                            style: descriptionStyle.copyWith(
                                fontSize: 11))
                            : Text(
                          destination!.item.project_class_str ==
                              "Specific Range"
                              ? destination!
                              .item.published_budget_str ??
                              '-'
                              : destination!
                              .item.published_budget_str,
                          style: descriptionStyle.copyWith(
                              fontSize: 12),
                        ),
                      )
                      /*
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Text('Budget',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w300)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 3.0, right: 10, bottom: 6),
                              child: destination!.item.project_class_str ==
                                      'Open to Suggestions'
                                  ? Text('Open to Suggestions',
                                      style: descriptionStyle.copyWith(
                                          fontSize: 11))
                                  : Text(
                                      destination!.item.project_class_str ==
                                              "Specific Range"
                                          ? destination!
                                                  .item.published_budget_str ??
                                              '-'
                                          : destination!
                                              .item.published_budget_str,
                                      style: descriptionStyle.copyWith(
                                          fontSize: 11),
                                    ),
                            )
                          ]),

                       */
                    ],
                  ),
                ),
              ),
              /*
              Container(
                width: 0.3,
                height: 52,
                color: Colors.grey,
              ),

               */
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Icon(
                        Icons.av_timer,
                        size: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 3.0, right: 10, bottom: 6),
                        child: Text(
                             destination!.item.finish_days > 1 ?
                            '${destination!.item.finish_days.toString()} days'
                            :
                             '${destination!.item.finish_days.toString()} day' ,
                            style:
                            descriptionStyle.copyWith(fontSize: 12))),
                    /*
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: Text('Deadline',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300)),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 3.0, right: 10, bottom: 6),
                              child: Text(
                                  '${destination!.item.finish_days.toString()} days',
                                  style:
                                      descriptionStyle.copyWith(fontSize: 11)))
                        ]),

                     */
                  ],
                ),
              ),
              /*
              Container(
                width: 0.3,
                height: 52,
                color: Colors.grey,
              ),

               */

              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(
                          Icons.people_outline,
                          size: 20.0,
                          color: Colors.black87,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: 3.0, right: 10, bottom: 6),
                          child: Text(
                               destination!.item.bid_count > 1?
                              '${destination!.item.bid_count.toString()} bids'
                              :
                               '${destination!.item.bid_count.toString()} bid'
                              ,
                              style: descriptionStyle.copyWith(
                                  fontSize: 12)))
                      /*
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Text('Bids',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w300)),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 3.0, right: 10, bottom: 6),
                                child: Text(
                                    '${destination!.item.bid_count.toString()} freelancer',
                                    style: descriptionStyle.copyWith(
                                        fontSize: 11)))
                          ]),

                       */
                    ],
                  ),
                ),
              ),
            ]),
      ),
    ];
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class ItemBrowseProjectsContent3 extends StatelessWidget {
  ItemBrowseProjectsContent3(
      {Key? key,
      @required this.destination,
      this.account,
      this.idHash,
      this.cb})
      : assert(destination != null),
        super(key: key);

  final ItemBrowseProjectsModel? destination;
  final bool? account;
  final String? idHash;
  ChatBloc? cb;
  int? getViewBackground(int? userid) {
    int? i = 0;
    if (userid! % 13 == 0) {
      i = 3;
    } else if (userid! % 12 == 0) {
      i = 4;
    } else if (userid! % 9 == 0) {
      i = 5;
    } else if (userid! % 14 == 0) {
      i = 6;
    } else if (userid! % 7 == 0) {
      i = 7;
    } else {
      i = 1;
    }
    return i;
  }

  Widget _buildCoverImage(Size screenSize, int? number) {
    List<String?>? image = [
      'assets/img/workerbg1.jpg',
      'assets/img/quote.jpg',
      'assets/img/workerbg3.jpg',
      'assets/img/workerbg7.jpg',
      'assets/img/facts.jpg',
      'assets/img/workerbg6.jpg',
      'assets/img/workerbg7.jpg',
    ];

    return Container(
      height: screenSize.height / 4.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: [0, 1, 2, 3, 4, 5, 6].contains(number)
              ? AssetImage(image[number!]!)
              : AssetImage(image![1]!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String? readDate(DateTime dt) {
    var now = DateTime.now();
    var format = DateFormat('dd MMMM yyyy');
    // var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(dt);
    var time = '';
    var day = DateFormat('EE').format(dt);

    time = '  $day, ${format.format(dt)}';
    return time;
  }

  Widget viewHeader(BuildContext context, bool? account, ChatBloc? cb) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    // final rng =   Random();
    var owner_id_str =
        destination!.item.buttons[2].url.replaceAll(RegExp(r'[^0-9]'), '');
    int? owner_id = int.parse(owner_id_str) ?? 1;
    final itm =
        owner_id == null ? getViewBackground(1) : getViewBackground(owner_id);
    final mediaQueryData = MediaQuery.of(context);
    return (Stack(children: <Widget>[
      _buildCoverImage(mediaQueryData.size, itm),
      // _buildStatContainer1(context),
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(children: <Widget>[
                    Text(destination!.item.channels_str[0],
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Expanded(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            PopupMenuButton<int>(
                              padding: EdgeInsets.only(left: 10, right: 8),
                              icon: Icon(Icons.more_horiz, color: Colors.white),
                              // color: Colors.white,
                              onSelected: (int? value) {
                                if (value == 1) {
                                  if (account!) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(
                                            destination!.item.buttons[0].url));
                                  } else {
                                    AppProvider.getRouter(context)!
                                        .navigateTo(context, '/login/1');
                                  }
                                }
                                if (value == 2) {
                                  if (account!) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(
                                            destination!.item.buttons[1].url));
                                  } else {
                                    AppProvider.getRouter(context)!
                                        .navigateTo(context, '/login/1');
                                  }
                                }
                                if (value == 3) {
                                  if (account!) {
                                    var owner_id_str = destination!
                                        .item.buttons[2].url
                                        .replaceAll(RegExp(r'[^0-9]'), '');

                                    int? owner_id = int.parse(owner_id_str);
                                    // cb =   ChatBloc();

                                    // if(widget.id == '')

                                    // cb!.wsSetHandlers();
                                    //cb!.lgn(widget.id);
                                    // cb!.lg(idHash!);
                                    //$idHash/${encode(this.model!.model!.owner_id)}
                                    String? thread = '';
                                    if (decode(idHash!) > owner_id) {
                                      thread = '${encode(owner_id)}/$idHash';
                                    } else {
                                      thread = '$idHash/${encode(owner_id)}';
                                    }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ChatScreen(
                                            user: {
                                              "thread": "$thread",
                                              "username":
                                                  "${destination!.item.owner_user_name}",
                                              "userid": "${encode(owner_id)}",
                                              "display":
                                                  "${destination!.item.owner_user_name}",
                                              "avatar":
                                                  "${destination!.item.owner_photo_url}",
                                              "lastmessage":
                                                  "<b>Konteks Percakapan: ${destination!.item.title.replaceAll('&amp;', '&')}</b>",
                                            },
                                            userID: idHash,
                                            chatBloc: cb,
                                            trans: true,
                                            ctx: context,
                                          ),
                                        )).then((value) async {
                                      cb!.dispose();
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setBool('chatlink', true);
                                    });
                                  } else {
                                    AppProvider.getRouter(context)!
                                        .navigateTo(context, '/login/1');
                                  }
                                }
                                if (value == 4) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PublicBrowseProjectsView(
                                            id:
                                                '${urlToRoute(destination!.item.buttons[3].url).split('/')[4]}',
                                            title:
                                                '${urlToRoute(destination!.item.buttons[3].url).split('/')[5]}',
                                            cb: cb)),
                                  );
                                  /*
                                              AppProvider.getRouter(context)!.navigateTo(
                                                  context,
                                                  urlToRoute(destination!.item.buttons[3].url ));

                                               */
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuItem<int>>[
                                const PopupMenuItem<int>(
                                  value: 1,
                                  child: Text('Place   bid'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 2,
                                  child: Text('Ask owner'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 3,
                                  child: Text('Chat with owner'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 4,
                                  child: Text('View'),
                                ),
                              ],
                            ),
                          ]),
                      //settingsRow,
                    ),
                  ]),
                ),
              ]),
        ),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(height: mediaQueryData.size.height / 18),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PublicBrowseProjectsView(
                      id:
                          '${urlToRoute(destination!.item.buttons[3].url).split('/')[4]}',
                      title:
                          '${urlToRoute(destination!.item.buttons[3].url).split('/')[5]}',
                      cb: cb)),
            );
            /*
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(destination!.item.buttons[3].url ));

                         */
          },
          child: HtmlWidget(
            readText(destination!.item.title, 120),
            //bodyPadding: EdgeInsets.only(left:15, right: 8, bottom: 5, top: 1),
            textStyle: TextStyle(fontSize: 20, color: Colors.white),
            onTapUrl: (url) async {
              if (url.contains('projects.co.id')) {
                if (url.contains(RegExp(r'[0-9]'))) {
                  if (url.contains('show_conversation')) {
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
                  AppProvider.getRouter(context)!
                      .navigateTo(context, urlToRoute(url + '/'));
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
          ),
          /*
                                Html(data: readText(destination!.item.title , 150) ,
                                    style: {
                                      "html": Style(
                                          fontSize: FontSize.xLarge,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                      ),
                                    }
                                  // useRichText: true, defaultTextStyle : titleStyle
                                )

                                     */
        ),
      ]),

      Column(children: <Widget>[
        Container(height: mediaQueryData.size.height / 6.0),
        Row(children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Text(
            readDate(destination!.item.published_date)!,
            style: descriptionStyle.copyWith(fontSize: 13, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                destination!.item.owner_photo_url,
                fit: BoxFit.cover,
                height: 30.0,
                width: 32.0,
              ),
            ),
          ),
        ]),
      ]),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    //ChatBloc _chatBloc;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    final List<Widget> children = <Widget>[
      /*
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  destination!.item.owner_photo_url,
                  fit: BoxFit.cover,
                  height: 22.0,
                  width: 22.0,
                ),
              ),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              destination!.item.owner_user_name,
                              style: descriptionStyle.copyWith(fontSize: 12 ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                        padding:
                        EdgeInsets.only(left: 12.0, top: 0.0),
                        child:  SmoothStarRating(
                          rating: destination!.item.owner_owner_rating.toDouble(),
                          size: 12,
                          color: CurrentTheme.PrimaryLightColor,
                          starCount: 5,
                          allowHalfRating: true,
                        )
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
      // Photo and title.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
              ),
            ],
          ),
        ),
      ),
      Container(
        // height:  120.0,
        padding:  const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
        child:
        GestureDetector(
            onTap: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item.buttons[3].url ));
            },
            child:
            Ink(
                child: Html(data: readText(destination!.item.title , 150) ,
                    style: {
                      "html": Style(
                          fontSize: FontSize.medium,
                          fontWeight: FontWeight.w500
                      ),
                    }
                  // useRichText: true, defaultTextStyle : titleStyle
                )
            )
        ),
      ),


       */
      viewHeader(context, account, cb),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 0.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            destination!.item.owner_user_name,
                            style: descriptionStyle.copyWith(fontSize: 13),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 0.0),
                    child: RatingBarIndicator(
                      rating:
                          destination!.item.owner_owner_rating.toDouble() / 2 -
                              0.01,
                      itemBuilder: (context, index) => Icon(
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
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15, top: 10),
          child: destination!.item.project_class_str == 'Open to Suggestions'
              ? Text('Open to Suggestions',
                  style: descriptionStyle.copyWith(fontSize: 13))
              : Text(
                  destination!.item.project_class_str == "Specific Range"
                      ? destination!.item.budget_range_str ?? '-'
                      : destination!.item.published_budget_str,
                  style: descriptionStyle.copyWith(fontSize: 13),
                ),
        ),
        SizedBox(height: 10),
      ]),

      Container(
        // height:  120.0,
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 16.0, 0.0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PublicBrowseProjectsView(
                        id:
                            '${urlToRoute(destination!.item.buttons[3].url).split('/')[4]}',
                        title:
                            '${urlToRoute(destination!.item.buttons[3].url).split('/')[5]}',
                        cb: cb)),
              );
              /*
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item.buttons[3].url ));

               */
            },
            child: Ink(
              // child: Html(data: destination!.item.short_description ,useRichText: true, defaultTextStyle : descriptionStyle.copyWith(color: Colors.black87,fontSize: 12 ), backgroundColor: CurrentTheme.BackgroundColor, )
              child: HtmlWidget(
                readText(
                    destination!.item.short_description!
                        .replaceAll('<div>', '')
                        .replaceAll('<\/div>', '')
                        .replaceAll('<br>', ' ')
                        .replaceAll('<p>', '')
                        .replaceAll('<\/p>', '<br>'),
                    400),
                //bodyPadding: EdgeInsets.only(left:0.0,  bottom: 5, top: 1),
                textStyle: TextStyle(fontSize: 12),
                onTapUrl: (url) async {
                  if (url.contains('projects.co.id')) {
                    if (url.contains(RegExp(r'[0-9]'))) {
                      if (url.contains('show_conversation')) {
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
                      AppProvider.getRouter(context)!
                          .navigateTo(context, urlToRoute(url + '/'));
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
              ),
              /*
                Html(data: readText(destination!.item.short_description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),400) ,
                    //useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 )
                    style: {
                      "html": Style(
                        fontSize: FontSize.small,
                      ),
                    }
                )

                 */
            )),
      ),
      SizedBox(height: 15),

      // Description and share/explore buttons.
    ];
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class ItemBrowseProjectsContent4 extends StatelessWidget {
  ItemBrowseProjectsContent4(
      {Key? key,
      @required this.destination,
      this.account,
      this.idHash,
      this.cb})
      : assert(destination != null),
        super(key: key);

  final ItemBrowseProjectsModel? destination;
  final bool? account;
  final String? idHash;
  ChatBloc? cb;

  @override
  Widget build(BuildContext context) {
    // ChatBloc _chatBloc;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    final List<Widget> children = <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  destination!.item.owner_photo_url,
                  fit: BoxFit.cover,
                  height: 22.0,
                  width: 22.0,
                ),
              ),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              destination!.item.owner_user_name,
                              style: descriptionStyle.copyWith(fontSize: 12),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 0.0),
                      child: RatingBarIndicator(
                        rating:
                            destination!.item.owner_owner_rating.toDouble() /
                                    2 -
                                0.01,
                        itemBuilder: (context, index) => Icon(
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
      // Photo and title.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
              ),
            ],
          ),
        ),
      ),
      Container(
        // height:  120.0,
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PublicBrowseProjectsView(
                        id:
                            '${urlToRoute(destination!.item.buttons[3].url).split('/')[4]}',
                        title:
                            '${urlToRoute(destination!.item.buttons[3].url).split('/')[5]}',
                        cb: cb)),
              );
              /*
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[3].url ));

                             */
            },
            child: Ink(
                child:
                    Html(data: readText(destination!.item.title, 150), style: {
              "html":
                  Style(fontSize: FontSize.medium, fontWeight: FontWeight.w500),
            }
                        // useRichText: true, defaultTextStyle : titleStyle
                        ))),
      ),
      Container(
        // height:  120.0,
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PublicBrowseProjectsView(
                        id:
                            '${urlToRoute(destination!.item.buttons[3].url).split('/')[4]}',
                        title:
                            '${urlToRoute(destination!.item.buttons[3].url).split('/')[5]}',
                        cb: cb)),
              );
              /*
                AppProvider.getRouter(context)!.navigateTo(
                context,
                urlToRoute(destination!.item.buttons[3].url ));

               */
            },
            child: Ink(
                // child: Html(data: destination!.item.short_description ,useRichText: true, defaultTextStyle : descriptionStyle.copyWith(color: Colors.black87,fontSize: 12 ), backgroundColor: CurrentTheme.BackgroundColor, )
                child: Html(
                    data: readText(
                        destination!.item.short_description!
                            .replaceAll('<div>', '')
                            .replaceAll('<\/div>', '')
                            .replaceAll('<br>', ' ')
                            .replaceAll('<p>', '')
                            .replaceAll('<\/p>', '<br>'),
                        400),
                    //useRichText: true, defaultTextStyle : descriptionStyle.copyWith(fontSize: 12 )
                    style: {
                  "html": Style(
                    fontSize: FontSize.small,
                  ),
                }))),
      ),
      // Description and share/explore buttons.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 10.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Row(
            children: <Widget>[
              // three line description
              //  Text(
              //    'Published . ',
              //    style: descriptionStyle.copyWith( fontSize: 13),
              //  ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  timeago.format(destination!.item.published_date),
                  style: descriptionStyle.copyWith(fontSize: 13),
                ),
              ),
              Text(
                ' . ',
                style: descriptionStyle.copyWith(fontSize: 13),
              ),
              destination!.item.project_class_str == 'Open to Suggestions'
                  ? Text('Open to Suggestions',
                      style: descriptionStyle.copyWith(fontSize: 13))
                  : Text(
                      destination!.item.project_class_str == "Specific Range"
                          ? destination!.item.budget_range_str ?? '-'
                          : destination!.item.published_budget_str,
                      style: descriptionStyle.copyWith(fontSize: 13),
                    ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      PopupMenuButton<int>(
                        onSelected: (int? value) {
                          if (value == 1) {
                            if (account!) {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item.buttons[0].url));
                            } else {
                              AppProvider.getRouter(context)!
                                  .navigateTo(context, '/login/1');
                            }
                          }
                          if (value == 2) {
                            if (account!) {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item.buttons[1].url));
                            } else {
                              AppProvider.getRouter(context)!
                                  .navigateTo(context, '/login/1');
                            }
                          }
                          if (value == 3) {
                            if (account!) {
                              var owner_id_str = destination!
                                  .item.buttons[2].url
                                  .replaceAll(RegExp(r'[^0-9]'), '');

                              int? owner_id = int.parse(owner_id_str);
                              // _chatBloc =   ChatBloc();

                              // if(widget.id == '')

                              //   _chatBloc.wsSetHandlers();
                              //_chatBloc.lgn(widget.id);
                              //   _chatBloc.lg(idHash!);
                              //$idHash/${encode(this.model!.model!.owner_id)}
                              String? thread = '';
                              if (decode(idHash!) > owner_id) {
                                thread = '${encode(owner_id)}/$idHash';
                              } else {
                                thread = '$idHash/${encode(owner_id)}';
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChatScreen(
                                      user: {
                                        "thread": "$thread",
                                        "username":
                                            "${destination!.item.owner_user_name}",
                                        "userid": "${encode(owner_id)}",
                                        "display":
                                            "${destination!.item.owner_user_name}",
                                        "avatar":
                                            "${destination!.item.owner_photo_url}",
                                        "lastmessage":
                                            "<b>Konteks Percakapan: ${destination!.item.title.replaceAll('&amp;', '&')}</b>",
                                      },
                                      userID: idHash,
                                      chatBloc: cb,
                                      trans: true,
                                      ctx: context,
                                    ),
                                  )).then((value) async {
                                // _chatBloc.dispose();
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('chatlink', true);
                              });
                            } else {
                              AppProvider.getRouter(context)!
                                  .navigateTo(context, '/login/1');
                            }
                          }
                          if (value == 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PublicBrowseProjectsView(
                                      id:
                                          '${urlToRoute(destination!.item.buttons[3].url).split('/')[4]}',
                                      title:
                                          '${urlToRoute(destination!.item.buttons[3].url).split('/')[5]}',
                                      cb: cb)),
                            );
                            /*
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item.buttons[3].url ));

                             */
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          const PopupMenuItem<int>(
                            value: 1,
                            child: Text('Place   bid'),
                          ),
                          const PopupMenuItem<int>(
                            value: 2,
                            child: Text('Ask owner'),
                          ),
                          const PopupMenuItem<int>(
                            value: 3,
                            child: Text('Chat with owner'),
                          ),
                          const PopupMenuItem<int>(
                            value: 4,
                            child: Text('View'),
                          ),
                        ],
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
