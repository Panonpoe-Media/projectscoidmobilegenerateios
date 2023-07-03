import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:projectscoid/models/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'file_fields.dart';
import 'meta.dart';
import 'button.dart';
import 'my_projects_item.dart';
import 'package:projectscoid/models/MyProjects/shortlisted_bids_list_item_base.dart';
import 'photo.dart';
import 'package:projectscoid/models/my_projects_base.dart';
import 'package:projectscoid/models/MyProjects/shortlisted_bids_list_base.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_html/style.dart';
import 'package:html/parser.dart' show parse;
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/views/route.dart' as rt;
import 'package:html/dom.dart' as dom;
import 'package:projectscoid/views/MyProjects/my_projects_action.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:projectscoid/views/MyProjects/my_projects_listing.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
part 'my_projects.g.dart';
/** AUTOGENERATE OFF **/

class BumpUpMyProjectsModel extends BumpUpMyProjectsBase{

  Map<String, dynamic> json;
  BumpUpMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class BroadcastMessageMyProjectsModel extends BroadcastMessageMyProjectsBase{

  Map<String, dynamic> json;
  BroadcastMessageMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class CreateProjectMyProjectsModel extends CreateProjectMyProjectsBase{

  Map<String, dynamic> json;
  CreateProjectMyProjectsModel(Map<String, dynamic> this.json):super(json);
/*
  @override
  Widget editTitle (State state) {
    return(
        TitleWidget(
          value: model!.model!.title,
          caption: 'Title',
          hint: 'Isi dengan judul project',
          required:true,
          getValue: (String? val) {
            state.setState(() {
              model!.model!.title = val;
            });
          },
        ));}

 */

}

class EditDraftMyProjectsModel extends EditDraftMyProjectsBase{

  Map<String, dynamic> json;
  EditDraftMyProjectsModel(Map<String, dynamic> this.json):super(json);

 /*
  @override
  SpeedDialChild  ButtonActionMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController? controller, MyProjectsController my_projects,
      var postMyProjectsResult, State state, String? sendPath, String? id,  String? title){
    var cl;
    var ic;
    if (button.color == 'green'){
      cl = Colors.green;
    }
    if (button.color == 'yellow'){
      cl = Colors.yellow;
    }
    if (button.color == 'blue'){
      cl = Colors.blue;
    }
    if (button.color == 'red'){
      cl = Colors.red;
    }
    if (button.color == 'orange'){
      cl = Colors.orange;
    }
    if (button.color == 'grey'){
      cl = Colors.grey;
    }
    if (button.color == 'black'){
      cl = Colors.black;
    }
    if (button.color == 'brown'){
      cl = Colors.brown;
    }
    if (button.icon == 'fa fa-briefcase'){
      ic = Icons.work;
    }
    if (button.icon == 'fa fa-plus'){
      ic = Icons.add;
    }
    if (button.icon == 'fa fa-list-alt'){
      ic = Icons.list;
    }

    if (button.icon == 'fa fa-credit-card'){
      ic = Icons.credit_card;
    }
    if (button.icon == 'fa fa-paypal'){
      ic = Icons.account_balance_wallet;
    }
    if (button.icon == 'fa fa-bank'){
      ic = Icons.account_balance;
    }
    if (button.icon == 'fa fa-dollar'){
      ic = Icons.attach_money;
    }
    if (button.icon == 'fa fa-user'){
      ic = Icons.person;
    }
    if (button.icon == 'fa fa-edit'){
      ic = Icons.edit;
    }
    if (button.icon == 'fa fa-picture-o'){
      ic = Icons.picture_in_picture;
    }
    if (button.icon == 'fa fa-asterisk'){
      ic = Icons.ac_unit;
    }
    if (button.icon == 'fa fa-envelope-o'){
      ic = Icons.local_post_office;
    }
    if (button.icon == 'fa fa-mobile'){
      ic = Icons.phone_iphone;
    }
    if (button.icon == 'fa fa-bullhorn'){
      ic = Icons.wifi_tethering;
    }

    if (button.icon == 'fa fa-arrow-circle-down'){
      ic = Icons.arrow_downward;
    }
    if (button.icon == 'fa fa-comment'){
      ic = Icons.comment;
    }
    if (button.icon == 'fa fa-send'){
      ic = Icons.send;
    }
    if(button.type == 'custom_filter'){
      return (

          SpeedDialChild(
            child: Icon(ic),
            backgroundColor: cl,
            label: button.text == 'Order by ...' ?  button.text : 'Order : ' + button.text,
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: (){ showSearchSelectDialog(context: context,
                caption:button.text,
                initialitems: button.selections,
                initvalue: button.selections![0]);
            },
          )

      );
    }else{
      print('jauhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      return(
          SpeedDialChild(
              child: Icon(ic),
              backgroundColor: cl,
              label: button.text,
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () async{
                controller!.animateTo(controller!.position.minScrollExtent,
                    duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                if (formKey.currentState.validate()) {
                  //Map<String, dynamic> res = model!.toJson();
                  //print('json result == $res');
                  var formData = await convertFormDataEditDraft(button.text, model
                      ,  attachmentslast
                  );
                  my_projects = MyProjectsController(AppProvider.getApplication(context),
                      sendPath,
                      AppAction.post,
                      id,
                      title,
                      formData,
                      false);
                  if(sendPath.contains('%s')){
                    final future = my_projects.postEditDraftMyProjectsWithID();
                    future.then((value) {
                      state.setState(() {
                        postMyProjectsResult = value;
                      });
                    }).catchError((Error){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  model!.model!.user_id)),
                            (Route<dynamic> route) => false,
                      );

                     // AppProvider.getRouter(context)!.pop(context);
                    });
                  }else{
                    final future = my_projects.postEditDraftMyProjects();
                    future.then((value) {
                      state.setState(() {
                        postMyProjectsResult = value;
                      });
                    }).catchError((Error){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => rt.UserMyProjectsListing(id :  model!.model!.user_id)),
                            (Route<dynamic> route) => false,
                      );
                      //AppProvider.getRouter(context)!.pop(context);
                    });
                  }


                } else {}
              }
          )

      );
    }

  }

  */


}

class PublishProjectMyProjectsModel extends PublishProjectMyProjectsBase{

  Map<String, dynamic> json;
  PublishProjectMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class CancelProjectMyProjectsModel extends CancelProjectMyProjectsBase{

  Map<String, dynamic> json;
  CancelProjectMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class AcceptOrRejectWorkMyProjectsModel extends AcceptOrRejectWorkMyProjectsBase{

  Map<String, dynamic> json;
  AcceptOrRejectWorkMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class RateWorkerMyProjectsModel extends RateWorkerMyProjectsBase{

  Map<String, dynamic> json;
  RateWorkerMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class ReportProgressMyProjectsModel extends ReportProgressMyProjectsBase{

  Map<String, dynamic> json;
  ReportProgressMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class WeeklyReportMyProjectsModel extends WeeklyReportMyProjectsBase{

  Map<String, dynamic> json;
  WeeklyReportMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class ReportDoneMyProjectsModel extends ReportDoneMyProjectsBase{

  Map<String, dynamic> json;
  ReportDoneMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class RateOwnerMyProjectsModel extends RateOwnerMyProjectsBase{

  Map<String, dynamic> json;
  RateOwnerMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class FileArbitrationMyProjectsModel extends FileArbitrationMyProjectsBase{

  Map<String, dynamic> json;
  FileArbitrationMyProjectsModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget editWorkerReceives (State state) {
    return(
        MoneyWidget(
          value: model!.model!.worker_receives,
          caption: 'Worker Receives',
          hint: 'Isi dengan Money Anda',
          required:true,
          min: '0',
          max: '1000000000',
          getValue: (double? val) {
            if(val! <= model!.model!.budget){
              state.setState(() {

                model!.model!.worker_receives = val;
                model!.model!.owner_receives = model!.model!.budget - val;
              });
            }else{
              state.setState(() {

                model!.model!.worker_receives = 0.0;
                model!.model!.owner_receives = 0.0;

              });
            }

          },
        ));}
  @override
  Widget editOwnerReceives (State state) {
    return(
        MoneyWidget(
          value: model!.model!.owner_receives,
          caption: 'Owner Receives',
          hint: 'Isi dengan Money Anda',
          required:true,
          min: '0',
          max: '1000000000',
          getValue: (double? val) {
            if(val! <= model!.model!.budget){
              state.setState(() {

                model!.model!.owner_receives = val;
                if(val == 0.0 && model!.model!.worker_receives == 0.0){
                  model!.model!.worker_receives = 0.0;

                }else{
                  model!.model!.worker_receives = model!.model!.budget - val;

                }
              });
            }else{
              state.setState(() {

                model!.model!.owner_receives = 0.0;
                model!.model!.worker_receives = 0.0;

              });
            }

          },
        ));}


}

class NewOfferMyProjectsModel extends NewOfferMyProjectsBase{

  Map<String, dynamic> json;
  NewOfferMyProjectsModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget editWorkerReceives (State state) {
    return(
        MoneyWidget(
          value: model!.model!.worker_receives,
          caption: 'Worker Receives',
          hint: 'Isi dengan Money Anda',
          required:true,
          min: '0',
          max: '1000000000',
          getValue: (double? val) {
            if(val! <= model!.model!.budget){
              state.setState(() {

                model!.model!.worker_receives = val;
                model!.model!.owner_receives = model!.model!.budget - val;
              });
            }else{
              state.setState(() {

                model!.model!.worker_receives = 0.0;
                model!.model!.owner_receives = 0.0;

              });
            }

          },
        ));}
  @override
  Widget editOwnerReceives (State state) {
    return(
        MoneyWidget(
          value: model!.model!.owner_receives,
          caption: 'Owner Receives',
          hint: 'Isi dengan Money Anda',
          required:true,
          min: '0',
          max: '1000000000',
          getValue: (double? val) {
            if(val! <= model!.model!.budget){
              state.setState(() {

                model!.model!.owner_receives = val;
                if(val == 0.0 && model!.model!.worker_receives == 0.0){
                  model!.model!.worker_receives = 0.0;

                }else{
                  model!.model!.worker_receives = model!.model!.budget - val;

                }
              });
            }else{
              state.setState(() {

                model!.model!.owner_receives = 0.0;
                model!.model!.worker_receives = 0.0;

              });
            }

          },
        ));}

}

class AcceptOfferMyProjectsModel extends AcceptOfferMyProjectsBase{

  Map<String, dynamic> json;
  AcceptOfferMyProjectsModel(Map<String, dynamic> this.json):super(json);

}

class RespondArbitrationMyProjectsModel extends RespondArbitrationMyProjectsBase{

  Map<String, dynamic> json;
  RespondArbitrationMyProjectsModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget editWorkerReceives (State state) {
    return(
        MoneyWidget(
          value: model!.model!.worker_receives,
          caption: 'Worker Receives',
          hint: 'Isi dengan Money Anda',
          required:true,
          min: '0',
          max: '1000000000',
          getValue: (double? val) {
            if(val! <= model!.model!.budget){
              state.setState(() {

                model!.model!.worker_receives = val;
                model!.model!.owner_receives = model!.model!.budget - val;
              });
            }else{
              state.setState(() {

                model!.model!.worker_receives = 0.0;
                model!.model!.owner_receives = 0.0;

              });
            }

          },
        ));}
  @override
  Widget editOwnerReceives (State state) {
    return(
        MoneyWidget(
          value: model!.model!.owner_receives,
          caption: 'Owner Receives',
          hint: 'Isi dengan Money Anda',
          required:true,
          min: '0',
          max: '1000000000',
          getValue: (double? val) {
            if(val! <= model!.model!.budget){
              state.setState(() {

                model!.model!.owner_receives = val;
                if(val == 0.0 && model!.model!.worker_receives == 0.0){
                  model!.model!.worker_receives = 0.0;

                }else{
                  model!.model!.worker_receives = model!.model!.budget - val;

                }
              });
            }else{
              state.setState(() {

                model!.model!.owner_receives = 0.0;
                model!.model!.worker_receives = 0.0;

              });
            }

          },
        ));}

}

class CancelArbitrationMyProjectsModel extends CancelArbitrationMyProjectsBase{

  Map<String, dynamic> json;
  CancelArbitrationMyProjectsModel(Map<String, dynamic> this.json):super(json);

}


class MyProjectsModel extends MyProjectsBase{
  Map<String, dynamic> json;
  MyProjectsModel(Map<String, dynamic> this.json):super(json);


}

////////////////////////////////////////////////////
@JsonSerializable()
class ViewModelMyProjectsRev {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  String? admin_note;
  String? description;
  List<FileField?>? attachments;
  String? attachments_url;
  String? attachments_name;
  List<int?>? channels_id;
  List<String?>?  channels_str;
  List<String?>? channels_url;
  int? project_type_id;
  String? project_type_str;
  List<int?>? project_type_list;
  List<String?>? project_type_list_str;
  int? project_class_id;
  String? project_class_str;
  List<int?>? project_class_list;
  List<String?>? project_class_list_str;
  String? budget_range_str;
  DateTime? published_date;
  double? published_budget;
  String? published_budget_str;
  int? finish_days;
  String? finish_days_str;
  int? project_status_id;
  String? project_status_str;
  List<int?>? project_status_list;
  List<String?>? project_status_list_str;
  int? project_ending_id;
  String? project_ending_str;
  List<int?>? project_ending_list;
  List<String?>? project_ending_list_str;
  int? bid_count;
  String? bid_count_str;
  DateTime? select_deadline;
  bool need_weekly_report;
  DateTime? start_date;
  DateTime? finish_deadline;
  DateTime? finish_date;
  DateTime? closed_date;
  int? accepted_worker_id;
  String? accepted_worker_str;
  String? accepted_worker_url;
  List<int?>? accepted_worker_list;
  List<String?>? accepted_worker_list_str;
  double? accepted_budget;
  String? accepted_budget_str;
  int? progress;
  int? arbitration_id;
  String? arbitration_str;
  String? arbitration_url;
  List<int?>? arbitration_list;
  List<String?>? arbitration_list_str;
  DateTime? last_bump;
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
  int?  owner_owner_rating;
  double?  owner_owner_rating_num;
  String? owner_owner_rating_num_str;
  int?  owner_owner_point;
  String? owner_owner_point_str;
  int?  owner_owner_ranking;
  String? owner_owner_ranking_str;
  double? worker_rating_num;
  String? worker_rating_num_str;
  String? worker_feedback;
  String? accepted_worker_photo_url;
  String? accepted_worker_user_name;
  String? accepted_worker_kabupaten_str;
  int?  accepted_worker_worker_rating;
  double?  accepted_worker_worker_rating_num;
  String? accepted_worker_worker_rating_num_str;
  int?  accepted_worker_worker_point;
  String? accepted_worker_worker_point_str;
  int?  accepted_worker_worker_ranking;
  String? accepted_worker_worker_ranking_str;
  String? owner_feedback;
  double? owner_rating_num;
  String? owner_rating_num_str;
  ShortlistedBidsListingTools? shortlisted_bids;
  String? project_id;

  //
  ViewModelMyProjectsRev(
      this.id,
      this.admin_note,
      this.description,
      this.attachments,
      this.attachments_url,
      this.attachments_name,
      this.channels_id,
      this.channels_str,
      this.channels_url,
      this.project_type_id,
      this.project_type_str,
      this.project_type_list,
      this.project_type_list_str,
      this.project_class_id,
      this.project_class_str,
      this.project_class_list,
      this.project_class_list_str,
      this.budget_range_str,
      this.published_date,
      this.published_budget,
      this.published_budget_str,
      this.finish_days,
      this.finish_days_str,
      this.project_status_id,
      this.project_status_str,
      this.project_status_list,
      this.project_status_list_str,
      this.project_ending_id,
      this.project_ending_str,
      this.project_ending_list,
      this.project_ending_list_str,
      this.bid_count,
      this.bid_count_str,
      this.select_deadline,
      this.need_weekly_report,
      this.start_date,
      this.finish_deadline,
      this.finish_date,
      this.closed_date,



      this.accepted_worker_id,
      this.accepted_worker_str,
      this.accepted_worker_url,
      this.accepted_worker_list,
      this.accepted_worker_list_str,
      this.accepted_budget,
      this.accepted_budget_str,
      this.progress,
      this.arbitration_id,
      this.arbitration_str,
      this.arbitration_url,
      this.arbitration_list,
      this.arbitration_list_str,
      this.last_bump,
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

      this.shortlisted_bids,



      this.project_id,

      );


  factory ViewModelMyProjectsRev.fromJson(Map<String, dynamic> json) => _$ViewModelMyProjectsRevFromJson(json);


}
/*
ViewModelMyProjectsRev _$ViewModelMyProjectsRevFromJson(Map<String, dynamic> json) {
  return ViewModelMyProjectsRev(
     json['id'] as String,
      json['admin_note'] as String,
      json['description'] as String,
      (json['attachments'] as List)
          ?.map((e) =>
      e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['attachments_url'] as String,
      json['attachments_name'] as String,
      (json['channels_id'] as List)?.map((e) => e as int)?.toList(),
      (json['channels_str'] as List)?.map((e) => e as String)?.toList(),
      (json['channels_url'] as List)?.map((e) => e as String)?.toList(),
      json['project_type_id'] as int,
      json['project_type_str'] as String,
      (json['project_type_list'] as List)?.map((e) => e as int)?.toList(),
      (json['project_type_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      json['project_class_id'] as int,
      json['project_class_str'] as String,
      (json['project_class_list'] as List)?.map((e) => e as int)?.toList(),
      (json['project_class_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      json['budget_range_str'] as String,
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      (json['published_budget'] as num)?.toDouble(),
      json['published_budget_str'] as String,
      json['finish_days'] as int,
      json['finish_days_str'] as String,
      json['project_status_id'] as int,
      json['project_status_str'] as String,
      (json['project_status_list'] as List)?.map((e) => e as int)?.toList(),
      (json['project_status_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      json['project_ending_id'] as int,
      json['project_ending_str'] as String,
      (json['project_ending_list'] as List)?.map((e) => e as int)?.toList(),
      (json['project_ending_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      json['bid_count'] as int,
      json['bid_count_str'] as String,
      json['select_deadline'] == null
          ? null
          : DateTime.parse(json['select_deadline'] as String),
      json['need_weekly_report'] as bool,
      json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      json['finish_deadline'] == null
          ? null
          : DateTime.parse(json['finish_deadline'] as String),
      json['finish_date'] == null
          ? null
          : DateTime.parse(json['finish_date'] as String),
      json['closed_date'] == null
          ? null
          : DateTime.parse(json['closed_date'] as String),



      json['accepted_worker_id'] as int,
      json['accepted_worker_str'] as String,
      json['accepted_worker_url'] as String,
      (json['accepted_worker_list'] as List)?.map((e) => e as int)?.toList(),
      (json['accepted_worker_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      (json['accepted_budget'] as num)?.toDouble(),
      json['accepted_budget_str'] as String,
      json['progress'] as int,
      json['arbitration_id'] as int,
      json['arbitration_str'] as String,
      json['arbitration_url'] as String,
      (json['arbitration_list'] as List)?.map((e) => e as int)?.toList(),
      (json['arbitration_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String),
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
    //  json['owner_rating_num'] as int,


      json['owner_rating_num_str'] as String,


      json['shortlisted_bids'] == null
      ? null
          : ShortlistedBidsListingTools.fromJson(json['shortlisted_bids'] as Map<String, dynamic>),





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
class MyProjectsViewSuperBaseRev {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyProjectsRev? model;
  MyProjectsViewSuperBaseRev(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );

  factory MyProjectsViewSuperBaseRev.fromJson(Map<String, dynamic> json) => _$MyProjectsViewSuperBaseRevFromJson(json);


}
/*
MyProjectsViewSuperBaseRev _$MyProjectsViewSuperBaseRevFromJson(
    Map<String, dynamic> json) {
  return MyProjectsViewSuperBaseRev(
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
          : ViewModelMyProjectsRev.fromJson(
          json['model'] as Map<String, dynamic>));
}

 */

class MyProjectsViewModel  extends MyProjectsViewBase{
  Map<String, dynamic> json;
 // MyProjectsViewModel(Map<String, dynamic> this.json):super(json);
  MyProjectsViewModel(Map<String, dynamic> this.json):super(json){model = MyProjectsViewSuperBaseRev.fromJson(this.json);}



  @override
  SpeedDialChild ButtonViewMyProjectsWidget(Button button, BuildContext context,var formKey, ScrollController? controller, MyProjectsController my_projects,
      State state, String? sendPath, String? id,  String? title, bool? account){
    AccountController accountController;
    accountController =AccountController(AppProvider.getApplication(context),
        AppAction.view   );
    var url = '';
    if(button.type == 'custom_filter'){
      return (
          SpeedDialChild(
            child: Icon(Icons.search),
            backgroundColor: Colors.green,
            label: button.text,
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: (){ showSearchSelectDialog(context: context,
                caption:button.text,
                initialitems: button.selections,
                initvalue: button.selections![0]);
              //AppProvider.getRouter(context)!.navigateTo(context,
            },
          )

      );
    }else{
      var cl;
      var ic;
      if (button.color == 'green'){
        cl = Colors.green;
      }
      if (button.color == 'yellow'){
        cl = Colors.yellow;
      }
      if (button.color == 'blue'){
        cl = Colors.blue;
      }
      if (button.color == 'red'){
        cl = Colors.red;
      }
      if (button.color == 'orange'){
        cl = Colors.orange;
      }
      if (button.color == 'grey'){
        cl = Colors.grey;
      }
      if (button.color == 'black'){
        cl = Colors.black;
      }
      if (button.color == 'brown'){
        cl = Colors.brown;
      }
      if (button.icon == 'fa fa-briefcase'){
        ic = Icons.work;
      }
      if (button.icon == 'fa fa-plus'){
        ic = Icons.add;
      }
      if (button.icon == 'fa fa-list-alt'){
        ic = Icons.list;
      }

      if (button.icon == 'fa fa-credit-card'){
        ic = Icons.credit_card;
      }
      if (button.icon == 'fa fa-paypal'){
        ic = Icons.account_balance_wallet;
      }
      if (button.icon == 'fa fa-bank'){
        ic = Icons.account_balance;
      }
      if (button.icon == 'fa fa-dollar'){
        ic = Icons.attach_money;
      }
      if (button.icon == 'fa fa-user'){
        ic = Icons.person;
      }
      if (button.icon == 'fa fa-edit'){
        ic = Icons.edit;
      }
      if (button.icon == 'fa fa-picture-o'){
        ic = Icons.picture_in_picture;
      }
      if (button.icon == 'fa fa-asterisk'){
        ic = Icons.ac_unit;
      }
      if (button.icon == 'fa fa-envelope-o'){
        ic = Icons.local_post_office;
      }
      if (button.icon == 'fa fa-mobile'){
        ic = Icons.phone_iphone;
      }

      if (button.icon == 'fa fa-bullhorn'){
        ic = Icons.wifi_tethering;
      }

      if (button.icon == 'fa fa-arrow-circle-down'){
        ic = Icons.arrow_downward;
      }
      if (button.icon == 'fa fa-comment'){
        ic = Icons.comment;
      }
      if (button.icon == 'fa fa-comments'){
        ic = Icons.comment_bank;
      }
      if (button.icon == 'fa fa-files-o'){
        ic = Icons.file_copy_outlined;
      }
      if (button.icon == 'fa fa-send'){
        ic = Icons.send;
      }

      if(button.url!.contains('user/my_purchases/download/')){
        return(	SpeedDialChild(
            child: Icon(ic),
            backgroundColor: cl,
            label: button.text,
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()async{
              {
                controller!.animateTo(controller.position.minScrollExtent,
                    duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);

                my_projects = MyProjectsController(AppProvider.getApplication(context),
                    sendPath! + button.url!,
                    AppAction.post,
                    id,
                    title,
                    null,
                    false);
                final future = my_projects.downloadFile();
                future.then((value) {
                  state.setState(() {
                    // postMyProjectsResult = value;
                    //AppProvider.getRouter(context)!.pop(context);
                  });
                }).catchError((Error){
                  AppProvider.getRouter(context)!.pop(context);
                });


              }
            }
        ));
      }else{
        if(button.text!.toLowerCase() =='show thread'){
         return(
          SpeedDialChild(
              child: Icon(ic),
              backgroundColor: cl,
              label: button.text,
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: ()async{
                String? userID;
                final future = accountController.getAccount();
                future.then((val){
                  for(var map in val) {
                    userID = map['user_hash'];
                  }
                  if(encode(model!.model!.accepted_worker_id) == userID){
                   // print('idddddddddddddddddddd ${encode(model!.model!.accepted_worker_id) }');
                    //print('idddddddddddddddddddd $userID');

                    url = '/user/my_projects/show_thread/${model!.model!.project_id}/${model!.model!.owner_str}*${model!.model!.owner_owner_rating.toString()}*${model!.model!.owner_photo_url!.replaceAll('https://cdn.projects.co.id/upload/', '')!.replaceAll('https://www.gravatar.com/avatar/', 'gravatar')!.replaceAll('/', 'ccc')}*r';
                  }else{
                    url = '/user/my_projects/show_thread/${model!.model!.project_id}/${model!.model!.accepted_worker_user_name}*${model!.model!.accepted_worker_worker_rating.toString()}*${model!.model!.accepted_worker_photo_url!.replaceAll('https://cdn.projects.co.id/upload/', '')!.replaceAll('https://www.gravatar.com/avatar/', 'gravatar')!.replaceAll('/', 'ccc')}*l';
                  }
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      url);



                });




              }
          )
         );


            // );



          /*
          AppProvider.getRouter(context)!.navigateTo(
              context,
              url);

           */

        }
        else {
          return(	SpeedDialChild(
            child: Icon(ic),
            backgroundColor: cl,
            label: button.text,
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: (){

              if(account!){
                AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url! ));
              }else{
                AppProvider.getRouter(context)!.navigateTo(context,'/login/1');
              }
            }
        ));
        }
      }

    }

  }


  /*

  Widget viewHeader (BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.subtitle1;
    final mediaQueryData = MediaQuery.of(context);
    var document = parse(this.model!.model!.project_status_str);
    //  var recentNews = document.getElementsByClassName('col-md-4 col-sm-4 recent-news');

    return(
        // SizedBox(
        //   height:model!.meta.title.length > 20 ? 180 : 160.0,
        //   child:
        GFListTile(
            avatar:GFAvatar(
              shape: GFAvatarShape.standard,
              maxRadius: 45.0,
              size: GFSize.LARGE,
              backgroundImage: NetworkImage(
                this.model!.model!.owner_photo_url!,
                // fit: BoxFit.fitHeight,
                // height: 75.0,
                // width: 80.0,
              ),
            ),
            title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children : <Widget>[

                  Html  (
                    // this.model!.meta.title ,
                    data :model!.meta.title,
                    style: {
                      "html": Style(
                        fontSize: FontSize.small,
                        //color: Colors.black87,
                        //backgroundColor: CurrentTheme.BackgroundColor
                      ),
                    },
                    //useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith( fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute(this.model!.model!.owner_url ));
                    },
                    child: Html(

                      data :readText(this.model!.model!.owner_user_name , 54),
                      style: {
                        "html": Style(
                          fontSize: FontSize.small,
                          color: Colors.green,
                          // backgroundColor: CurrentTheme.BackgroundColor
                        ),
                      },
                      //useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                    ),
                  ),//
                  /*
                    Html(

                        data :readText(this.model!.model!.project_status_str , 54),
                        style: {
                          "html": Style(
                              fontSize: FontSize.small,
                              fontWeight: FontWeight.w500
                          ),
                        },
                      //  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(fontSize: 12, fontWeight: FontWeight.w500 )
                    ),

                     */
                  Row(
                      children: <Widget>[
                        // three line description
                        /*
                          Text(
                            this.model!.model!.project_status_str,
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
                          child:
                          Text(
                              document.children[0].text,
                              style: descriptionStyle!.copyWith(fontSize: 11)),

                        ),

                        this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                          ' . ',
                          style: descriptionStyle!.copyWith(fontSize: 11),
                        ),
                        this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                          this.model!.model!.project_ending_str?? '',
                          style: descriptionStyle!.copyWith(fontSize: 11),
                        )


                      ]
                  ),
                  Row(
                      children: <Widget>[
                        // three line description
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child:
                          Text(
                            this.model!.model!.project_class_str ,
                            style: descriptionStyle!.copyWith( fontSize: 11),
                          ),

                        ),

                        this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                          ' . ',
                          style: descriptionStyle!.copyWith( fontSize: 11),
                        ),
                        this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                          this.model!.model!.project_class_id == 10? this.model!.model!.budget_range_str : this.model!.model!.published_budget_str,
                          style: descriptionStyle!.copyWith( fontSize: 11),
                        )


                      ]
                  ),
                ]
            )

        )
        /*
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // three line description

                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0 , 0.0),
                  child:      InkWell(
                    onTap: () {
                      // return BidItemInfo(info : this.info);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowItemScreenshots(image : this.model!.model!.owner_photo_url)),
                      );

                    },

                    child:
                          GFAvatar(
                                    shape: GFAvatarShape.standard,
                                    maxRadius: 40.0,
                                    size: GFSize.LARGE,
                                    child: Image.network(
                                    this.model!.model!.owner_photo_url!,
                                            fit: BoxFit.fitHeight,
                                           // height: 75.0,
                                           // width: 80.0,
                                          ),
                          ),

                    /*
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        this.model!.model!.owner_photo_url!,
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
                                // this.model!.meta.title ,
                                data :model!.meta.title,
                                useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith(color: Colors.black87,  fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(this.model!.model!.owner_url ));
                                },
                                child: Html(

                                    data :readText(this.model!.model!.owner_user_name , 54),
                                    useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                                ),
                              ),//
                              Html(

                                  data :readText(this.model!.model!.project_status_str , 54),
                                  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(fontSize: 12, fontWeight: FontWeight.w500 )
                              ),
                              Row(
                                  children: <Widget>[
                                    // three line description
                                    Text(
                                      this.model!.model!.project_type_str,
                                      style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 11),
                                    ),

                                    this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      ' . ',
                                      style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 11),
                                    ),
                                    this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      this.model!.model!.project_ending_str,
                                      style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 11),
                                    )


                                  ]
                              ),
                              Row(
                                  children: <Widget>[
                                    // three line description
                                    Text(
                                      this.model!.model!.project_class_str ,
                                      style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 11),
                                    ),

                                    this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      ' . ',
                                      style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 11),
                                    ),
                                    this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      this.model!.model!.published_budget_str,
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



  Widget viewDesc(BuildContext context){
    ScrollController? controller;
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    return
       darkMode?
       ExpandablePanel(
           header:
           Padding(
               padding: const EdgeInsets.fromLTRB(
                   20.0, 8.0, 20.0, 0.0),
               child:
               Column(
                   children: <Widget>[
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Text('About this project',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
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
                     HtmlWidget( readText(this.model!.model!.description!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 200)),

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
                         child : HtmlWidget(this.model!.model!.description!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'),
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
                             MaterialPageRoute(builder: (context) => ShowItemScreenshots(image:'$src')),
                           ),
                         )
                     ),


                   ]
               )

           )

       )
      : GFAccordion(
        //  title: 'About this project',
          titleChild: Text('About this project',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
          contentChild: HtmlWidget(this.model!.model!.description!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'),
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
              MaterialPageRoute(builder: (context) => ShowItemScreenshots(image:'$src')),
            ),
          ),
       //   collapsedIcon: Icon(Icons.add),
       //   expandedIcon: Icon(Icons.minimize)
      );
    /*
      ExpandablePanel(
        header:
        Padding(
            padding: const EdgeInsets.fromLTRB(
                20.0, 8.0, 20.0, 0.0),
            child:
            Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('About this project',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
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
                  HtmlWidget( readText(this.model!.model!.description!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 200)),

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
                      child : HtmlWidget(this.model!.model!.description!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'),
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
                          MaterialPageRoute(builder: (context) => ShowItemScreenshots(image:'$src')),
                        ),
                      )
                  ),


                ]
            )

        )

    );

     */
    /*
    return Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DescProductInfo(info : this.model!.model, title: this.model!.meta.title)),
              );
            },
            child:
            Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('About this product',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  HtmlWidget(readText(this.model!.model!.description, 150)),
                ]
            )


        )
    );

     */
  }

  Widget viewAcceptedWorker(BuildContext context){
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model!.model!.accepted_worker_user_name == null|| this.model!.model!.accepted_worker_user_name == '' ? Container(width: 0.0, height: 0.0, color: Colors.white,):
    GFCard(
      titlePosition: GFPosition.start,
      title: GFListTile(
              avatar:GFAvatar(
                maxRadius: 40.0,
                backgroundImage: NetworkImage(
                        this.model!.model!.accepted_worker_photo_url!,
                      ),
               shape: GFAvatarShape.circle,
              ),
              title: Text(this.model!.model!.accepted_worker_user_name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),),
              subTitle:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Worker', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                  Padding(
                      padding:
                      EdgeInsets.only(right: 10.0, top: 3.0),
                      child:
                      RatingBarIndicator(
                        rating: this.model!.model!.worker_rating_num,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: CurrentTheme.PrimaryLightColor,
                        ),
                        itemCount: 5,
                        itemSize: 14.0,
                        unratedColor: Colors.black26,
                        direction:  Axis.horizontal,
                      ),
                      /*
                        SmoothStarRating(
                        rating: double.tryParse(this.model!.model!.accepted_worker_worker_rating.toString()),
                        size: 14,
                        starCount: 5,
                        // allowHalfRating: true,
                        allowHalfRating: true,

                      )

                       */
                  ),
                  Padding(
                    padding: const EdgeInsets.only( top: 5.0,right: 3.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.stars,
                          size: 11.0,
                          color: Colors.orange,
                        ),
                        Text(
                          ' ' +  this.model!.model!.accepted_worker_worker_rating_num_str,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Sans",
                             // color: Colors.black54
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(this.model!.model!.accepted_worker_kabupaten_str, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),


              icon: GFIconButton(
                onPressed: null,
                icon: Icon(Icons.work),

                type: GFButtonType.transparent,
              )
      ),
      boxFit: BoxFit.contain,
      image: Image.asset(
        'assets/img/workerbg5.jpg',
        fit: BoxFit.fitHeight,
        // height: 75.0,
        // width: 80.0,
      ),


       // '${dateformat.format(model!.model!.birth_date)}'

      content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   // Text('Rated Owner: ${model!.model!.accepted_worker_worker_rating_num_str} '),

                    this.model!.model!.closed_date == null ? Container(width: 0.0, height: 0.0,) :Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          GFRating(
                            value: double.tryParse(this.model!.model!.accepted_worker_worker_rating.toString()),
                            allowHalfRating: true,
                            color: CurrentTheme.PrimaryLightColor,
                            size: 15,
                          ),


                          Text('  ${dateformat.format(this.model!.model!.closed_date)}'),
                        ]
                    ),

                    this.model!.model!.closed_date == null ? Container(width: 0.0, height: 0.0,) :Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                                HtmlWidget(this.model!.model!.worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>')),
                              ]
                    ),

                  ]
                ),
      //Text(this.model!.model!.worker_feedback),
      buttonBar: GFButtonBar(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,

        children: <Widget>[
           GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.model!.accepted_worker_url ));
            },
            text: 'About worker',
          ),
          /*
          GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.model!.owner_url  ));
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
                        Text( this.model!.model!.worker_rating_num_str),
                      ]

                  ),

                  this.model!.model!.worker_feedback == null? Container(width: 0.0, height: 0.0, color: Colors.white,): Html(data: readText(this.model!.model!.worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),
                ]
            )



    );

     */
  }

  Widget viewProjectOwner(BuildContext context){
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model!.model!.owner_owner_rating_num_str == null? Container(width: 0.0, height: 0.0, color: Colors.white,):
    GFCard(
      titlePosition: GFPosition.start,
      title: GFListTile(
          avatar:GFAvatar(
            maxRadius: 40.0,
            backgroundImage: NetworkImage(
              this.model!.model!.owner_photo_url!,
            ),
            shape: GFAvatarShape.circle,
          ),
          title: Text(this.model!.model!.owner_user_name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),),
          subTitle:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Owner', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              Padding(
                  padding:
                  EdgeInsets.only(right: 10.0, top: 3.0),
                  child:
                  RatingBarIndicator(
                    rating: this.model!.model!.owner_owner_rating_num,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: CurrentTheme.PrimaryLightColor,
                    ),
                    itemCount: 5,
                    itemSize: 14.0,
                    unratedColor: Colors.black26,
                    direction:  Axis.horizontal,
                  ),

                /*
                        SmoothStarRating(
                        rating: double.tryParse(this.model!.model!.accepted_worker_worker_rating.toString()),
                        size: 14,
                        starCount: 5,
                        // allowHalfRating: true,
                        allowHalfRating: true,

                      )

                       */
              ),
              Padding(
                padding: const EdgeInsets.only( top: 5.0,right: 3.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.stars,
                      size: 11.0,
                      color: Colors.orange,
                    ),
                    Text(
                      ' ' +  this.model!.model!.owner_owner_rating_num_str,
                      softWrap: false,
                      style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Sans",
                         // color: Colors.black54
                      ),
                    ),
                  ],
                ),
              ),
              Text(this.model!.model!.owner_kabupaten_str, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),


          icon: GFIconButton(
            onPressed: null,
            icon: Icon(Icons.monetization_on),

            type: GFButtonType.transparent,
          )
      ),
      boxFit: BoxFit.contain,
      image: Image.asset(
        'assets/img/workerbg4.jpg',
        fit: BoxFit.fitHeight,
        // height: 75.0,
        // width: 80.0,
      ),


      // '${dateformat.format(model!.model!.birth_date)}'
     // json['owner_rating_num'] as int,
    //  json['owner_rating_num_str'] as String,

      content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text('Rated Owner: ${model!.model!.owner_rating_num_str} '),

            this.model!.model!.closed_date == null ? Container(width: 0.0, height: 0.0,) : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  GFRating(
                    value: double.tryParse(this.model!.model!.owner_rating_num.toString()),
                    allowHalfRating: true,
                    color: CurrentTheme.PrimaryLightColor,
                    size: 15,
                  ),


                  Text('  ${dateformat.format(this.model!.model!.closed_date)}'),
                ]
            ),

            this.model!.model!.closed_date == null ? Container(width: 0.0, height: 0.0,) : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HtmlWidget(this.model!.model!.owner_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>')),
                ]
            ),

          ]
      ),
      //Text(this.model!.model!.worker_feedback),
      buttonBar: GFButtonBar(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,

        children: <Widget>[
          /*
          this.model!.model!.closed_date == null ? Container(width: 0.0, height: 0.0,) : GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.model!.accepted_worker_url ));
            },
            text: 'About worker',
          ),

           */
          GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.model!.owner_url  ));
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
                    Text( this.model!.model!.owner_owner_rating_num_str),
                  ]

              ),

              this.model!.model!.owner_feedback == null? Container(width: 0.0, height: 0.0, color: Colors.white,): Html(data: readText(this.model!.model!.owner_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),
            ]
        )



    );

     */
  }

  Widget viewBidder (BuildContext context){
    int? count = -1;

   if (this.model!.model!.shortlisted_bids != null){
     count = this.model!.model!.shortlisted_bids.items.length;
    }else{
      count = 0;
    }

    if(count == 0 ){
      return Container(height:0 , width: 0);
    }else{
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            this.model!.model!.shortlisted_bids.items.length == 0?
            Container(width : 0.0, height : 0.0):
            Padding(
              padding : EdgeInsets.only(left: 20.0, bottom: 10),
              child:  Text('Shortlisted Bids',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
            ),

            Container(
              height: 200.0,
              padding: EdgeInsets.only(left: 10.0, top: 0.0),
              child: this.model!.model!.shortlisted_bids.items.length == 0?
              Container(width : 0.0, height : 0.0)
                  :

             ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int? index) {
                  return index! >= this.model!.model!.shortlisted_bids.items.length
                      ? Container(width : 0.0, height : 0.0)
                      :MyBidItem(model: this.model!.model!.shortlisted_bids.items[index], info : this.model!.model!.shortlisted_bids );
                },
                // itemCount: this.model!.model!.user_bids.items.length <= 8
                //     ? this.model!.model!.user_bids.items.length
                //     : 8,
                itemCount: this.model!.model!.shortlisted_bids.items.length,
                // controller: controller1,
              ),


            )
          ],
        );
    }

  }


  @override
  Widget viewAttachments (BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    if(model!.model!.attachments == null){
      return(Container(height: 0, width: 0) );
    }
    if(model!.model!.attachments_name != ''){

      return(  FileViewAtt(
        ctx : context,
        value: model!.model!.attachments_name,
        value1: model!.model!.attachments_url,
        caption: 'Attachments',
      ));
      /*
      return( FileViewRev(
       // ctx : context,
        value: model!.model!.attachments_name,
        value1: model!.model!.attachments_url,
        caption: 'Attachments',
      )
      );

       */
    }else{
      return( Container(height: 0, width: 0) );
    }

  }

  @override
  Widget view (BuildContext context, ScrollController? controller , bool? account) {


    viewChildren.clear();

    //viewHeader
    viewChildren.add(viewHeader(context));
   viewChildren.add(viewAttachments(context));
    viewChildren.add(viewChannels(context));
    viewChildren.add(viewDesc(context));
    viewChildren.add(viewAcceptedWorker(context));
    viewChildren.add(viewProjectOwner(context));
    viewChildren.add(viewBidder(context));
   // viewChildren.add(viewInfo(context));


    if(this.model!.meta.after_content != null){ viewChildren.add(Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
      child:  Html(data: this.model!.meta.after_content),
    ));}


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

   */



  Widget viewHeader (BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.subtitle1;
    // ignore: unused_local_variable
    final mediaQueryData = MediaQuery.of(context);
    var document = parse(this.model!.model!.project_status_str);
    //  var recentNews = document.getElementsByClassName('col-md-4 col-sm-4 recent-news');

    return(
        // SizedBox(
        //   height:model!.meta.title.length > 20 ? 180 : 160.0,
        //   child:
        GFListTile(
            avatar:GFAvatar(
              shape: GFAvatarShape.standard,
              maxRadius: 45.0,
              size: GFSize.LARGE,
              backgroundImage: NetworkImage(
                this.model!.model!.owner_photo_url!,
                // fit: BoxFit.fitHeight,
                // height: 75.0,
                // width: 80.0,
              ),
            ),
            title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children : <Widget>[

                  Html  (
                    // this.model!.meta.title ,
                    data :model!.meta.title,
                    style: {
                      "html": Style(
                        fontSize: FontSize.small,
                        //color: Colors.black87,
                        //backgroundColor: CurrentTheme.BackgroundColor
                      ),
                    },
                    //useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith( fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute(this.model!.model!.owner_url ));
                    },
                    child: Html(

                      data :readText(this.model!.model!.owner_user_name , 54),
                      style: {
                        "html": Style(
                          fontSize: FontSize.small,
                          color: Colors.green,
                          // backgroundColor: CurrentTheme.BackgroundColor
                        ),
                      },
                      //useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                    ),
                  ),//
                  /*
                    Html(

                        data :readText(this.model!.model!.project_status_str , 54),
                        style: {
                          "html": Style(
                              fontSize: FontSize.small,
                              fontWeight: FontWeight.w500
                          ),
                        },
                      //  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(fontSize: 12, fontWeight: FontWeight.w500 )
                    ),

                     */
                  Row(
                      children: <Widget>[
                        // three line description
                        /*
                          Text(
                            this.model!.model!.project_status_str,
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
                          child:
                          Text(
                              document.children[0].text,
                              style: descriptionStyle!.copyWith(fontSize: 11)),

                        ),

                        this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                          ' . ',
                          style: descriptionStyle.copyWith(fontSize: 11),
                        ),
                        this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                          this.model!.model!.project_ending_str,
                          style: descriptionStyle.copyWith(fontSize: 11),
                        )


                      ]
                  ),
                  Row(
                      children: <Widget>[
                        // three line description
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child:
                          Text(
                            this.model!.model!.project_class_str ,
                            style: descriptionStyle.copyWith( fontSize: 11),
                          ),

                        ),

                        this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                          ' . ',
                          style: descriptionStyle.copyWith( fontSize: 11),
                        ),
                        this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                          this.model!.model!.project_class_id == 10? this.model!.model!.budget_range_str : this.model!.model!.published_budget_str,
                          style: descriptionStyle.copyWith( fontSize: 11),
                        )


                      ]
                  ),
                ]
            )

        )
        /*
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // three line description

                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0 , 0.0),
                  child:      InkWell(
                    onTap: () {
                      // return BidItemInfo(info : this.info);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowItemScreenshots(image : this.model!.model!.owner_photo_url)),
                      );

                    },

                    child:
                          GFAvatar(
                                    shape: GFAvatarShape.standard,
                                    maxRadius: 40.0,
                                    size: GFSize.LARGE,
                                    child: Image.network(
                                    this.model!.model!.owner_photo_url!,
                                            fit: BoxFit.fitHeight,
                                           // height: 75.0,
                                           // width: 80.0,
                                          ),
                          ),

                    /*
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        this.model!.model!.owner_photo_url!,
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
                                // this.model!.meta.title ,
                                data :model!.meta.title,
                                useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith(color: Colors.black87,  fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(this.model!.model!.owner_url ));
                                },
                                child: Html(

                                    data :readText(this.model!.model!.owner_user_name , 54),
                                    useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                                ),
                              ),//
                              Html(

                                  data :readText(this.model!.model!.project_status_str , 54),
                                  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(fontSize: 12, fontWeight: FontWeight.w500 )
                              ),
                              Row(
                                  children: <Widget>[
                                    // three line description
                                    Text(
                                      this.model!.model!.project_type_str,
                                      style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 11),
                                    ),

                                    this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      ' . ',
                                      style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 11),
                                    ),
                                    this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      this.model!.model!.project_ending_str,
                                      style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 11),
                                    )


                                  ]
                              ),
                              Row(
                                  children: <Widget>[
                                    // three line description
                                    Text(
                                      this.model!.model!.project_class_str ,
                                      style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 11),
                                    ),

                                    this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      ' . ',
                                      style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 11),
                                    ),
                                    this.model!.model!.project_class_str ==  'Open to Suggestions'? Container(width: 0.0, height: 0.0,): Text(
                                      this.model!.model!.published_budget_str,
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


  Widget viewHeader1(BuildContext context){
    return(
        Padding(
          padding: EdgeInsets.symmetric( horizontal: 10, vertical: 10),
          child:  Html(
            // this.model!.meta.title ,
              data :model!.meta.title,
              style: {
                "html": Style(
                  fontSize: FontSize(25.0),
                  // fontWeight: FontWeight.w300
                ),
              }
            // useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith(  fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
          ),
        )
    );
  }


  Widget viewDesc(BuildContext context){
    YoutubePlayerController _controller;
    var document = parse(this.model!.model!.description!.replaceAll('<div>', '')!.replaceAll('</div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('</p>', '<br>'));
    var videoList = document.querySelectorAll("iframe");
    List<String?>? id = [];
    for (dom.Element video in videoList) {
      // print('ini list video' + video.attributes["src"]);

      // id.add(YoutubePlayer.convertUrlToId(video.attributes["src"]));
      if(video.attributes["src"]!.contains('youtube')){
        if(video.attributes["src"]!.contains('https')){

          // print('ini list video id' + YoutubePlayer.convertUrlToId(video.attributes["src"]));
          id.add(YoutubePlayer.convertUrlToId(video.attributes["src"]!));
        }else{
          // print('ini list video id' + YoutubePlayer.convertUrlToId('https:' + video.attributes["src"]));
          id.add(YoutubePlayer.convertUrlToId('https:' + video.attributes["src"]!));

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

    ScrollController? controller;
    controller = ScrollController();
    return Column(
      children: [
        ExpandablePanel(
            header:
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    20.0, 8.0, 20.0, 0.0),
                child:
                Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
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
                      HtmlWidget( readText(this.model!.model!.description!.replaceAll('<div>', '')!.replaceAll('</div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('</p>', '<br>'), 1000), isSelectable: true,),
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
                          child : HtmlWidget(this.model!.model!.description!.replaceAll('<div>', '')!.replaceAll('</div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('</p>', '<br>'),
                            isSelectable: true,
                            onTapUrl: (url) async{
                              if(url.contains('projects.co.id')){
                                if(url.contains(new RegExp(r'[0-9]'))){
                                  if(url.contains('show_conversation')){
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
                            onTapImage:(src) =>
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ShowItemScreenshots(image:'${src.sources.first.url}')),
                                ),
                          )
                      ),
                    ]
                )
            )
        ),
        id.length == 0? Container():
        Text('List Video:'),
        id.length == 0? Container():
        Container(
          height: id.length * 250.0  ,
          child:
          ListView.separated(
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
            separatorBuilder: (context, _) => const SizedBox(height: 10.0),
          ),
        )

      ],
    );


  }


  Widget viewAcceptedWorker(BuildContext context){
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model!.model!.accepted_worker_user_name == null? Container(width: 0.0, height: 0.0, color: Colors.white,):
    GFCard(
      titlePosition: GFPosition.start,
      title: GFListTile(
          avatar:GFAvatar(
            maxRadius: 40.0,
            backgroundImage: NetworkImage(
              this.model!.model!.accepted_worker_photo_url!,
            ),
            shape: GFAvatarShape.circle,
          ),
          title: Text(this.model!.model!.accepted_worker_user_name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),),
          subTitle:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Worker', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              Padding(
                padding:
                EdgeInsets.only(right: 10.0, top: 3.0),
                child:
                RatingBarIndicator(
                  rating: this.model!.model!.worker_rating_num/2 - 0.01,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: CurrentTheme.PrimaryLightColor,
                  ),
                  itemCount: 5,
                  itemSize: 14.0,
                  unratedColor: Colors.black26,
                  direction:  Axis.horizontal,
                ),

                /*
                        SmoothStarRating(
                        rating: double.tryParse(this.model!.model!.accepted_worker_worker_rating.toString()),
                        size: 14,
                        starCount: 5,
                        // allowHalfRating: true,
                        allowHalfRating: true,

                      )

                       */
              ),
              Padding(
                padding: const EdgeInsets.only( top: 5.0,right: 3.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.stars,
                      size: 11.0,
                      color: Colors.orange,
                    ),
                    Text(
                      ' ' +  this.model!.model!.accepted_worker_worker_rating_num_str,
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
              Text(this.model!.model!.accepted_worker_kabupaten_str, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),


          icon: GFIconButton(
            onPressed: null,
            icon: Icon(Icons.work),

            type: GFButtonType.transparent,
          )
      ),
      boxFit: BoxFit.contain,
      image: Image.asset(
        'assets/img/workerbg5.jpg',
        fit: BoxFit.fitHeight,
        // height: 75.0,
        // width: 80.0,
      ),


      // '${dateformat.format(model!.model!.birth_date)}'

      content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text('Rated Owner: ${model!.model!.accepted_worker_worker_rating_num_str} '),

            this.model!.model!.finish_date == null ? Container(width: 0.0, height: 0.0,) :Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RatingBarIndicator(
                    rating: double.tryParse(this.model!.model!.accepted_worker_worker_rating.toString())!/2 -0.01,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: CurrentTheme.PrimaryLightColor,
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    unratedColor: Colors.black26,
                    direction:  Axis.horizontal,
                  ),




                  // Text('  ${dateformat.format(this.model!.model!.finish_date)}'),
                ]
            ),

            this.model!.model!.finish_date == null ? Container(width: 0.0, height: 0.0,) :
            HtmlWidget(this.model!.model!.worker_feedback!.replaceAll('<div>', '')!.replaceAll('</div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('</p>', '<br>')),


          ]
      ),
      //Text(this.model!.model!.worker_feedback),
      buttonBar: GFButtonBar(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,

        children: <Widget>[
          GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute('${Env.value!.baseUrl!}/public/browse_users/view/${encode(this.model!.model!.accepted_worker_id)}/usr'));
              // urlToRoute(this.model!.model!.accepted_worker_url ));
            },
            text: 'About worker',
          ),
          /* GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.model!.owner_url  ));
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
                        Text( this.model!.model!.worker_rating_num_str),
                      ]

                  ),

                  this.model!.model!.worker_feedback == null? Container(width: 0.0, height: 0.0, color: Colors.white,): Html(data: readText(this.model!.model!.worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),
                ]
            )



    );

     */
  }

  Widget viewProjectOwner(BuildContext context){
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model!.model!.owner_owner_rating_num_str == null? Container(width: 0.0, height: 0.0, color: Colors.white,):
    GFCard(
      titlePosition: GFPosition.start,
      title: GFListTile(
          avatar:GFAvatar(
            maxRadius: 40.0,
            backgroundImage: NetworkImage(
              this.model!.model!.owner_photo_url!,
            ),
            shape: GFAvatarShape.circle,
          ),
          title: Text(this.model!.model!.owner_user_name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),),
          subTitle:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Owner', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              Padding(
                padding:
                EdgeInsets.only(right: 10.0, top: 3.0),
                child:
                RatingBarIndicator(
                  rating: this.model!.model!.owner_owner_rating_num/2 - 0.01,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: CurrentTheme.PrimaryLightColor,
                  ),
                  itemCount: 5,
                  itemSize: 14.0,
                  unratedColor: Colors.black26,
                  direction:  Axis.horizontal,
                ),

                /*
                        SmoothStarRating(
                        rating: double.tryParse(this.model!.model!.accepted_worker_worker_rating.toString()),
                        size: 14,
                        starCount: 5,
                        // allowHalfRating: true,
                        allowHalfRating: true,

                      )

                       */
              ),
              Padding(
                padding: const EdgeInsets.only( top: 5.0,right: 3.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.stars,
                      size: 11.0,
                      color: Colors.orange,
                    ),
                    Text(
                      ' ' +  this.model!.model!.owner_owner_rating_num_str,
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
              Text(this.model!.model!.owner_kabupaten_str, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),


          icon: GFIconButton(
            onPressed: null,
            icon: Icon(Icons.monetization_on),

            type: GFButtonType.transparent,
          )
      ),
      boxFit: BoxFit.contain,
      image: Image.asset(
        'assets/img/workerbg4.jpg',
        fit: BoxFit.fitHeight,
        // height: 75.0,
        // width: 80.0,
      ),


      // '${dateformat.format(model!.model!.birth_date)}'
      // json['owner_rating_num'] as int,
      //  json['owner_rating_num_str'] as String,

      content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text('Rated Owner: ${model!.model!.owner_rating_num_str} '),

            this.model!.model!.finish_date == null ? Container(width: 0.0, height: 0.0,) : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RatingBarIndicator(
                    rating: double.tryParse(this.model!.model!.owner_rating_num.toString())!/2 - 0.01,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: CurrentTheme.PrimaryLightColor,
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    unratedColor: Colors.black26,
                    direction:  Axis.horizontal,
                  ),



                  Text('  ${dateformat.format(this.model!.model!.finish_date)}'),
                ]
            ),

            this.model!.model!.finish_date == null ? Container(width: 0.0, height: 0.0,) : // Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // children: <Widget>[
            HtmlWidget(this.model!.model!.owner_feedback!.replaceAll('<div>', '')!.replaceAll('</div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('</p>', '<br>')),
            //   ]
            // ),

          ]
      ),
      //Text(this.model!.model!.worker_feedback),
      buttonBar: GFButtonBar(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,

        children: <Widget>[
          /*
          this.model!.model!.finish_date == null ? Container(width: 0.0, height: 0.0,) : GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.model!.accepted_worker_url ));
            },
            text: 'About worker',
          ),

           */
          GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.model!.owner_url  ));
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
                    Text( this.model!.model!.owner_owner_rating_num_str),
                  ]

              ),

              this.model!.model!.owner_feedback == null? Container(width: 0.0, height: 0.0, color: Colors.white,): Html(data: readText(this.model!.model!.owner_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),
            ]
        )



    );

     */
  }

  @override
  Widget viewAttachments (BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    if(model!.model!.attachments == null){
      return(Container(height: 0, width: 0) );
    }
    if(model!.model!.attachments_name != ''){

      return(  FileViewAtt(
        ctx : context,
        value: model!.model!.attachments_name,
        value1: model!.model!.attachments_url,
        caption: 'Attachments',
      ));
      /*
      return( FileViewRev(
       // ctx : context,
        value: model!.model!.attachments_name,
        value1: model!.model!.attachments_url,
        caption: 'Attachments',
      )
      );

       */
    }else{
      return( Container(height: 0, width: 0) );
    }

  }


  Widget viewChannels1 (BuildContext context) {
    if(this.model!.model!.channels_url != null){
      return( 	ChannelRouteTagsWidget(
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
            MaterialPageRoute(builder: (context) => UserMyProjectsListing(id: val!.split('?')[1])),
          );
          // AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val));

        },
      ));
    }else{
      return( 	ChannelNonURLRouteWidget(
        value: this.model!.model!.channels_id,
        caption: '',
        hint: ' ',
        required: true,
        idroutetags: this.model!.model!.channels_id,
        nameroutetags: this.model!.model!.channels_str,
      ));

    }
  }

  Widget viewOwner (BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, bottom: 5),
            child:           Text('Project Owner:', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)

        ),
        Row(
          children:<Widget>[
            GestureDetector(
              onTap: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(this.model!.model!.owner_url));
              },
              child:
              Padding(
                padding: EdgeInsets.only( top: 5, bottom:5, left:12),
                child:
                ShowAvatar(avatar:this.model!.model!.owner_photo_url),
                /*
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    this.model!.model!.owner_photo_url!,
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
                    context,
                    urlToRoute(this.model!.model!.owner_url));
              },
              child:
              Padding(
                padding: EdgeInsets.only( top: 1),
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${filterShortcodes(this.model!.model!.owner_str)} ',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),

                              Row(
                                  children:<Widget>[
                                    Padding(
                                      padding:
                                      EdgeInsets.only( top: 2.0),
                                      child:
                                      RatingBarIndicator(
                                        rating: this.model!.model!.owner_owner_rating_num.toDouble()/2-0.01,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: CurrentTheme.PrimaryLightColor,
                                        ),
                                        itemCount: 5,
                                        itemSize: 18.0,
                                        unratedColor: Colors.black26,
                                        direction:  Axis.horizontal,
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
                                      '(${this.model!.model!.owner_owner_rating_num.toStringAsPrecision(2)}/10.00)',
                                      style: TextStyle(fontSize: 15),
                                    ),

                                  ]

                              ),
                            //  Text('23 project'),
                            //  Text('last seen 10 minutes ago' , style: TextStyle(fontSize: 15)),

                              //  Text('${this.model!.model!.owner_projects_owned} project'),
                              //  this.model!.model!.owner_last_seen == null? Container():Text('last seen ' +timeago.format(this.model!.model!.owner_last_seen), style: TextStyle(fontSize: 15)),
                              // Text('last seen dummy ago', style: TextStyle(fontSize: 15)),


                            ]
                        ),
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
        this.model!.model!.project_status_id == 9 ?
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child:
            Text('Rated Worker: ${this.model!.model!.worker_rating_num.toString()}/10.00')

        )
            : Container(),

        this.model!.model!.project_status_id == 9 ?
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child:
            HtmlWidget(this.model!.model!.worker_feedback!.replaceAll('<div>', '')!.replaceAll('</div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('</p>', '<br>'))

        )
            : Container(),

        SizedBox(height: 10,),
      ],
    );
  }


  Widget viewWorker (BuildContext context){
    return this.model!.model!.accepted_worker_str == ''?  SizedBox(height: 30,) :
     Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, bottom: 5, top: 20),
            child:           Text('Project Worker:', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)

        ),
        Row(
          children:<Widget>[
            GestureDetector(
              onTap: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(this.model!.model!.accepted_worker_url));
              },
              child:
              Padding(
                padding: EdgeInsets.only( top: 5, bottom:5, left:12),
                child:
                ShowAvatar(avatar:this.model!.model!.accepted_worker_photo_url),
                /*
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    this.model!.model!.owner_photo_url!,
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
                    context,
                    urlToRoute(this.model!.model!.accepted_worker_url));
              },
              child:
              Padding(
                padding: EdgeInsets.only( top: 1),
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${filterShortcodes(this.model!.model!.accepted_worker_str)} ',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),

                              Row(
                                  children:<Widget>[
                                    Padding(
                                      padding:
                                      EdgeInsets.only( top: 2.0),
                                      child:
                                      RatingBarIndicator(
                                        rating: this.model!.model!.accepted_worker_worker_rating_num.toDouble()/2-0.01,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: CurrentTheme.PrimaryLightColor,
                                        ),
                                        itemCount: 5,
                                        itemSize: 18.0,
                                        unratedColor: Colors.black26,
                                        direction:  Axis.horizontal,
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
                                      '(${this.model!.model!.accepted_worker_worker_rating_num.toStringAsPrecision(2)}/10)',
                                      style: TextStyle(fontSize: 15),
                                    ),

                                  ]

                              ),
                             // Text('23 project'),
                             // Text('last seen 10 minutes ago' , style: TextStyle(fontSize: 15)),
                              //  Text('${this.model!.model!.owner_projects_owned} project'),
                              //  this.model!.model!.owner_last_seen == null? Container():Text('last seen ' +timeago.format(this.model!.model!.owner_last_seen), style: TextStyle(fontSize: 15)),
                              // Text('last seen dummy ago', style: TextStyle(fontSize: 15)),


                            ]
                        ),
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
        this.model!.model!.project_status_id == 9 ?
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child:
            Text('Rated Owner: ${this.model!.model!.owner_rating_num.toString()}/10')

        )
            : Container(),

        this.model!.model!.project_status_id == 9 ?
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child:
            HtmlWidget(this.model!.model!.owner_feedback!.replaceAll('<div>', '')!.replaceAll('</div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('</p>', '<br>'))

        )            : Container(),

        SizedBox(height: 10,),
      ],
    );
  }


  projectInfo(BuildContext context){
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.subtitle1;
    var dateformat = DateFormat('dd/MM/yyyy');
    return  Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child :
        Container(
            height: 150,
            color: CurrentTheme.PrimaryLightColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          'Published Budget: ',
                          style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                        Text(
                          '${this.model!.model!.published_budget_str}',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          'Finish Days: ',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),
                        Text(
                          '${this.model!.model!.finish_days.toString()}',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),


                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          'Published Date: ',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                        /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item!.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                        this.model!.model!.published_date == null ? Container():
                        Text(
                          '${dateformat.format(this.model!.model!.published_date)}',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          'Start Date: ',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                        /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item!.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                        this.model!.model!.start_date == null ? Container():
                        Text(
                          '${dateformat.format(this.model!.model!.start_date)}',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          'Finish Date: ',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                        /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item!.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                        this.model!.model!.finish_date == null ? Container():
                        Text(
                          '${dateformat.format(this.model!.model!.finish_date)}',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                      ]
                  ),
                ),
              ],
            )
        )
    );
  }

  projectStatus(BuildContext context){
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.subtitle1;
    var dateformat = DateFormat('dd/MM/yyyy');
    String? sts = this.model!.model!.project_status_str!.split('>')[1].split('<')[0];
    return  Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
        child :
        Container(
            height: 120,
            color: CurrentTheme.PrimaryLightColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          'Project status: ',
                          style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                        Text(
                          '$sts',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          'Accepted Worker: ',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),
                        Text(
                          '${this.model!.model!.accepted_worker_user_name}',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),


                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          'Accepted Budget: ',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                        /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item!.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                        Text(
                          '${this.model!.model!.accepted_budget_str}',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          'Project Ending: ',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                        /*
                                              // three line description
                                              SmoothStarRating(
                                                rating: info!.item!.worker_rating.toDouble(),
                                                size: 15,
                                                starCount: 5,
                                                // allowHalfRating: true,
                                                color: CurrentTheme.PrimaryDarkColor,
                                                allowHalfRating: true,

                                              ),

                                               */
                        Text(
                          '${this.model!.model!.project_ending_str}',
                          style: descriptionStyle.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),

                      ]
                  ),
                ),

              ],
            )
        )
    );
  }


  Widget viewBidder (BuildContext context){
    if(this.model!.model!.shortlisted_bids.items.length == 0 || this.model!.model!.description.contains('This is a private project.')){
      return Container(height:0 , width: 0);
    }else{
      return   Container(
        height: 245.0,
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: this.model!.model!.shortlisted_bids.items.length == 0?
        Container(width : 0.0, height : 0.0)

            : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 3),
                  child:           Text('User Bids:', style:  TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)

              ),
              Container(
                height: 222.0, //375
                padding: const EdgeInsets.fromLTRB(
                    0.0, 0.0, 0.0, 0.0),

                child:
               ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int? index) {
                    return index! >= this.model!.model!.shortlisted_bids.items.length
                        ? Container(width : 0.0, height : 0.0)
                        :ShortBidItem(model: this.model!.model!.shortlisted_bids.items[index], info : this.model!.model!.shortlisted_bids );
                  },
                  // itemCount: this.model!.model!.user_bids.items.length <= 8
                  //     ? this.model!.model!.user_bids.items.length
                  //     : 8,
                  itemCount: this.model!.model!.shortlisted_bids.items.length,
                  // controller: controller1,
                ),
              )
            ]
        ) ,

      );
    }
  }


  @override
  Widget view (BuildContext context, ScrollController? controller , bool? account, bool _isBannerAdReady,  _bannerAd) {


    viewChildren.clear();

    //viewHeader
    viewChildren.add(viewHeader1(context));
    viewChildren.add(viewAttachments(context));

    viewChildren.add(viewDesc(context));

    viewChildren.add(SizedBox(height: 5,));
    viewChildren.add( Padding(
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: viewChannels1(context))
    );

    viewChildren.add(projectInfo(context));
    viewChildren.add(projectStatus(context));

    viewChildren.add(viewOwner(context));
    viewChildren.add(viewWorker(context));
    viewChildren.add(viewBidder(context));
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
    // viewChildren.add(viewAcceptedWorker(context));
    // viewChildren.add(viewProjectOwner(context));


    // viewChildren.add(viewInfo(context));


    if(this.model!.meta.after_content != null){ viewChildren.add(Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
      child:  Html(data: this.model!.meta.after_content),
    ));}


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


class ShortBidItem extends StatelessWidget {
  final ItemShortlistedBids? model;
  final ShortlistedBidsListingTools? info;
  ShortBidItem({this.model, this.info});
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
                    urlToRoute(this.model!.buttons![0]!.url! ));
                /*
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(Env.value!.baseUrl! + '/public/browse_users/view/' + encode(model!.worker_user_id) +'/zzz'));

                 */
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
                      child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                // In order to have the ink splash appear above the image, you
                                // must use Ink.image. This allows the image to be painted as part
                                // of the Material and display ink effects above it. Using a
                                // stan
                                // dard Image will obscure the ink splash.
                                child:
                                Container(
                                  height: 215.0,
                                  width: 155.0,
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 18,),

                                      SizedBox(
                                        height: 92.0,
                                        width: 115.0,
                                        child: Stack(
                                            children: <Widget>[
                                              Positioned.fill(
                                                  bottom: 0.0,
                                                  left: 20.0,
                                                  right: 0.0,
                                                  // In order to have the ink splash appear above the image, you
                                                  // must use Ink.image. This allows the image to be painted as part
                                                  // of the Material and display ink effects above it. Using a
                                                  // standard Image will obscure the ink splash.
                                                  child:

                                                 ShowAvatar(avatar : model!.worker_photo_url!, ishuge: false,)

                                              ),
                                            ]
                                        ),
                                      ),

                                      Padding(
                                        padding:
                                        EdgeInsets.only(left: 20.0, right: 10.0, top: 5.0),
                                        child: //Html(data:readText(model!.user_name, 35),defaultTextStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500 ))
                                        Text(model!.worker_user_name!,
                                            softWrap: false,
                                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                                        ),
                                      ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsets.only(left: 20.0, top: 5.0),
                                            child:
                                            RatingBarIndicator(
                                              rating: model!.worker_worker_rating!/2 -0.01,
                                              itemBuilder: (context, index) => Icon(
                                                Icons.star,
                                                color: CurrentTheme.PrimaryLightColor,
                                              ),
                                              itemCount: 5,
                                              itemSize: 11.0,
                                              unratedColor: Colors.black26,
                                              direction:  Axis.horizontal,
                                            ),
                                          ),
                                          Text('(${model!.worker_worker_rating.toString()})', style: TextStyle(
                                            fontSize: 14.0,)),
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
                                      /*
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0, top: 2.0,right: 3.0),
                                        child:
                                        Text('${model!.worker_projects_completed.toString()} Project Selesai', style: TextStyle(
                                          fontSize: 14.0,)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0, top: 2.0,right: 3.0),
                                        child:
                                        model!.worker_projects_won >= 1 ?
                                        Text('${((model!.worker_projects_completed/model!.worker_projects_won)*100).toStringAsFixed(2)} % Penyelesaian', style: TextStyle(
                                          fontSize: 14.0,))
                                            :Text('- Penyelesaian', style: TextStyle(
                                          fontSize: 14.0,)),
                                      ),

                                       */



                                    ],
                                  ),
                                )

                              /*
                                      ShowWorkerWithRating(username : model!.worker_user_name,
                                      avatar: model!.worker_photo_url!,
                                      rating: model!.worker_worker_rating_num,
                                      viewRating: model!.worker_worker_rating_num_str,
                                      projects: '',
                                      )

                                     */
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

class MyBidItem extends StatelessWidget {
  final ItemShortlistedBids? model;
  final ShortlistedBidsListingTools? info;
  MyBidItem({this.model, this.info});

  @override
  Widget build(BuildContext context) {
  /*
  List<ItemButton> buttons;
  String? bid_id;
  String? worker_photo_url;
  Photo? worker_photo;
  String? worker_user_name;
  int?  worker_worker_point;
  String? worker_worker_point_str;
  int?  worker_worker_ranking;
  String? worker_worker_ranking_str;
  int? worker_kabupaten_id;
  String? worker_kabupaten_str;
  int?  worker_worker_rating;
  double? amount;
  String? amount_str;
  int? matching_skills;
  String? message;
  String? attachments_name;
  String? attachments_url;
   SList<FileField?>? attachments;
   */


    return

      GFCard(
      titlePosition: GFPosition.start,
      title: GFListTile(
          avatar:GFAvatar(
            maxRadius: 40.0,

            backgroundImage: NetworkImage(
              this.model!.worker_photo_url!,
            ),
            shape: GFAvatarShape.circle,
          ),
          title:
          GestureDetector(
            onTap: (){
                  AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.buttons![0]!.url! ));
          },
            child: Text(this.model!.worker_user_name!, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),),

          ),

          subTitle:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Owner', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              Padding(
                  padding:
                  EdgeInsets.only(right: 10.0, top: 3.0),
                  child:
                  RatingBarIndicator(
                    rating: double.parse(this.model!.worker_worker_rating.toString()),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: CurrentTheme.PrimaryLightColor,
                    ),
                    itemCount: 5,
                    itemSize: 14.0,
                    unratedColor: Colors.black26,
                    direction:  Axis.horizontal,
                  ),


                /*
                        SmoothStarRating(
                        rating: double.tryParse(this.model!.model!.accepted_worker_worker_rating.toString()),
                        size: 14,
                        starCount: 5,
                        // allowHalfRating: true,
                        allowHalfRating: true,

                      )

                       */
              ),
              Padding(
                padding: const EdgeInsets.only( top: 5.0,right: 3.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 11.0,
                      color: Colors.orange,
                    ),
                    Text(
                      ' ' +  this.model!.worker_worker_rating.toString(),
                      softWrap: false,
                      style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Sans",
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Text(this.model!.worker_worker_point.toString() + ' ' + 'poin',
                softWrap: false,
                style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Sans",
                    color: Colors.black54),
              ),
              Text( this.model!.worker_worker_ranking_str!,
                softWrap: false,
                style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Sans",
                    color: Colors.black54),
              ),
              Text(this.model!.worker_kabupaten_str!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),


          icon: GFIconButton(
            onPressed: null,
            icon: Icon(Icons.monetization_on),

            type: GFButtonType.transparent,
          )
      ),
    //  boxFit: BoxFit.contain,
     /*
      image: Image.asset(

        'assets/img/workerbg4.jpg',
        fit: BoxFit.fitHeight,
        // height: 75.0,
        // width: 80.0,
      ),
      */


      // '${dateformat.format(model!.model!.birth_date)}'
      // json['owner_rating_num'] as int,
      //  json['owner_rating_num_str'] as String,

      content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            // Text('Rated Owner: ${model!.model!.owner_rating_num_str} '),
            this.model!.attachments == null || model!.attachments_name == '' ? Container(height: 0, width: 0) :
            FileViewRev(
              // ctx : context,
              value: this.model!.attachments_name,
              value1: this.model!.attachments_url,
              caption: 'Attachments',
            ),


            this.model!.message == null || this.model!.message == '' ? Container(width: 0.0, height: 0.0,) : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HtmlWidget(this.model!.message!.replaceAll('<div>', '').replaceAll('</div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('</p>', '<br>')),
                ]
            ),

          ]
      ),
      //Text(this.model!.model!.worker_feedback),
      buttonBar: GFButtonBar(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,

        children: <Widget>[
        /*
          GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.buttons![0]!.url! ));
            },
            text: this.model!.buttons[0].text,
          ),

         */
          GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.buttons![1]!.url! ));
            },
            text: this.model!.buttons![1]!.text!,
          ),
          GFButton(
            onPressed: () {
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(this.model!.buttons![2]!.url! ));
            },
            text: this.model!.buttons![2]!.text!,
          ),
        ],
      ),
    );




  /*

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                // return BidItemInfo(info : this.info);
                //  Navigator.push(
                //    context,
                //    MaterialPageRoute(builder: (context) => BidItemInfo(info : this.info)),
                //  );
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(Env.value!.baseUrl! + model!.buttons![0]!.url!));
                //   Navigator.push(
                //    context,
                //     MaterialPageRoute(builder: (context) => BidItemInfo(info : this.info)),
                //   );

              },
              child: Container(
                height: 180.0,
                width: 120.0,
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 170.0,
                      width: 120.0,
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
                                Text('Helllo'),
                                 /*
                                ShowWorkerWithRating(username : model!.worker_user_name,
                                  avatar: model!.worker_photo_url!,
                                  rating: model!.worker_worker_rating,
                                  viewRating: model!.ra,
                                  projects: '',
                                )

                                  */
                              /*
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:Image.network(
                                            model!.worker_photo_url!,
                                            fit: BoxFit.fitHeight,
                                          )


                              )

                                  */
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

   */




  }
}

class DescMyProjectsInfo extends StatelessWidget {
  final ViewModelMyProjectsRev? info;
  final String? title;
  ScrollController? controller;
  DescMyProjectsInfo({this.info, this.title});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            backgroundColor: CurrentTheme.MainAccentColor,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: Row (
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0 , 0.0),
                  child:  ClipRRect(
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
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 2.0 , 0.0),
                  child:
                  Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
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
                    child:  Html(data: this.info!.description!.replaceAll('<div>', '').replaceAll('</div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('</p>', '<br>'),
                        onLinkTap: (url, _, __, ___) async{
                          if(url!.contains('projects.co.id')){


                            if(url.contains(new RegExp(r'[0-9]'))){
                              if(url.contains('show_conversation')){
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
                        onImageTap:(src, _, __, ___) {
                          // print('print source : $src');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShowItemScreenshots(image:'$src')),
                          );

                        }
                    ),
                  ),


                ]
            )

        )


    );

  }
}

///////////////////////////////////////////////////


class MyProjectsListingModel extends MyProjectsListingBase{
  Map<String, dynamic> json;
  MyProjectsListingModel(Map<String, dynamic> this.json):super(json);

  //@override
  Widget viewItemId1 (ItemMyProjectsModel item,String search, int? index, bool? account, String? id, ChatBloc? cb) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item!.toJson())).contains(search)),
        //  child:  ItemMyProjectsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemMyProjectsCard1(destination :item, search : search, shape : shape, height : height, account : account, username: id, cb : cb)
    );
  }
}

//class ItemMyProjects extends class ItemMyProjectsBase{
//
//}

////////////////////////////

class ItemMyProjectsCard1 extends StatelessWidget {
  const ItemMyProjectsCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account, this.username, this.cb})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyProjectsModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;
  final String? username;
  final ChatBloc? cb;


  @override
  Widget build(BuildContext context) {
    /*
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
          child: Column(
            children: <Widget>[
              // const SectionTitle(title: ''),

              Container(
                // height:index == 0 ?  315 : height,
               // height: destination!.item!.published_date == null? 315 : destination!.item!.short_description.length < 100? 240 :destination!.item!.short_description.length < 200? 285 : 330,
                /*  height: destination!.item!.short_description.length < 200 ?  destination!.item!.short_description.length.toDouble()*3.3
                     : destination!.item!.short_description.length < 400 ?  destination!.item!.short_description.length.toDouble()*3.7/4
                     : destination!.item!.short_description.length < 600 ?  destination!.item!.short_description.length.toDouble()*3.4/4
                     : destination!.item!.short_description.length.toDouble()*3.6/4 ,
                     */

                /*   child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                margin: EdgeInsets.all(0.0),
                borderOnForeground : false, */
                child: ItemMyProjectsContent2(destination: destination,  account : account, username: username) ,
                //  child: index == 0 ? ItemMyProjectsContent2(destination: destination,  account : account) :ItemMyProjectsContent1(destination: destination, account : account),
                //   ),
              ),

              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                alignment: Alignment.center,
                height: 10.0,
                decoration:BoxDecoration(
                  //color: Colors.lightBlue[100],
                  color:CurrentTheme.ListColor,
                ),
              )



            ],
          )
      ),
    );

     */
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

            child: ItemMyProjectsContent2(destination: destination,  account : account, username: username, cb: cb) ,

      ),

      ),
    );
  }
}

class ItemMyProjectsContent2 extends StatelessWidget {
  const ItemMyProjectsContent2({ Key? key, @required this.destination, this.account, this.username, this.cb })
      : assert(destination != null),
        super(key: key);

  final ItemMyProjectsModel? destination;
  final bool? account ;
  final String? username;
  final ChatBloc? cb;



  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final size =MediaQuery.of(context).size;
    final width =size.width;
    String? myHash = '';
    if(this.username == destination!.item!.owner_str){
      myHash = encode(destination!.item!.owner_id!);

    }else{
      myHash = encode(destination!.item!.accepted_worker_id!);

    }
   // ChatBloc _chatBloc;
    final List<Widget> children = <Widget>[


      Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle!,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 16.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle,
                  child: Container(
                    width: 250,
                    child:
                      // three line description
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child:       destination!.item!.published_date == null? Html(data: destination!.item!.project_status_str,
                          //  defaultTextStyle: TextStyle(color: CurrentTheme.ErrorColor),
                          style: {
                            "html": Style(
                              color: CurrentTheme.ErrorColor,
                            ),
                          },
                        ) : Html(data: destination!.item!.project_status_str!.toUpperCase(),
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
              // three line description

              destination!.item!.project_status_str!.toLowerCase().contains('running') ?
                  Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      destination!.item!.buttons != null?
                      destination!.item!.buttons!.length == 1?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![0]!.url! ));
                          }
                          if(value == 2) {
                              String? idHash = '';
                              int? peer ;
                              String? peerUsername;
                              String? peerLink;
                              if(this.username == destination!.item!.owner_str){
                                idHash = encode(destination!.item!.owner_id!);
                                peer = destination!.item!.accepted_worker_id;
                                peerLink = destination!.item!.accepted_worker_photo_url;
                                peerUsername = destination!.item!.accepted_worker_str;
                              }else{
                                idHash = encode(destination!.item!.accepted_worker_id!);
                                peer = destination!.item!.owner_id;
                                peerLink = destination!.item!.owner_photo_url;
                                peerUsername= destination!.item!.owner_str;
                              }

                             // _chatBloc =ChatBloc();
                              // if(widget.id == '')

                             // _chatBloc.wsSetHandlers();
                              //_chatBloc.lgn(widget.id);
                            //  _chatBloc.lg(idHash);
                              //$idHash/${encode(this.model!.model!.owner_id)}
                              String? thread = '';
                              if(decode(idHash) > peer! ){
                                thread = '${encode(peer)}/$idHash';
                              }else{
                                thread = '$idHash/${encode(peer)}';
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChatScreen(
                                      user: {

                                        "thread":"$thread",
                                        "username":"${peerUsername}",
                                        "userid":"${encode(peer!)}",
                                        "display":"${peerUsername}",
                                        "avatar":"${peerLink}",
                                        "lastmesssage":"",
                                        "lastseen":1606880840,
                                        "lasttime":1234567890

                                      },
                                      userID : idHash,
                                      chatBloc : cb,
                                      trans : true,
                                      ctx: context,
                                    ),
                                  )
                              ).then((value)async{
                               // _chatBloc.dispose();
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.setBool('chatlink', true );
                              });




                          }
                          if(value == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),

                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text('Chat'),
                          ),
                          const PopupMenuItem<int>(
                            value: 3,
                            child: Text('Browse Users'),

                          ),

                        ],
                      ):
                      destination!.item!.buttons!.length == 2?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
                              /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

                               */

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';

                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
                              /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

                               */

                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }


                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 3?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
                              /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

                               */

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }

                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 4,
                            child: Text('Browse Users'),

                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 4?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id

                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }



                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }

                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 5,
                            child: Text('Browse Users'),

                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 5?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                              if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 6,
                            child: Text('Browse Users'),

                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 6?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                                     }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */



                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                                    }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }


/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
                             /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

                              */

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![5]!.url! ));
                          }
                          if(value == 7) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item!.buttons![5]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 7,
                            child: Text('Browse Users'),

                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 7?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }
/*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */

                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![5]!.url! ));
                          }
                          if(value == 7) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![6]!.url! ));
                          }
                          if(value == 8) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item!.buttons![5]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 7,
                            child: Text(destination!.item!.buttons![6]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 8,
                            child: Text('Browse Users'),

                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 8?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![5]!.url! ));
                          }
                          if(value == 7) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![6]!.url! ));
                          }
                          if(value == 8) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![7]!.url! ));
                          }
                          if(value == 9) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item!.buttons![5]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 7,
                            child: Text(destination!.item!.buttons![6]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 8,
                            child: Text(destination!.item!.buttons![7]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 9,
                            child: Text('Browse Users'),

                          ),
                        ],
                      ): Container(height: 0.0, width: 0.0, color: Colors.white,):
                      Container(height: 0.0, width: 0.0, color: Colors.white,),

                    ]
                ),
                //settingsRow,
              )
                  :Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      destination!.item!.buttons != null?
                      destination!.item!.buttons!.length == 1?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![0]!.url! ));
                          }
                          if(value == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 2,
                            child: Text('Browse Users'),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 2?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }
                            else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 3,
                            child: Text('Browse Users'),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 3?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 4,
                            child: Text('Browse Users'),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 4?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';



                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }





                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }

                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 5,
                            child: Text('Browse Users'),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 5?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 6,
                            child: Text('Browse Users'),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 6?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![5]!.url! ));
                          }
                          if(value == 7) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item!.buttons![5]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 7,
                            child: Text('Browse Users'),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 7?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![5]!.url! ));
                          }
                          if(value == 7) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![6]!.url! ));
                          }
                          if(value == 8) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item!.buttons![5]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 7,
                            child: Text(destination!.item!.buttons![6]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 8,
                            child: Text('Browse Users'),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 8?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show bids'){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.title}', cb: cb)),
                              );
                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '/user/my_projects/show_thread/${destination!.item!.project_id}/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0].replaceAll('https://cdn.projects.co.id/upload/', '').replaceAll('https://www.gravatar.com/avatar/', 'gravatar').replaceAll('/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![5]!.url! ));
                          }
                          if(value == 7) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![6]!.url! ));
                          }
                          if(value == 8) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![7]!.url! ));
                          }
                          if(value == 9) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  SearchBrowseUsersListing1(
                                      id: '', title: '', cb: null)),
                            );
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item!.buttons![5]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 7,
                            child: Text(destination!.item!.buttons![6]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 8,
                            child: Text(destination!.item!.buttons![7]!.text!),
                          ),
                          const PopupMenuItem<int>(
                            value: 9,
                            child: Text('Browse Users'),
                          ),
                        ],
                      ): Container(height: 0.0, width: 0.0, color: Colors.white,):
                      Container(height: 0.0, width: 0.0, color: Colors.white,),

                    ]
                ),
                //settingsRow,
              ),

            ],
          ),
        ),
      ),


      Container(
      // height:  120.0,
      padding:  const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
      child:
            GestureDetector(
              onTap: () {
                if(destination!.item!.buttons![destination!.item!.buttons!.length - 1]!.url!.contains('past_projects') || destination!.item!.buttons![destination!.item!.buttons!.length - 1]!.url!.contains('my_projects')){
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute(destination!.item!.buttons![destination!.item!.buttons!.length - 1]!.url! ));

                }else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        rt.PublicBrowseProjectsView(id: '${urlToRoute(
                            destination!.item!.buttons![destination!.item!.buttons!.length -
                                1]!.url!).split('/')[4]}',
                            title: '${urlToRoute(
                                destination!.item!.buttons![destination!.item!.buttons!
                                    .length - 1]!.url!).split('/')[5]}',
                            cb: cb)),
                  );
                }
                /*
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(destination!.item!.buttons![destination!.item!.buttons!.length - 1]!.url ));


                 */
              },
              child:
                  Ink(
                  child: Html(data: readText(destination!.item!.title! , 150) ,
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
                  urlToRoute(destination!.item!.buttons![destination!.item!.buttons!.length - 1]!.url! ));
            },
            child:
            Ink(
                child: Html(data: readText(destination!.item!.short_description!.replaceAll('<div>', '').replaceAll('</div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('</p>', '<br>'),400) ,
                 // useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(fontSize: 12 ),
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

      // Description and share/explore buttons!.
      destination!.item!.project_status_str!.toLowerCase().contains('no action') ?
      Padding(
          padding:  const EdgeInsets.fromLTRB(20.0, 0.0, 16.0, 0.0),
          child: Text('Accepted Worker: none'),
       )
      :Padding(
        //accepted_worker_url
        padding:  const EdgeInsets.fromLTRB(20.0, 0.0, 16.0, 0.0),
        child:

                GestureDetector(
                  onTap: () {
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute(destination!.item!.accepted_worker_url! ));
                  },
                  child:
                Text('Accepted Worker: ${destination!.item!.accepted_worker_str?? ''}'),
            )
      ),
      destination!.item!.accepted_worker_user_name != '' && destination!.item!.owner_str != ''  ? ButtonBarTheme(
        data: ButtonBarThemeData(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.9 * width,
        ),
        child: ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 0.9 * width,
            children: <Widget>[
              destination!.item!.project_status_str!.toUpperCase().contains('CODER SELECTED')?
              ElevatedButton(
                  child: Text('My Orders'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                    overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                  ),

                  onPressed: () {
                    String? idHash = '';




                    if(this.username == destination!.item!.owner_str){
                      idHash = encode(destination!.item!.owner_id!);

                    }else{
                      idHash = encode(destination!.item!.accepted_worker_id!);

                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => rt.UserMyOrdersIndex(id :  idHash!)),
                    );





                  }
              ):
              Container(),
              ElevatedButton(
                  child: Text('Chat'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                    overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                  ),

                  onPressed: () {
                    String? idHash = '';
                    int? peer ;
                    String? peerUsername;
                    String? peerLink;



                    if(this.username == destination!.item!.owner_str){
                      idHash = encode(destination!.item!.owner_id!);
                      peer = destination!.item!.accepted_worker_id;
                      peerLink = destination!.item!.accepted_worker_photo_url;
                      peerUsername = destination!.item!.accepted_worker_str;
                    }else{
                      idHash = encode(destination!.item!.accepted_worker_id!);
                      peer = destination!.item!.owner_id;
                      peerLink = destination!.item!.owner_photo_url;
                      peerUsername= destination!.item!.owner_str;
                    }

                  //  _chatBloc =ChatBloc();
                    // if(widget.id == '')

                   // _chatBloc.wsSetHandlers();
                    //_chatBloc.lgn(widget.id);
                   // _chatBloc.lg(idHash);
                    //$idHash/${encode(this.model!.model!.owner_id)}
                    String? thread = '';
                    if(decode(idHash) > peer! ){
                      thread = '${encode(peer)}/$idHash';
                    }else{
                      thread = '$idHash/${encode(peer)}';
                    }

                   if(cb != null){


                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            user: {

                              "thread":"$thread",
                              "username":"${peerUsername}",
                              "userid":"${encode(peer!)}",
                              "display":"${peerUsername}",
                              "avatar":"${peerLink}",
                              "lastmesssage":"",
                              "lastseen":1606880840,
                              "lasttime":1234567890

                            },
                            userID : idHash,
                            chatBloc : cb,
                            trans : true,
                            ctx: context,
                          ),
                        )
                    ).then((value)async{
                     // _chatBloc.dispose();
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool('chatlink', true );
                    });
                    }else{
                     var cb1 =  AppProvider.getApplication(context).chat;
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (_) => ChatScreen(
                             user: {

                               "thread":"$thread",
                               "username":"${peerUsername}",
                               "userid":"${encode(peer!)}",
                               "display":"${peerUsername}",
                               "avatar":"${peerLink}",
                               "lastmesssage":"",
                               "lastseen":1606880840,
                               "lasttime":1234567890

                             },
                             userID : idHash,
                             chatBloc : cb1,
                             trans : true,
                             ctx: context,
                           ),
                         )
                     ).then((value)async{
                       // _chatBloc.dispose();
                       SharedPreferences prefs = await SharedPreferences.getInstance();
                       prefs.setBool('chatlink', true );
                     });
                   }





                  }
              )
            ]
        ),
      ) : Container(),
      Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 16.0, 0.0, 15.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Row(

            children: <Widget>[
              // three line description
            destination!.item!.published_date == null? Container(height: 0.0, width: 0.0, color: Colors.white ,) :  Text(
                'Published ',
                style: descriptionStyle.copyWith( fontSize: 13),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child:destination!.item!.published_date == null?  Container(height: 0.0, width: 0.0, color: Colors.white ,): Text(timeago.format(destination!.item!.published_date!)
                  ,
                  style: descriptionStyle.copyWith( fontSize: 13),
                ),
              ),
              destination!.item!.published_date == null? Container(height: 0.0, width: 0.0, color: Colors.white ,):Text(
                ' ',
                style: descriptionStyle.copyWith( fontSize: 13),
              ),
                destination!.item!.published_date == null? Container(height: 0.0, width: 0.0, color: Colors.white ,): destination!.item!.project_class_str == 'Open to Suggestions'? Text(
                  'Open to Suggestions', style: descriptionStyle.copyWith( fontSize: 13)): Text(
                destination!.item!.published_budget_str!,
                style: descriptionStyle.copyWith( fontSize: 13),
              ),

              /*
             Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      destination!.item!.buttons != null?
                      destination!.item!.buttons!.length == 1?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 2?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 3?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 4?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }

                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 5?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 6?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![5]!.url! ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item!.buttons![5]!.text!),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 7?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![5]!.url! ));
                          }
                          if(value == 7) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![6]!.url! ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item!.buttons![5]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 7,
                            child: Text(destination!.item!.buttons![6]!.text!),
                          ),
                        ],
                      ):
                      destination!.item!.buttons!.length == 8?
                      PopupMenuButton<int>(
                        onSelected: (int value) {
                          if(value == 1) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![0]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![0]!.url! ));

                            }

                          }
                          if(value == 2) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![1]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![1]!.url! ));

                            }

                          }
                          if(value == 3) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![2]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![2]!.url! ));

                            }

                          }
                          if(value == 4) {

                            //"url": "\/user\/my_projects\/show_thread\/97e116\/artikel-2",
                            //"url": "\/user\/my_projects\/show_thread\/97e116\/zzz",
                            //destination!.item!.project_id
                            String? url = '';
                            if(destination!.item!.buttons![3]!.text!.toLowerCase() =='show thread'){
                            if(destination!.item!.accepted_worker_user_name == this.username){

                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.owner_str}*${destination!.item!.owner_owner_rating.toString()}*${destination!.item!.owner_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*r', cb: cb)),
                                );
                              }else{
                                url = '\/user\/my_projects\/show_thread\/${destination!.item!.project_id}\/${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l';
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowThreadMyProjects(id : '${destination!.item!.project_id}', title : '${destination!.item!.accepted_worker_user_name}*${destination!.item!.accepted_worker_worker_rating.toString()}*${destination!.item!.accepted_worker_photo_url!.split('?')[0]!.replaceAll('https:\/\/cdn.projects.co.id\/upload\/', '')!.replaceAll('https:\/\/www.gravatar.com\/avatar\/', 'gravatar')!.replaceAll('\/', 'ccc')}*l', cb: cb)),
                                );
                              }

                            /*
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  url);

 */


                            }else{
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(destination!.item!.buttons![3]!.url! ));

                            }

                          }
                          if(value == 5) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![4]!.url! ));
                          }
                          if(value == 6) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![5]!.url! ));
                          }
                          if(value == 7) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![6]!.url! ));
                          }
                          if(value == 8) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons![7]!.url! ));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                            value: 1,
                            child: Text(destination!.item!.buttons![0]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Text(destination!.item!.buttons![1]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text(destination!.item!.buttons![2]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Text(destination!.item!.buttons![3]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 5,
                            child: Text(destination!.item!.buttons![4]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 6,
                            child: Text(destination!.item!.buttons![5]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 7,
                            child: Text(destination!.item!.buttons![6]!.text!),
                          ),
                          PopupMenuItem<int>(
                            value: 8,
                            child: Text(destination!.item!.buttons![7]!.text!),
                          ),
                        ],
                      ): Container(height: 0.0, width: 0.0, color: Colors.white,):
                      Container(height: 0.0, width: 0.0, color: Colors.white,),

                    ]
                ),
                //settingsRow,
              ),

               */


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