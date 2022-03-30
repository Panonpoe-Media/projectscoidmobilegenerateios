
import 'package:projectscoid/models/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:convert';
import 'meta.dart';
import 'button.dart';
import 'browse_users_item.dart';

import 'photo.dart';
import 'package:projectscoid/models/browse_users_base.dart';
import 'package:photo_view/photo_view.dart';
import 'package:projectscoid/models/BrowseUsers/services_list_base.dart';
import 'BrowseUsers/services_list_item_base.dart';
import 'package:projectscoid/models/BrowseUsers/products_list_base.dart';
import 'BrowseUsers/products_list_item_base.dart';
import 'BrowseUsers/portofolio_list_item_base.dart';
import 'package:projectscoid/models/BrowseUsers/portofolio_list_base.dart';

import 'package:projectscoid/models/BrowseUsers/as_project_worker_list_base.dart';
import 'package:projectscoid/models/BrowseUsers/as_project_owner_list_base.dart';
import 'package:projectscoid/models/BrowseUsers/user_arbitrations_list_base.dart';
import 'package:expandable/expandable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/views/BrowseUsers/services_list.dart';
import 'package:projectscoid/views/BrowseUsers/products_list.dart';
import 'package:projectscoid/views/BrowseUsers/user_arbitrations_list.dart';
import 'package:projectscoid/views/BrowseUsers/as_project_owner_list.dart';
import 'package:projectscoid/views/BrowseUsers/as_project_worker_list.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_html/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';
import 'package:projectscoid/views/BrowseUsers/browse_users_view.dart';
import 'package:projectscoid/views/BrowseProducts/browse_products_view.dart';
import 'package:projectscoid/views/BrowseServices/browse_services_view.dart';
import 'package:projectscoid/views/BrowseUsers/browse_users_listing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectscoid/api/api.dart';
import 'package:json_annotation/json_annotation.dart';
part 'browse_users.g.dart';
/** AUTOGENERATE OFF **/

class InviteToBidBrowseUsersModel extends InviteToBidBrowseUsersBase{

  Map<String, dynamic> json;
  InviteToBidBrowseUsersModel(Map<String, dynamic> this.json):super(json); 
	  
}

class HireMeBrowseUsersModel extends HireMeBrowseUsersBase{

  Map<String, dynamic> json;
  HireMeBrowseUsersModel(Map<String, dynamic> this.json):super(json);

  @override
  Map<String, dynamic> convertFormDataAction(var data, String? triger){
    String? attachments = '';
    if (model!.model!.attachments!= null) {
      if (model!.model!.attachments[0].temp != '') {
        attachments = '[{"name":"${model!.model!.attachments[0].name}","size":${model!.model!.attachments[0].size},"created":${model!.model!.attachments[0].date},"modified":${model!.model!.attachments[0].date},"temp":"${model!.model!.attachments[0].temp}","remote":"${model!.model!.attachments[0].remote}","dir":"${model!.model!.attachments[0].dir}"}]';
      }
    }
    String? tgr = triger!.toLowerCase()!.replaceAll(' ', '_');
    var formData = {
      "project[_trigger_]":"$tgr",
      "project[title]": "${model!.model!.title }",
      "project[description]": "${model!.model!.description }",
      "project[attachments]": '$attachments',
      "project[attachments_lastval]": '',
      "project[finish_days]": "${model!.model!.finish_days }",
      "project[budget_range_min]": "${model!.model!.budget_range_min }",
      "project[budget_range_max]": "${model!.model!.budget_range_max }",

    };
    int count = 0;
    for(var tag in model!.model!.channels_id){
      formData.addAll({"project[channels][selection][$count]": "$tag"});
      count++;
    }

   // print('hire123' + jsonEncode(formData));
    return( formData);
  }

}


class BrowseUsersModel extends BrowseUsersBase{
  Map<String, dynamic> json;
  BrowseUsersModel(Map<String, dynamic> this.json):super(json);
  
}
 
////////////////////////////////////////////////////
@JsonSerializable()
class ViewModelBrowseUsersRev {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  String? self_introduction;
  List<int?>? skills_id;
  List<String?>?  skills_str;
  List<String?>? skills_url;
  String? photo_url;
  Photo? photo;
  String? display_name;
  String? user_name;
  int? account_type_id;
  String? account_type_str;
  List<int?>? account_type_list;
  List<String?>? account_type_list_str;
  DateTime? date_registered;
  int? provinsi_id;
  String? provinsi_str;
  String? provinsi_url;
  List<int?>? provinsi_list;
  List<String?>? provinsi_list_str;
  int? kabupaten_id;
  String? kabupaten_str;
  String? kabupaten_url;
  List<int?>? kabupaten_list;
  List<String?>? kabupaten_list_str;
  String? website;
  double? online_hours;
  String? online_hours_str;
  int? projects_completed;
  String? projects_completed_str;
  int? current_projects;
  String? current_projects_str;
  DateTime? last_seen;
  int? worker_rating;
  double? worker_rating_num;
  String? worker_rating_num_str;
  int? worker_point;
  String? worker_point_str;
  int? worker_ranking;
  String? worker_ranking_str;
  int? owner_rating;
  double? owner_rating_num;
  String? owner_rating_num_str;
  int? owner_point;
  String? owner_point_str;
  int? owner_ranking;
  String? owner_ranking_str;
  int? projects_owned;
  String? projects_owned_str;
  int? seller_rating;
  double? seller_rating_num;
  String? seller_rating_num_str;
  int? seller_point;
  String? seller_point_str;
  int? seller_ranking;
  String? seller_ranking_str;
  int? product_sold;
  String? product_sold_str;
  int? affiliate_rating;
  double? affiliate_rating_num;
  String? affiliate_rating_num_str;
  int? affiliate_point;
  String? affiliate_point_str;
  int? affiliate_ranking;
  String? affiliate_ranking_str;
  int? refered_users;
  String? refered_users_str;
  int? work_quality;
  int? expertise;
  int? worker_communication;
  int? worker_professionalism;
  int? clarity;
  int? friendliness;
  int? owner_communication;
  int? owner_professionalism;
  int? projects_won;
  String? projects_won_str;
  double? projects_won_cumulative;
  String? projects_won_cumulative_str;
  double? projects_owned_cumulative;
  String? projects_owned_cumulative_str;
  int? projects_noaction;
  String? projects_noaction_str;
  int? projects_canceled;
  String? projects_canceled_str;
  int? missed_payment;
  String? missed_payment_str;
  int? projects_arbitrated;
  String? projects_arbitrated_str;
  int? projects_arbit_won;
  String? projects_arbit_won_str;
  int? projects_arbit_lost;
  String? projects_arbit_lost_str;
  int? missed_weekly_report;
  String? missed_weekly_report_str;
  double? product_sold_cumulative;
  String? product_sold_cumulative_str;
  int? product_bought;
  String? product_bought_str;
  double? product_bought_cumulative;
  String? product_bought_cumulative_str;
  int? bid_count;
  String? bid_count_str;
  int? post_count;
  String? post_count_str;
  double? completion_rate;
  double? arbitration_rate;

  ServicesListingTools? services;
  ProductsListingTools? products;
  PortofolioListingTools? portofolio;



  AsProjectWorkerListingTools? as_project_worker;

  AsProjectOwnerListingTools? as_project_owner;

  UserArbitrationsListingTools? user_arbitrations;


  String? user_id;

  //
  ViewModelBrowseUsersRev(
      this.id,

      this.self_introduction,

      this.skills_id,
      this.skills_str,
      this.skills_url,
      this.photo,
      this.photo_url,
      this.display_name,
      this.user_name,
      this.account_type_id,
      this.account_type_str,
      this.account_type_list,
      this.account_type_list_str,
      this.date_registered,
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
      this.website,
      this.online_hours,
      this.online_hours_str,
      this.projects_completed,
      this.projects_completed_str,
      this.current_projects,
      this.current_projects_str,
      this.last_seen,

      this.worker_rating,
      this.worker_rating_num,
      this.worker_rating_num_str,
      this.worker_point,
      this.worker_point_str,
      this.worker_ranking,
      this.worker_ranking_str,
      this.owner_rating,
      this.owner_rating_num,
      this.owner_rating_num_str,
      this.owner_point,
      this.owner_point_str,
      this.owner_ranking,
      this.owner_ranking_str,
      this.projects_owned,
      this.projects_owned_str,
      this.seller_rating,
      this.seller_rating_num,
      this.seller_rating_num_str,
      this.seller_point,
      this.seller_point_str,
      this.seller_ranking,
      this.seller_ranking_str,
      this.product_sold,
      this.product_sold_str,
      this.affiliate_rating,
      this.affiliate_rating_num,
      this.affiliate_rating_num_str,
      this.affiliate_point,
      this.affiliate_point_str,
      this.affiliate_ranking,
      this.affiliate_ranking_str,
      this.refered_users,
      this.refered_users_str,
      this.work_quality,
      this.expertise,
      this.worker_communication,
      this.worker_professionalism,
      this.clarity,
      this.friendliness,
      this.owner_communication,
      this.owner_professionalism,
      this.projects_won,
      this.projects_won_str,
      this.projects_won_cumulative,
      this.projects_won_cumulative_str,
      this.projects_owned_cumulative,
      this.projects_owned_cumulative_str,
      this.projects_noaction,
      this.projects_noaction_str,
      this.projects_canceled,
      this.projects_canceled_str,
      this.missed_payment,
      this.missed_payment_str,
      this.projects_arbitrated,
      this.projects_arbitrated_str,
      this.projects_arbit_won,
      this.projects_arbit_won_str,
      this.projects_arbit_lost,
      this.projects_arbit_lost_str,
      this.missed_weekly_report,
      this.missed_weekly_report_str,
      this.product_sold_cumulative,
      this.product_sold_cumulative_str,
      this.product_bought,
      this.product_bought_str,
      this.product_bought_cumulative,
      this.product_bought_cumulative_str,
      this.bid_count,
      this.bid_count_str,
      this.post_count,
      this.post_count_str,
      this.completion_rate,
      this.arbitration_rate,



      this.services,
      this.products,
      this.portofolio,



      this.as_project_worker,

      this.as_project_owner,

      this.user_arbitrations,






      this.user_id

      );


  factory ViewModelBrowseUsersRev.fromJson(Map<String, dynamic> json) => _$ViewModelBrowseUsersRevFromJson(json);



}
/*
ViewModelBrowseUsersRev _$ViewModelBrowseUsersRevFromJson(Map<String, dynamic> json) {
  return ViewModelBrowseUsersRev(
      json['id']  as String,

      json['self_introduction'] as String,

      (json['skills_id'] as List)?.map((e) => e as int)?.toList(),
      (json['skills_str'] as List)?.map((e) => e as String)?.toList(),
      (json['skills_url'] as List)?.map((e) => e as String)?.toList(),
      json['photo'] == null
          ? null
          : Photo.fromJson(json['photo'] as Map<String, dynamic>),
      json['photo_url'] as String,
      json['display_name'] as String,
      json['user_name'] as String,
      json['account_type_id'] as int,
      json['account_type_str'] as String,
      (json['account_type_list'] as List)?.map((e) => e as int)?.toList(),
      (json['account_type_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      json['date_registered'] == null
          ? null
          : DateTime.parse(json['date_registered'] as String),
      json['provinsi_id'] as int,
      json['provinsi_str'] as String,
      json['provinsi_url'] as String,
      (json['provinsi_list'] as List)?.map((e) => e as int)?.toList(),
      (json['provinsi_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['kabupaten_id'] as int,
      json['kabupaten_str'] as String,
      json['kabupaten_url'] as String,
      (json['kabupaten_list'] as List)?.map((e) => e as int)?.toList(),
      (json['kabupaten_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['website'] as String,
      (json['online_hours'] as num)?.toDouble(),
      json['online_hours_str'] as String,
      json['projects_completed'] as int,
      json['projects_completed_str'] as String,
      json['current_projects'] as int,
      json['current_projects_str'] as String,
      json['last_seen'] == null
          ? null
          : DateTime.parse(json['last_seen'] as String),

      json['worker_rating'] as int,
      (json['worker_rating_num'] as num)?.toDouble(),
      json['worker_rating_num_str'] as String,
      json['worker_point'] as int,
      json['worker_point_str'] as String,
      json['worker_ranking'] as int,
      json['worker_ranking_str'] as String,
      json['owner_rating'] as int,
      (json['owner_rating_num'] as num)?.toDouble(),
      json['owner_rating_num_str'] as String,
      json['owner_point'] as int,
      json['owner_point_str'] as String,
      json['owner_ranking'] as int,
      json['owner_ranking_str'] as String,
      json['projects_owned'] as int,
      json['projects_owned_str'] as String,
      json['seller_rating'] as int,
      (json['seller_rating_num'] as num)?.toDouble(),
      json['seller_rating_num_str'] as String,
      json['seller_point'] as int,
      json['seller_point_str'] as String,
      json['seller_ranking'] as int,
      json['seller_ranking_str'] as String,
      json['product_sold'] as int,
      json['product_sold_str'] as String,
      json['affiliate_rating'] as int,
      (json['affiliate_rating_num'] as num)?.toDouble(),
      json['affiliate_rating_num_str'] as String,
      json['affiliate_point'] as int,
      json['affiliate_point_str'] as String,
      json['affiliate_ranking'] as int,
      json['affiliate_ranking_str'] as String,
      json['refered_users'] as int,
      json['refered_users_str'] as String,
      json['work_quality'] as int,
      json['expertise'] as int,
      json['worker_communication'] as int,
      json['worker_professionalism'] as int,
      json['clarity'] as int,
      json['friendliness'] as int,
      json['owner_communication'] as int,
      json['owner_professionalism'] as int,
      json['projects_won'] as int,
      json['projects_won_str'] as String,
      (json['projects_won_cumulative'] as num)?.toDouble(),
      json['projects_won_cumulative_str'] as String,
      (json['projects_owned_cumulative'] as num)?.toDouble(),
      json['projects_owned_cumulative_str'] as String,
      json['projects_noaction'] as int,
      json['projects_noaction_str'] as String,
      json['projects_canceled'] as int,
      json['projects_canceled_str'] as String,
      json['missed_payment'] as int,
      json['missed_payment_str'] as String,
      json['projects_arbitrated'] as int,
      json['projects_arbitrated_str'] as String,
      json['projects_arbit_won'] as int,
      json['projects_arbit_won_str'] as String,
      json['projects_arbit_lost'] as int,
      json['projects_arbit_lost_str'] as String,
      json['missed_weekly_report'] as int,
      json['missed_weekly_report_str'] as String,
      (json['product_sold_cumulative'] as num)?.toDouble(),
      json['product_sold_cumulative_str'] as String,
      json['product_bought'] as int,
      json['product_bought_str'] as String,
      (json['product_bought_cumulative'] as num)?.toDouble(),
      json['product_bought_cumulative_str'] as String,
      json['bid_count'] as int,
      json['bid_count_str'] as String,
      json['post_count'] as int,
      json['post_count_str'] as String,
      (json['completion_rate'] as num)?.toDouble(),
      (json['arbitration_rate'] as num)?.toDouble(),



      json['services'] == null
        ? null
        : ServicesListingTools.fromJson(json['services'] as Map<String, dynamic>),
      json['products'] == null
        ? null
        : ProductsListingTools.fromJson(json['products'] as Map<String, dynamic>),
      json['portofolio'] == null
        ? null
        : PortofolioListingTools.fromJson(json['portofolio'] as Map<String, dynamic>),


      json['as_project_worker'] == null
        ? null
        : AsProjectWorkerListingTools.fromJson(json['as_project_worker'] as Map<String, dynamic>),


      json['as_project_owner'] == null
        ? null
        : AsProjectOwnerListingTools.fromJson(json['as_project_owner'] as Map<String, dynamic>),



      json['user_arbitrations'] == null
        ? null
        : UserArbitrationsListingTools.fromJson(json['user_arbitrations'] as Map<String, dynamic>),





      json['user_id'] as String,)
    ..age = json['age'] as int
    ..cnt = json['cnt'] as int
    ..page = json['page'] as int
    ..ttl = json['ttl'] as String
    ..pht = json['pht'] as String
    ..sbttl = json['sbttl'] as String;
}

 */
@JsonSerializable()
class BrowseUsersViewSuperBaseRev {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelBrowseUsersRev? model;
  BrowseUsersViewSuperBaseRev(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );

  factory BrowseUsersViewSuperBaseRev.fromJson(Map<String, dynamic> json) => _$BrowseUsersViewSuperBaseRevFromJson(json);

}
/*
BrowseUsersViewSuperBaseRev _$BrowseUsersViewSuperBaseRevFromJson( Map<String, dynamic> json) {
  return BrowseUsersViewSuperBaseRev(
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
          : ViewModelBrowseUsersRev.fromJson(
          json['model'] as Map<String, dynamic>));
}

 */

class BrowseUsersViewModel  extends BrowseUsersViewBase{
  Map<String, dynamic> json;
//  BrowseUsersViewModel(Map<String, dynamic> this.json):super(json);
  BrowseUsersViewModel(Map<String, dynamic> this.json):super(json){model = BrowseUsersViewSuperBaseRev.fromJson(this.json);}

  int? getViewBackground(int userid){
    int? i = 0;
    if (userid % 13 == 0) {
      i = 3;
    } else if (userid % 12 == 0) {
      i = 4;
    } else if(userid % 9 == 0){
      i = 5;
    } else if(userid % 14 == 0){
      i = 6;
    } else if(userid % 7 == 0){
      i = 7;
    } else{
      i = 1;
    }
    return i;
  }
  Widget viewHeader (BuildContext context, bool? account, ChatBloc? cb) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
   // final rng = Random();
    final itm = model!.model!.kabupaten_id == null?getViewBackground(1) : getViewBackground(model!.model!.kabupaten_id);
   // final itm = getViewBackground(1);
    final mediaQueryData = MediaQuery.of(context);
    return(
        Stack(
            children: <Widget>[

              _buildCoverImage(mediaQueryData.size, itm),
             // _buildStatContainer1(context),
             SafeArea(
                 child: SingleChildScrollView(

                    child: Column(
                            children: <Widget>[
                             //
                              _buildStatContainer1(context),
                              SizedBox(height: mediaQueryData.size.height / 7.6),
                              _buildProfileImage(context),
                              _buildFullName(),
                              _buildUserName(),
                              Padding(
                                  padding:
                                  EdgeInsets.only(top: 5.0),
                                  child:
                                  RatingBarIndicator(
                                    rating: model!.model!.worker_rating.toDouble()/2-0.01,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: CurrentTheme.PrimaryLightColor,
                                    ),
                                    itemCount: 5,
                                    itemSize: 30.0,
                                    unratedColor: Colors.black26,
                                    direction:  Axis.horizontal,
                                  ),

                              ),
                              _buildStatus(context),

                              _buildLastSeen(context),

                              _buildStatContainer(context),


                              viewPointContainer(context),


                              viewPortfolio (context),
                              Padding(
                                  padding:
                                  EdgeInsets.only(top: 20.0),
                                  child:
                                  Center(
                                    child: Text('Project Statistics As Worker', style: TextStyle(fontSize: 25)),
                                  )

                              ),
                              viewProcentageContainer(context),
                              viewSellContainer(context, cb),
                              SizedBox(height: 10),
                              Center(child: Text('Current Projects : ' + this.model!.model!.current_projects.toString(), style: TextStyle(fontSize: 22),)),
                              SizedBox(height: 10),
                              _buildButtons(context, account),
                              _buildBio(context, account),


                            ]),


               ),

             ),
          ]
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
                  child:      InkWell(
                    onTap: () {
                      // return BidItemInfo(info : this.info);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowItemScreenshots(image : this.model!.model!.photo_url)),
                      );

                    },

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        this.model!.model!.photo_url!,
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
                                // this.model!.meta.title ,
                                data :readText(model!.meta.title!, 75),
                                useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith(color: Colors.black87, fontSize: 15),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(this.model!.model!.owner_url ));
                                },
                                child: Html(

                                    data :readText(this.model!.model!.owner_str , 54),
                                    useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                                ),
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
                              )
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

  Widget _buildCoverImage(Size screenSize, int? number) {
    List<String?>? image = [
      'assets/img/workerbg1.jpg',
      'assets/img/workerbg2.jpg',
      'assets/img/workerbg3.jpg',
      'assets/img/workerbg4.jpg',
      'assets/img/workerbg5.jpg',
      'assets/img/workerbg6.jpg',
      'assets/img/workerbg7.jpg',
    ];

    return Container(
      height: screenSize.height / 4.1,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: [0,1,2,3,4,5,6]!.contains(number) ? AssetImage(image[number!]!) : AssetImage(image[1]!) ,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Center(
      child: Container(
        width: 90.0,
        height: 90.0,
        decoration : BoxDecoration(
                     color: Colors.white,
                     border: Border.all(  color: Colors.white,
                       width: 5.0,),
                     borderRadius: BorderRadius.circular(80),
                   ),

                    child:  InkWell(
                          onTap: () {
                              // return BidItemInfo(info : this.info);
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ShowItemScreenshots(image : this.model!.model!.photo_url)),
                              );

                          },
                        child : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          this.model!.model!.photo_url!,
                          fit: BoxFit.fitHeight,
                          height: 80.0,
                          width: 80.0,
                        ),
                      ),
                  )

              )

    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      // color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );
    return (
        Html(data: readText(this.model!.model!.display_name, 100),
            style: {
              "html": Style(
                  alignment: Alignment.center,
                  textAlign: TextAlign.center,
                  fontSize: FontSize.xxLarge,
                  fontWeight: FontWeight.w400
              ),
            })
    );
  }


    Widget _buildUserName() {
      TextStyle _nameTextStyle = TextStyle(
        fontFamily: 'Roboto',
        // color: Colors.black,
        fontSize: 26.0,
        fontWeight: FontWeight.w600,
      );
      return(
          Html( data: '(${this.model!.model!.user_name})',
              style: {
                "html": Style(
                    alignment: Alignment.center,
                    textAlign: TextAlign.center,
                    fontSize: FontSize(26),
                    fontWeight: FontWeight.w300
                ),
              })
      );
/*
    return Text(

      this.model!.model!.display_name,
      textAlign: TextAlign.center,
      style: _nameTextStyle,
    );
 */
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        this.model!.model!.account_type_str,
        style: TextStyle(
          fontFamily: 'Spectral',
         // color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildLastSeen(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        'last seen ' +timeago.format(this.model!.model!.last_seen),
        style: TextStyle(
          fontFamily: 'Spectral',
         // color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildBio(BuildContext context,bool?  account) {


    ScrollController? controller;
    return ExpandablePanel(
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
                        Text('Self Introduction',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
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
                  HtmlWidget( this.model!.model!.self_introduction== null? '' : readText(this.model!.model!.self_introduction.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 165)),

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
                      child : HtmlWidget(this.model!.model!.self_introduction== null? '' : this.model!.model!.self_introduction.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'),
                        onTapUrl: (url) async{
                          if(url!.contains('projects.co.id')){


                            if(url!.contains(RegExp(r'[0-9]'))){
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
                          MaterialPageRoute(builder: (context) => ShowItemScreenshots(image:src.sources.first.url)),
                        ),
                      )
                  ),


                ]
            )

        )

    );

    /*
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 18.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              Html(
              data: this.model!.model!.self_introduction== null? '' : readText(this.model!.model!.self_introduction, 165),
              defaultTextStyle: bioTextStyle,
             ),
            this.model!.model!.self_introduction== null? Container(height: 0, width:0,) :   this.model!.model!.self_introduction.length > 165 ? _readMore(context, account) : Container(height: 0, width:0,),

        ]
      ),
    );

     */
  }

  Widget _readMore(BuildContext context, bool? account) {
    TextStyle readTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Colors.blue,
      fontSize: 18.0,
    );
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap:(){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DescUserInfo(info : this.model!.model, title: this.model!.meta.title!, account : account)),
                  );
              } ,
              child: Text('Read more',
                          textAlign: TextAlign.start,
                          style:readTextStyle ),
            )

          ]
      ),
    );
  }

  Widget _buildStatItem(String label, String? count,BuildContext context) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return

      GestureDetector(
          onTap: () {
            switch(label){
              case 'Projects':{



                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        SearchPastProjectsListing11(id : '', title : 'List ${this.model!.model!.user_name} Projects', search : '${this.model!.model!.user_name}')),
                );


              }
              break;
              case 'Sales':{ //services //products
                if(this.model!.model!.services.items.length != null){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicesList
                      (id : this.model!.model!.user_id, title: this.model!.meta.title,
                        url: Env.value!.baseUrl! +
                            '/public/browse_users/services_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title
                            + '?')),
                  );

                }else if(this.model!.model!.products.items.length != null){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductsList(id :
                    this.model!.model!.user_id, title: this.model!.meta.title,
                        url: Env.value!.baseUrl! +
                            '/public/browse_users/products_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title
                            + '?')),
                  );

                }else{

                }

              }
              break;
              case 'Owner':{
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        SearchPastProjectsListing11(id : '', title : 'List ${this.model!.model!.user_name} Projects', search : '${this.model!.model!.user_name}')),
                );
              }
              break;

            }
            // Share.share('${model!.meta.title} https://projects.co.id/public/browse_users/view/${this.model!.model!.user_id}/user', subject: '${model!.meta.title}');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                count!,
                style: _statCountTextStyle,
              ),
              Text(
                label!,
                style: _statLabelTextStyle,
              ),
            ],
          )
      );

  }

  Widget _buildStatItem1(String? label, String? count, BuildContext context) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );

    return
    GestureDetector(
            onTap: () {
              switch(label){
                case 'Rank':{
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute
                        ('/public/browse_users/listing/&filter=worker_ranking'));
                }
                break;
                case 'Points':{
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AsProjectWorkerList(id :
                    this.model!.model!.user_id, title: this.model!.meta.title,
                        url: Env.value!.baseUrl! +
                            '/public/browse_users/as_project_worker_list/'+this.model!.model!.user_id
                            +'/'+this.model!.meta.title + '?')),
                  );

                }
                break;
                case 'Arbitrated':{
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserArbitrationsList(id :
                    this.model!.model!.user_id, title: this.model!.meta.title,
                        url: Env.value!.baseUrl! +
                            '/public/browse_users/user_arbitrations_list/'+this.model!.model!.user_id
                            +'/'+this.model!.meta.title + '?')),
                  );
                }
                break;

              }
              // Share.share('${model!.meta.title} https://projects.co.id/public/browse_users/view/${this.model!.model!.user_id}/user', subject: '${model!.meta.title}');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  label!,
                  style: _statLabelTextStyle,
                ),
                Text(
                  count!,
                  style: _statCountTextStyle,
                ),

              ],
            )
    );


  }

  Widget _buildStatContainer(BuildContext context) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("Projects", this.model!.model!.projects_completed.toString(), context),
          _buildStatItem("Sales", this.model!.model!.product_sold.toString(), context),
          _buildStatItem("Owner", this.model!.model!.projects_owned.toString(), context),
        ],
      ),
    );
  }

  Widget _buildStatContainer1(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.only(top: 2.0),
      decoration: BoxDecoration(
        color: Colors.black45,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem1("Rank", this.model!.model!.worker_ranking.toString(), context ),
          _buildStatItem1("Points", this.model!.model!.worker_point.toString(), context),
          _buildStatItem1("Arbitrated", this.model!.model!.projects_arbitrated.toString(), context),

        ],
      ),
    );
  }

  Widget _buildPointIndicator(String type, String? label, String? count, int?  cnt, double? rating, BuildContext context) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
    //  color: Colors.black45,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.white30,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /*
        CircularPercentIndicator(
          progressColor: cnt!/10000 > 0.5 ? Colors.blue: cnt!/10000 > 0.25? Colors.yellow : Colors.redAccent,
          percent: cnt!/10000> 1.0 ? 1.0 : cnt < 0.0 ? 0.0 : cnt!/10000,
          animation: true,
          radius: 100.0,
          lineWidth: 15.0,
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              count!,
              style: _statCountTextStyle,
            ),
            Text(
              label!,
              style: _statLabelTextStyle,
            ),

          ]),
        ),

         */
        _buildStatItem1(label, count!, context),

        Text(
          type,
          style: _statCountTextStyle,
        ),

        Padding(
            padding:
            EdgeInsets.only(top: 5.0),
            child:
            RatingBarIndicator(
              rating: rating!/2-0.01,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: CurrentTheme.PrimaryLightColor,
              ),
              itemCount: 5,
              itemSize: 18.0,
              unratedColor: Colors.black26,
              direction:  Axis.horizontal,
            ),

        ),


      ],
    );
  }

  Widget viewPointContainer(BuildContext context) {
    return Container(
      height: 160.0,
      margin: EdgeInsets.only(top: 2.0),
      color: Colors.black45,
     // decoration: BoxDecoration(
     //   color: Colors.white,
     // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildPointIndicator("Worker", "Points", this.model!.model!.worker_point.toString(),this.model!.model!.worker_point, this.model!.model!.worker_rating.toDouble(), context),
          _buildPointIndicator("Seller", "Points", this.model!.model!.seller_point.toString(),this.model!.model!.seller_point, this.model!.model!.seller_rating.toDouble(), context),
          _buildPointIndicator("Owner","Points", this.model!.model!.owner_point.toString(),this.model!.model!.owner_point, this.model!.model!.owner_rating.toDouble(), context),
        ],
      ),
    );
  }

  Widget _buildProcentageIndicator(String type, String? label, int? cnt, int?  cnt1, BuildContext context) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
       color: Colors.black45,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black45,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        cnt1 == 0 ?
        Text(
          'No projects $type',
          style: _statCountTextStyle,
        )
            :

        type == 'Arbitrated'?
        CircularPercentIndicator(

          progressColor: this.model!.model!.arbitration_rate / 100 > 0.5 ? Colors.blue: this.model!.model!.arbitration_rate / 100 > 0.25? Colors.yellow : Colors.blue,
          percent: this.model!.model!.arbitration_rate < 0 ? 0.0 : this.model!.model!.arbitration_rate / 100 ,
          animation: true,
          radius: 100.0,
          lineWidth: 15.0,
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  (this.model!.model!.arbitration_rate < 0? '-' : this.model!.model!.arbitration_rate.toStringAsFixed(2)),
                  style: _statCountTextStyle,
                ),
                Text(
                  label!,
                  style: _statLabelTextStyle,
                ),

              ]),
        )
            :  type == 'Noaction' ?

        CircularPercentIndicator(
          progressColor: cnt!/cnt1! > 0.5 ? Colors.redAccent: cnt!/cnt1! > 0.25? Colors.yellow : Colors.blue,
          percent: cnt!/cnt1> 1.0 ? 1.0 : cnt < 0.0 ? 0.0 : cnt!/cnt1,
          animation: true,
          radius: 100.0,
          lineWidth: 15.0,
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  ((cnt!/cnt1)*100).toStringAsFixed(2),
                  style: _statCountTextStyle,
                ),
                Text(
                  label!,
                  style: _statLabelTextStyle,
                ),

              ]),
        )

         : CircularPercentIndicator(
          progressColor: this.model!.model!.completion_rate / 100 > 0.5 ? Colors.blue: this.model!.model!.completion_rate / 100 > 0.25? Colors.yellow : Colors.redAccent,
          percent: this.model!.model!.completion_rate < 0 ? 0.0 : this.model!.model!.completion_rate / 100 ,
          animation: true,
          radius: 100.0,
          lineWidth: 15.0,
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ( this.model!.model!.completion_rate < 0? '-' : this.model!.model!.completion_rate.toStringAsFixed(2)),
              style: _statCountTextStyle,
            ),
            Text(
              label!,
              style: _statLabelTextStyle,
            ),

          ]),
        ),

/*
        cnt1 == 0 ?
            Text(
              'No projects $type',
              style: _statCountTextStyle,
            )
            : _buildStatItem1(((cnt!/cnt1)*100).toString(), label  ),

 */

        Text(
          type,
          style: _statCountTextStyle,
        ),




      ],
    );
  }

  Widget viewProcentageContainer(BuildContext context,) {
    return Container(
      height: 150.0,
      margin: EdgeInsets.only(top: 2.0),
      color: Colors.white,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildProcentageIndicator("Arbitrated", "%", this.model!.model!.projects_arbitrated,this.model!.model!.projects_won == 0? 1 + this.model!.model!.projects_owned : this.model!.model!.projects_won + this.model!.model!.projects_owned, context),
          _buildProcentageIndicator("Completed", "%", this.model!.model!.projects_completed,this.model!.model!.projects_won == 0? 1 :this.model!.model!.projects_won , context),
          _buildProcentageIndicator("Noaction","%", this.model!.model!.projects_noaction,this.model!.model!.projects_owned == 0? 1 :this.model!.model!.projects_owned, context),
        ],
      ),
    );
  }


  Widget viewSellContainer(BuildContext context, ChatBloc? cb) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: (){

                if(this.model!.model!.products.items.length == 0){

                }else{


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductsList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                        url: Env.value!.baseUrl! + '/public/browse_users/products_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?', cb: cb)),
                  );


                }
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: this.model!.model!.products.items.length == 0 ?
                  Text(
                    "0 Product ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                      :this.model!.model!.products.items.length == 1 ?
                  Text(
                    "1 Product ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                  :Text(
                    "${this.model!.model!.products.paging.total_rows.toString()} Products ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: (){
                if(this.model!.model!.services.items.length == 0){

                }else{
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicesList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                        url: Env.value!.baseUrl! + '/public/browse_users/services_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?', cb : cb)),
                  );
                }
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child:  Center(
                  child: this.model!.model!.services.items.length == 0 ?
                  Text(
                    "0 Service ",
                    style: TextStyle(

                      fontWeight: FontWeight.w600,
                    ),
                  )
                      :this.model!.model!.services.items.length == 1 ?
                  Text(
                    "1 Service ",
                    style: TextStyle(

                      fontWeight: FontWeight.w600,
                    ),
                  )
                      :Text(
                    "${this.model!.model!.services.paging.total_rows.toString()} Services ",
                    style: TextStyle(

                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context, bool? account) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: (){
                if(account!){
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute('public/browse_users/hire_me/${this.model!.model!.user_id}/${this.model!.meta.title}'));
                }else{
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      '/login/1');
                }

              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "HIRE ME",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: (){
                if(account!){
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute('public/browse_users/invite_to_bid/${this.model!.model!.user_id}/${this.model!.meta.title}'));
                }else{
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      '/login/1');
                }

              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Invite to bid",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget viewButton (BuildContext context){
    final size =MediaQuery.of(context).size;
    final width =size.width;

    return  ButtonBarTheme(
      data: ButtonBarThemeData(
        alignment: MainAxisAlignment.center,
        buttonMinWidth: 0.9 * width,
      ),
      child: ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.9 * width,
          children: <Widget>[
            RaisedButton(
                child: Text('Buy ' + this.model!.model!.price_str),
                textColor: Colors.white,
                splashColor : CurrentTheme.ShadeColor,
                color : Color(0xFF037f51),
                onPressed: () {
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute('/public/browse_products/add_to_cart/${this.model!.model!.product_id}/${this.model!.meta.title}'));
                }
            )
          ]
      ),
    );
  }

  Widget viewUserInfo(BuildContext context){
    var formatter = DateFormat('dd/MM/yyyy');
    return ExpandablePanel(
      header: Padding(
          padding: const EdgeInsets.fromLTRB(
              20.0, 8.0, 20.0, 0.0),
          child:
          Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('About this user', style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),),

                    ]
                ),

              ]
          )

      ),
      collapsed:
      Padding(
          padding: const EdgeInsets.fromLTRB(
              20.0, 0.0, 20.0, 30.0),
          child:
          Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('This user information', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),

                    ]
                ),

              ]
          )

      ),

      expanded: Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 0.0, 20.0, 5.0),
        child:
        Container(
            height: 370.0,
            padding:EdgeInsets.only(bottom : 10) ,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Container(
                          height: 60.0,
                          width: 300.0,

                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 20.0, top: 0.0),
                                    child: Icon(
                                      Icons.account_circle,
                                      size: 20.0,
                                    //  color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                      EdgeInsets.only( left: 10,right: 8.0, top: 0.0),
                                      child:  Text('Username',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ),

                                ],
                              ),

                              Padding(
                                  padding:
                                  EdgeInsets.only(left: 55.0, right: 8.0, top: 0.0),
                                  child:  Html(data: this.model!.model!.user_name,                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w400
                                                                  ),
                                                                })
                              ),


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
                          height:60.0,
                          width: 300.0,

                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 20.0, top: 0.0),
                                    child: Icon(
                                      Icons.location_city,
                                      size: 20.0,
                                     // color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                      EdgeInsets.only( left: 10,right: 8.0, top: 0.0),
                                      child:  Text('Provinsi',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ),

                                ],
                              ),

                              Padding(
                                  padding:
                                  EdgeInsets.only(left: 55.0, right: 8.0, top: 0.0),
                                  child: this.model!.model!.provinsi_str == ''? Html(data: 'Unavailable',                                                        style: {
                                                                    "html": Style(
                                                                        fontSize: FontSize.small,
                                                                        fontWeight: FontWeight.w400
                                                                    ),
                                                                }) : Html(data: this.model!.model!.provinsi_str,                                                        style: {
                                                                    "html": Style(
                                                                        fontSize: FontSize.small,
                                                                        fontWeight: FontWeight.w400
                                                                    ),
                                                                })
                              ),


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
                          height:60.0,
                          width: 300.0,

                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 20.0, top: 0.0),
                                    child: Icon(
                                      Icons.location_city,
                                      size: 20.0,
                                     // color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                      EdgeInsets.only( left: 10,right: 8.0, top: 0.0),
                                      child:  Text('Kabupaten',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ),

                                ],
                              ),

                              Padding(
                                  padding:
                                  EdgeInsets.only(left: 55.0, right: 8.0, top: 0.0),
                                  child:  this.model!.model!.kabupaten_id == null? Html(data: 'Unavailable',                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w400
                                                                  ),
                                                                }): this.model!.model!.kabupaten_str == ''? Html(data: 'Unavailable',                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w400
                                                                  ),
                                                                }) : Html(data: this.model!.model!.kabupaten_str,                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w400
                                                                  ),
                                                                })
                              ),


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
                          height: 60.0,
                          width: 300.0,

                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 20.0, top: 0.0),
                                    child: Icon(
                                      Icons.date_range,
                                      size: 20.0,
                                     // color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                      EdgeInsets.only( left: 10,right: 8.0, top: 0.0),
                                      child:  Text('Registered',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ),

                                ],
                              ),
                              this.model!.model!.date_registered == null? Container(width: 0.0, height: 0.0,):
                              Padding(
                                  padding:
                                  EdgeInsets.only(left: 55.0, right: 8.0, top: 0.0),
                                  child:  Html(data: formatter.format(this.model!.model!.date_registered),                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w400
                                                                  ),
                                                                })
                              ),


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
                          height: 60.0,
                          width: 300.0,

                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 20.0, top: 0.0),
                                    child: Icon(
                                      Icons.web,
                                      size: 20.0,
                                     // color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                      EdgeInsets.only( left: 10,right: 8.0, top: 0.0),
                                      child:  Text('Website',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ),

                                ],
                              ),

                              Padding(
                                  padding:
                                  EdgeInsets.only(left: 55.0, right: 8.0, top: 0.0),
                                  child:  Html(data: this.model!.model!.website == null? '-': this.model!.model!.website == ''? '-' : this.model!.model!.website,
                                      onLinkTap: (url, _, __, ___) async{
                                        if(url!.contains('projects.co.id')){


                                          if(url!.contains(RegExp(r'[0-9]'))){
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
                                                                                              style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w400
                                                                  ),
                                                                })
                              ),

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
                          height: 60.0,
                          width: 300.0,

                          child:   Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 20.0, top: 0.0),
                                    child: Icon(
                                      Icons.work,
                                      size: 20.0,
                                    //  color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                      EdgeInsets.only( left: 10,right: 8.0, top: 0.0),
                                      child:  Text('Current Projects',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
                                  ),

                                ],
                              ),

                              Padding(
                                  padding:
                                  EdgeInsets.only(left: 55.0, right: 8.0, top: 0.0),
                                  child:  Html(data: this.model!.model!.current_projects.toString() + ' projects',                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w400
                                                                  ),
                                                                })
                              ),

                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )

        ),

      ),
      //tapHeaderToExpand: true,
      //hasIcon: true,
    );

  }

  Widget viewUserServices(BuildContext context, ChatBloc? cb){
    return this.model!.model!.services.items.length == 0 ? Container(height: 0.0, width: 0.0):Column(
            children: <Widget>[
              Container(
               // decoration: BoxDecoration(
               //   color: CurrentTheme.ShadeColor,
               // ),
                child:   Padding(
                    padding: const EdgeInsets.fromLTRB(
                        20.0, 10.0, 8.0, 10.0),
                    child: InkWell(
                        onTap: () {
                              if(this.model!.model!.services.items.length == 0){

                              }else{
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ServicesList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                                      url: Env.value!.baseUrl! + '/public/browse_users/services_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?', cb : cb)),
                                );
                              }
                         // AppProvider.getRouter(context)!.navigateTo(
                          //    context, urlToRoute(this.model!.services.items.url + '/listing/12'));
                            //  context, urlToRoute('/public/browse_services/view/${this.model!.model!.services.items.service_id}/${this.model!.model!.services.items.title}'),
                        //  );
                        },
                        child:
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('User Services',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                              Icon(Icons.arrow_forward, size: 18.0)
                            ]
                        )
                    )
                ),
              ),

              Container(
                height: 210.0,
               // decoration: BoxDecoration(
               //   color: CurrentTheme.ShadeColor,
               // ),
                padding: const EdgeInsets.fromLTRB(
                    0.0, 10.0, 0.0, 0.0),
                child:

                this.model!.model!.services.items.length == 1?
                Center(
                  child:ServiceUserItem(model: this.model!.model!.services.items[0], cb: cb )
                )
                :ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int? index) {
                    return index! >= this.model!.model!.services.items.length?
                    this.model!.model!.services.paging.total_pages == this.model!.model!.services.paging.current_page?
                    Container(height: 0.0, width: 0.0, color:CurrentTheme.ShadeColor ):
                    userBottomLoader()
                        :ServiceUserItem(model: this.model!.model!.services.items[index], cb: cb );
                  },
                  itemCount: this.model!.model!.services.items.length == 10
                      ? this.model!.model!.services.items.length
                      : this.model!.model!.services.items.length + 1,
                 // controller: controller!,
                ),
              ),
            ],
    );
  }

  Widget viewUserProducts(BuildContext context, ChatBloc? cb){
    return this.model!.model!.products.items.length == 0 ? Container(height: 0.0, width: 0.0):Column(
      children: <Widget>[
        Container(
         // decoration: BoxDecoration(
         //   color: CurrentTheme.BackgroundColor,
         // ),
          child:   Padding(
              padding: const EdgeInsets.fromLTRB(
                  20.0, 10.0, 8.0, 10.0),
              child: InkWell(
                  onTap: () {
                    if(this.model!.model!.products.items.length == 0){

                    }else{


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductsList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                            url: Env.value!.baseUrl! + '/public/browse_users/products_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?', cb: cb)),
                      );


                    }
                    // AppProvider.getRouter(context)!.navigateTo(
                    //    context, urlToRoute(this.model!.products.items.url + '/listing/12'));
                    //  context, urlToRoute('/public/browse_products/view/${this.model!.model!.products.items.service_id}/${this.model!.model!.products.items.title}'),
                    //  );
                  },
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('User Products',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  )
              )
          ),
        ),

        Container(
          height: 210.0,
          decoration: BoxDecoration(
            //color: CurrentTheme.BackgroundColor,
          ),
          padding: const EdgeInsets.fromLTRB(
              0.0, 10.0, 0.0, 0.0),
          child:


          this.model!.model!.products.items.length == 1?
          Center(
              child:ProductUserItem(model: this.model!.model!.products.items[0], cb: cb )
          )
              :ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int? index) {
              return index! >= this.model!.model!.products.items.length?
              this.model!.model!.products.paging.total_pages == this.model!.model!.products.paging.current_page?
              Container(height: 0.0, width: 0.0,):userBottomLoader()
                  :ProductUserItem(model: this.model!.model!.products.items[index] , cb: cb);
            },
            itemCount: this.model!.model!.products.items.length == 10
                ? this.model!.model!.products.items.length
                : this.model!.model!.products.items.length + 1,
            // controller: controller!,
          ),
        ),
      ],
    );
  }

  Widget reviewUserAsWorker(BuildContext context){

    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    var dateformat = DateFormat('dd/MM/yyyy');
    return
      model!.model!.as_project_worker!.items.length == 0 ?

    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {


            },
            child:

            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 25,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Peer Reviews as Worker',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        //Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  //Center(
                  // child:
                  Text('Belum ada review', style: TextStyle(fontStyle: FontStyle.italic)),
                  // ),



                  //  Html(data: readText(this.model!.model!.service_reviews.items[0].testimony, 150)),
                ]
            )




        )
    )
       //   : Container();

        :
    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AsProjectWorkerList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                    url: Env.value!.baseUrl! + '/public/browse_users/as_project_worker_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?')),
              );
            },
            child:

            Column(
                children: <Widget>[
                  SizedBox(height: 25,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Peer Reviews as Worker',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  Center(
                    child:
                    Card(
                        elevation : 3.0,
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin : EdgeInsets.only(left:5, top: 10, right:10, bottom: 15),

                        child:
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                isThreeLine: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 2 , vertical: 2),
                                //enabled: false,
                                onLongPress: () {},
                                //onTap: () => Navigator.of(context).pushNamed('chat'),
                                onTap: () {

                                },


                                leading: Container(
                                  width: 80,
                                  height: 80,

                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        top: 13,
                                        left: 30,
                                       // left: 10,
                                        child:


                                        GestureDetector(
                                          onTap: (){
                                            //   AppProvider.getRouter(context)!.navigateTo(
                                            //       context,
                                            //      urlToRoute('public/browse_users/view/'+encode(this.model!.model!.product_reviews.items[0].buyer_id) + '/z'));
                                          },
                                          child :

                                          CircleAvatar(
                                            // radius: 100,
                                            // minRadius: 70,
                                            // maxRadius: 70,
                                            // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                                            backgroundImage: NetworkImage( this.model!.model!.as_project_worker!.items[0].owner_avatar),
                                          ),


                                            /*

                                          CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            // radius: 20,
                                            child: Icon(
                                              Icons.person,
                                              size: 55.0,
                                              //  color: CurrentTheme.HomeColor,
                                            ),
                                          ),

                                             */


                                        ),
                                      ),



                                    ],
                                  ),
                                ),

                                /*
              title: Text(
                '${widget._jsonMessage['display']}',
                maxLines: 2,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),

               */
                                subtitle:
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        //crossAxisAlignment: CrossAxisAlignment.s,
                                        children: <Widget>[
                                          Expanded(
                                            child:
                                            GestureDetector(
                                              onTap: (){
                                                  AppProvider.getRouter(context)!.navigateTo(
                                                      context,
                                                      urlToRoute(this.model!.model!.as_project_worker!.items[0].owner_url));
                                              },
                                              child:
                                              Padding(
                                                padding: EdgeInsets.only(top: 17, right: 5),
                                                child:
                                                this.model!.model!.as_project_worker!.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :

                                                Text( this.model!.model!.as_project_worker!.items[0].owner_str, overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: descriptionStyle!.copyWith(fontSize: 17,  letterSpacing: 1, fontWeight: FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only( top: 4),
                                        child:
                                        this.model!.model!.as_project_worker!.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :

                                        Text(
                                          this.model!.model!.as_project_worker.items![0].finish_date == null? '':
                                          dateformat.format(this.model!.model!.as_project_worker.items![0].finish_date) + ' ' + 'WIB',
                                          style: descriptionStyle!.copyWith(fontSize: 12 ),
                                        ),

                                      )
                                    ]
                                ),





                              ),

                              SizedBox(height: 10,),
                              Center(
                                child:
                                RatingBarIndicator(
                                  rating: this.model!.model!.as_project_worker.items![0].worker_rating.toDouble()/2-0.01,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: CurrentTheme.PrimaryLightColor,
                                  ),
                                  itemCount: 5,
                                  itemSize: 30.0,
                                  unratedColor: Colors.black26,
                                  direction:  Axis.horizontal,
                                ),


                              ),
                              SizedBox(height: 5,),

                              Center(
                                child: Text(this.model!.model!.as_project_worker.items![0].worker_rating.toString() + '/10', style: TextStyle(fontSize: 12)),
                              ),
                              SizedBox(height: 8,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 0.0),
                                child :

                                      GestureDetector(
                                        onTap: (){
                                          AppProvider.getRouter(context)!.navigateTo(
                                              context,
                                              urlToRoute(this.model!.model!.as_project_worker.items![0].project_url));
                                        },
                                        child:
                                                Html(
                                                  // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                                                    data:this.model!.model!.as_project_worker.items![0].title,
                                                    style: {
                                                      "html": Style(
                                                          fontSize: FontSize.large,
                                                          fontWeight: FontWeight.w800
                                                      ),
                                                    }

                                                ),
                                      ),
                              ),
                              SizedBox(height: 1,),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                                child: HtmlWidget('${readText(this.model!.model!.as_project_worker.items![0].worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>') ?? '', 400)}',
                                  //tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w400,

                                  ),
                                  // bodyPadding : EdgeInsets.only(left : 0.0,top:4.0,bottom: 0.0, right: 5)
                                ),
                              ),
                              SizedBox(height: 20,),
                            ]
                        )
                    ),
                  ),
                  /*
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 16.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      Icon(
                                        Icons.person,
                                        size: 35.0,
                                       // color: CurrentTheme.HomeColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                this.model!.model!.service_reviews.items![0].owner_str,
                                                style: descriptionStyle!.copyWith(fontSize: 15, fontWeight:FontWeight.w800 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      SmoothStarRating(
                                        rating: this.model!.model!.service_reviews.items![0].worker_rating.toDouble(),
                                        size: 15,
                                        starCount: 5,
                                        // allowHalfRating: true,
                                        allowHalfRating: true,

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                dateformat.format(this.model!.model!.service_reviews.items[0].start_date),
                                                style: descriptionStyle!.copyWith(fontSize: 12 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Html(data: readText(this.model!.model!.service_reviews.items[0].worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),
                    ],
                  )

                   */

                  /*
                    List<ItemButton> buttons;
                    String? order_item_id;
                    int? rating;
                    String? testimony;
                    int? buyer_id;
                    String? buyer_str;
                    String? buyer_url;
                    List<int?>? buyer_list;
                    List<String?>? buyer_list_str;
                    DateTime? date;
                   */


                  //  Html(data: readText(this.model!.model!.service_reviews.items[0].testimony, 150)),
                ]
            )




        )
    );



  }

  Widget reviewUserAsOwner(BuildContext context){
    /*
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.subhead;
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model!.model!.as_project_owner.items!.length == 0 ? Container(height:0.0, width: 0.0,):
    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child:

        Column(
            children: <Widget>[
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child : Html(
                  // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                    data:this.model!.model!.as_project_owner.items[0].title,
                    style: {
                      "html": Style(
                          fontSize: FontSize.large,
                          fontWeight: FontWeight.w800
                      ),
                    }

                ),
              ),
              this.model!.model!.as_project_owner.items[0].owner_feedback == null? Container(width: 0.0, height: 0.0,):
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                child : Html(data: '${readText(this.model!.model!.as_project_owner.items[0].owner_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>') ?? '', 400)}',
                    style: {
                      "html": Style(
                        fontSize: FontSize.large,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic,
                      ),
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(this.model!.model!.as_project_owner.items[0].accepted_worker_url));} ,
                        child:   this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                        Text(
                          '~ ${this.model!.model!.as_project_owner.items[0].accepted_worker_str} / Worker ',
                          style: descriptionStyle!.copyWith(color: Colors.blue, fontSize: 16, fontWeight:FontWeight.w200 ),
                        ),
                      ),



                    ]
                ),
              ),
              Divider(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        'Worker',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                      this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        '${this.model!.model!.as_project_owner.items[0].accepted_worker_str}',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),

                    ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        'Project ending',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                      this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        '${this.model!.model!.as_project_owner.items[0].project_ending_str}',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),

                    ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        'Finish date',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                    //  this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        this.model!.model!.as_project_owner.items[0].finish_date == null? '':
                        dateformat.format(this.model!.model!.as_project_owner.items[0].finish_date  ),
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        'Owner rating',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                      this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      // three line description
                      RatingBarIndicator(
                        rating: this.model!.model!.as_project_owner.items[0].owner_rating.toDouble()/2-0.01,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: CurrentTheme.PrimaryLightColor,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        unratedColor: Colors.black26,
                        direction:  Axis.horizontal,
                      ),


                    ]
                ),
              ),

              Divider(height: 20.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AsProjectOwnerList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                                url: Env.value!.baseUrl! + '/public/browse_users/as_project_owner_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?')),
                          );
                        } ,
                        child:  Text(
                          'more...',
                          style: descriptionStyle!.copyWith(color : Colors.blue ,fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),
                      ),



                    ]
                ),
              ),
              Divider(),
/*
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('As worker reviews',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child : Html(
                           // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                               data:this.model!.model!.as_project_worker.items[0].title,
                            style: {
                              "html": Style(
                                  fontSize: FontSize.medium,
                                  fontWeight: FontWeight.w800
                              ),
                            }

                             ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child :
                          this.model!.model!.as_project_worker.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                              Html(
                                  data : this.model!.model!.as_project_worker.items[0].project_ending_str + ' Project' ,
                                  style: {
                                    "html": Style(
                                        fontSize: FontSize.medium,
                                        fontWeight: FontWeight.w800
                                    ),
                                  }

                                ),
                      ),

                      SizedBox(
                        height: 40.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 16.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      Icon(
                                        Icons.person,
                                        size: 35.0,
                                        color: CurrentTheme.HomeColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              this.model!.model!.as_project_worker.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                                              Text(
                                                this.model!.model!.as_project_worker.items[0].owner_str,
                                                style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w800 ),
                                              ),


                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      SmoothStarRating(
                                        rating: this.model!.model!.as_project_worker.items[0].worker_rating.toDouble(),
                                        size: 15,
                                        starCount: 5,
                                        // allowHalfRating: true,
                                        color: CurrentTheme.PrimaryLightColor,
                                        allowHalfRating: true,

                                      ),

                                      this.model!.model!.as_project_worker.items[0].finish_date == null? Container(width: 0.0, height: 0.0,):
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                dateformat.format(this.model!.model!.as_project_worker.items[0].finish_date  ),
                                                style: descriptionStyle!.copyWith(fontSize: 12 ),
                                              ),

                                            ]

                                        ),


                                      ),



                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      this.model!.model!.as_project_worker.items[0].worker_feedback == null? Container(width: 0.0, height: 0.0,):
                      Html(data: readText(this.model!.model!.as_project_worker.items[0].worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>') ?? '', 150)),



                    ],
                  ),

 */

              /*
                    List<ItemButton> buttons;
                    String? order_item_id;
                    int? rating;
                    String? testimony;
                    int? buyer_id;
                    String? buyer_str;
                    String? buyer_url;
                    List<int?>? buyer_list;
                    List<String?>? buyer_list_str;
                    DateTime? date;
                   */


              //  Html(data: readText(this.model!.model!.as_project_worker.items[0].testimony, 150)),
            ]
        )
            /*
        InkWell(
            onTap: () {

               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AsProjectOwnerList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                    url: Env.value!.baseUrl! + '/public/browse_users/as_project_owner_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?')),
              );
            },
            child:

            Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('As owner reviews',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child :
                        this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                        Html(
                          // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                          data :  this.model!.model!.as_project_owner.items[0].title!,                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,
                                                                      fontWeight: FontWeight.w800
                                                                  ),
                                                                }
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child :
                        this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                        Html(
                          data : this.model!.model!.as_project_owner.items[0].project_ending_str + ' Project' ,                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,
                                                                      fontWeight: FontWeight.w800
                                                                  ),
                                                                }
                        ),
                      ),

                      SizedBox(
                        height: 40.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 16.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      Icon(
                                        Icons.person,
                                        size: 35.0,
                                        color: CurrentTheme.HomeColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                                              Text(
                                                this.model!.model!.as_project_owner.items[0].accepted_worker_str,
                                                style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w800 ),
                                              ),


                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,):
                                      SmoothStarRating(
                                        rating: this.model!.model!.as_project_owner.items[0].owner_rating.toDouble(),
                                        size: 15,
                                        starCount: 5,
                                        // allowHalfRating: true,
                                        color: CurrentTheme.PrimaryLightColor,
                                        allowHalfRating: true,

                                      ),

                                      this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                                      this.model!.model!.as_project_owner.items[0].finish_date == null? Container(width: 0.0, height: 0.0,):
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                dateformat.format(this.model!.model!.as_project_owner.items[0].finish_date),
                                                style: descriptionStyle!.copyWith(fontSize: 12 ),
                                              ),

                                            ]

                                        ),
                                      ),





                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      this.model!.model!.as_project_owner.items[0].owner_feedback == null ? Container(width: 0.0, height: 0.0,) :
                      Html(data: readText(this.model!.model!.as_project_owner.items[0].owner_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>') , 150)),


                    ],
                  ),
              ]
            )


        )

             */
    );

     */
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model!.model!.as_project_owner.items!.length == 0 ?

    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {


            },
            child:

            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Peer Reviews as Owner',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        //Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  //Center(
                  // child:
                  Text('Belum ada review', style: TextStyle(fontStyle: FontStyle.italic)),
                  // ),
                  /*
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 16.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      Icon(
                                        Icons.person,
                                        size: 35.0,
                                       // color: CurrentTheme.HomeColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                this.model!.model!.service_reviews.items[0].owner_str,
                                                style: descriptionStyle!.copyWith(fontSize: 15, fontWeight:FontWeight.w800 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      SmoothStarRating(
                                        rating: this.model!.model!.service_reviews.items[0].worker_rating.toDouble(),
                                        size: 15,
                                        starCount: 5,
                                        // allowHalfRating: true,
                                        allowHalfRating: true,

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                dateformat.format(this.model!.model!.service_reviews.items[0].start_date),
                                                style: descriptionStyle!.copyWith(fontSize: 12 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Html(data: readText(this.model!.model!.service_reviews.items[0].worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),
                    ],
                  )

                   */

                  /*
                    List<ItemButton> buttons;
                    String? order_item_id;
                    int? rating;
                    String? testimony;
                    int? buyer_id;
                    String? buyer_str;
                    String? buyer_url;
                    List<int?>? buyer_list;
                    List<String?>? buyer_list_str;
                    DateTime? date;
                   */


                  //  Html(data: readText(this.model!.model!.service_reviews.items[0].testimony, 150)),
                ]
            )




        )
    )

        :
    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AsProjectOwnerList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                    url: Env.value!.baseUrl! + '/public/browse_users/as_project_owner_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?')),
              );
            },
            child:

            Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Peer Reviews as Owner',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  Center(
                    child:
                    Card(
                        elevation : 3.0,
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin : EdgeInsets.only(left:5, top: 10, right:10, bottom: 15),

                        child:
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                isThreeLine: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 2 , vertical: 1),
                                //enabled: false,
                                onLongPress: () {},
                                //onTap: () => Navigator.of(context).pushNamed('chat'),
                                onTap: () {

                                },


                                leading: Container(
                                  width: 80,
                                  height: 80,

                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        top: 13,
                                         left: 30,
                                        //left: 10,
                                        child:


                                        GestureDetector(
                                          onTap: (){
                                            //   AppProvider.getRouter(context)!.navigateTo(
                                            //       context,
                                            //      urlToRoute('public/browse_users/view/'+encode(this.model!.model!.product_reviews.items[0].buyer_id) + '/z'));
                                          },
                                          child :

                                          CircleAvatar(
                                            // radius: 100,
                                            // minRadius: 70,
                                            // maxRadius: 70,
                                            // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                                            backgroundImage: NetworkImage(this.model!.model!.as_project_owner.items[0].accepted_worker_avatar),
                                          ),

                                           /*


                                          CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            // radius: 20,
                                            child: Icon(
                                              Icons.person,
                                              size: 55.0,
                                              //  color: CurrentTheme.HomeColor,
                                            ),
                                          ),

                                            */



                                        ),
                                      ),



                                    ],
                                  ),
                                ),


                                subtitle:
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        //crossAxisAlignment: CrossAxisAlignment.s,
                                        children: <Widget>[
                                          Expanded(
                                            child:
                                            GestureDetector(
                                              onTap: (){
                                                AppProvider.getRouter(context)!.navigateTo(
                                                    context,
                                                    urlToRoute(this.model!.model!.as_project_owner.items[0].accepted_worker_url));
                                              },
                                              child:
                                              Padding(
                                                padding: EdgeInsets.only(top: 17, right: 5),
                                                child:
                                                this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :

                                                Text( this.model!.model!.as_project_owner.items[0].accepted_worker_str, overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: descriptionStyle!.copyWith(fontSize: 17, letterSpacing: 1, fontWeight: FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only( top: 4),
                                        child:
                                        this.model!.model!.as_project_owner.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :

                                        Text(
                                          this.model!.model!.as_project_owner.items[0].finish_date == null? '':
                                          dateformat.format(this.model!.model!.as_project_owner.items[0].finish_date) + ' ' + 'WIB',
                                          style: descriptionStyle!.copyWith(fontSize: 12 ),
                                        ),

                                      )
                                    ]
                                ),





                              ),

                              SizedBox(height: 10,),
                              Center(
                                child:
                                RatingBarIndicator(
                                  rating: this.model!.model!.as_project_owner.items[0].owner_rating.toDouble()/2-0.01,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: CurrentTheme.PrimaryLightColor,
                                  ),
                                  itemCount: 5,
                                  itemSize: 30.0,
                                  unratedColor: Colors.black26,
                                  direction:  Axis.horizontal,
                                ),


                              ),
                              SizedBox(height: 5,),

                              Center(
                                child: Text(this.model!.model!.as_project_owner.items[0].owner_rating.toString() + '/10', style: TextStyle(fontSize: 12)),
                              ),
                              SizedBox(height: 8,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 0.0),
                                child :
                                GestureDetector(
                                  onTap: (){
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(this.model!.model!.as_project_owner.items[0].project_url));
                                  },
                                  child:
                                      Html(
                                        // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                                          data:this.model!.model!.as_project_owner.items[0].title,
                                          style: {
                                            "html": Style(
                                                fontSize: FontSize.large,
                                                fontWeight: FontWeight.w800
                                            ),
                                          }

                                      ),
                                ),
                              ),
                              SizedBox(height: 1,),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                                child: HtmlWidget('${readText(this.model!.model!.as_project_owner.items[0].owner_feedback!.replaceAll('%;\"><\/div>', '%;background-color: #FF8000;\"><\/div>')!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>') ?? '', 800)}',
                                  //tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w400,

                                  ),
                                  // bodyPadding : EdgeInsets.only(left : 0.0,top:4.0,bottom: 0.0, right: 5)
                                ),
                              ),
                              SizedBox(height: 20,),
                            ]
                        )
                    ),
                  ),



                  //  Html(data: readText(this.model!.model!.service_reviews.items[0].testimony, 150)),
                ]
            )




        )
    );
  }

  Widget userArbitrase(BuildContext context, var data){

    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    var dateformat = DateFormat('dd/MM/yyyy');
    bool? loading = true;



    return this.model!.model!.user_arbitrations.items!.length == 0 ?

    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {


            },
            child:

            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Arbitrase',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        //Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  //Center(
                  // child:
                  Text('Belum ada arbitrase', style: TextStyle(fontStyle: FontStyle.italic)),
                  // ),
                  /*
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 16.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      Icon(
                                        Icons.person,
                                        size: 35.0,
                                       // color: CurrentTheme.HomeColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                this.model!.model!.service_reviews.items[0].owner_str,
                                                style: descriptionStyle!.copyWith(fontSize: 15, fontWeight:FontWeight.w800 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      SmoothStarRating(
                                        rating: this.model!.model!.service_reviews.items[0].worker_rating.toDouble(),
                                        size: 15,
                                        starCount: 5,
                                        // allowHalfRating: true,
                                        allowHalfRating: true,

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                dateformat.format(this.model!.model!.service_reviews.items[0].start_date),
                                                style: descriptionStyle!.copyWith(fontSize: 12 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Html(data: readText(this.model!.model!.service_reviews.items[0].worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),
                    ],
                  )

                   */

                  /*
                    List<ItemButton> buttons;
                    String? order_item_id;
                    int? rating;
                    String? testimony;
                    int? buyer_id;
                    String? buyer_str;
                    String? buyer_url;
                    List<int?>? buyer_list;
                    List<String?>? buyer_list_str;
                    DateTime? date;
                   */


                  //  Html(data: readText(this.model!.model!.service_reviews.items[0].testimony, 150)),
                ]
            )




        )
    )

        :

    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserArbitrationsList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                    url: Env.value!.baseUrl! + '/public/browse_users/user_arbitrations_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?')),
              );
            },
            child:

            Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Arbitrase',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  Center(
                    child:
                    Card(
                        elevation : 3.0,
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin : EdgeInsets.only(left:5, top: 10, right:10, bottom: 15),

                        child:
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              /*

                              SizedBox(height: 10,),
                              Center(
                                child:
                                RatingBarIndicator(
                                  rating: this.model!.model!.as_project_worker.items[0].worker_rating.toDouble()/2-0.01,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: CurrentTheme.PrimaryLightColor,
                                  ),
                                  itemCount: 5,
                                  itemSize: 30.0,
                                  unratedColor: Colors.black26,
                                  direction:  Axis.horizontal,
                                ),


                              ),
                              SizedBox(height: 5,),

                              Center(
                                child: Text(this.model!.model!.as_project_worker.items[0].worker_rating.toString() + '/10', style: TextStyle(fontSize: 12)),
                              ),

                               */
                              SizedBox(height: 8,),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(25.0, 5.0, 0.0, 0.0),
                                child :

                                GestureDetector(
                                  onTap: (){
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(data['project_url']));} ,
                                  child:
                                  HtmlWidget(
                                    // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                                    data['project_str'],
                                    textStyle: descriptionStyle!.copyWith(
                                      fontSize: 15.75,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w800,

                                    ),

                                  ),

                                ),
                              ),

                              SizedBox(height: 15,),

                              Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                                child: HtmlWidget('${readText(data['plaintiff_description'].trim()!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>') ?? '', 400).trim()}',
                                  //tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w400,

                                  ),
                                  // bodyPadding : EdgeInsets.only(left : 0.0,top:4.0,bottom: 0.0, right: 5)
                                ),
                              ),
                              /*
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: (){
                                          AppProvider.getRouter(context)!.navigateTo(
                                              context,
                                              urlToRoute(this.model!.model!.user_arbitrations.items[0].plaintiff_url));} ,
                                        child:   this.model!.model!.user_arbitrations.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :
                                        Text(
                                          '~ ${this.model!.model!.user_arbitrations.items[0].plaintiff_str} / Complaint ',
                                          style: descriptionStyle!.copyWith(color: Colors.blue, fontSize: 16, fontWeight:FontWeight.w200 ),
                                        ),
                                      ),
                                    ]
                                ),
                              ),

                               */
                              SizedBox(height: 10,),

                              Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child:           Text('Komplain oleh:', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)

                              ),

                              ListTile(
                                isThreeLine: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 2 , vertical: 1),
                                //enabled: false,
                                onLongPress: () {},
                                //onTap: () => Navigator.of(context).pushNamed('chat'),
                                onTap: () {

                                },


                                leading: Container(
                                  width: 80,
                                  height: 80,

                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        top: 13,
                                        left: 30,
                                        //left: 10,
                                        child:


                                        GestureDetector(
                                          onTap: (){
                                            //   AppProvider.getRouter(context)!.navigateTo(
                                            //       context,
                                            //      urlToRoute('public/browse_users/view/'+encode(this.model!.model!.product_reviews.items[0].buyer_id) + '/z'));
                                          },
                                          child :

                                          CircleAvatar(
                                            // radius: 100,
                                            // minRadius: 70,
                                            // maxRadius: 70,
                                            // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                                            backgroundImage: NetworkImage(data['plaintiff_avatar']),
                                          ),


                                          /*
                                          CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            // radius: 20,
                                            child: Icon(
                                              Icons.person,
                                              size: 55.0,
                                              //  color: CurrentTheme.HomeColor,
                                            ),
                                          ),

                                           */


                                        ),
                                      ),



                                    ],
                                  ),
                                ),

                                /*
              title: Text(
                '${widget._jsonMessage['display']}',
                maxLines: 2,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),

               */
                                subtitle:
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        //crossAxisAlignment: CrossAxisAlignment.s,
                                        children: <Widget>[
                                          Expanded(
                                            child:
                                            GestureDetector(
                                              onTap: (){

                                                AppProvider.getRouter(context)!.navigateTo(
                                                    context,
                                                    urlToRoute(data['plaintiff_url']));

                                              },
                                              child:
                                              Padding(
                                                padding: EdgeInsets.only(top: 17, right: 5),
                                                child:


                                                Text( data['plaintiff_str'], overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 17,  letterSpacing: 1, fontWeight: FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only( top: 4),
                                        child:
                                        this.model!.model!.user_arbitrations.items!.length == 0 ? Container(width: 0.0, height: 0.0,) :

                                        Text(
                                          data['requested_date'] == null? '':
                                          dateformat.format(DateTime.parse(data['requested_date'] as String)) + ' ' + 'WIB',
                                          style: descriptionStyle!.copyWith(fontSize: 12 ),
                                        ),

                                      )
                                    ]
                                ),





                              ),

                              SizedBox(height: 25,),
                            ]
                        )
                    ),
                  ),
                  /*
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 16.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      Icon(
                                        Icons.person,
                                        size: 35.0,
                                       // color: CurrentTheme.HomeColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                this.model!.model!.service_reviews.items[0].owner_str,
                                                style: descriptionStyle!.copyWith(fontSize: 15, fontWeight:FontWeight.w800 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      SmoothStarRating(
                                        rating: this.model!.model!.service_reviews.items[0].worker_rating.toDouble(),
                                        size: 15,
                                        starCount: 5,
                                        // allowHalfRating: true,
                                        allowHalfRating: true,

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                dateformat.format(this.model!.model!.service_reviews.items[0].start_date),
                                                style: descriptionStyle!.copyWith(fontSize: 12 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Html(data: readText(this.model!.model!.service_reviews.items[0].worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),
                    ],
                  )

                   */

                  /*
                    List<ItemButton> buttons;
                    String? order_item_id;
                    int? rating;
                    String? testimony;
                    int? buyer_id;
                    String? buyer_str;
                    String? buyer_url;
                    List<int?>? buyer_list;
                    List<String?>? buyer_list_str;
                    DateTime? date;
                   */


                  //  Html(data: readText(this.model!.model!.service_reviews.items[0].testimony, 150)),
                ]
            )




        )
    );


    /*
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.subhead;
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model!.model!.user_arbitrations.items!.length == 0 ? Container(height:0.0, width: 0.0,):
    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child:

        Column(
            children: <Widget>[
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child :

                GestureDetector(
                  onTap: (){
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute(this.model!.model!.user_arbitrations.items[0].project_url));} ,
                  child:
                  Html(
                    // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                      data:this.model!.model!.user_arbitrations.items[0].project_str,
                      style: {
                        "html": Style(
                            fontSize: FontSize.large,
                            fontWeight: FontWeight.w800
                        ),
                      }

                  ),

                ),
              ),
              this.model!.model!.user_arbitrations.items[0].plaintiff_description == null? Container(width: 0.0, height: 0.0,):
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                child : Html(data: '${readText(this.model!.model!.user_arbitrations.items[0].plaintiff_description!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>') ?? '', 400)}',
                    style: {
                      "html": Style(
                        fontSize: FontSize.large,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic,
                      ),
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute(this.model!.model!.user_arbitrations.items[0].plaintiff_url));} ,
                        child:   this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                        Text(
                          '~ ${this.model!.model!.user_arbitrations.items[0].plaintiff_str} / Complaint ',
                          style: descriptionStyle!.copyWith(color: Colors.blue, fontSize: 16, fontWeight:FontWeight.w200 ),
                        ),
                      ),
                    ]
                ),
              ),
              Divider(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        'Complaint by',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                      this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        '${this.model!.model!.user_arbitrations.items[0].plaintiff_str}',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),

                    ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        'Request date',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                      this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        dateformat.format(this.model!.model!.user_arbitrations.items[0].requested_date  ),
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        'Defendant',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                      this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        '${this.model!.model!.user_arbitrations.items[0].defendant_str}',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),

                    ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        'Owner rating',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                      this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      // three line description
                      RatingBarIndicator(
                        rating: this.model!.model!.user_arbitrations.items[0].owner_rating.toDouble()/2-0.01,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: CurrentTheme.PrimaryLightColor,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        unratedColor: Colors.black26,
                        direction:  Axis.horizontal,
                      ),


                    ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      Text(
                        'Worker rating',
                        style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w200 ),
                      ),
                      this.model!.model!.user_arbitrations.items.length == 0 ? Container(width: 0.0, height: 0.0,) :
                      // three line description
                      RatingBarIndicator(
                        rating: this.model!.model!.user_arbitrations.items[0].worker_rating.toDouble()/2-0.01,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: CurrentTheme.PrimaryLightColor,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        unratedColor: Colors.black26,
                        direction:  Axis.horizontal,
                      ),


                    ]
                ),
              ),
              Divider(height: 20.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserArbitrationsList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                                url: Env.value!.baseUrl! + '/public/browse_users/user_arbitrations_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?')),
                          );
                        } ,
                        child:  Text(
                          'more...',
                          style: descriptionStyle!.copyWith(color : Colors.blue ,fontSize: 14, fontWeight:FontWeight.w200 ),
                        ),
                      ),

                    ]
                ),
              ),
              Divider()
            ]
        )
    );

     */

    /*
    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {

               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserArbitrationsList(id : this.model!.model!.user_id, title: this.model!.meta.title,
                    url: Env.value!.baseUrl! + '/public/browse_users/user_arbitrations_list/'+this.model!.model!.user_id+'/'+this.model!.meta.title + '?')),
              );
            },
            child:
            Column(
        children: <Widget>[
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Arbitrase',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
              Icon(Icons.arrow_forward, size: 18.0)
            ]
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child : Html(
                // data: ' Project' ,defaultTextStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight:FontWeight.w800 )
                data :  this.model!.model!.user_arbitrations.items[0].project_str,                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,
                                                                      fontWeight: FontWeight.w800
                                                                  ),
                                                                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child :
              Html(
                data : this.model!.model!.user_arbitrations.items[0].status_str + ' Arbitration' ,                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.medium,
                                                                      fontWeight: FontWeight.w800
                                                                  ),
                                                                }
              ),
            ),
            SizedBox(
              height: 40.0,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 16.0,
                    //top: 0.0,
                    child:    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: DefaultTextStyle(
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: descriptionStyle,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // three line description
                            Icon(
                              Icons.person,
                              size: 35.0,
                              color: CurrentTheme.HomeColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      this.model!.model!.user_arbitrations.items[0].plaintiff_str,
                                      style: descriptionStyle!.copyWith(fontSize: 14, fontWeight:FontWeight.w800 ),
                                    ),


                                  ]

                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    //top: 0.0,
                    child:    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: DefaultTextStyle(
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: descriptionStyle,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // three line description

                            Text('Date of complaint ' , style: descriptionStyle!.copyWith(fontSize: 12 )),
                            this.model!.model!.user_arbitrations.items[0].requested_date == null? Container(width: 0.0, height: 0.0,):
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      dateformat.format(this.model!.model!.user_arbitrations.items[0].requested_date),
                                      style: descriptionStyle!.copyWith(fontSize: 12 ),
                                    ),

                                  ]

                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Html(data: readText(this.model!.model!.user_arbitrations.items[0].plaintiff_description!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),

          ],
        ),
        ]
    )


        )
    );

    */

  }

  Widget viewPortfolio (BuildContext context){
    if(this.model!.model!.portofolio.items.length == 0){
      return Container(height:0 , width: 0);
    }else{
      return   Container(
        height: 200.0,
        child: this.model!.model!.portofolio.items.length == 0?
        Container(width : 0.0, height : 0.0)
            : ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int? index) {
            return index! >= this.model!.model!.portofolio.items.length
                ? Container(width : 0.0, height : 0.0)
                :PortfoliosItem(model: this.model!.model!.portofolio.items[index], info : this.model!.model!.portofolio );
          },
          itemCount: this.model!.model!.portofolio.items.length <= 15
              ? this.model!.model!.portofolio.items.length
              : 8,
          // controller: controller1,
        ),
      );
    }

  }
/*
 List<ItemButton> buttons;
  String? arbitration_id;
  int? project_id;
  String? project_str;
  String? project_url;
  List<int?>? project_list;
  List<String?>? project_list_str;
  int? plaintiff_id;
  String? plaintiff_str;
  String? plaintiff_url;
  List<int?>? plaintiff_list;
  List<String?>? plaintiff_list_str;
  DateTime? requested_date;
  String? plaintiff_description;
  String? plaintiff_wishes;
  int? defendant_id;
  String? defendant_str;
  String? defendant_url;
  List<int?>? defendant_list;
  List<String?>? defendant_list_str;
  DateTime? defendant_response_date;
  String? defendant_description;
  String? defendant_wishes;
  String? analysis;
  DateTime? decided_date;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? type_id;
  String? type_str;
  List<int?>? type_list;
  List<String?>? type_list_str;
  int? owner_rating;
  int? owner_point;
  String? owner_point_str;
  double? owner_amount;
  String? owner_amount_str;
  int? owner_percentage;
  int? worker_rating;
  int? worker_point;
  String? worker_point_str;
  double? worker_amount;
  String? worker_amount_str;
  int? worker_percentage;
 */

/*
  Widget viewReview(BuildContext context){
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.subhead;
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model!.model!.service_reviews.items.length == 0 ?

    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {


            },
            child:

            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Reviews',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        //Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  //Center(
                  // child:
                  Text('Belum ada review', style: TextStyle(fontStyle: FontStyle.italic)),
                  // ),
                  /*
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 16.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      Icon(
                                        Icons.person,
                                        size: 35.0,
                                       // color: CurrentTheme.HomeColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                this.model!.model!.service_reviews.items[0].owner_str,
                                                style: descriptionStyle!.copyWith(fontSize: 15, fontWeight:FontWeight.w800 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      SmoothStarRating(
                                        rating: this.model!.model!.service_reviews.items[0].worker_rating.toDouble(),
                                        size: 15,
                                        starCount: 5,
                                        // allowHalfRating: true,
                                        allowHalfRating: true,

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                dateformat.format(this.model!.model!.service_reviews.items[0].start_date),
                                                style: descriptionStyle!.copyWith(fontSize: 12 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Html(data: readText(this.model!.model!.service_reviews.items[0].worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),
                    ],
                  )

                   */

                  /*
                    List<ItemButton> buttons;
                    String? order_item_id;
                    int? rating;
                    String? testimony;
                    int? buyer_id;
                    String? buyer_str;
                    String? buyer_url;
                    List<int?>? buyer_list;
                    List<String?>? buyer_list_str;
                    DateTime? date;
                   */


                  //  Html(data: readText(this.model!.model!.service_reviews.items[0].testimony, 150)),
                ]
            )




        )
    )

        :
    Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServiceReviewsList(id : this.model!.model!.service_id, title: this.model!.meta.title,
                    url: Env.value!.baseUrl! + '/public/browse_services/service_reviews_list/'+this.model!.model!.service_id+'/'+this.model!.meta.title + '?')),
              );
            },
            child:

            Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Reviews',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                        Icon(Icons.arrow_forward, size: 18.0)
                      ]
                  ),
                  Center(
                    child:
                    Card(
                        elevation : 3.0,
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin : EdgeInsets.only(left:5, top: 10, right:10, bottom: 15),
                        color: Colors.white,
                        child:
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                isThreeLine: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 2 , vertical: 1),
                                //enabled: false,
                                onLongPress: () {},
                                //onTap: () => Navigator.of(context).pushNamed('chat'),
                                onTap: () {

                                },


                                leading: Container(
                                  width: 80,
                                  height: 80,

                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        top: 13,
                                        left: 30,
                                        child:


                                        GestureDetector(
                                          onTap: (){
                                            //   AppProvider.getRouter(context)!.navigateTo(
                                            //       context,
                                            //      urlToRoute('public/browse_users/view/'+encode(this.model!.model!.product_reviews.items[0].buyer_id) + '/z'));
                                          },
                                          child :

                                          CircleAvatar(
                                            // radius: 100,
                                            // minRadius: 70,
                                            // maxRadius: 70,
                                            // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                                            backgroundImage: NetworkImage(this.model!.model!.service_reviews.items[0].owner_photo_url),
                                          ),
                                          /*
                                          CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            // radius: 20,
                                            child: Icon(
                                              Icons.person,
                                              size: 45.0,
                                              //  color: CurrentTheme.HomeColor,
                                            ),
                                          ),

                                               */
                                        ),
                                      ),



                                    ],
                                  ),
                                ),

                                /*
              title: Text(
                '${widget._jsonMessage['display']}',
                maxLines: 2,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),

               */
                                subtitle:
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        //crossAxisAlignment: CrossAxisAlignment.s,
                                        children: <Widget>[
                                          Expanded(
                                            child:
                                            GestureDetector(
                                              onTap: (){
                                                //  AppProvider.getRouter(context)!.navigateTo(
                                                //      context,
                                                //      urlToRoute('public/browse_users/view/'+encode(this.model!.model!.product_reviews.items[0].buyer_id) + '/z'));
                                              },
                                              child:
                                              Padding(
                                                padding: EdgeInsets.only(top: 17, right: 5),
                                                child:Text( this.model!.model!.service_reviews.items[0].owner_str, overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 17, color: Colors.black, letterSpacing: 1, fontWeight: FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                          ),
                                          //FractionallySizedBox(heightFactor: 0.05),

                                          /*
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 5),
                    child:   Text(timeago.format(destination!.item.date), softWrap: true, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                  ),

                  */


                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only( top: 4),
                                        child:
                                        Text(
                                          dateformat.format(this.model!.model!.service_reviews.items[0].start_date) + ' ' + 'WIB',
                                          style: descriptionStyle!.copyWith(fontSize: 12 ),
                                        ),
                                        /*
                                        SmoothStarRating(
                                          rating: this.model!.model!.service_reviews.items[0].worker_rating.toDouble(),
                                          size: 18,
                                          starCount: 5,
                                          color: CurrentTheme.PrimaryLightColor,
                                          // allowHalfRating: true,
                                          allowHalfRating: true,

                                        ),

                                         */
                                      ),

                                      /*
              Html(


                  data :"${destination!.item.feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>')}",
                  shrinkWrap: false,
                  style: {
                    "html": s.Style(
                        fontSize: s.FontSize.medium,
                        textAlign: TextAlign.left,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 0.0, bottom: 0.0, top: 0),
                        fontWeight: FontWeight.w100,
                        lineHeight: 0.0,
                    ),
                  }

              ),

               */

                                      /*

              Container(
                width: 260,
                child:HtmlWidget( destination!.item.feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'),
                    tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
                    bodyPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5)),
              )

               */

                                    ]
                                ),





                              ),

                              SizedBox(height: 10,),
                              Center(
                                child:
                                RatingBarIndicator(
                                  rating: this.model!.model!.service_reviews.items[0].worker_rating.toDouble()/2-0.01,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: CurrentTheme.PrimaryLightColor,
                                  ),
                                  itemCount: 5,
                                  itemSize: 30.0,
                                  unratedColor: Colors.black26,
                                  direction:  Axis.horizontal,
                                ),


                              ),
                              SizedBox(height: 5,),

                              Center(
                                child: Text(this.model!.model!.service_reviews.items[0].worker_rating.toString() + '/10', style: TextStyle(fontSize: 12)),
                              ),
                              SizedBox(height: 8,),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                                child: HtmlWidget(this.model!.model!.service_reviews.items[0].worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'),
                                  //tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w400,

                                  ),
                                  // bodyPadding : EdgeInsets.only(left : 0.0,top:4.0,bottom: 0.0, right: 5)
                                ),
                              ),
                              SizedBox(height: 20,),
                            ]
                        )
                    ),
                  ),
                  /*
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 16.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      Icon(
                                        Icons.person,
                                        size: 35.0,
                                       // color: CurrentTheme.HomeColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                this.model!.model!.service_reviews.items[0].owner_str,
                                                style: descriptionStyle!.copyWith(fontSize: 15, fontWeight:FontWeight.w800 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              //top: 0.0,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: DefaultTextStyle(
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // three line description
                                      SmoothStarRating(
                                        rating: this.model!.model!.service_reviews.items[0].worker_rating.toDouble(),
                                        size: 15,
                                        starCount: 5,
                                        // allowHalfRating: true,
                                        allowHalfRating: true,

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                dateformat.format(this.model!.model!.service_reviews.items[0].start_date),
                                                style: descriptionStyle!.copyWith(fontSize: 12 ),
                                              ),

                                            ]

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Html(data: readText(this.model!.model!.service_reviews.items[0].worker_feedback!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'), 150)),
                    ],
                  )

                   */

                  /*
                    List<ItemButton> buttons;
                    String? order_item_id;
                    int? rating;
                    String? testimony;
                    int? buyer_id;
                    String? buyer_str;
                    String? buyer_url;
                    List<int?>? buyer_list;
                    List<String?>? buyer_list_str;
                    DateTime? date;
                   */


                  //  Html(data: readText(this.model!.model!.service_reviews.items[0].testimony, 150)),
                ]
            )




        )
    );
  }

 */


  @override
  PreferredSizeWidget appBar(BuildContext context, String? idHash){
    return(
        AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            title: Text('', style : TextStyle( color: Colors.white, )),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Share.share('${model!.meta.title} https://projects.co.id/public/browse_users/view/${this.model!.model!.user_id}/user', subject: '${model!.meta.title}');
                    },
                    child: Icon(
                      Icons.share,
                      size: 26.0,
                    ),
                  )
              ),
            ]
        )
    );
  }




  Widget viewSkills1 (BuildContext context, ChatBloc? cb) {
    if(this.model!.model!.skills_url != null){
      if(this.model!.model!.skills_url.length == 0){
        return Container();
      }else {
        return (ChannelRouteTagsWidget(
          value: this.model!.model!.skills_id,
          caption: '',
          hint: ' ',
          required: false,
          idroutetags: this.model!.model!.skills_id,
          nameroutetags: this.model!.model!.skills_str,
          urlroutetags: this.model!.model!.skills_url,
          getValue: (String? val) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  PublicBrowseUsersListing(id: val!.split('?')[1], cb: cb)),
            );
          },
        ));
      }
    }else{
      return( 	ChannelNonURLRouteWidget(
        value: this.model!.model!.skills_id,
        caption: '',
        hint: ' ',
        required: false,
        idroutetags: this.model!.model!.skills_id,
        nameroutetags: this.model!.model!.skills_str,
      ));

    }
  }


  //@override
  Widget view1(BuildContext context, ScrollController controller, bool? account, ChatBloc? cb, var dataar) {



    viewChildren.clear();

   /* if(this.model!.meta.before_title != null){ viewChildren.add(Padding(
      padding: const EdgeInsets.fromLTRB(
          8.0, 14.0, 8.0, 2.0),
      child:  Html(data: this.model!.meta.before_title!),
    ));}
    if(this.model!.meta.title != null){ viewChildren.add(Padding(
      padding: const EdgeInsets.fromLTRB(
          8.0, 14.0, 8.0, 2.0),
      child:  Html(data: this.model!.meta.title!),
    ));}
    if(this.model!.meta.after_title != null){ viewChildren.add(Padding(
      padding: const EdgeInsets.fromLTRB(
          8.0, 14.0, 8.0, 2.0),
      child:  Html(data: this.model!.meta.after_title!),
    ));}
    if(this.model!.meta.warning != null){ viewChildren.add(Padding(
      padding: const EdgeInsets.fromLTRB(
          8.0, 14.0, 8.0, 2.0),
      child:  Html(data: this.model!.meta.warning.message, backgroundColor: CurrentTheme.WarningColor),
    ));}

    if(this.model!.meta.before_content != null){ viewChildren.add(Padding(
      padding: const EdgeInsets.fromLTRB(
          8.0, 14.0, 8.0, 2.0),
      child:  Html(data: this.model!.meta.before_content),
    ));}

     */

    viewChildren.add(viewHeader(context, account!, cb));
  //  viewChildren.add(viewPointContainer());
    viewChildren.add(viewUserInfo(context));
    if(cb == null){
      var cb1 = AppProvider.getApplication(context).chat;
      viewChildren.add(viewSkills1(context, cb1));
    }else{
      viewChildren.add(viewSkills1(context, cb));
    }

    viewChildren.add(reviewUserAsWorker(context));
    viewChildren.add(reviewUserAsOwner(context));
    viewChildren.add(userArbitrase(context, dataar));
    if(cb == null){
      var cb1 = AppProvider.getApplication(context).chat;
      viewChildren.add(viewUserServices(context, cb1));
      viewChildren.add(viewUserProducts(context, cb1));
    }else{
      viewChildren.add(viewUserServices(context, cb));
      viewChildren.add(viewUserProducts(context, cb));
    }






  /*  viewChildren.add(viewSelfIntroduction(context));
    viewChildren.add(viewSkills(context));
    viewChildren.add(viewPhoto(context));
    viewChildren.add(viewDisplayName(context));
    viewChildren.add(viewUserName(context));
    viewChildren.add(viewAccountType(context));
    viewChildren.add(viewDateRegistered(context));
    viewChildren.add(viewProvinsi(context));
    viewChildren.add(viewKabupaten(context));
    viewChildren.add(viewWebsite(context));
    viewChildren.add(viewOnlineHours(context));
    viewChildren.add(viewProjectsCompleted(context));
    viewChildren.add(viewCurrentProjects(context));
    viewChildren.add(viewLastSeen(context));
    viewChildren.add(viewWorkerRating(context));
    viewChildren.add(viewWorkerRatingNum(context));
    viewChildren.add(viewWorkerPoint(context));
    viewChildren.add(viewWorkerRanking(context));
    viewChildren.add(viewOwnerRating(context));
    viewChildren.add(viewOwnerRatingNum(context));
    viewChildren.add(viewOwnerPoint(context));
    viewChildren.add(viewOwnerRanking(context));
    viewChildren.add(viewProjectsOwned(context));
    viewChildren.add(viewSellerRating(context));
    viewChildren.add(viewSellerRatingNum(context));
    viewChildren.add(viewSellerPoint(context));
    viewChildren.add(viewSellerRanking(context));
    viewChildren.add(viewProductSold(context));
    viewChildren.add(viewAffiliateRating(context));
    viewChildren.add(viewAffiliateRatingNum(context));
    viewChildren.add(viewAffiliatePoint(context));
    viewChildren.add(viewAffiliateRanking(context));
    viewChildren.add(viewReferedUsers(context));
    viewChildren.add(viewWorkQuality(context));
    viewChildren.add(viewExpertise(context));
    viewChildren.add(viewWorkerCommunication(context));
    viewChildren.add(viewWorkerProfessionalism(context));
    viewChildren.add(viewClarity(context));
    viewChildren.add(viewFriendliness(context));
    viewChildren.add(viewOwnerCommunication(context));
    viewChildren.add(viewOwnerProfessionalism(context));
    viewChildren.add(viewProjectsWon(context));
    viewChildren.add(viewProjectsWonCumulative(context));
    viewChildren.add(viewProjectsOwnedCumulative(context));
    viewChildren.add(viewProjectsNoAction(context));
    viewChildren.add(viewProjectsCanceled(context));
    viewChildren.add(viewMissedPayment(context));
    viewChildren.add(viewProjectsArbitrated(context));
    viewChildren.add(viewProjectsWonInArbitration(context));
    viewChildren.add(viewProjectsLostInArbitration(context));
    viewChildren.add(viewMissedWeeklyReport(context));
    viewChildren.add(viewProductSoldCumulative(context));
    viewChildren.add(viewProductBought(context));
    viewChildren.add(viewProductBoughtCumulative(context));
    viewChildren.add(viewBidCount(context));
    viewChildren.add(viewPostCount(context));

   */

    if(this.model!.meta.after_content != null){ viewChildren.add(Padding(
      padding: const EdgeInsets.fromLTRB(
          8.0, 14.0, 8.0, 2.0),
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


class ShowItemPortfolios extends StatelessWidget {
  final String? image;
  ShowItemPortfolios({this.image});
  var _appbar = AppBar(
    backgroundColor: CurrentTheme.MainAccentColor,
    elevation: 0.0,
    title: Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
      child: Text(
        'View',
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
     // resizeToAvoidBottomPadding: false,
      body: PhotoView(
        imageProvider: NetworkImage(
          this.image!
          ,
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

class PortfoliosItem extends StatelessWidget {
  final ItemPortofolio? model;
  final PortofolioListingTools? info;
  PortfoliosItem({this.model, this.info});

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
                // return BidItemInfo(info : this.info);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowItemPortfolios(image : this.model!.image_url)),
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

class DescUserInfo extends StatelessWidget {
  final ViewModelBrowseUsersRev? info;
  final String? title;
  ScrollController? controller;
  bool? account;
  DescUserInfo({this.info, this.title, this.account});
  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: (){
                if(account!){
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute('public/browse_users/hire_me/${this.info!.user_id}/haloo'));
                }else{
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                     '/login/1');
                }

              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "HIRE ME",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: (){
                if(account!){
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute('public/browse_users/invite_to_bid/${this.info!.user_id}/test'));
                }else{
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      '/login/1');
                }

              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Invite to bid",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            backgroundColor: CurrentTheme.MainAccentColor,
            elevation: 0.0,
            title: Row (
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0 , 0.0),
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      this.info!.photo_url!,
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
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontSize: 13.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
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
                    child:  Html(data: this.info!.self_introduction!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'),
                        onLinkTap: (url, _, __, ___) async{
                          if(url!.contains('projects.co.id')){


                            if(url!.contains(RegExp(r'[0-9]'))){
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
                        onImageTap:(src, _, __, ___){
                          // print('print source : $src');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShowItemScreenshots1(image:'$src')),
                          );

                        }
                    ),
                  ),

                  _buildButtons(context),
                ]
            )

        )


    );

  }
}

class ServiceUserItem extends StatelessWidget {
  final ItemServices? model;
  final ChatBloc? cb;

  ServiceUserItem({this.model, this.cb});

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
                  MaterialPageRoute(builder: (context) => PublicBrowseServicesView(id:'${model!.service_id}', title: '${model!.title}', cb: cb)),
                );
                /*

                AppProvider.getRouter(context)!.navigateTo(
                    context, urlToRoute('/public/browse_services/view/${model!.service_id}/${model!.title}'));

                 */
                /*  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => flashSale(),
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
                height: 190.0,
                width: 121.0,
                //color: CurrentTheme.ShadeColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 90.0,
                      width: 110.0,
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
                              child:ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child:
                                  Image.network(
                                    model!.logo_url!,
                                    fit: BoxFit.contain,

                                  )
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                        padding:
                        EdgeInsets.only(left: 20.0, right: 0.0, top: 10.0),
                        child: Html(data:readText(model!.title!, 35),                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w500
                                                                  ),
                                                                })
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.0, top: 0.0,right: 0.0),
                      child: Text(model!.price_str!,
                          style: TextStyle(
                              fontSize: 10.5,
                              //color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Sans")),
                    ),


                    /*    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 0.0,right: 10.0),
                      child: Text(
                        model!.seller,
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Sans",
                            color: Colors.black),
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 0.0,right: 10.0),
                      child: Container(
                        height: 5.0,
                        width: model!.seller.length.toDouble()*5,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFA500),
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            shape: BoxShape.rectangle),
                      ),
                    ) */
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

class ProductUserItem extends StatelessWidget {
  final ItemProducts? model;
  final ChatBloc? cb;

  ProductUserItem({this.model, this.cb});

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
                  MaterialPageRoute(builder: (context) => PublicBrowseProductsView(id:'${model!.product_id}', title: '${model!.title}', cb: cb)),
                );
                /*
                AppProvider.getRouter(context)!.navigateTo(
                    context, urlToRoute('/public/browse_products/view/${model!.product_id}/${model!.title}'));

                 */
                /*  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => flashSale(),
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
                height: 190.0,
                width: 121.0,
               // color: CurrentTheme.BackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 90.0,
                      width: 110.0,
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
                              child:ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child:
                                  Image.network(
                                    model!.logo_url!,
                                    fit: BoxFit.contain,

                                  )
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                        padding:
                        EdgeInsets.only(left: 20.0, right: 0.0, top: 10.0),
                        child: Html(data:readText(model!.title!, 35),                                                        style: {
                                                                  "html": Style(
                                                                      fontSize: FontSize.small,
                                                                      fontWeight: FontWeight.w500
                                                                  ),
                                                                })
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.0, top: 5.0,right: 0.0),
                      child: Text(model!.price_str!,
                          style: TextStyle(
                              fontSize: 10.5,
                           //   color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Sans")),
                    ),


                    /*    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 0.0,right: 10.0),
                      child: Text(
                        model!.seller,
                        style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Sans",
                            color: Colors.black),
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 0.0,right: 10.0),
                      child: Container(
                        height: 5.0,
                        width: model!.seller.length.toDouble()*5,
                        decoration: BoxDecoration(
                            color: Color(0xFFFFA500),
                            borderRadius:
                            BorderRadius.all(Radius.circular(4.0)),
                            shape: BoxShape.rectangle),
                      ),
                    ) */
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

class userBottomLoader extends StatelessWidget {
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

///////////////////////////////////////////////////


class BrowseUsersListingModel extends BrowseUsersListingBase{
  Map<String, dynamic> json;
  BrowseUsersListingModel(Map<String, dynamic> this.json):super(json);

  @override
  Widget viewItemIndex (ItemBrowseUsersModel item,String? search, int? index,bool? account ) {
    ShapeBorder? shape;
    double? height = 302;


    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson()))!.contains(search!)),
        child:  ItemBrowseUsersCard1(destination :item, search : search, shape : shape, height : height, index : index)
    );
  }


  //@override
  Widget viewItemcb (ItemBrowseUsersModel item,String? search, bool? account, ChatBloc? cb) {
    ShapeBorder? shape;
    double? height = 302;

    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson()))!.contains(search!)),
        child:  ItemBrowseUsersCard2(destination :item, search : search, shape : shape, height : height, account: account, cb : cb)
    );
  }



  SpeedDialChild floatChild (BuildContext  context){
    return SpeedDialChild(
      child: Icon(Icons.search),
      backgroundColor: Colors.green,
      label: 'Search',
      labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
      onTap: ()=>{  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchBrowseUsersListing(id : '', title : '')),
      )
      },
    );
  }

  @override
  List<SpeedDialChild>	 listButton(BuildContext context, bool? account){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
    buttonChildren.add(floatChild (context));
    for(var i = 0; i < tools.buttons.length; i++)
    {
      buttonChildren.add(ListButtonBrowseUsersWidget(tools.buttons[i],context, account));
    }

    return(
        buttonChildren
    );
  }


}

class  SearchBrowseUsersListing extends StatefulWidget {
  static const String? PATH = '/public/browse_users/listing/:id';
  final String? id ;
  final String? title;
  bool? account;
  ChatBloc? cb;
  SearchBrowseUsersListing({Key? key, this.id, this.title, this.account, this.cb}) : super(key: key);
  @override
  SearchBrowseUsersListingState createState() =>  SearchBrowseUsersListingState();
}

class  SearchBrowseUsersListingState extends State< SearchBrowseUsersListing>{
  String? title = 'Browse Users';
  bool? _dialVisible = true;
  bool? search = false;
  String? getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d';
 // final scrollController = ScrollController();
  ScrollController?  scrollController;
  BrowseUsersController? browse_users;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool? selected = false;
  AccountController? accountController;
  bool? account = true;
  String? searchText = '';
  double? initscroll = 0.0;

  

  @override
  Widget build(BuildContext context) {

    search = true;
    if(widget.id ==''){
      getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d&' + 'search=' + searchText!;
    }else{
      getPath = Env.value!.baseUrl! + '/public/browse_users/listing/' + widget.id! +'?page=%d';
    }
    accountController = AccountController(AppProvider.getApplication(context),
        AppAction.view   );
    List listAccount = [];
    final future = accountController!.getAccount();
    future.then((val){

      listAccount.addAll(val);
      if(listAccount.length == 0){
        account = false;
      }else{
        account = true;
      }

    });
    final prefs = SharedPreferences.getInstance();
    prefs.then((val){
      initscroll = val.getDouble("position");
      if(initscroll != 0.0 || initscroll != null ){
        scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
        scrollController!.addListener(_onScroll);
      } else {
        scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
        scrollController!.addListener(_onScroll);
      }
    });

    browse_users =  BrowseUsersController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    browse_users!.listing!.add(BrowseUsersList());
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: widget.id == '' ? TextField(
            textInputAction: TextInputAction.search,
            // textInputAction: TextInputAction.search ,
            onTap: (){

            },
            autofocus: true,
            onSubmitted: (String? value) {
              _onSubmited(value);
            },
            decoration: InputDecoration(
              hintText: 'Search users',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
            ),
          ) : Text(widget.title!),
        ),
        body: buildListingBar()
    );
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
  Widget buildSearchBar(String tiltle){
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
          style: TextStyle(
              fontSize: 14.0,
              height: 0.2,
              color: Colors.black
          ),
          onChanged: (String? value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

            //hasFloatingPlaceholder: false,
            suffixIcon:
            IconButton(
              icon:Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ) ,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) , gapPadding: 20.0),
          ),
        )
    );
  }
  Widget buildListingBar(){
    return BlocBuilder<BrowseUsersListing, BrowseUsersState>(
     // cubit: browse_users!.listing,

      builder: (BuildContext context, BrowseUsersState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseUsersListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child:CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
        if (state is BrowseUsersListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is BrowseUsersListingLoaded) {
          if (state.browse_users!.items.items.isEmpty) {
            if (state.browse_users!.tools.buttons.length == 0){
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
                    floatingActionButton: state.browse_users!.Buttons(context, _dialVisible, account)
                  //floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller!,browse_users,  this, Env.value!.baseUrl!, '', title)
                );
            }
          }
          if (state.browse_users!.tools.buttons.length == 0){
            return
              Scaffold(
                  body:
                  RefreshIndicator(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int? index) {

                        return index! >= state.browse_users!.items.items.length ?
                        search! ?
                        state.browse_users!.tools.paging.total_pages == state.browse_users!.tools.paging.current_page?
                        Container(height: 0.0, width: 0.0,):
                        SearchBrowseUsersBottomLoader()
                            : 1 == state.browse_users!.tools.paging.current_page?
                        Container(height: 0.0, width: 0.0,):
                        SearchBrowseUsersBottomLoader()
                            : state.browse_users!.viewItem (state.browse_users!.items.items[index] , searchText, account );
                      },
                      itemCount: state.hasReachedMax!
                          ? state.browse_users!.items.items.length
                          : state.browse_users!.items.items.length + 1,
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
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int? index) {
                      return index! >= state.browse_users!.items.items.length ?
                      search! ?
                      state.browse_users!.tools.paging.total_pages == state.browse_users!.tools.paging.current_page?
                      Container(height: 0.0, width: 0.0,):
                      SearchBrowseUsersBottomLoader()
                          : 1 == state.browse_users!.tools.paging.current_page?
                      Container(height: 0.0, width: 0.0,):
                      SearchBrowseUsersBottomLoader()
                          : state.browse_users!.viewItem (state.browse_users!.items.items[index] , searchText, account );
                    },
                    itemCount: state.hasReachedMax!
                        ? state.browse_users!.items.items.length
                        : state.browse_users!.items.items.length + 1,
                    controller: scrollController,
                  ),
                  onRefresh: _onRefresh,
                ),

                floatingActionButton: state.browse_users!.Buttons(context, _dialVisible, account)
              //floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller!,browse_users,  this, Env.value!.baseUrl!, '', title!, account)

            );
        }

        return Center(
            child:CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green),
            ));
      },
    );
  }

/*
  // @override
  Widget buildListingBar(){
    return BlocBuilder(
      cubit: browse_users!.listing,

      builder: (BuildContext context, BrowseUsersState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseUsersListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child:CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
        if (state is BrowseUsersListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is BrowseUsersListingLoaded) {
          if (state.browse_users!.items.items.isEmpty) {
            if (state.browse_users!.tools.buttons.length == 0){
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
                    floatingActionButton: state.browse_users!.Buttons(context, _dialVisible, widget.account)
                  //floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller!,browse_users,  this, Env.value!.baseUrl!, '', title)
                );
            }
          }
          if (state.browse_users!.tools.buttons.length == 0){
            return
              Scaffold(
                  body:
                  RefreshIndicator(
                    child:
                    ListView.builder(
                      itemBuilder: (BuildContext context, int? index) {

                        return index! >= state.browse_users!.items.items.length
                            ?  SearchBrowseUsersBottomLoader()
                            : state.browse_users!.viewItem (state.browse_users!.items.items[index] , searchText, widget.account );
                      },
                      itemCount: state.hasReachedMax!
                          ? state.browse_users!.items.items.length
                          : state.browse_users!.items.items.length + 1,
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
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int? index) {

                    return index! >= state.browse_users!.items.items.length
                        ?  SearchBrowseUsersBottomLoader()
                        : state.browse_users!.viewItem (state.browse_users!.items.items[index] , searchText, widget.account );
                  },
                  itemCount: state.hasReachedMax!
                      ? state.browse_users!.items.items.length
                      : state.browse_users!.items.items.length + 1,
                  controller: scrollController,
                ),
                onRefresh: _onRefresh,
              ),

              //floatingActionButton: state.browse_users!.Buttons(context, _dialVisible)
              //floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller!,browse_users,  this, Env.value!.baseUrl!, '', title)

            );
        }

        return Center(
            child:CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green),
            ));
      },
    );
  }

 */

  @override
  void dispose() {
    browse_users!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = Completer<Null>();
    browse_users!.listing!.add(BrowseUsersListingRefresh());

    Timer timer = Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      browse_users!.listing!.add(BrowseUsersList());
    }

  }

}


class  SearchBrowseUsersListing1 extends StatefulWidget {
  static const String? PATH = '/public/browse_users/listing/:id';
  final String? id ;
  final String? title;
  bool? account;
  ChatBloc? cb;
  SearchBrowseUsersListing1({Key? key, this.id, this.title, this.account, this.cb}) : super(key: key);
  @override
  SearchBrowseUsersListing1State createState() =>  SearchBrowseUsersListing1State();
}

class  SearchBrowseUsersListing1State extends State< SearchBrowseUsersListing1>{
  String? title = 'Browse Users';
  bool? _dialVisible = true;
  bool? search = false;
  String? getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d';
  // final scrollController = ScrollController();
  ScrollController?  scrollController;
  BrowseUsersController? browse_users;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool? selected = false;
  AccountController? accountController;
  bool? account = true;
  String? searchText = '';
  double? initscroll = 0.0;



  @override
  Widget build(BuildContext context) {

    search = true;
    if(widget.id ==''){
      getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d&' + 'search=' + searchText!;
    }else{
      getPath = Env.value!.baseUrl! + '/public/browse_users/listing/' + widget.id! +'?page=%d';
    }
    accountController = AccountController(AppProvider.getApplication(context),
        AppAction.view   );
    List listAccount = [];
    final future = accountController!.getAccount();
    future.then((val){

      listAccount.addAll(val);
      if(listAccount.length == 0){
        account = false;
      }else{
        account = true;
      }

    });
    final prefs = SharedPreferences.getInstance();
    prefs.then((val){
      initscroll = val.getDouble("position");
      if(initscroll != 0.0 || initscroll != null ){
        scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
        scrollController!.addListener(_onScroll);
      } else {
        scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
        scrollController!.addListener(_onScroll);
      }
    });

    browse_users =  BrowseUsersController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    browse_users!.listing!.add(BrowseUsersList());
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: widget.id == '' ? TextField(
            textInputAction: TextInputAction.search,
            // textInputAction: TextInputAction.search ,
            onTap: (){

            },
            autofocus: true,
            onSubmitted: (String? value) {
              _onSubmited(value);
            },
            decoration: InputDecoration(
              hintText: 'Search users',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
            ),
          ) : Text(widget.title!),
        ),
        body: buildListingBar()
    );
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
  Widget buildSearchBar(String tiltle){
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
          style: TextStyle(
              fontSize: 14.0,
              height: 0.2,
              color: Colors.black
          ),
          onChanged: (String? value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

            //hasFloatingPlaceholder: false,
            suffixIcon:
            IconButton(
              icon:Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ) ,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) , gapPadding: 20.0),
          ),
        )
    );
  }
  Widget buildListingBar(){
    return BlocBuilder<BrowseUsersListing, BrowseUsersState>(
      bloc: browse_users!.listing,

      builder: (BuildContext context, BrowseUsersState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseUsersListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child:CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
        if (state is BrowseUsersListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is BrowseUsersListingLoaded) {
          if (state.browse_users!.items.items.isEmpty) {
            if (state.browse_users!.tools.buttons.length == 0){
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
                    floatingActionButton: state.browse_users!.Buttons(context, _dialVisible, account)
                  //floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller!,browse_users,  this, Env.value!.baseUrl!, '', title)
                );
            }
          }
          if (state.browse_users!.tools.buttons.length == 0){
            return
              Scaffold(
                  body:
                  RefreshIndicator(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int? index) {

                        return index! >= state.browse_users!.items.items.length ?
                        search! ?
                        state.browse_users!.tools.paging.total_pages == state.browse_users!.tools.paging.current_page?
                        Container(height: 0.0, width: 0.0,):
                        SearchBrowseUsersBottomLoader()
                            : 1 == state.browse_users!.tools.paging.current_page?
                        Container(height: 0.0, width: 0.0,):
                        SearchBrowseUsersBottomLoader()
                            : state.browse_users!.viewItemcb (state.browse_users!.items.items[index] , searchText, account!, widget.cb );
                      },
                      itemCount: state.hasReachedMax!
                          ? state.browse_users!.items.items.length
                          : state.browse_users!.items.items.length + 1,
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
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int? index) {
                      return index! >= state.browse_users!.items.items.length ?
                      search! ?
                      state.browse_users!.tools.paging.total_pages == state.browse_users!.tools.paging.current_page?
                      Container(height: 0.0, width: 0.0,):
                      SearchBrowseUsersBottomLoader()
                          : 1 == state.browse_users!.tools.paging.current_page?
                      Container(height: 0.0, width: 0.0,):
                      SearchBrowseUsersBottomLoader()
                          : state.browse_users!.viewItemcb (state.browse_users!.items.items[index] , searchText, account , widget.cb);
                    },
                    itemCount: state.hasReachedMax!
                        ? state.browse_users!.items.items.length
                        : state.browse_users!.items.items.length + 1,
                    controller: scrollController,
                  ),
                  onRefresh: _onRefresh,
                ),

                floatingActionButton: state.browse_users!.Buttons(context, _dialVisible, account)
              //floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller!,browse_users,  this, Env.value!.baseUrl!, '', title!, account)

            );
        }

        return Center(
            child:CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green),
            ));
      },
    );
  }

/*
  // @override
  Widget buildListingBar(){
    return BlocBuilder(
      cubit: browse_users!.listing,

      builder: (BuildContext context, BrowseUsersState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseUsersListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child:CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
        if (state is BrowseUsersListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is BrowseUsersListingLoaded) {
          if (state.browse_users!.items.items.isEmpty) {
            if (state.browse_users!.tools.buttons.length == 0){
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
                    floatingActionButton: state.browse_users!.Buttons(context, _dialVisible, widget.account)
                  //floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller!,browse_users,  this, Env.value!.baseUrl!, '', title)
                );
            }
          }
          if (state.browse_users!.tools.buttons.length == 0){
            return
              Scaffold(
                  body:
                  RefreshIndicator(
                    child:
                    ListView.builder(
                      itemBuilder: (BuildContext context, int? index) {

                        return index! >= state.browse_users!.items.items.length
                            ?  SearchBrowseUsersBottomLoader()
                            : state.browse_users!.viewItem (state.browse_users!.items.items[index] , searchText, widget.account );
                      },
                      itemCount: state.hasReachedMax!
                          ? state.browse_users!.items.items.length
                          : state.browse_users!.items.items.length + 1,
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
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int? index) {

                    return index! >= state.browse_users!.items.items.length
                        ?  SearchBrowseUsersBottomLoader()
                        : state.browse_users!.viewItem (state.browse_users!.items.items[index] , searchText, widget.account );
                  },
                  itemCount: state.hasReachedMax!
                      ? state.browse_users!.items.items.length
                      : state.browse_users!.items.items.length + 1,
                  controller: scrollController,
                ),
                onRefresh: _onRefresh,
              ),

              //floatingActionButton: state.browse_users!.Buttons(context, _dialVisible)
              //floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller!,browse_users,  this, Env.value!.baseUrl!, '', title)

            );
        }

        return Center(
            child:CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green),
            ));
      },
    );
  }

 */

  @override
  void dispose() {
    browse_users!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = Completer<Null>();
    browse_users!.listing!.add(BrowseUsersListingRefresh());

    Timer timer = Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      browse_users!.listing!.add(BrowseUsersList());
    }

  }

}



class  SearchBrowseUsersBottomLoader extends StatelessWidget {
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
//class ItemBrowseUsers extends class ItemBrowseUsersBase{
//
//}

////////////////////////////
class ItemBrowseUsersCard1 extends StatelessWidget {
  const ItemBrowseUsersCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemBrowseUsersModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;



  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return SafeArea(
      top: false,
      bottom: false,
      child:
          Column(
            children: <Widget>[
              // const SectionTitle(title: ''),

              SizedBox(
                height:index == 0 ? 460 : height,
                /*   child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                margin: EdgeInsets.all(0.0),
                borderOnForeground : false, */
                child: index == 0 ? ItemBrowseUsersContent2(destination: destination) :ItemBrowseUsersContent1(destination: destination),
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

    );
  }
}

class ItemBrowseUsersCard2 extends StatelessWidget {
  const ItemBrowseUsersCard2({ Key? key, @required this.destination, this.search, this.shape, this.height, this.account, this.cb})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemBrowseUsersModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final bool? account;
  final ChatBloc? cb;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child:
      Card(
        elevation: 5.0,
        shadowColor: CurrentTheme.ListColor,
        color: Colors.deepPurple,
        child: ItemBrowseUsersContent1(destination: destination!, account: account!, cb : cb),
      ),

      /*
      Column(
          children: <Widget>[
            // const SectionTitle(title: ''),
            SizedBox(
              height: height,
              // child: Card(
              // This ensures that the Card's children are clipped correctly.
              //   clipBehavior: Clip.antiAlias,
              //   shape: shape,
              //  margin: EdgeInsets.all(0.0),
              child: ItemBrowseUsersContent1(destination: destination!, account: account),
            ),
            // ),
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
        ),

           */

    );
  }
}

class ItemBrowseUsersContent1 extends StatelessWidget {
  const ItemBrowseUsersContent1({ Key? key, @required this.destination , this.account, this.cb})
      : assert(destination != null),
        super(key: key);

  final ItemBrowseUsersModel? destination;
  final bool? account;
  final ChatBloc? cb;


  int? getViewBackground(int userid){
    int? i = 0;
    if (userid % 13 == 0) {
      i = 3;
    } else if (userid % 12 == 0) {
      i = 4;
    } else if(userid % 9 == 0){
      i = 5;
    } else if(userid % 14 == 0){
      i = 6;
    } else if(userid % 7 == 0){
      i = 7;
    } else{
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
      height: screenSize.height / 3.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: [0,1,2,3,4,5,6]!.contains(number) ? AssetImage(image[number!]!) : AssetImage(image[1]!) ,
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
    var day =  DateFormat('EE').format(dt);

    time = '  $day, ${format.format(dt)}';
    return time;
  }
  Widget viewHeader (BuildContext context, bool? account) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    // final rng = Random();
    var owner_id_str = destination!.item.buttons[2].url!.replaceAll(RegExp(r'[^0-9]'),'');
    int? owner_id = int.parse(owner_id_str)?? 1;
    final itm = owner_id == null?getViewBackground(1) : getViewBackground(owner_id);
    final mediaQueryData = MediaQuery.of(context);
    return(
        Stack(
            children: <Widget>[

              _buildCoverImage(mediaQueryData.size, itm),
              // _buildStatContainer1(context),
              SafeArea(
                child: SingleChildScrollView(

                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child:
                          Row(
                              children: <Widget>[
                                destination!.item.skills_str.isEmpty ? Container(): Text(destination!.item.skills_str[0], style: TextStyle(fontSize: 14, color: Colors.white)),
                                Expanded(
                                  child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        PopupMenuButton<int>(
                                          padding : EdgeInsets.only(left: 10, right: 8),
                                          icon: Icon(Icons.more_horiz, color: Colors.white),
                                          //color: Colors.white,
                                          onSelected: (int value) {

                                            if(value == 1) {
                                              if(account!){
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
                                              if(account!){
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => PublicBrowseUsersView(id:'${urlToRoute(destination!.item.buttons[2].url ).split('/')[4]}', title: '${urlToRoute(destination!.item.buttons[2].url).split('/')[5]}', cb: cb)),
                                              );
                                              /*
                                              AppProvider.getRouter(context)!.navigateTo(
                                                  context,
                                                  urlToRoute(destination!.item.buttons[2].url ));

                                               */
                                            }

                                          },
                                          itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                                            const PopupMenuItem<int>(
                                              value: 1,
                                              child: Text('Invite to bid'),
                                            ),
                                            const PopupMenuItem<int>(
                                              value: 2,
                                              child: Text('Hire me'),
                                            ),
                                            const PopupMenuItem<int>(
                                              value: 3,
                                              child: Text('View'),
                                            ),


                                          ],
                                        ),
                                      ]
                                  ),
                                  //settingsRow,
                                ),
                              ]
                          ),
                        ),

                      ]),


                ),

              ),
              Column(
                 // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(height: mediaQueryData.size.height/18),

                    Container(
                      width: 65,
                      height: 65,
                      decoration: ShapeDecoration(
                        shadows:[
                          BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0)),
                        ],

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(
                              width: 3,
                              color: Colors.white
                          ),
                        ),


                        image: DecorationImage(
                          image: NetworkImage(destination!.item.photo_url),
                          fit: BoxFit.contain,

                        ),
                      ),
                    )
                    /*
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        destination!.item.photo_url!,
                        fit: BoxFit.cover,
                        height: 65.0,
                        width: 65.0,

                      ),
                    ),

                     */

                  ]),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(height: mediaQueryData.size.height/5.4),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[

                          Text( '${destination!.item.worker_ranking.toString()} rank',
                            style: descriptionStyle!.copyWith( fontSize: 12, color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child:
                            Container(
                              width: 1,
                              height: 12,
                              color: Colors.white,
                            ),
                          ),

                          Text('${destination!.item.worker_point.toString()} points',
                          style: descriptionStyle!.copyWith( fontSize: 12, color: Colors.white),
                          ),


                     ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[
                              RawMaterialButton(
                                constraints: const BoxConstraints(minWidth: 88.0, minHeight: 30.0),
                                fillColor: Colors.pink,
                              splashColor: Colors.orange,
                              child: Text("HIRE ME", style: TextStyle(fontSize: 9, color: Colors.white)),
                              onPressed: (){
                                if(account!){
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(destination!.item.buttons[1].url ));
                                }else{
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      '/login/1');
                                }
                              },
                              shape: const StadiumBorder(),
                              ),
                              SizedBox(width: 30.0),
                              RawMaterialButton(
                                constraints: const BoxConstraints(minWidth: 88.0, minHeight: 30.0),
                                fillColor: Colors.transparent,
                                splashColor: Colors.orange,
                                child: Text("Invite to bid", style: TextStyle(fontSize: 10, color: Colors.white)),
                                onPressed:(){
                                  if(account!){
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item.buttons[0].url ));
                                  }else{
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        '/login/1');
                                  }
                                },
                                shape: const StadiumBorder(),
                              ),
                        ]
                    ),
                  ]
              ),

            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final mediaQueryData = MediaQuery.of(context);

    final List<Widget> children = <Widget>[
      viewHeader(context, account),
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Expanded(
              child:
              Padding(
                padding: EdgeInsets.only( top: 10),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 0.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                    GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => PublicBrowseUsersView(id:'${urlToRoute(destination!.item.buttons[2].url ).split('/')[4]}', title: '${urlToRoute(destination!.item.buttons[2].url).split('/')[5]}', cb: cb)),
                                      );
                                      /*
                                    AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(destination!.item.buttons[2].url ));

                                       */
                                    },
                                    child:
                                        Text(
                                          destination!.item.user_name,
                                          style: descriptionStyle!.copyWith(fontSize: 18, color: Colors.white ),
                                        ),
                                    ),
                            ]
                        ),
                      ),
                      Padding(
                          padding:
                          EdgeInsets.only(left: 15.0, top: 0.0),
                          child:
                          RatingBarIndicator(
                            rating: destination!.item.worker_rating.toDouble()/2-0.01,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: CurrentTheme.PrimaryLightColor,
                            ),
                            itemCount: 5,
                            itemSize: 12.0,
                            unratedColor: Colors.black26,
                            direction:  Axis.horizontal,
                          ),

                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, top: 10),
              child:  destination!.item.projects_completed == 0? Text(
                  '0 Project Completed', style: TextStyle(  fontSize: 13, color: Colors.white)):
              Text( '${destination!.item.projects_completed.toString()} Projects Completed',
                style: TextStyle(  fontSize: 13, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),



          ]
      ),

      Container(
        // height:  120.0,
        padding:  const EdgeInsets.fromLTRB(15.0, 10.0, 16.0, 0.0),
        child:
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PublicBrowseUsersView(id:'${urlToRoute(destination!.item.buttons[2].url ).split('/')[4]}', title: '${urlToRoute(destination!.item.buttons[2].url).split('/')[5]}', cb: cb)),
              );
              /*
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item.buttons[2].url ));

               */
            },
            child: Ink(
              // child: Html(data: destination!.item.short_description ,useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.black87,fontSize: 12 ), backgroundColor: CurrentTheme.BackgroundColor, )
              child:
              HtmlWidget(readText(destination!.item.self_introduction!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'),400) ,
                //bodyPadding: EdgeInsets.only(left:0.0,  bottom: 5, top: 1),
                textStyle: TextStyle(fontSize:12, color: Colors.white),
                onTapUrl: (url) async{
                  if(url!.contains('projects.co.id')){
                    if(url!.contains(RegExp(r'[0-9]'))){
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
                          urlToRoute(url + '/'));
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
              ),
              /*
                Html(data: readText(destination!.item.short_description!.replaceAll('<div>', '')!.replaceAll('<\/div>','')!.replaceAll('<br>', ' ')!.replaceAll('<p>', '')!.replaceAll('<\/p>', '<br>'),400) ,
                    //useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(fontSize: 12 )
                    style: {
                      "html": Style(
                        fontSize: FontSize.small,
                      ),
                    }
                )

                 */
            )
        ),
      ),
      SizedBox(height: 15),
      /*
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 2.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Row(

            children: <Widget>[
              // three line description
              Text(
                'Published . ',
                style: descriptionStyle!.copyWith(color: Colors.black87),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text('test'
                  ,
              style: descriptionStyle!.copyWith(color: Colors.black54),
              ),
              Text(
                ' . ',
                style: descriptionStyle!.copyWith(color: Colors.black54),
              ),
              Text(
                destination!.item.price_str,
                style: descriptionStyle!.copyWith(color: Colors.black54),
              ),

              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[



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


                    ]
                ),
                //settingsRow,
              ),


            ],
          ),
        ),
      ),

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

            // image: AssetImage(destination!.UserName, package: destination!.assetPackage),
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
              child:    Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // three line description

                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                destination!.item.seller_str,
                                style: descriptionStyle!.copyWith(color: Colors.black87,fontSize: 20 ),
                              ),

                            ]

                        ),
                      ),

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



       */

    ];



    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.subhead;
    final mediaQueryData = MediaQuery.of(context);

    final List<Widget> children = <Widget>[
      // Photo? and title.
      SizedBox(
        height:  230.0,
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
                Image.network(
                 destination!.item.photo_url!,
                  fit: BoxFit.cover,

                )
            ),
            Positioned.fill(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.lightGreenAccent,
                      onTap: () {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(destination!.item.buttons[2].url ));
                      },
                    )
                )
            ),

            Positioned.fill(
                bottom: 25,
                left: 0.80 * mediaQueryData.size.width - ratingMean(destination!.item.worker_rating_num).length.toDouble() * 1.3,
                top:  0.82 * 230.0,
                right: 30 - ratingMean(destination!.item.worker_rating_num).length.toDouble() * 0.8,
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
                  decoration: BoxDecoration(
                    //color: Colors.lightBlue[100],
                    color:CurrentTheme.NormalTextColor,
                  ),
                  child: Text( ratingMean(destination!.item.worker_rating_num) ,style: TextStyle(color: CurrentTheme.BackgroundColor),

                  ),
                )
            ),


          ],
        ),
      ),

      SizedBox(
        height: 72.0,
        child:
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description

              Container(
                padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0 , 0.0),
                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    destination!.item.photo_url!,
                    fit: BoxFit.cover,
                    height: 55.0,
                    width: 55.0,

                  ),
                ),
              ),
              //newly added
              Flexible(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0 , 0.0),
                      child: Column(
                          children : <Widget>[
                            GestureDetector(
                              onTap: () {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(destination!.item.buttons[2].url ));
                              },
                              child: Html(

                                  data :readText(destination!.item.user_name, 62),
                                style: {
                                  "html": Style(
                                    fontSize: FontSize.medium,
                                    fontWeight: FontWeight.w500,

                                  ),
                                },

                              ),
                            ),

                            Row(
                                children: <Widget>[
                                  // three line description
                                  Text(
                                    'Completed' ,
                                    style: descriptionStyle!.copyWith( fontSize: 13),
                                  ),
                                  Text(
                                    ' . '+ destination!.item.projects_completed.toString() + ' projects' + ' . ',
                                    style: descriptionStyle!.copyWith( fontSize: 13),
                                  ),
                                  Text(
                                    destination!.item.product_sold.toString() + ' sales',
                                    style: descriptionStyle!.copyWith( fontSize: 13),
                                  )


                                ]
                            )
                          ]
                      )
                  )
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0 , 0.0),
                child:
                PopupMenuButton<int>(
                  onSelected: (int value) {

                    if(value == 1) {
                      if(account!){
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
                      if(account!){
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
                      child: Text('Invite to bid'),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text('Hire me'),
                    ),
                    const PopupMenuItem<int>(
                      value: 3,
                      child: Text('View'),
                    ),


                  ],
                ),
              ),


              /*      Expanded(
                        child: Row(
                           // crossAxisAlignment: CrossAxisAlignment.end,
                           // mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[



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


                            ]
                        ),
                        //settingsRow,
                      ), */





            ]


          /*
                      Expanded(
                        child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[



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


                            ]
                        ),
                        //settingsRow,
                      ),

                      */



        ),

      )
      // Description and share/explore buttons.
      /*
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 2.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Row(

            children: <Widget>[
              // three line description
              Text(
                'Published . ',
                style: descriptionStyle!.copyWith(color: Colors.black87),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text('test'
                  ,
              style: descriptionStyle!.copyWith(color: Colors.black54),
              ),
              Text(
                ' . ',
                style: descriptionStyle!.copyWith(color: Colors.black54),
              ),
              Text(
                destination!.item.price_str,
                style: descriptionStyle!.copyWith(color: Colors.black54),
              ),

              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[



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


                    ]
                ),
                //settingsRow,
              ),


            ],
          ),
        ),
      ),

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

            // image: AssetImage(destination!.UserName, package: destination!.assetPackage),
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
              child:    Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // three line description

                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 0.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                destination!.item.seller_str,
                                style: descriptionStyle!.copyWith(color: Colors.black87,fontSize: 20 ),
                              ),

                            ]

                        ),
                      ),

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



       */

    ];



    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

 */

}

class ItemBrowseUsersContent2 extends StatelessWidget {
  const ItemBrowseUsersContent2({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemBrowseUsersModel? destination;


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;

    final List<Widget> children = <Widget>[


    ];



    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }



}


class  SearchPastProjectsListing11 extends StatefulWidget {
  //static const String? PATH = '/public/past_projects/listing/:id';
  final String? id ;
  final String? title ;
  final String? search;
  SearchPastProjectsListing11({Key? key, this.id, this.title, this.search}) : super(key: key);
  @override
  SearchPastProjectsListing11State createState() =>  SearchPastProjectsListing11State();
}

class  SearchPastProjectsListing11State extends State< SearchPastProjectsListing11>  with RestorationMixin{
  String? title = 'Past Projects';
  bool? _dialVisible = true;
  bool? search = false;
  String? getPath = Env.value!.baseUrl! + '/public/past_projects/listing?page=%d';
  final scrollController = ScrollController();
  PastProjectsController? past_projects;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool? selected = false;
  String? searchText = '';

  SearchPastProjectsListingState1() {
    scrollController!.addListener(_onScroll);
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'SearchPastProjects';

  @override
  void restoreState(RestorationBucket? oldBucket, bool? initialRestore) {
    registerForRestoration(cs, 'SearchPastProjects');
  }

  @override
  Widget build(BuildContext context) {


      getPath = Env.value!.baseUrl! + '/public/past_projects/listing?page=%d&' + 'search=' + widget.search!;


    past_projects =  PastProjectsController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    past_projects!.listing!.add(PastProjectsList());
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(widget.title!, style: TextStyle(color: Colors.white),),
        ),
        body: buildListingBar()
    );
  }





  // @override
  Widget buildListingBar(){
    return BlocBuilder<PastProjectsListing,  PastProjectsState>(
     // cubit: past_projects!.listing,

      builder: (BuildContext context, PastProjectsState state) {
        if (state is PastProjectsListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child:CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
        if (state is PastProjectsListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is PastProjectsListingLoaded) {
          if (state.past_projects!.items.items.isEmpty) {
            if (state.past_projects!.tools.buttons.length == 0){
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
                    floatingActionButton: state.past_projects!.Buttons(context, _dialVisible, false)
                  //floatingActionButton: isLoading? null :  state.past_projects!.Buttons(context, _dialVisible, controller!,past_projects,  this, Env.value!.baseUrl!, '', title)
                );
            }
          }
          if (state.past_projects!.tools.buttons.length == 0){
            return
              Scaffold(
                  body:
                  RefreshIndicator(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int? index) {

                        return index! >= state.past_projects!.items.items.length
                            ?  SearchPastProjectsBottomLoader11()
                            : state.past_projects!.viewItem (state.past_projects!.items.items[index] , searchText, false );
                      },
                      itemCount: state.hasReachedMax!
                          ? state.past_projects!.items.items.length
                          : state.past_projects!.items.items.length + 1,
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
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int? index) {

                    return index! >= state.past_projects!.items.items.length
                        ?  SearchPastProjectsBottomLoader11()
                        : state.past_projects!.viewItem (state.past_projects!.items.items[index] , searchText, false );
                  },
                  itemCount: state.hasReachedMax!
                      ? state.past_projects!.items.items.length
                      : state.past_projects!.items.items.length + 1,
                  controller: scrollController,
                ),
                onRefresh: _onRefresh,
              ),

              //floatingActionButton: state.past_projects!.Buttons(context, _dialVisible)
              //floatingActionButton: isLoading? null :  state.past_projects!.Buttons(context, _dialVisible, controller!,past_projects,  this, Env.value!.baseUrl!, '', title)

            );
        }

        return Center(
            child:CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green),
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
    if (maxScroll - currentScroll <= scrollThreshold) {
      past_projects!.listing!.add(PastProjectsList());
    }

  }

}

class  SearchPastProjectsBottomLoader11 extends StatelessWidget {
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