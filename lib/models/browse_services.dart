import 'package:projectscoid/models/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:string_mask/string_mask.dart';
import 'package:string_mask/src/mask_pattern.dart';
import 'dart:convert';
import 'meta.dart';
import 'button.dart';
import 'browse_services_item.dart';
import 'photo.dart';
import 'option_fields.dart';
import 'package:projectscoid/models/browse_services_base.dart';
import 'BrowseServices/screenshots_list_item_base.dart';
import 'package:projectscoid/models/BrowseServices/screenshots_list_base.dart';
import 'package:projectscoid/models/BrowseServices/service_reviews_list_base.dart';
import 'package:projectscoid/models/BrowseServices/service_comments_list_base.dart';
import 'BrowseServices/service_reviews_list_item_base.dart';
import 'BrowseServices/service_reviews_list_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expandable/expandable.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/views/BrowseServices/service_reviews_list.dart';
import 'package:projectscoid/views/BrowseServices/service_comments_list.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:badges/badges.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:developer';
import 'package:projectscoid/views/BrowseServices/browse_services_view.dart';
import 'package:projectscoid/views/BrowseServices/browse_services_listing.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
part 'browse_services.g.dart';
/** AUTOGENERATE OFF **/

class PlaceOrderBrowseServicesModel extends PlaceOrderBrowseServicesBase {
  Map<String, dynamic> json;
  PlaceOrderBrowseServicesModel(Map<String, dynamic> this.json) : super(json);
}

class BrowseServicesModel extends BrowseServicesBase {
  Map<String, dynamic> json;
  BrowseServicesModel(Map<String, dynamic> this.json) : super(json);
}

////////////////////////////////////////////////////
@JsonSerializable()
class ViewModelBrowseServicesRev {
  int? age;
  int? cnt;
  int? page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;
  String? description;
  int? finish_days;
  String? finish_days_str;
  List<int?>? tags_id;
  List<String?>? tags_str;
  List<String?>? tags_url;
  //Screenshots screenshots;
  double? price;
  String? price_str;
  List<OptionField1?>? options;
  String? logo_url;
  Photo? logo;

  int? rating;
  int? seller_id;
  String? seller_str;
  String? seller_url;
  int? sales_count;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  String? seller_photo_url;
  Photo? seller_photo;
  String? seller_user_name;
  int? seller_kabupaten_id;
  String? seller_kabupaten_str;
  int? seller_seller_rating;
  double? seller_seller_rating_num;
  String? seller_seller_rating_num_str;
  int? seller_seller_ranking;
  String? seller_seller_ranking_str;
  DateTime? seller_date_registered;
  DateTime? seller_last_seen;
  double? seller_completion_rate;
  double? seller_arbitration_rate;

  ScreenshotsListingTools? screenshots;
  ServiceReviewsListingToolsRev? service_reviews;
  ServiceCommentsListingTools? service_comments;
  String? service_id;

  //
  ViewModelBrowseServicesRev(
    this.id,
    this.description,
    this.finish_days,
    this.finish_days_str,
    this.tags_id,
    this.tags_str,
    this.tags_url,
    this.price,
    this.price_str,
    this.options,
    this.logo,
    this.rating,
    this.logo_url,
    this.seller_id,
    this.seller_str,
    this.seller_url,
    this.sales_count,
    this.seller_list,
    this.seller_list_str,
    this.seller_photo_url,
    this.seller_photo,
    this.seller_kabupaten_id,
    this.seller_kabupaten_str,
    this.seller_seller_rating_num,
    this.seller_seller_rating_num_str,
    this.seller_seller_ranking,
    this.seller_seller_ranking_str,
    this.seller_date_registered,
    this.seller_last_seen,
    this.seller_completion_rate,
    this.seller_arbitration_rate,
    this.screenshots,
    this.service_reviews,
    this.service_comments,
    this.service_id,
  );

  factory ViewModelBrowseServicesRev.fromJson(Map<String, dynamic> json) =>
      _$ViewModelBrowseServicesRevFromJson(json);
}
/*
ViewModelBrowseServicesRev _$ViewModelBrowseServicesRevFromJson(Map<String, dynamic> json) {
  return ViewModelBrowseServicesRev(
      json['id'] as String,
      json['description'] as String,
      json['finish_days'] as int,
      json['finish_days_str'] as String,
      (json['tags_id'] as List)?.map((e) => e as int)?.toList(),
      (json['tags_str'] as List)?.map((e) => e as String)?.toList(),
      (json['tags_url'] as List)?.map((e) => e as String)?.toList(),

      (json['price'] as num)?.toDouble(),
      json['price_str'] as String,

      (json['options'] as List)
          ?.map((e) =>
      e == null ? null : OptionField1.fromJson(e as Map<String, dynamic>))
          ?.toList(),


      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['rating'] as int,
      json['logo_url'] as String,
      json['seller_id'] as int,
      json['seller_str'] as String,
      json['seller_url'] as String,
      json['sales_count'] as int,
      (json['seller_list'] as List)?.map((e) => e as int)?.toList(),
      (json['seller_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['seller_photo_url'] as String,
      json['seller_photo'] == null
          ? null
          : Photo.fromJson(json['seller_photo'] as Map<String, dynamic>),
      json['seller_kabupaten_id'] as int,
      json['seller_kabupaten_str'] as String,
      (json['seller_seller_rating_num'] as num)?.toDouble(),
      json['seller_seller_rating_num_str'] as String,
      json['seller_seller_ranking'] as int,
      json['seller_seller_ranking_str'] as String,
      json['seller_date_registered'] == null
          ? null
          : DateTime.parse(json['seller_date_registered'] as String),
      json['seller_last_seen'] == null
          ? null
          : DateTime.parse(json['seller_last_seen'] as String),
      (json['seller_completion_rate'] as num)?.toDouble(),
      (json['seller_arbitration_rate'] as num)?.toDouble(),
      json['screenshots'] == null
          ? null
          : ScreenshotsListingTools.fromJson(json['screenshots'] as Map<String, dynamic>),
      json['service_reviews'] == null
          ? null
          : ServiceReviewsListingToolsRev.fromJson(json['service_reviews'] as Map<String, dynamic>),
      json['service_comments'] == null
          ? null
          : ServiceCommentsListingTools.fromJson(json['service_comments'] as Map<String, dynamic>),
      json['service_id'] as String)
    ..age = json['age'] as int
    ..cnt = json['cnt'] as int
    ..page = json['page'] as int
    ..ttl = json['ttl'] as String
    ..pht = json['pht'] as String
    ..sbttl = json['sbttl'] as String
    ..seller_user_name = json['seller_user_name'] as String
    ..seller_seller_rating = json['seller_seller_rating'] as int;
}

 */

@JsonSerializable()
class BrowseServicesViewSuperBaseRev {
  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelBrowseServicesRev? model;
  BrowseServicesViewSuperBaseRev(
    this.id,
    this.buttons,
    this.meta,
    this.model,
  );

  factory BrowseServicesViewSuperBaseRev.fromJson(Map<String, dynamic> json) =>
      _$BrowseServicesViewSuperBaseRevFromJson(json);
}
/*
BrowseServicesViewSuperBaseRev _$BrowseServicesViewSuperBaseRevFromJson(Map<String, dynamic> json) {
  return BrowseServicesViewSuperBaseRev(
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
          : ViewModelBrowseServicesRev.fromJson(
          json['model'] as Map<String, dynamic>));
}

 */

class BrowseServicesViewModel extends BrowseServicesViewBase {
  Map<String, dynamic> json;
  // BrowseServicesViewModel(Map<String, dynamic> this.json):super(json);
  BrowseServicesViewModel(this.json) : super(json) {
    model = BrowseServicesViewSuperBaseRev.fromJson(json);
  }
  //ChatBloc? cb;

  List<dynamic> multiSelectedOption = [];
  final _selectedOptionsController = BehaviorSubject();
  Stream get selectedOptionsToggleStream => _selectedOptionsController.stream;

  Widget viewHeader(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final mediaQueryData = MediaQuery.of(context);
    return (Column(children: <Widget>[
      //  SizedBox(
      //    height: 140.0,
      //     child:
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        // three line description

        Container(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 20.0, 0.0),
          child: InkWell(
            onTap: () {
              // return BidItemInfo(info : this.info);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowItemScreenshots1(
                        image: this.model!.model!.logo_url)),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                this.model!.model!.logo_url,
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
                padding: const EdgeInsets.fromLTRB(0.0, 40.0, 30.0, 0.0),
                child: Column(children: <Widget>[
                  Html(
                      // this.model!.meta.title ,
                      data: model!.meta.title,
                      style: {
                        "html": Style(
                          fontSize: FontSize.small,
                          // fontWeight: FontWeight.w300
                        ),
                      }
                      // useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith(  fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
                      ),
                  GestureDetector(
                    onTap: () {
                      AppProvider.getRouter(context)!.navigateTo(
                          context, urlToRoute(this.model!.model!.seller_url));
                    },
                    child: Html(
                        data: readText(this.model!.model!.seller_str, 54),
                        style: {
                          "html": Style(
                              fontSize: FontSize.small,
                              fontWeight: FontWeight.w500,
                              color: Colors.green),
                        }
                        // useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
                        ),
                  ),
                  Row(children: <Widget>[
                    // three line description
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          this.model!.model!.price_str,
                          style: descriptionStyle!.copyWith(fontSize: 11),
                        )),
                  ]),
                  SizedBox(height: 10),
                ]))),
      ]),

      //  ),
      /*
            OptionView(
              value: this.model!.model!.options,
              caption: 'Options',
            )

             */
    ]));
  }

  Widget viewBanner(BuildContext context, String? idHash, ChatBloc? cb) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Stack(children: [
        ClipRRect(
          //borderRadius: BorderRadius.circular(20),
          child: Image.network(
            this.model!.model!.logo_url,
            fit: BoxFit.cover,
            height: size.height * 0.4,
            width: size.width,
          ),
        ),
        Container(
          height: 185,
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
                        size: 20,
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
                                 child: Icon(
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
                                '${model!.meta.title} https://projects.co.id/public/browse_services/view/${this.model!.model!.service_id}/service',
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
                            if (idHash!.isNotEmpty) {
                              //  cb = ChatBloc();
                              // if(widget.id == '')

                              //  cb.wsSetHandlers();
                              //cb.lgn(widget.id);
                              //  cb.lg(idHash!);
                              //$idHash/${encode(this.model!.model!.owner_id)}
                              String? thread = '';
                              if (decode(idHash!) >
                                  this.model!.model!.seller_id) {
                                thread =
                                    '${encode(this.model!.model!.seller_id)}/$idHash';
                              } else {
                                thread =
                                    '$idHash/${encode(this.model!.model!.seller_id)}';
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChatScreen(
                                      user: {
                                        "thread": "$thread",
                                        "username":
                                            "${this.model!.model!.seller_user_name}",
                                        "userid":
                                            "${encode(this.model!.model!.seller_id)}",
                                        "display":
                                            "${this.model!.model!.seller_user_name}",
                                        "avatar":
                                            "${this.model!.model!.seller_photo_url}",
                                        "lastmesssage": "",
                                        "lasttime": "1234567890"
                                      },
                                      userID: idHash,
                                      chatBloc: cb,
                                      trans: true,
                                      ctx: context,
                                    ),
                                  )).then((value) async {
                                //  cb.dispose();
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
          // useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith(  fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
          ),
    ));
  }

  Widget viewRating1() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: RatingBarIndicator(
            rating: (this.model!.model!.rating / 2) - 0.01,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: CurrentTheme.PrimaryLightColor,
            ),
            itemCount: 5,
            itemSize: 22.0,
            unratedColor: Colors.black26,
            direction: Axis.horizontal,
          ),
          /*
          SmoothStarRating(
            rating: (this.model!.model!.rating/2)-0.01,
            size: 22,
            starCount: 5,
            color: CurrentTheme.PrimaryLightColor,
            // allowHalfRating: true,
            allowHalfRating: true,

          ),

               */
        ),
        Text('(${this.model!.model!.rating.toString()}/10)',
            style: TextStyle(fontSize: 12)),
      ],
    ));
  }

  Widget viewSales() {
    return (Padding(
      padding: EdgeInsets.only(left: 20, bottom: 10),
      child: this.model!.model!.sales_count == 0
          ? Text('Belum ada rating')
          : Text(
              '${this.model!.model!.sales_count.toString()} kali pekerjaan selesai',
              style: TextStyle(fontSize: 15)),
    ));
  }

  void multiSelectOption(dynamic option, State state) {
    // print(message);
    // if (multiSelectedMessage != null) {
    // selectedMessage =
    // message['time'] == selectedMessage['time'] ? null : message;

    if (multiSelectedOption.length == 0) {
      multiSelectedOption.add(option);
      state.setState(() {
        this.model!.model!.price = this.model!.model!.price + option['price'];
      });
    } else {
      var msm = multiSelectedOption;
      bool? isSelect = true;
      int count = 0;
      for (var item in msm) {
        if (item['description'] == option['description']) {
          multiSelectedOption.removeAt(count);
          state.setState(() {
            this.model!.model!.price =
                this.model!.model!.price - option['price'];
          });
          isSelect = false;
          break;
        }
        count++;
      }
      if (isSelect!) {
        multiSelectedOption.add(option);
        state.setState(() {
          this.model!.model!.price = this.model!.model!.price + option['price'];
        });
      }
    }

    // } else {
    //   multiSelectedMessage = [];

    //   multiSelectedMessage.add(message);
    // }

    _selectedOptionsController.add(multiSelectedOption);
  }

  IconData getIconData(List<dynamic>? multiSelectedOption, dynamic option) {
    //  print('heloooooooooo');
    if (multiSelectedOption != null) {
      if (multiSelectedOption.length == 1) {
        if (option['description'] == multiSelectedOption[0]['description']) {
          return Icons.check_box_outlined;
        } else {
          return Icons.check_box_outline_blank_sharp;
        }
      } else {
        var msm = multiSelectedOption;
        bool? isSelect = false;
        int count = 0;
        for (var item in msm) {
          if (item['description'] == option['description']) {
            isSelect = true;
          }
          count++;
        }
        if (isSelect!) {
          return Icons.check_box_outlined;
        } else {
          return Icons.check_box_outline_blank_sharp;
        }
      }
    } else {
      return Icons.check_box_outline_blank_sharp;
    }
  }

  List<Widget> getOptions(State state) {
    var maskOptions = MaskOptions()..reverse = true;
    var formatter = StringMask('#,##0', options: maskOptions);
    List<Widget> OptionsTextFields = [];

    for (int? i = 0; i! < this.model!.model!.options.length; i++) {
      if (this.model!.model!.options[i]!.description != '') {
        var val = this
            .model!
            .model!
            .options[i]!
            .price
            .toString()
            .replaceAll('.0', '');
        OptionsTextFields.add(Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 18.0),
            child: StreamBuilder(
                stream: selectedOptionsToggleStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return (GestureDetector(
                    child: Row(
                      //  crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(
                              getIconData(snapshot.data,
                                  this.model!.model.options[i].toJson()),
                              //Icons.check_box_outline_blank_sharp,
                              color: Colors.amber,
                            ),
                            Text(
                              '  ${this.model!.model!.options[i]!.description} \n  Rp. ${formatter.apply(val)},-',
                              maxLines: 2,
                            ),
                          ],
                        ),

                        // Text(' Rp. ${formatter.apply(val)},-'),

                        //  Expanded(child: OptionViewFields(i, this.optiondata)),
                        //  SizedBox(width: 16,),
                        // we need add button at last Options row
                      ],
                    ),
                    onTap: () async {
                      multiSelectOption(
                          this.model!.model!.options[i]!.toJson(), state);
                    },
                  ));
                })));
      }
    }

    return OptionsTextFields;
  }

  double? avgRating(List<ItemServiceReviewsRev> rev) {
    var rv;
    int? revRating = 0;
    int count = 0;
    for (rv in rev) {
      count++;
      revRating = (revRating! + rv.worker_rating!) as int?;
    }
    return revRating! / count;
  }

  Widget viewInfo(BuildContext context) {
    return Container(
        height: 68.0,
        padding: EdgeInsets.only(bottom: 10),
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
                        height: 49.0,
                        width: 130.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, right: 2.0, top: 0.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        this
                                            .model!
                                            .model!
                                            .seller_seller_rating_num
                                            .toStringAsFixed(1),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                    Icon(
                                      Icons.star,
                                      size: 16.0,
                                    ),
                                  ]),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 8.0, top: 1.0),
                                child: Html(data: 'Seller rating ', style: {
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
                        height: 48.0,
                        width: 130.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 8.0, top: 0.0),
                              child: Icon(
                                Icons.attach_money,
                                size: 16.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 8.0, top: 1.0),
                              child: this.model!.model!.price < 100000
                                  ? Html(
                                      data: readText('Low price', 46),
                                      style: {
                                          "html": Style(
                                              fontSize: FontSize.small,
                                              fontWeight: FontWeight.w300),
                                        })
                                  : this.model!.model!.price < 500000
                                      ? Html(
                                          data: readText(' Medium price', 46),
                                          style: {
                                              "html": Style(
                                                  fontSize: FontSize.small,
                                                  fontWeight: FontWeight.w300),
                                            })
                                      : Html(
                                          data: readText('High price', 46),
                                          style: {
                                              "html": Style(
                                                  fontSize: FontSize.small,
                                                  fontWeight: FontWeight.w300),
                                            }),
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
                        height: 48.0,
                        width: 130.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 2.0, top: 0.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    this
                                                .model!
                                                .model!
                                                .service_reviews
                                                .items
                                                .length ==
                                            0
                                        ? Text('0.0',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500))
                                        : Text(
                                            avgRating(this
                                                    .model!
                                                    .model!
                                                    .service_reviews
                                                    .items)!
                                                .toStringAsFixed(1),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                    Icon(
                                      Icons.star,
                                      size: 16.0,
                                    ),
                                  ]),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 8.0, top: 0.0),
                                child: this
                                            .model!
                                            .model!
                                            .service_reviews
                                            .items
                                            .length ==
                                        0
                                    ? Html(data: 'No review ', style: {
                                        "html": Style(
                                            fontSize: FontSize.small,
                                            fontWeight: FontWeight.w300),
                                      })
                                    : Html(
                                        data: this
                                                .model!
                                                .model!
                                                .service_reviews
                                                .paging
                                                .total_rows
                                                .toString() +
                                            ' reviews ',
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
          ],
        ));
  }

  @override
  Widget viewTrialVersion(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    if (model!.model!.trial_version == null) {
      return (Container(height: 0, width: 0));
    }
    if (model!.model!.trial_version_name != '') {
      return (FileViewAtt(
        ctx: context,
        value: model!.model!.trial_version_name,
        value1: model!.model!.trial_version_url,
        caption: 'Sample',
      ));
    } else {
      return (Container(height: 0, width: 0));
    }
  }

  Widget viewButton(BuildContext context, bool? account, State state,
      String? idHash, ChatBloc? cb) {
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    var maskOptions = MaskOptions()..reverse = true;
    var formatter = StringMask('#,##0', options: maskOptions);
    //this.model!.model!.price_str
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        this.model!.model!.options == null
            ? Container()
            : this.model!.model!.options.length == 0
                ? Container()
                : this.model!.model!.options[0].description != ''
                    ? Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Fitur tambahan:',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ))
                    : Container(),
        this.model!.model!.options == null
            ? Container()
            : this.model!.model!.options.length == 0
                ? Container()
                : Column(children: <Widget>[
                    ...getOptions(state),
                  ]),
        Container(
            height: 80,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 55,
                    ),
                    Center(
                        child: Text('Anda belum dikenakan biaya',
                            style: TextStyle(fontStyle: FontStyle.italic))),
                  ],
                ),
                ButtonBarTheme(
                  data: ButtonBarThemeData(
                    alignment: MainAxisAlignment.center,
                    buttonMinWidth: 0.43 * width,
                  ),
                  child: ButtonBar(
                      alignment: MainAxisAlignment.center,
                      buttonMinWidth: 0.43 * width,
                      children: <Widget>[
                        ElevatedButton(
                            //  child: Text('Buy ' +   'Rp 100.000.000,-'),
                            child: Row(
                              children: [
                                Icon(Icons.shopping_cart, size: 20),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Buy ' +
                                    'Rp ${formatter.apply(this.model!.model!.price.toString().replaceAll('.0', ''))},-'),
                              ],
                            ),
                            style: ButtonStyle(
                              textStyle:
                              MaterialStateProperty.all<TextStyle>(
                                  const TextStyle(color: Colors.white)),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  const Color(0xFF037f51)),
                            ),
                            onPressed: () {
                              if (account!) {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(
                                        '/user/browse_services/place_order/${this.model!.model!.service_id}/${this.model!.meta.title.replaceAll('/', '*')}'));
                              } else {
                                AppProvider.getRouter(context)!
                                    .navigateTo(context, '/login/1');
                              }
                            }),
                        ElevatedButton(
                            child: Row(
                              children: [
                                Icon(Icons.chat_bubble, size: 18),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Chat & Nego '),
                              ],
                            ),
                            style: ButtonStyle(
                              textStyle:
                              MaterialStateProperty.all<TextStyle>(
                                  const TextStyle(color: Colors.white)),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  const Color(0xFF037f51)),
                            ),
                            onPressed: () {
                              if (account!) {
                                // cb = ChatBloc();
                                // if(widget.id == '')

                                //  cb.wsSetHandlers();
                                //cb.lgn(widget.id);
                                // cb.lg(idHash!);
                                //$idHash/${encode(this.model!.model!.owner_id)}
                                if (cb != null) {
                                  String? thread = '';
                                  if (decode(idHash!) >
                                      this.model!.model!.seller_id) {
                                    thread =
                                        '${encode(this.model!.model!.seller_id)}/$idHash';
                                  } else {
                                    thread =
                                        '$idHash/${encode(this.model!.model!.seller_id)}';
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ChatScreen(
                                          user: {
                                            "thread": "$thread",
                                            "username":
                                                "${this.model!.model!.seller_user_name}",
                                            "userid":
                                                "${encode(this.model!.model!.seller_id)}",
                                            "display":
                                                "${this.model!.model!.seller_user_name}",
                                            "avatar":
                                                "${this.model!.model!.seller_photo_url}",
                                            "lastmessage":
                                                "<b>Konteks Percakapan: ${model!.meta.title}</b>",
                                            "lasttime": "1234567890"
                                          },
                                          userID: idHash,
                                          chatBloc: cb,
                                          trans: true,
                                          ctx: context,
                                        ),
                                      )).then((value) async {
                                    // cb.dispose();
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setBool('chatlink', true);
                                  });
                                } else {
                                  var cb1 =
                                      AppProvider.getApplication(context).chat;
                                  String? thread = '';
                                  if (decode(idHash!) >
                                      this.model!.model!.seller_id) {
                                    thread =
                                        '${encode(this.model!.model!.seller_id)}/$idHash';
                                  } else {
                                    thread =
                                        '$idHash/${encode(this.model!.model!.seller_id)}';
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ChatScreen(
                                          user: {
                                            "thread": "$thread",
                                            "username":
                                                "${this.model!.model!.seller_user_name}",
                                            "userid":
                                                "${encode(this.model!.model!.seller_id)}",
                                            "display":
                                                "${this.model!.model!.seller_user_name}",
                                            "avatar":
                                                "${this.model!.model!.seller_photo_url}",
                                            "lastmessage":
                                                "<b>Konteks Percakapan: ${model!.meta.title}</b>",
                                            "lasttime": "1234567890"
                                          },
                                          userID: idHash,
                                          chatBloc: cb1,
                                          trans: true,
                                          ctx: context,
                                        ),
                                      )).then((value) async {
                                    // cb.dispose();
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
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
                                '/public/support/contact_form/1/contact_formReportaViolationhttps:**projects.co.id*public*browse_services*view*${this.model!.model!.service_id}*${this.model!.meta.title.replaceAll('/', ' ')}',
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
                                      content: Text('Apakah Anda blok halaman / user ini?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () async{
                                            await apiRepProvider!.loadAndSaveBlacklist('black', this.model!.model!.service_id + 'BrowseServices');
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PublicBrowseServicesListing(
                                                          id: '0',
                                                          cb: cb)),
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
            )),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget viewSewaFreelancer(BuildContext context, bool? account) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    var maskOptions = MaskOptions()..reverse = true;
    var formatter = StringMask('#,##0', options: maskOptions);
    //this.model!.model!.price_str
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ButtonBarTheme(
          data: ButtonBarThemeData(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 0.9 * width,
          ),
          child: ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.9 * width,
              children: <Widget>[
                ElevatedButton(
                    child: Text('Sewa Freelancer Ini'),
                    style: ButtonStyle(
                      textStyle:
                      MaterialStateProperty.all<TextStyle>(
                          const TextStyle(color: Colors.white)),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          const Color(0xFF037f51)),
                    ),
                    onPressed: () {
                      if (account!) {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(
                                '/user/browse_services/place_order/${this.model!.model!.service_id}/${this.model!.meta.title.replaceAll('/', '*')}'));
                      } else {
                        AppProvider.getRouter(context)!
                            .navigateTo(context, '/login/1');
                      }
                    }),
              ]),
        ),
      ],
    );
  }

  Widget viewSeller(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, bottom: 5),
            child: Text(
              'Seller:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            )),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context, urlToRoute(this.model!.model!.seller_url));
              },
              child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 12),
                  child: ShowAvatar(
                    avatar: this.model!.model!.seller_photo_url,
                  )
                  /*
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    this.model!.model!.seller_photo_url,
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
                    context, urlToRoute(this.model!.model!.seller_url));
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
                                '${filterShortcodes(this.model!.model!.seller_str)} ',
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
                                                .seller_seller_rating
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
                                  '(${this.model!.model!.seller_seller_rating.toString()}/10)',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ]),
                              Text(
                                  'last seen ' +
                                      timeago.format(
                                          this.model!.model!.seller_last_seen),
                                  style: TextStyle(fontSize: 15)),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.date_range_outlined,
                    size: 50, color: CurrentTheme.PrimaryLightColor),
                Text(DateFormat('dd/MM/yyyy')
                    .format(this.model!.model!.seller_date_registered)),
                Text('Anggota sejak'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  progressColor: this.model!.model!.seller_arbitration_rate /
                              100 >
                          0.5
                      ? Colors.blue
                      : this.model!.model!.seller_arbitration_rate / 100 > 0.25
                          ? Colors.yellow
                          : Colors.blue,
                  percent: this.model!.model!.seller_arbitration_rate < 0
                      ? 0.0
                      : this.model!.model!.seller_arbitration_rate / 100,
                  animation: true,
                  radius: 50.0,
                  lineWidth: 6.0,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                Text(this.model!.model!.seller_arbitration_rate < 0
                    ? '-'
                    : '${this.model!.model!.seller_arbitration_rate.toStringAsFixed(2)}%'),
                Text('Arbitrase'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  progressColor: this.model!.model!.seller_completion_rate /
                              100 >
                          0.5
                      ? Colors.blue
                      : this.model!.model!.seller_completion_rate / 100 > 0.25
                          ? Colors.yellow
                          : Colors.blue,
                  percent: this.model!.model!.seller_completion_rate < 0
                      ? 0.0
                      : this.model!.model!.seller_completion_rate / 100,
                  animation: true,
                  radius: 50.0,
                  lineWidth: 6.0,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                Text(this.model!.model!.seller_completion_rate < 0
                    ? '-'
                    : '${this.model!.model!.seller_completion_rate.toStringAsFixed(2)}%'),
                Text('Penyelesaian'),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget viewChatButton(BuildContext context, String? idHash, ChatBloc? cb) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    var maskOptions = MaskOptions()..reverse = true;
    var formatter = StringMask('#,##0', options: maskOptions);
    //this.model!.model!.price_str
    return ButtonBarTheme(
      data: ButtonBarThemeData(
        alignment: MainAxisAlignment.center,
        buttonMinWidth: 0.9 * width,
      ),
      child: ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.9 * width,
          children: <Widget>[
            ElevatedButton(
                child: Text('Chat & Nego'),
                style: ButtonStyle(
                  textStyle:
                  MaterialStateProperty.all<TextStyle>(
                      const TextStyle(color: Colors.white)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(
                      const Color(0xFF037f51)),
                ),
                onPressed: () {
                  if (idHash!.isNotEmpty) {
                    //  cb = ChatBloc();
                    // if(widget.id == '')

                    //  cb.wsSetHandlers();
                    //cb.lgn(widget.id);
                    // cb.lg(idHash!);
                    //$idHash/${encode(this.model!.model!.owner_id)}
                    String? thread = '';
                    if (decode(idHash!) > this.model!.model!.seller_id) {
                      thread =
                          '${encode(this.model!.model!.seller_id)}/$idHash';
                    } else {
                      thread =
                          '$idHash/${encode(this.model!.model!.seller_id)}';
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            user: {
                              "thread": "$thread",
                              "username":
                                  "${this.model!.model!.seller_user_name}",
                              "userid":
                                  "${encode(this.model!.model!.seller_id)}",
                              "display":
                                  "${this.model!.model!.seller_user_name}",
                              "avatar":
                                  "${this.model!.model!.seller_photo_url}",
                              "lastmessage":
                                  "<b>Konteks Percakapan: ${model!.meta.title}</b>",
                              "lasttime": "1234567890"
                            },
                            userID: idHash,
                            chatBloc: cb,
                            trans: true,
                            ctx: context,
                          ),
                        ));
                  } else {
                    AppProvider.getRouter(context)!
                        .navigateTo(context, '/login/1');
                  }
                }),
          ]),
    );
  }

  Widget viewAds(BuildContext context, bool _isBannerAdReady, BannerAd _bannerAd ) {
    if (this.model!.model!.price <= 100000.00) {
      return   Column(
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
        ],
      );
    } else {
      return Container(height: 0, width: 0);
    }
  }

  Widget viewScreenshots(BuildContext context) {
    if (this.model!.model!.screenshots.items.length == 0) {
      return Container(height: 0, width: 0);
    } else {
      return Container(
        height: 200.0,
        child: this.model!.model!.screenshots.items.length == 0
            ? Container(width: 0.0, height: 0.0)
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int? index) {
                  return index! >= this.model!.model!.screenshots.items.length
                      ? Container(width: 0.0, height: 0.0)
                      : ScreenshotsItem1(
                          model: this.model!.model!.screenshots.items[index],
                          info: this.model!.model!.screenshots);
                },
                itemCount: this.model!.model!.screenshots.items.length <= 8
                    ? this.model!.model!.screenshots.items.length
                    : 8,
                // controller: controller1,
              ),
      );
    }
  }

  Widget viewDesc(BuildContext context) {
    YoutubePlayerController _controller;
    var document = parse(this
        .model!
        .model!
        .description
        .replaceAll('<div>', '')
        .replaceAll('<\/div>', '')
        .replaceAll('<br>', ' ')
        .replaceAll('<p>', '')
        .replaceAll('<\/p>', '<br>'));
    var videoList = document.querySelectorAll("iframe");
    List<String?>? id = [];
    for (dom.Element video in videoList) {
      // print('ini list video' + video.attributes["src"]!);

      // id.add(YoutubePlayer.convertUrlToId(video.attributes["src"]!));
      if (video.attributes["src"]!.contains('youtube')) {
        if (video.attributes["src"]!.contains('https')) {
          // print('ini list video id' + YoutubePlayer.convertUrlToId(video.attributes["src"]!));
          id.add(YoutubePlayer.convertUrlToId(video.attributes["src"]!));
        } else {
          // print('ini list video id' + YoutubePlayer.convertUrlToId('https:' + video.attributes["src"]!));
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

    ScrollController? controller;
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
                  HtmlWidget(readText(
                      this
                          .model!
                          .model!
                          .description
                          .replaceAll('<div>', '')
                          .replaceAll('<\/div>', '')
                          .replaceAll('<br>', ' ')
                          .replaceAll('<p>', '')
                          .replaceAll('<\/p>', '<br>'),
                      1000)),
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
                                  .description
                                  .replaceAll('<div>', '')
                                  .replaceAll('<\/div>', '')
                                  .replaceAll('<br>', ' ')
                                  .replaceAll('<p>', '')
                                  .replaceAll('<\/p>', '<br>'),
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
                          }, onTapImage: (src) {
                            //  print('source image === $src');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowItemScreenshots(
                                      image: '${src.sources.first.url}')),
                            );
                          })),
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
        SizedBox(
          height: 10,
        ),
      ],
    );

    /*
    return Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DescServiceInfo(info : this.model!.model, title: this.model!.meta.title)),
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
                  HtmlWidget( readText(this.model!.model!.description, 150)),
                ]
            )


        )
    );

     */
  }

  Widget viewReview(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model!.model!.service_reviews.items.length == 0
        ? Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 20.0),
            child: InkWell(
                onTap: () {},
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Reviews',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            //Icon(Icons.arrow_forward, size: 18.0)
                          ]),
                      //Center(
                      // child:
                      Text('Belum ada review',
                          style: TextStyle(fontStyle: FontStyle.italic)),
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
                                  style: descriptionStyle!,
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
                                  style: descriptionStyle!,
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
                      Html(data: readText(this.model!.model!.service_reviews.items[0].worker_feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),
                    ],
                  )

                   */

                      /*
                    List<ItemButton> buttons;
                    String? order_item_id;
                    int?rating;
                    String? testimony;
                    int?buyer_id;
                    String? buyer_str;
                    String? buyer_url;
                    List<int?>? buyer_list;
                    List<String?>?buyer_list_str;
                    DateTime? date;
                   */

                      //  Html(data: readText(this.model!.model!.service_reviews.items[0].testimony, 150)),
                    ])))
        : Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 20.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServiceReviewsList(
                            id: this.model!.model!.service_id,
                            title: this.model!.meta.title,
                            url: Env.value!.baseUrl! +
                                '/public/browse_services/service_reviews_list/' +
                                this.model!.model!.service_id +
                                '/' +
                                this.model!.meta.title +
                                '?')),
                  );
                },
                child: Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Reviews',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.arrow_forward, size: 18.0)
                      ]),
                  Center(
                    child: Card(
                        elevation: 3.0,
                        borderOnForeground: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(
                            left: 5, top: 10, right: 10, bottom: 15),
                        // color: Colors.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                isThreeLine: false,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 1),
                                //enabled: false,
                                onLongPress: () {},
                                //onTap: () => Navigator.of(context).pushNamed('chat'),
                                onTap: () {},

                                leading: Container(
                                  width: 80,
                                  height: 80,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        top: 13,
                                        left: 30,
                                        child: GestureDetector(
                                          onTap: () {
                                            //   AppProvider.getRouter(context)!.navigateTo(
                                            //       context,
                                            //      urlToRoute('public/browse_users/view/'+encode(this.model!.model!.product_reviews.items[0].buyer_id) + '/z'));
                                          },
                                          child: CircleAvatar(
                                            // radius: 100,
                                            // minRadius: 70,
                                            // maxRadius: 70,
                                            // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                                            backgroundImage: NetworkImage(this
                                                .model!
                                                .model!
                                                .service_reviews
                                                .items[0]
                                                .owner_photo_url),
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
                                subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        //crossAxisAlignment: CrossAxisAlignment.s,
                                        children: <Widget>[
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                //  AppProvider.getRouter(context)!.navigateTo(
                                                //      context,
                                                //      urlToRoute('public/browse_users/view/'+encode(this.model!.model!.product_reviews.items[0].buyer_id) + '/z'));
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 17, right: 5),
                                                child: Text(
                                                  this
                                                      .model!
                                                      .model!
                                                      .service_reviews
                                                      .items[0]
                                                      .owner_str,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: descriptionStyle!
                                                      .copyWith(
                                                          fontSize: 17,
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                          ),
                                          //FractionallySizedBox(heightFactor: 0.05),

                                          /*
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 5),
                    child:   Text(timeago.format(destination!.item!.date), softWrap: true, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w300),
                    ),
                  ),

                  */
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          dateformat.format(this
                                                  .model!
                                                  .model!
                                                  .service_reviews
                                                  .items[0]
                                                  .start_date) +
                                              ' ' +
                                              'WIB',
                                          style: descriptionStyle!
                                              .copyWith(fontSize: 12),
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


                  data :"${destination!.item!.feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>')}",
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
                child:HtmlWidget( destination!.item!.feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
                    tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
                    bodyPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5)),
              )

               */
                                    ]),
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: RatingBarIndicator(
                                  rating: this
                                              .model!
                                              .model!
                                              .service_reviews
                                              .items[0]
                                              .worker_rating
                                              .toDouble() /
                                          2 -
                                      0.01,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: CurrentTheme.PrimaryLightColor,
                                  ),
                                  itemCount: 5,
                                  itemSize: 30.0,
                                  unratedColor: Colors.black26,
                                  direction: Axis.horizontal,
                                ),
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                    this
                                            .model!
                                            .model!
                                            .service_reviews
                                            .items[0]
                                            .worker_rating
                                            .toString() +
                                        '/10',
                                    style: TextStyle(fontSize: 12)),
                              ),

                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: HtmlWidget(
                                  this
                                      .model!
                                      .model!
                                      .service_reviews
                                      .items[0]
                                      .worker_feedback
                                      .replaceAll('<div>', '')
                                      .replaceAll('<\/div>', '')
                                      .replaceAll('<br>', ' ')
                                      .replaceAll('<p>', '')
                                      .replaceAll('<\/p>', '<br>'),
                                  //tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  // bodyPadding : EdgeInsets.only(left : 0.0,top:4.0,bottom: 0.0, right: 5)
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                child:  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              //destination!.item.buttons[2].url

                                              AppProvider.getRouter(
                                                  context)!
                                                  .navigateTo(
                                                context,

                                                '/public/support/contact_form/1/contact_formReportaViolationhttps:**projects.co.id*public*browse_services*view*${this
                                                    .model!
                                                    .model!.service_id}*${this
                                                    .model!.meta!.title.replaceAll('/','*')}* service reviews id = ${this
                                                    .model!
                                                    .model!
                                                    .service_reviews
                                                    .items[0]
                                                    .project_id}',
                                              );

                                            },
                                            child:  const Text('Report',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.red,
                                              ),

                                            ),
                                          ),
                                          const SizedBox(width : 3),
                                          const Text('|',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                            ),

                                          ),
                                          const SizedBox(width : 3),
                                          GestureDetector(
                                            onTap: () async{
                                              return await showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Text('Block',
                                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                      content: Text('Apakah Anda blok halaman / user ini?'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () async{
                                                            /*
                                                                        await apiRepProvider!.loadAndSaveBlacklist('black', destination!.item.service_id + 'BrowseServices');
                                                                        Navigator.pushAndRemoveUntil(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) =>
                                                                                  PublicBrowseServicesListing(
                                                                                      id: '0',
                                                                                      cb: cb)),
                                                                              (Route<dynamic> route) => false,
                                                                        );
                                                                        // Navigator.pop(context); Navigator.pop(context);

                                                                         */
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

                                            },
                                            child:  const Text('Block',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.red,
                                              ),

                                            ),

                                          ),
                                        ]
                                    )
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ])),
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
                                  style: descriptionStyle!,
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
                                  style: descriptionStyle!,
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
                      Html(data: readText(this.model!.model!.service_reviews.items[0].worker_feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),
                    ],
                  )

                   */

                  /*
                    List<ItemButton> buttons;
                    String? order_item_id;
                    int?rating;
                    String? testimony;
                    int?buyer_id;
                    String? buyer_str;
                    String? buyer_url;
                    List<int?>? buyer_list;
                    List<String?>?buyer_list_str;
                    DateTime? date;
                   */

                  //  Html(data: readText(this.model!.model!.service_reviews.items[0].testimony, 150)),
                ])));
  }

  Widget viewComment(BuildContext context, bool? account, String? userid) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    var dateformat = DateFormat('dd/MM/yyyy');
    return Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 20.0),
        child: InkWell(
          onTap: () {
            if (this.model!.model!.service_comments.items.length == 0) {
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceCommentsList(
                        id: this.model!.model!.service_id,
                        title: this.model!.meta.title,
                        url: Env.value!.baseUrl! +
                            '/public/browse_services/service_comments_list/' +
                            this.model!.model!.service_id +
                            '/' +
                            this.model!.meta.title +
                            '?')),
              );
            }
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Comments',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      this.model!.model!.service_comments.items.length == 0
                          ? Container()
                          : Icon(Icons.arrow_forward, size: 18.0)
                    ]),
                this.model!.model!.service_comments.items.length == 0
                    ?
                    //Center(
                    // child:
                    Text('Belum ada comment',
                        style: TextStyle(fontStyle: FontStyle.italic))
                    //  )
                    : Container(),
                this.model!.model!.service_comments.items.length == 0
                    ? viewButtonReplay(context, account, userid)
                    : Center(
                        child: Card(
                            elevation: 3.0,
                            borderOnForeground: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(
                                left: 5, top: 10, right: 10, bottom: 15),
                            // color: Colors.white,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    isThreeLine: false,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 1),
                                    //enabled: false,
                                    onLongPress: () {},
                                    //onTap: () => Navigator.of(context).pushNamed('chat'),
                                    onTap: () {},

                                    leading: Container(
                                      width: 80,
                                      height: 80,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                            top: 13,
                                            left: 30,
                                            child: GestureDetector(
                                              onTap: () {
                                                //  AppProvider.getRouter(context)!.navigateTo(
                                                //      context,
                                                //      urlToRoute('public/browse_users/view/'+encode(destination!.item!.user_id) + '/z'));
                                              },
                                              child: CircleAvatar(
                                                // radius: 100,
                                                // minRadius: 70,
                                                // maxRadius: 70,
                                                // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                                                backgroundImage: NetworkImage(
                                                    this
                                                        .model!
                                                        .model!
                                                        .service_comments
                                                        .items[0]
                                                        .user_photo_url),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,

                                            //crossAxisAlignment: CrossAxisAlignment.s,
                                            children: <Widget>[
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    //  AppProvider.getRouter(context)!.navigateTo(
                                                    //      context,
                                                    //      urlToRoute('public/browse_users/view/'+encode(this.model!.model!.product_reviews.items[0].buyer_id) + '/z'));
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 17, right: 5),
                                                    child: Text(
                                                      this
                                                          .model!
                                                          .model!
                                                          .service_comments
                                                          .items[0]
                                                          .user_user_name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: descriptionStyle!
                                                          .copyWith(
                                                              fontSize: 17,
                                                              letterSpacing: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        //destination!.item.buttons[2].url

                                                        AppProvider.getRouter(
                                                            context)!
                                                            .navigateTo(
                                                          context,

                                                          '/public/support/contact_form/1/contact_formReportaViolationhttps:**projects.co.id*public*browse_services*view*${this
                                                              .model!
                                                              .model!.service_id}*${this
                                                              .model!.meta!.title.replaceAll('/','*')}* message id = ${this
                                                              .model!
                                                              .model!
                                                              .service_comments
                                                              .items[0]
                                                              .service_post_id}',
                                                        );

                                                      },
                                                      child:  const Text('Report',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w300,
                                                          color: Colors.red,
                                                        ),

                                                      ),
                                                    ),
                                                    const SizedBox(width : 3),
                                                    const Text('|',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w300,
                                                      ),

                                                    ),
                                                    const SizedBox(width : 3),
                                                    GestureDetector(
                                                      onTap: () async{
                                                        return await showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              AlertDialog(
                                                                title: Text('Block',
                                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                                content: Text('Apakah Anda blok halaman / user ini?'),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    onPressed: () async{
                                                                      /*
                                                                        await apiRepProvider!.loadAndSaveBlacklist('black', destination!.item.service_id + 'BrowseServices');
                                                                        Navigator.pushAndRemoveUntil(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) =>
                                                                                  PublicBrowseServicesListing(
                                                                                      id: '0',
                                                                                      cb: cb)),
                                                                              (Route<dynamic> route) => false,
                                                                        );
                                                                        // Navigator.pop(context); Navigator.pop(context);

                                                                         */
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

                                                      },
                                                      child:  const Text('Block',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w300,
                                                          color: Colors.red,
                                                        ),

                                                      ),

                                                    ),
                                                  ]
                                              )
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: Text(
                                              dateformat.format(this
                                                      .model!
                                                      .model!
                                                      .service_comments
                                                      .items[0]
                                                      .post_date) +
                                                  ' ' +
                                                  'WIB',
                                              style: descriptionStyle!
                                                  .copyWith(fontSize: 12),
                                            ),
                                            /*
                                                    SmoothStarRating(
                                                      rating: this.model!.model!.service_comments.items[0].user_seller_rating.toDouble(),
                                                      size: 18,
                                                      starCount: 5,
                                                      color: CurrentTheme.PrimaryLightColor,
                                                      // allowHalfRating: true,
                                                      allowHalfRating: true,

                                                    ),

                                                     */
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child: HtmlWidget(
                                      this
                                          .model!
                                          .model!
                                          .service_comments
                                          .items[0]
                                          .message
                                          .replaceAll('<div>', '')
                                          .replaceAll('<\/div>', '')
                                          .replaceAll('<br>', ' ')
                                          .replaceAll('<p>', '')
                                          .replaceAll('<\/p>', '<br>'),
                                      //tableCellPadding : EdgeInsets.only(left : 0.0,top: 0.0,bottom: 0.0, right: 5),
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // bodyPadding : EdgeInsets.only(left : 0.0,top:4.0,bottom: 0.0, right: 5)
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ])),
                      ),
              ]),
          /*
              Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Comments',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600 ),),
                          Icon(Icons.arrow_forward, size: 18.0)
                        ]
                    ),
                    this.model!.model!.service_comments.items.length == 0 ? viewButtonReplay (context,account):   Column(
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
                                    style: descriptionStyle!,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Image.network(
                                            this.model!.model!.service_comments.items[0].user_photo_url,
                                            fit: BoxFit.cover,
                                            height: 35.0,
                                            width: 35.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  this.model!.model!.service_comments.items[0].user_user_name,
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
                                    style: descriptionStyle!,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // three line description
                                        SmoothStarRating(
                                          rating: this.model!.model!.service_comments.items[0].user_seller_rating.toDouble(),
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
                                                  dateformat.format(this.model!.model!.service_comments.items[0].post_date),
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
                        Html(data: readText(this.model!.model!.service_comments.items[0].message.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),
                      ],
                    )

                  ]
              )

                   */
        ));
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
                    'About this seller',
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
                    'This seller rating and ranking',
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
                          height: 60.0,
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
                                  padding:
                                      EdgeInsets.only(left: 55.0, right: 8.0),
                                  child: Html(
                                      data: this.model!.model!.seller_user_name,
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
                          height: 60.0,
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
                                  padding:
                                      EdgeInsets.only(left: 55.0, right: 8.0),
                                  child: this
                                              .model!
                                              .model!
                                              .seller_kabupaten_str ==
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
                                              .seller_kabupaten_str,
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
                          height: 60.0,
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
                                padding:
                                    EdgeInsets.only(left: 55.0, right: 8.0),
                                child: RatingBarIndicator(
                                  rating: model!.model!.seller_seller_rating
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
                                  padding:
                                      EdgeInsets.only(left: 55.0, right: 8.0),
                                  child: model!.model!
                                              .seller_seller_rating_num_str ==
                                          ''
                                      ? Html(data: 'Unavailable', style: {
                                          "html": Style(
                                              fontSize: FontSize.small,
                                              fontWeight: FontWeight.w400),
                                        })
                                      : Html(
                                          data: model!.model!
                                              .seller_seller_rating_num_str,
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
                          height: 60.0,
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
                                  padding:
                                      EdgeInsets.only(left: 55.0, right: 8.0),
                                  child: model!.model!
                                              .seller_seller_ranking_str ==
                                          ''
                                      ? Html(data: 'Unavailable', style: {
                                          "html": Style(
                                              fontSize: FontSize.small,
                                              fontWeight: FontWeight.w400),
                                        })
                                      : Html(
                                          data: model!
                                              .model!.seller_seller_ranking_str,
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
      //  hasIcon: true,
    );
  }

  Widget viewReviews(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 20.0),
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DescServiceInfo(
                        info: this.model!.model,
                        title: this.model!.meta.title)),
              );
            },
            child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'About this service',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.arrow_forward, size: 18.0)
                  ]),
              HtmlWidget(readText(
                  this
                      .model!
                      .model!
                      .description
                      .replaceAll('<div>', '')
                      .replaceAll('<\/div>', '')
                      .replaceAll('<br>', ' ')
                      .replaceAll('<p>', '')
                      .replaceAll('<\/p>', '<br>'),
                  150)),
            ])));
  }

  Widget viewButtonReplay(BuildContext context, bool? account, String? userid) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return ButtonBarTheme(
      data: ButtonBarThemeData(
        alignment: MainAxisAlignment.center,
        buttonMinWidth: 0.9 * width,
      ),
      child: ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonMinWidth: 0.9 * width,
          children: <Widget>[
            ElevatedButton(
                child: userid == this.model!.model!.seller_id
                    ? Text('Jawab Pertanyaan ')
                    : Text('Tanya Seller '),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                  overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                ),
                onPressed: () {
                  if (account!) {
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        '/public/browse_services/service_comments_new_reply/' +
                            this.model!.model!.service_id +
                            '/' +
                            this.model!.meta.title.replaceAll('/', ''));
                  } else {
                    AppProvider.getRouter(context)!
                        .navigateTo(context, '/login/1');
                  }
                })
          ]),
    );
  }

  //@override
  Widget appBar1(BuildContext context, String? idHash, ChatBloc? cb) {
    return (AppBar(
        title: Text('',
            style: TextStyle(
              color: Colors.white,
            )),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Share.share(
                      '${model!.meta.title} https://projects.co.id/public/browse_services/view/${this.model!.model!.service_id}/service',
                      subject: '${model!.meta.title}');
                },
                child: Icon(
                  Icons.share,
                  size: 26.0,
                ),
              )),
          PopupMenuButton<int>(
            onSelected: (int? value) {
              if (value == 1) {
                if (idHash!.isNotEmpty) {
                  //  cb = ChatBloc();
                  // if(widget.id == '')

                  // cb.wsSetHandlers();
                  //cb.lgn(widget.id);
                  //  cb.lg(idHash!);
                  //$idHash/${encode(this.model!.model!.owner_id)}
                  String? thread = '';
                  if (decode(idHash!) > this.model!.model!.seller_id) {
                    thread = '${encode(this.model!.model!.seller_id)}/$idHash';
                  } else {
                    thread = '$idHash/${encode(this.model!.model!.seller_id)}';
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
                          user: {
                            "thread": "$thread",
                            "username":
                                "${this.model!.model!.seller_user_name}",
                            "userid": "${encode(this.model!.model!.seller_id)}",
                            "display": "${this.model!.model!.seller_user_name}",
                            "avatar": "${this.model!.model!.seller_photo_url}",
                            "lastmessage":
                                "<b>Konteks Percakapan: ${model!.meta.title}</b>",
                            "lasttime": "1234567890"
                          },
                          userID: idHash,
                          chatBloc: cb,
                          trans: true,
                          ctx: context,
                        ),
                      )).then((value) async {
                    //  cb.dispose();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('chatlink', true);
                  });
                } else {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, '/login/1');
                }
              }

              //  }
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Chat seller'),
              ),
            ],
          ),
        ]));
  }

  Widget viewTags1(BuildContext context, ChatBloc? cb) {
    if (model!.model!.tags_url != null) {
      return (ChannelRouteTagsWidget(
        value: model!.model!.tags_id,
        caption: '',
        hint: ' ',
        required: false,
        idroutetags: model!.model!.tags_id,
        nameroutetags: model!.model!.tags_str,
        urlroutetags: model!.model!.tags_url,
        getValue: (String? val) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PublicBrowseServicesListing(
                    id: val!.split('?')[1], cb: cb)),
          );
          // AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val));
        },
      ));
    } else {
      return (ChannelNonURLRouteWidget(
        value: model!.model!.tags_id,
        caption: '',
        hint: ' ',
        required: false,
        idroutetags: model!.model!.tags_id,
        nameroutetags: model!.model!.tags_str,
      ));
    }
  }

  Widget view1(BuildContext context, ScrollController controller, bool? account,
      State state, String? idHash, ChatBloc? cb, bool br, bool br1, BannerAd ba, BannerAd ba1) {
    viewChildren.clear();
    /*
    viewChildren.add(viewHeader(context));
    viewChildren.add(viewInfo(context));
   // viewChildren.add(viewTrialVersion(context));
    viewChildren.add(viewButton(context, account, state));
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

    //service_reviews
    //service-comments
    viewChildren.add(viewBanner(context, idHash, cb));
    viewChildren.add(viewHeader1(context));
    viewChildren.add(viewRating1());
    viewChildren.add(viewSales());
    viewChildren.add(viewDesc(context));
    viewChildren.add(Padding(
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: viewTags1(context, cb)));
    viewChildren.add(viewAds(context, br, ba ));
    viewChildren.add(viewButton(context, account, state, idHash, cb));
    viewChildren.add(viewAds(context, br1, ba1 ));
    viewChildren.add(viewScreenshots(context));

    viewChildren.add(viewSeller(context));
    // viewChildren.add(viewChatButton(context, idHash!));

    // viewChildren.add(viewOwnerInfo(context));
    viewChildren.add(viewReview(context));
    viewChildren.add(viewComment(context, account, idHash!));
    //   viewChildren.add(viewSewaFreelancer(context, account));

    return (SingleChildScrollView(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        reverse: false,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: viewChildren)));
  }

  Widget view2(BuildContext context, ScrollController controller, bool? account,
      State state, String? idHash, ChatBloc? cb) {
    viewChildren.clear();
    /*
    viewChildren.add(viewHeader(context));
    viewChildren.add(viewInfo(context));
   // viewChildren.add(viewTrialVersion(context));
    viewChildren.add(viewButton(context, account, state));
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

    //service_reviews
    //service-comments
    viewChildren.add(viewBanner(context, idHash, cb));
    viewChildren.add(viewHeader1(context));
    viewChildren.add(viewRating1());
    viewChildren.add(viewSales());
    viewChildren.add(viewDesc(context));
    viewChildren.add(Padding(
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: viewTags1(context, cb)));

    viewChildren.add(viewButton(context, account, state, idHash, cb));

    viewChildren.add(viewScreenshots(context));

    viewChildren.add(viewSeller(context));
    // viewChildren.add(viewChatButton(context, idHash!));

    // viewChildren.add(viewOwnerInfo(context));
    viewChildren.add(viewReview(context));
    viewChildren.add(viewComment(context, account, idHash!));
    //   viewChildren.add(viewSewaFreelancer(context, account));

    return (SingleChildScrollView(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        reverse: false,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: viewChildren)));
  }
}




class ShowItemScreenshots1 extends StatelessWidget {
  final String? image;
  ShowItemScreenshots1({this.image});
  final _appbar = AppBar(
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    backgroundColor: CurrentTheme.MainAccentColor,
    elevation: 0.0,
    title: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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

class ScreenshotsItem1 extends StatelessWidget {
  final ItemScreenshots? model;
  final ScreenshotsListingTools? info;
  ScreenshotsItem1({this.model, this.info});
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
                  MaterialPageRoute(
                      builder: (context) =>
                          ShowItemScreenshots1(image: this.model!.image_url)),
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
                      child: Stack(children: <Widget>[
                        Positioned.fill(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            // In order to have the ink splash appear above the image, you
                            // must use Ink.image. This allows the image to be painted as part
                            // of the Material and display ink effects above it. Using a
                            // standard Image will obscure the ink splash.
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  model!.image_url!,
                                  fit: BoxFit.fitHeight,
                                ))),
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

class DescServiceInfo extends StatelessWidget {
  final ViewModelBrowseServicesRev? info;
  final String? title;
  ScrollController? controller;
  DescServiceInfo({this.info, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: CurrentTheme.MainAccentColor,
            elevation: 0.0,
            title: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      this.info!.logo_url!,
                      fit: BoxFit.fill,
                      height: 35.0,
                      width: 35.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
            )),
        body: SingleChildScrollView(
            controller: controller,
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
                          throw 'Could not launch ';
                        },
                        onTapImage: (src) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowItemScreenshots1(
                                  image: '${src.sources.first.url}')),
                        ),
                      )),
                ])));
  }
}

///////////////////////////////////////////////////

class BrowseServicesListingModel extends BrowseServicesListingBase {
  Map<String, dynamic> json;
  BrowseServicesListingModel(Map<String, dynamic> this.json) : super(json);
  @override
  Widget viewItemIndex(
      ItemBrowseServicesModel item, String? search, int? index, bool? account) {
    ShapeBorder? shape;
    double? height = 302;
    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item.item.toJson()))!.contains(search!)),
        child: ItemBrowseServicesCard1(
            destination: item,
            search: search,
            shape: shape,
            height: height,
            index: index,
            account: account));
  }

  @override
  Widget viewItem(ItemBrowseServicesModel item, String? search, bool? account) {
    ShapeBorder? shape;
    double? height = 210;
    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item.item.toJson()))!.contains(search!)),
        child: ItemBrowseServicesCard3(
            destination: item,
            search: search,
            shape: shape,
            height: height,
            account: account,
            idHash: ''));
  }

  //@override
  Widget viewItemId1(ItemBrowseServicesModel item, String? search, int? index,
      bool? account, String? id, ChatBloc? cb) {
    ShapeBorder? shape;
    double? height = 210;
    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item.item.toJson()))!.contains(search!)),
        child: ItemBrowseServicesCard3(
            index: index,
            destination: item,
            search: search,
            shape: shape,
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
                  SearchBrowseServicesListing1(id: '', title: '')),
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
          ListButtonBrowseServicesWidget(tools.buttons[i], context, account));
    }

    return (buttonChildren);
  }
}

class SearchBrowseServicesListing1 extends StatefulWidget {
  static const String? PATH = '/public/browse_services/listing/:id';
  final String? id;
  final String? title;
  bool? account;
  ChatBloc? cb;
  SearchBrowseServicesListing1(
      {Key? key, this.id, this.title, this.account, this.cb})
      : super(key: key);
  @override
  SearchBrowseServicesListing1State createState() =>
      SearchBrowseServicesListing1State();
}

class SearchBrowseServicesListing1State
    extends State<SearchBrowseServicesListing1> with RestorationMixin {
  String? title = 'Browse Services';
  bool? _dialVisible = true;
  bool? search = false;
  String? getPath =
      Env.value!.baseUrl! + '/public/browse_services/listing?page=%d';
  ScrollController? scrollController;
  BrowseServicesController? browse_services;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  AccountController? accountController;
  bool? account = true;
  bool? selected = false;
  bool isopen = false;
  String? searchText = '';
  double? initscroll = 0.0;
  String? userid;

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'BrowseServicesscr';

  @override
  void restoreState(RestorationBucket? oldBucket, bool? initialRestore) {
    registerForRestoration(cs, 'BrowseServicesscr');
  }

  @override
  Widget build(BuildContext context) {
    search = true;
    if (widget.id == '') {
      getPath = Env.value!.baseUrl! +
          '/public/browse_services/listing?page=%d&' +
          'search=' +
          searchText!;
    } else {
      getPath = Env.value!.baseUrl! +
          '/public/browse_services/listing/' +
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
    browse_services = BrowseServicesController(
        AppProvider.getApplication(context),
        getPath,
        AppAction.listing,
        '',
        '',
        '',
        search);
    browse_services!.listing!.add(BrowseServicesList());
    return WillPopScope(
        onWillPop: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setDouble("position", 0.0);
          if (search!) {
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
                        hintText: 'Search Services',
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

  Widget buildSearchBar(String tiltle) {
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
  void open(bool val){
    // setState(() {
    isopen = val;
    //});
  }
  Widget buildListingBar() {
    return BlocBuilder<BrowseServicesListing, BrowseServicesState>(
      bloc: browse_services!.listing,
      builder: (BuildContext context, BrowseServicesState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseServicesListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is BrowseServicesListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is BrowseServicesListingLoaded) {
          if (state.browse_services!.items!.items.isEmpty) {
            if (state.browse_services!.tools.buttons.length == 0) {
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
                  floatingActionButton: state.browse_services!
                      .Buttons(context, _dialVisible, account, open)
                  //floatingActionButton: isLoading? null :  state.browse_services!.Buttons(context, _dialVisible, controller,browse_services,  this, Env.value!.baseUrl!, '', title)
                  );
            }
          }
          if (state.browse_services!.tools.buttons.length == 0) {
            return Scaffold(
                body: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int? index) {
                  return index! >= state.browse_services!.items!.items.length
                      ? state.browse_services!.tools.paging.total_pages ==
                              state.browse_services!.tools.paging.current_page
                          ? Container(
                              height: 0.0,
                              width: 0.0,
                            )
                          : SearchBrowseServicesBottomLoader1()
                      // viewItemIndex(ItemBlogModel item,String? search, int?index, bool? account)
                      : state.browse_services!.viewItemId1(
                          state.browse_services!.items!.items[index],
                          searchText,
                          index,
                          account,
                          userid,
                          widget.cb);
                },
                itemCount: state.hasReachedMax!
                    ? state.browse_services!.items!.items.length
                    : state.browse_services!.items!.items.length + 1,
                controller: scrollController,
              ),
              onRefresh: _onRefresh,
            ));
          }
          return Scaffold(
              body: RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int? index) {
                    return index! >= state.browse_services!.items!.items.length
                        ? state.browse_services!.tools.paging.total_pages ==
                                state.browse_services!.tools.paging.current_page
                            ? Container(
                                height: 0.0,
                                width: 0.0,
                              )
                            : SearchBrowseServicesBottomLoader1()
                        // viewItemIndex(ItemBlogModel item,String? search, int?index, bool? account)
                        : state.browse_services!.viewItemId1(
                            state.browse_services!.items!.items[index],
                            searchText,
                            index,
                            account,
                            userid,
                            widget.cb);
                  },
                  itemCount: state.hasReachedMax!
                      ? state.browse_services!.items!.items.length
                      : state.browse_services!.items!.items.length + 1,
                  controller: scrollController,
                ),
                onRefresh: _onRefresh,
              ),
              floatingActionButton:
                  state.browse_services!.Buttons(context, _dialVisible, account, open)
              //floatingActionButton: isLoading? null :  state.browse_services!.Buttons(context, _dialVisible, controller,browse_services,  this, Env.value!.baseUrl!, '', title!, account)

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
      cubit: browse_services!.listing,
      builder: (BuildContext context, BrowseServicesState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseServicesListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child:CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
        if (state is BrowseServicesListingError) {
          return Center(
            child: Text('failed to ' + widget.title!),
          );
        }
        if (state is BrowseServicesListingLoaded) {
          if (state.browse_services!.items!.items.isEmpty) {
            return Center(
              child: Text('no ' + widget.title!),
            );
          }
          return
            Scaffold(

                body: RefreshIndicator(
                  child : GridView.builder(
                    shrinkWrap: true,
                    itemCount: state.hasReachedMax!
                        ? state.browse_services!.items!.items.length
                        : state.browse_services!.items!.items.length + 1,
                    controller: scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    // padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // mainAxisSpacing: 10,
                      // crossAxisSpacing: 10,
                      // childAspectRatio: 0.9,
                      childAspectRatio: mediaQueryData.size.width/(mediaQueryData.size.height/1.9),
                    ),
                    itemBuilder: (context, index) {
                      return index! >= state.browse_services!.items!.items.length
                          ? SearchBrowseServicesBottomLoader()
                          : state.browse_services!.viewItem (state.browse_services!.items!.items[index] , searchText, widget.account );
                    },
                  ),
                  onRefresh: _onRefresh,
                ),
                floatingActionButton: state.browse_services!.Buttons(context, _dialVisible, widget.account)
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
    browse_services!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = Completer<Null>();
    browse_services!.listing!.add(BrowseServicesListingRefresh());
    Timer timer = Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  void _onScroll() async {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("position", scrollController!.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
      browse_services!.listing!.add(BrowseServicesList());
    }
  }
}

class SearchBrowseServicesBottomLoader1 extends StatelessWidget {
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
//class ItemBrowseServices extends class ItemBrowseServicesBase{
//
//}

////////////////////////////

class ItemBrowseServicesCard1 extends StatelessWidget {
  const ItemBrowseServicesCard1(
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
  final ItemBrowseServicesModel? destination;
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
        child: Column(
          children: <Widget>[
            // const SectionTitle(title: ''),
            SizedBox(
              height: index == 0 ? 330 : height,
            ),
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
        ));
  }
}

class ItemBrowseServicesCard2 extends StatelessWidget {
  const ItemBrowseServicesCard2(
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
  final ItemBrowseServicesModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final bool? account;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        children: <Widget>[
          // const SectionTitle(title: ''),
          SizedBox(
            height: height,
            child: ItemBrowseServicesContent1(
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
    );
  }
}

class ItemBrowseServicesCard3 extends StatefulWidget {
  ItemBrowseServicesCard3(
      {Key? key,
      @required this.destination,
      this.index,
      this.search,
      this.shape,
      this.height,
      this.account,
      this.idHash,
      this.cb})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height;
  final ItemBrowseServicesModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final bool? account;
  final String? idHash;
  final int? index;
  ChatBloc? cb;

  @override
  _ItemBrowseServicesCard3State createState() =>
      _ItemBrowseServicesCard3State();
}

class _ItemBrowseServicesCard3State extends State<ItemBrowseServicesCard3> {
  late BannerAd _bannerAd;
  bool _isSetRatting = true;
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
      getRevStatus();
    }
  }
  Future<void> _setRevStatus() async {
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('apprate_timestamp', tm);
    setState(() {
      _isSetRatting = false;
    });
  }
  Future<void> _setRevEndStatus() async {
    // var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('apprate_timestamp', 0);
    setState(() {
      _isSetRatting = false;
    });
  }
  Future<void> _setRS() async {
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('apprate_timestamp1', tm);
    setState(() {
      _isSetRatting = false;
    });
  }
  Future<void> getRevStatus() async {
    var ts;
    var ts1;
    var tm = DateTime.now().toUtc().millisecondsSinceEpoch;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('apprate_timestamp')) {
      ts =  prefs.getInt('apprate_timestamp');

    } else {

    }

    if (prefs.containsKey('apprate_timestamp1')) {

      ts1 =  prefs.getInt('apprate_timestamp1');

    } else {

    }

    if(ts != null){
      if(ts == 0){
        if (!mounted) {
          setState(() {
            _isSetRatting = false;
          });
        }else{
          _isSetRatting = false;
        }
      }else {
        if (ts1 != null) {
          final date1 = DateTime.fromMillisecondsSinceEpoch(ts * 1000).toUtc();
          final date2 = DateTime.fromMillisecondsSinceEpoch(tm * 1000).toUtc();
          final date3 = DateTime.fromMillisecondsSinceEpoch(ts1 * 1000).toUtc();
          double difference = double.parse(date2
              .difference(date3)
              .inDays
              .toString());
          if (difference <= 365.00) {
            if (!mounted) {
              setState(() {
                _isSetRatting = false;
              });
            } else {
              _isSetRatting = false;
            }
          }
        } else {
          final date1 = DateTime.fromMillisecondsSinceEpoch(ts * 1000).toUtc();
          final date2 = DateTime.fromMillisecondsSinceEpoch(tm * 1000).toUtc();
          double difference = double.parse(date2
              .difference(date1)
              .inDays
              .toString());
          if (difference <= 7.00) {
            if (!mounted) {
              setState(() {
                _isSetRatting = false;
              });
            } else {
              _isSetRatting = false;
            }
          }
        }
      }


    }else{
      if(ts1 != null){
        final date1 = DateTime.fromMillisecondsSinceEpoch(ts1 * 1000).toUtc();
        final date2 = DateTime.fromMillisecondsSinceEpoch(tm * 1000).toUtc();
        double difference = double.parse(date2.difference(date1).inDays.toString());
        if(difference <= 365.00){
          if (!mounted) {
            setState(() {
              _isSetRatting = false;
            });
          }else{
            _isSetRatting = false;
          }
        }

      }
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
    return SafeArea(
        top: false,
        bottom: false,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
            child: Column(
              children: [
                if (_isBannerAdReady && _isSetRatting) Card(
                  color: Colors.red,
                  elevation: 12.0,
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            //  const SizedBox(
                            //    width: 20,
                            //  ),
                            Container(
                                height: 100,
                                width: 320,
                                child: const Text('Jika Anda merasa terbantu dengan aplikasi ini, berkenankah untuk memberikan rating? Terima kasih atas dukungan Anda selama ini.',style: TextStyle( color: Colors.white, fontSize: 18,), textAlign: TextAlign.center,overflow:TextOverflow.clip, maxLines: 4)

                            ) ,
                            //  const SizedBox(
                            //    width: 5,
                            // ),
                          ]
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          SizedBox(width: 10),
                          Expanded(child:  TextButton(
                            style: TextButton.styleFrom( //<-- SEE HERE
                              side: BorderSide(width: 1.5, color: Colors.white),
                            ),
                            onPressed: () async{
                              //  await _setRateCountSF(1);

                              await  _setRevStatus();
                              // Navigator.of(context).pop(true);
                            },

                            child: Text('Nanti Saja', style: TextStyle(fontSize: 15, color: Colors.white)),
                          ),),

                          SizedBox(width: 5),
                          Expanded(child: TextButton(
                            style: TextButton.styleFrom( //<-- SEE HERE
                              side: BorderSide(width: 1.5, color: Colors.white),
                            ),
                            onPressed: () async{
                              //  await _setRateCountSF(1);

                              // await  _setRevEndStatus();
                              await  _setRS();

                              // Navigator.of(context).pop(true);
                            },

                            child: Text('Sudah Pernah', style: TextStyle(fontSize: 15, color: Colors.white)),
                          ),),

                          SizedBox(width: 5),
                          /*
                        TextButton(
                          onPressed: () async{
                            //  await _setRateCountSF(1);
                            if (await canLaunch(
                                'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                              await launch(
                                  'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                            } else {
                              throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                            }
                            Navigator.of(context).pop(true);
                          },

                          child: Text('Silahkan Merating', style: TextStyle(fontSize: 18, color: Colors.white)),
                        ),

                         */
                          Expanded(child:TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,

                            ),
                            onPressed: () async{
                              // await  _setRevStatus();
                              await   _setRS();
                              if (await canLaunch(
                                  'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                                await launch(
                                    'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                              } else {
                                throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                              }
                              Navigator.of(context).pop(true);

                            },
                            child: const Text('Tentu Saja', style: TextStyle(fontSize: 15, color: Colors.red)),
                          ), ),

                          SizedBox(width: 10),
                          /*
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFFff8f00),
                                        Color(0xFFff8f00),
                                        Color(0xFFffc046),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                onPressed: () async{
                                 // await  _setRevStatus();
                                  await   _setRS();
                                  if (await canLaunch(
                                      'https://play.google.com/store/apps/details?id=id.co.projectscoid')) {
                                    await launch(
                                        'https://play.google.com/store/apps/details?id=id.co.projectscoid');
                                  } else {
                                    throw 'Could not launch https://play.google.com/store/apps/details?id=id.co.projectscoid';
                                  }
                                  Navigator.of(context).pop(true);

                                },
                                child: const Text('Silahkan Merating', style: TextStyle(fontSize: 18, color: Colors.white)),
                              ),
                            ],
                          ),
                        ),

                         */
                          /*
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Nanti', style: TextStyle(fontSize: 18, color: Colors.white)),
                        ),

                         */
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                    ],
                  ),

                ),
                Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: _isBannerAdReady
                      ? ItemBrowseServicesContent3(
                          bannerAd: _bannerAd,
                          isBanner: _isBannerAdReady,
                          destination: widget.destination,
                          account: widget.account,
                          idHash: widget.idHash,
                          cb: widget.cb)
                      : ItemBrowseServicesContent3(
                          bannerAd: null,
                          isBanner: _isBannerAdReady,
                          destination: widget.destination,
                          account: widget.account,
                          idHash: widget.idHash,
                          cb: widget.cb),
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
            )

            //  margin: EdgeInsets.all(5.0),

            ));
  }
}

class ItemBrowseServicesContent1 extends StatelessWidget {
  const ItemBrowseServicesContent1(
      {Key? key, @required this.destination, this.account})
      : assert(destination != null),
        super(key: key);

  final ItemBrowseServicesModel? destination;
  final bool? account;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final mediaQueryData = MediaQuery.of(context);

    final List<Widget> children = <Widget>[
      // Photo? and title.
      SizedBox(
        height: 230.0,
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
                child: Image.network(
                  destination!.item!.logo_url,
                  fit: BoxFit.cover,
                )),
            Positioned.fill(
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.lightGreenAccent,
                      onTap: () {
                        /*
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(destination!.item!.buttons[1].url ));

                         */
                      },
                    ))),
            Positioned.fill(
                bottom: 25,
                left: 0.80 * mediaQueryData.size.width -
                    destination!.item!.price_str.length.toDouble() * 1.3,
                top: 0.82 * 230.0,
                right:
                    30.0 - destination!.item!.price_str.length.toDouble() * 0.8,
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                child: Container(
                  // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  alignment: Alignment.center,
                  height: 10.0,
                  decoration: BoxDecoration(
                    //color: Colors.lightBlue[100],
                    color: CurrentTheme.NormalTextColor,
                  ),
                  child: Text(
                    destination!.item!.price_str,
                    style: TextStyle(color: CurrentTheme.BackgroundColor),
                  ),
                )),
          ],
        ),
      ),

      SizedBox(
        height: 72.0,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description

              Container(
                padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    destination!.item!.logo_url,
                    fit: BoxFit.scaleDown,
                    height: 40.0,
                    width: 40.0,
                  ),
                ),
              ),
              //newly added
              Flexible(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: Column(children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            /*
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(destination!.item!.buttons[1].url ));

                                 */
                          },
                          child: Html(
                              data: readText(destination!.item!.title, 62),
                              style: {
                                "html": Style(
                                    fontSize: FontSize.medium,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black87),
                              }
                              //  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.black87,fontSize: 14, fontWeight: FontWeight.w500 )
                              ),
                        ),
                        Row(children: <Widget>[
                          // three line description
                          Text(
                            destination!.item!.seller_str,
                            style: descriptionStyle!
                                .copyWith(color: Colors.black87, fontSize: 13),
                          ),
                          Text(
                            ' . ' +
                                ratingMean(destination!.item!.rating_num) +
                                ' . ',
                            style: descriptionStyle!
                                .copyWith(color: Colors.black54, fontSize: 13),
                          ),
                          Text(
                            destination!.item!.seller_product_sold.toString() +
                                ' sales',
                            style: descriptionStyle!
                                .copyWith(color: Colors.black54, fontSize: 13),
                          )
                        ])
                      ]))),
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: PopupMenuButton<int>(
                  onSelected: (int? value) {
                    if (value == 1) {
                      if (account!) {
                        AppProvider.getRouter(context)!.navigateTo(context,
                            urlToRoute(destination!.item!.buttons[0].url));
                      } else {
                        AppProvider.getRouter(context)!
                            .navigateTo(context, '/login/1');
                      }
                    }
                    if (value == 2) {
                      /*
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute(destination!.item!.buttons[1].url ));

                       */
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text('Chat with seller'),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
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
                                onSelected: (int?value) {

                                  if(value == 1) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item!.buttons[0].url ));
                                  }
                                  if(value == 2) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item!.buttons[1].url ));
                                  }
                                  if(value == 3) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item!.buttons[2].url ));
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
                                onSelected: (int?value) {

                                  if(value == 1) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item!.buttons[0].url ));
                                  }
                                  if(value == 2) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item!.buttons[1].url ));
                                  }
                                  if(value == 3) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item!.buttons[2].url ));
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
          style: descriptionStyle!,
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
                destination!.item!.price_str,
                style: descriptionStyle!.copyWith(color: Colors.black54),
              ),

              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[



                      PopupMenuButton<int>(
                        onSelected: (int?value) {

                          if(value == 1) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons[0].url ));
                          }
                          if(value == 2) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons[1].url ));
                          }
                          if(value == 3) {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(destination!.item!.buttons[2].url ));
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
              child:    Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle!,
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
                                destination!.item!.seller_str,
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
          style: descriptionStyle!,
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
}

class ItemBrowseServicesContent2 extends StatelessWidget {
  const ItemBrowseServicesContent2(
      {Key? key, @required this.destination, this.account})
      : assert(destination != null),
        super(key: key);

  final ItemBrowseServicesModel? destination;
  final bool? account;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final List<Widget> children = <Widget>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class ItemBrowseServicesContent3 extends StatelessWidget {
  ItemBrowseServicesContent3(
      {Key? key,
      this.bannerAd,
      this.isBanner,
      @required this.destination,
      this.account,
      this.idHash,
      this.cb})
      : assert(destination != null),
        super(key: key);

  final ItemBrowseServicesModel? destination;

  final bool? account;
  final String? idHash;
  final BannerAd? bannerAd;
  final bool? isBanner;
  ChatBloc? cb;

  static String? _capitalize(String name) {
    assert(name != null && name.isNotEmpty);
    return name.substring(0, 1).toUpperCase() + name.substring(1);
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

  @override
  Widget build(BuildContext context) {
    // ChatBloc? cb;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(fontSize: 15, fontWeight: FontWeight.w500);
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    // var owner_id_str1 = destination!.item!.buttons[2].url.replaceAll(RegExp(r'[^0-9]'),'');
    int? owner_id1 = destination!.item!.seller_id;
    final mediaQueryData = MediaQuery.of(context);
    var ownerID = encode(owner_id1!);
    final List<Widget> children = <Widget>[
      //viewHeader(context, account, cb),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context, urlToRoute(destination!.item!.seller_url));
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
                        image: NetworkImage(destination!.item!.logo_url),
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                  /*
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        destination!.item!.logo_url,
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
                    context, urlToRoute(destination!.item!.seller_url));
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
                                '${destination!.item!.seller_str} ',
                                style: descriptionStyle!.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w800),
                              ),
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0, top: 2.0),
                                  child: RatingBarIndicator(
                                    rating: destination!
                                                .item!.seller_seller_rating
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
                                  '(${destination!.item!.seller_product_sold.toString()})',
                                  style:
                                      descriptionStyle!.copyWith(fontSize: 13),
                                ),
                              ]),
                              /*
                              Padding(
                                  padding: const EdgeInsets.only(left: 10 ,bottom: 1.0, top: 1.0),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            //destination!.item.buttons[2].url

                                            AppProvider.getRouter(
                                                context)!
                                                .navigateTo(
                                              context,
                                              '/public/support/contact_form/1/contact_formReportaViolationhttps:**projects.co.id*${destination!.item.buttons[1].url.replaceAll('/','*')}',
                                            );

                                          },
                                          child:  const Text('Report',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.red,
                                            ),

                                          ),
                                        ),
                                        const SizedBox(width : 3),
                                        const Text('|',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                          ),

                                        ),
                                        const SizedBox(width : 3),
                                        GestureDetector(
                                          onTap: () async{
                                            return await showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  AlertDialog(
                                                    title: Text('Block',
                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                    content: Text('Apakah Anda blok halaman / user ini?'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () async{
                                                          await apiRepProvider!.loadAndSaveBlacklist('black', destination!.item.service_id + 'BrowseServices');
                                                          Navigator.pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    PublicBrowseServicesListing(
                                                                        id: '0',
                                                                        cb: cb)),
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

                                          },
                                          child:  const Text('Block',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.red,
                                            ),

                                          ),

                                        ),
                                      ]
                                  )
                              ),

                               */
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
        Expanded(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                /*
                GestureDetector(
                  onTap: () {
                    //destination!.item.buttons[2].url

                    AppProvider.getRouter(
                        context)!
                        .navigateTo(
                      context,
                      '/public/support/contact_form/1/contact_formReportaViolationhttps:**projects.co.id*${destination!.item.buttons[1].url.replaceAll('/','*')}',
                    );

                  },
                  child: Container(
                    height: 60.0,
                    width: 40.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Icon(
                            Icons.warning_rounded,
                            size: 20.0,
                            color: Colors.red,
                          ),
                        ),
                        Text('Report',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    return await showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(
                            title: Text('Block',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            content: Text('Apakah Anda blok halaman / user ini?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () async{
                                  await apiRepProvider!.loadAndSaveBlacklist('black', destination!.item.service_id + 'BrowseServices');
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PublicBrowseServicesListing(
                                                id: '0',
                                                cb: cb)),
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

                  },
                  child: Container(
                    height: 60.0,
                    width: 40.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Icon(
                            Icons.block_rounded,
                            size: 20.0,
                            color: Colors.red,
                          ),
                        ),
                        Text('Block',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                ),

                 */
            GestureDetector(
              onTap: () {
                if (account!) {
                  //  var owner_id_str = destination!.item!.buttons[0].url.replaceAll(RegExp(r'[^0-9]'),'');

                  // int?owner_id = int.parse(owner_id_str);
                  //   widget.cb = ChatBloc();

                  // if(widget.id == '')

                  // cb.wsSetHandlers();
                  //widget.cb.lgn(widget.id);
                  // cb.lg(idHash!);
                  //$idHash/${encode(this.model!.model!.owner_id)}
                  String? thread = '';
                  if (decode(idHash!) > destination!.item!.seller_id) {
                    thread = '${encode(destination!.item!.seller_id)}/$idHash';
                  } else {
                    thread = '$idHash/${encode(destination!.item!.seller_id)}';
                  }

                  if (cb != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            user: {
                              "thread": "$thread",
                              "username": "${destination!.item!.seller_str}",
                              "userid":
                                  "${encode(destination!.item!.seller_id)}",
                              "display": "${destination!.item!.seller_str}",
                              "avatar": "${destination!.item!.logo_url}",
                              "lastmessage":
                                  "<b>Konteks Percakapan: ${destination!.item!.title.replaceAll('&amp;', '&')}</b>",
                              "lastseen": null,
                              "lasttime": null
                            },
                            userID: idHash,
                            chatBloc: cb,
                            trans: true,
                            ctx: context,
                          ),
                        )).then((value) async {
                      // cb.dispose();
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
                              "username": "${destination!.item!.seller_str}",
                              "userid":
                                  "${encode(destination!.item!.seller_id)}",
                              "display": "${destination!.item!.seller_str}",
                              "avatar": "${destination!.item!.logo_url}",
                              "lastmessage":
                                  "<b>Konteks Percakapan: ${destination!.item!.title.replaceAll('&amp;', '&')}</b>",
                              "lastseen": null,
                              "lasttime": null
                            },
                            userID: idHash,
                            chatBloc: cb1,
                            trans: true,
                            ctx: context,
                          ),
                        )).then((value) async {
                      // cb.dispose();
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
            GestureDetector(
              onTap: () {
                if (account!) {
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute(
                          '/user/browse_services/place_order/${destination!.item!.service_id}/${destination!.item!.title.replaceAll('/', '*')}'));
                } else {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, '/login/1');
                }
              },
              child: Container(
                height: 60.0,
                width: 58.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 19.0,
                        color: Colors.green,
                      ),
                    ),
                    Text('Order',
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

        Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PublicBrowseServicesView(
                            id:
                            '${urlToRoute(destination!.item!.buttons[1].url).split('/')[4]}',
                            title:
                            '${urlToRoute(destination!.item!.buttons[1].url).split('/')[5]}',
                            cb: cb)),
                  );
                  /*
          AppProvider.getRouter(context)!.navigateTo(
              context,
              urlToRoute(destination!.item!.buttons[1].url ));

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
                  Container(
                    width: mediaQueryData.size.width * 3/4,

                    child: Text(destination!.item.title.replaceAll('&amp;', '&'),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 1.0, top: 1.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            //destination!.item.buttons[2].url

                            AppProvider.getRouter(
                                context)!
                                .navigateTo(
                              context,
                              '/public/support/contact_form/1/contact_formReportaViolationhttps:**projects.co.id*${destination!.item.buttons[1].url.replaceAll('/','*')}',
                            );

                          },
                          child:  const Text('Report',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: Colors.red,
                            ),

                          ),
                        ),
                        const SizedBox(width : 3),
                        const Text('|',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),

                        ),
                        const SizedBox(width : 3),
                        GestureDetector(
                          onTap: () async{
                            return await showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertDialog(
                                    title: Text('Block',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                    content: Text('Apakah Anda blok halaman / user ini?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async{
                                          await apiRepProvider!.loadAndSaveBlacklist('black', destination!.item.service_id + 'BrowseServices');
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PublicBrowseServicesListing(
                                                        id: '0',
                                                        cb: cb)),
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

                          },
                          child:  const Text('Block',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: Colors.red,
                            ),

                          ),

                        ),
                      ]
                  )
              ),
            ]),



      Container(
        // height:  120.0,
        padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 8.0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PublicBrowseServicesView(
                        id:
                            '${urlToRoute(destination!.item!.buttons[1].url).split('/')[4]}',
                        title:
                            '${urlToRoute(destination!.item!.buttons[1].url).split('/')[5]}',
                        cb: cb)),
              );
              /*
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item!.buttons[1].url ));

               */
            },
            child: Ink(
              // child: Html(data: destination!.item!.short_description ,useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.black87,fontSize: 12 ), backgroundColor: CurrentTheme.BackgroundColor, )
              child: HtmlWidget(
                readText(
                    destination!.item!.short_description
                        .replaceAll('<div>', '')
                        .replaceAll('<\/div>', '')
                        .replaceAll('<br>', ' ')
                        .replaceAll('<p>', '')
                        .replaceAll('<\/p>', '<br>'),
                    250),
                //bodyPadding: EdgeInsets.only(left:0.0,  bottom: 12, top: 1),
                textStyle: TextStyle(fontSize: 12),
                onTapUrl: (url) async {
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
                Html(data: readText(destination!.item!.short_description.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),400) ,
                    //useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(fontSize: 12 )
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
        child: destination!.item!.tags_str.length >= 2
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
                                      PublicBrowseServicesListing(
                                          id: destination!.item!.tags_url[0]
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
                                _capitalize(destination!.item!.tags_str[0])!,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ),
                          /*
                            Chip(
                              key: ValueKey<String>(destination!.item!.channels_str[0]),
                                padding: const EdgeInsets.only(top : 0,bottom : 0),
                              shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
                              backgroundColor: Colors.white70,
                              label: Text(_capitalize(destination!.item!.channels_str[0]), style:TextStyle(
                                  fontSize: 11,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w300) ),
                            ),
                            */

                          /*
                            Text(destination!.item!.channels_str[0], style: TextStyle(
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
                                      PublicBrowseServicesListing(
                                          id: destination!.item!.tags_url[1]
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
                                _capitalize(destination!.item!.tags_str[1])!,
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
            : destination!.item!.tags_str.length == 1
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
                                // destination!.item!.channels_str[0]
                                // destination!.item!.channels_strText(),
                                GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PublicBrowseServicesListing(
                                              id: destination!.item!.tags_url[0]
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
                                        destination!.item!.tags_str[0])!,
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
        color: Colors.grey,
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                          Icons.attach_money_rounded,
                          size: 20.0,
                          color: Colors.black87,
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Text('Start from',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w300)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 3.0, right: 10, bottom: 6),
                              child: Text(
                                destination!.item!.price_str,
                                style: descriptionStyle!.copyWith(fontSize: 11),
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
              ),
              Container(
                width: 0.3,
                height: 52,
                color: Colors.grey,
              ),
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
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: Text('Rating',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300)),
                          ),
                          Row(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: 3.0,
                              ),
                              child: RatingBarIndicator(
                                rating:
                                    destination!.item!.rating.toDouble() / 2 -
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
                                '(${destination!.item!.sales_count.toString()})',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300)),
                          ])
                        ]),
                  ],
                ),
              ),
              Container(
                width: 0.3,
                height: 52,
                color: Colors.grey,
              ),
              Expanded(
                child: Padding(
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
                                    '${destination!.item!.finish_days.toString()} days',
                                    style: descriptionStyle!
                                        .copyWith(fontSize: 11)))
                          ]),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    ];

    /*

    final List<Widget> children = <Widget>[
      // Photo? and title.
      SizedBox(
        height:  (mediaQueryData.size.height - (4*55) )/3.8 ,
        child: Stack(

          children: <Widget>[
            Positioned.fill(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                top : 0.0,
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                child:
                Image.network(
                  destination!.item!.logo_url,
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
                            urlToRoute(destination!.item!.buttons[1].url ));
                      },
                    )
                )
            ),
            /*
            Positioned.fill(
                bottom: 17,
                left: 0.22 * mediaQueryData.size.width - destination!.item!.price_str.length.toDouble() * 0.35,
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
                  decoration: BoxDecoration(
                    //color: Colors.lightBlue[100],
                    color:CurrentTheme.NormalTextColor,
                  ),
                  child: Text( destination!.item!.price_str ,style: TextStyle(color: CurrentTheme.BackgroundColor, fontSize: 10),

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
        height: 55,
        //padding: const EdgeInsets.fromLTRB(5.0, 2.0, 0.0 , 0.0),
        child:
        Stack(

            children: <Widget>[
              Positioned.fill(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                top : 0.0,
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
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0.0 , 0.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children : <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        AppProvider.getRouter(context)!.navigateTo(
                                            context,
                                            urlToRoute(destination!.item!.buttons[2].url ));
                                      },
                                      child:

                                      Text(
                                        readText(destination!.item!.title , 25) ,
                                        style: descriptionStyle!.copyWith( fontSize: 12),
                                      ),

                                    ),

                                    Row(
                                        children: <Widget>[
                                          // three line description
                                          Text(
                                            destination!.item!.seller_str ,
                                            style: descriptionStyle!.copyWith( fontSize: 10),
                                          ),

                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                          // three line description
                                          Text(
                                            ratingMean(destination!.item!.rating_num)  + ' . ' ,
                                            style: descriptionStyle!.copyWith( fontSize: 10),
                                          ),

                                          Text(
                                            destination!.item!.sales_count.toString() + ' sales' + ' . ',
                                            style: descriptionStyle!.copyWith( fontSize: 10),
                                          ),
                                          Text(
                                            destination!.item!.price_str  ,
                                            style: descriptionStyle!.copyWith( fontSize: 10),
                                          ),


                                        ]
                                    ),

                                  ]
                              )
                          )
                      )

                    ]

                ),

              ),
              Positioned.fill(
                  bottom: 0.0,
                  left:mediaQueryData.size.width < 350 ?  mediaQueryData.size.width * 1/3 : mediaQueryData.size.width * 1/2.8,
                  right: 0.0,
                  top : 0.0,
                  // In order to have the ink splash appear above the image, you
                  // must use Ink.image. This allows the image to be painted as part
                  // of the Material and display ink effects above it. Using a
                  // standard Image will obscure the ink splash.
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0 , 0.0),
                      child: Column(
                          children : <Widget>[
                            Container(
                              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0 , 0.0),
                              child: PopupMenuButton<int>(
                                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 12.0),
                                onSelected: (int?value) {

                                  if(value == 1) {
                                    if(account!){
                                      var owner_id_str = destination!.item!.buttons[0].url.replaceAll(RegExp(r'[^0-9]'),'');

                                      int?owner_id = int.parse(owner_id_str);
                                      cb = ChatBloc();

                                      // if(widget.id == '')

                                      cb.wsSetHandlers();
                                      //cb.lgn(widget.id);
                                      cb.lg(idHash!);
                                      //$idHash/${encode(this.model!.model!.owner_id)}
                                      String? thread = '';
                                      if(decode(idHash!)> owner_id ){
                                        thread = '${encode(owner_id)}/$idHash';
                                      }else{
                                        thread = '$idHash/${encode(owner_id)}';
                                      }
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => ChatScreen(
                                              user: {

                                                "thread":"$thread",
                                                "username":"${destination!.item!.seller_str}",
                                                "userid":"${encode(owner_id)}",
                                                "display":"${destination!.item!.seller_str}",
                                                "avatar":"${destination!.item!.logo_url}",
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
                                      );
                                    }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          '/login/1');
                                    }
                                  }

                                  if(value == 2) {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(destination!.item!.buttons[1].url ));
                                  }


                                },
                                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                                  const PopupMenuItem<int>(
                                    value: 1,
                                    child: Text('Chat with seller'),
                                  ),
                                  const PopupMenuItem<int>(
                                    value: 2,
                                    child: Text('View'),
                                  ),


                                ],
                              ),
                            ),
                          ])
                  )

              ),
            ])
        /*
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              // three line description


              //newly added
              Flexible(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0.0 , 0.0),
                      child: Column(
                          children : <Widget>[
                            GestureDetector(
                              onTap: () {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(destination!.item!.buttons[2].url ));
                              },
                              child: Html(

                                  data :readText(destination!.item!.title , 40),
                                  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.black,fontSize: 8, fontWeight: FontWeight.w500 )
                              ),
                            ),

                            Row(
                                children: <Widget>[
                                  // three line description
                                  Text(
                                    destination!.item!.seller_str ,
                                    style: descriptionStyle!.copyWith(color: Colors.black87, fontSize: 8),
                                  ),



                                ]
                            ),
                            Row(
                                children: <Widget>[
                                  // three line description
                                  Text(
                                    ratingMean(destination!.item!.rating_num)  + ' . ' ,
                                    style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 8),
                                  ),

                                  Text(
                                    destination!.item!.sales_count.toString() + ' sales' + ' . ',
                                    style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 8),
                                  ),
                                  Text(
                                    destination!.item!.price_str  ,
                                    style: descriptionStyle!.copyWith(color: Colors.black54, fontSize: 8),
                                  ),


                                ]
                            ),

                          ]
                      )
                  )
              ),

              Container(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0 , 0.0),
                  child: Column(
                      children : <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0 , 0.0),
                          child: PopupMenuButton<int>(
                            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 12.0),
                            onSelected: (int?value) {

                              if(value == 1) {
                                if(account!){
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(destination!.item!.buttons[0].url ));
                                }else{
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      '/login/1');
                                }
                              }

                              if(value == 3) {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(destination!.item!.buttons[1].url ));
                              }


                            },
                            itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                              const PopupMenuItem<int>(
                                value: 1,
                                child: Text('Chat with seller'),
                              ),
                              const PopupMenuItem<int>(
                                value: 2,
                                child: Text('View'),
                              ),


                            ],
                          ),
                        ),
                      ])
              )

            ]

        ),

         */

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
