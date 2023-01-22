import 'package:projectscoid/models/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import 'file_fields.dart';
import 'meta.dart';
import 'button.dart';
import 'browse_products_item.dart';
import 'photo.dart';
import 'package:projectscoid/models/browse_products_base.dart';
import 'BrowseProducts/screenshots_list_item_base.dart';
import 'package:projectscoid/models/BrowseProducts/screenshots_list_base.dart';
import 'package:projectscoid/models/BrowseProducts/product_comments_list_base.dart';
import 'BrowseProducts/product_reviews_list_item.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:expandable/expandable.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:projectscoid/app/Env.dart';
import 'package:projectscoid/views/BrowseProducts/product_reviews_list.dart';
import 'package:projectscoid/views/BrowseProducts/product_comments_list.dart';
import 'package:projectscoid/views/BrowseProducts/browse_products_listing.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';
import 'package:badges/badges.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:projectscoid/views/BrowseProducts/browse_products_view.dart';
import 'package:string_mask/string_mask.dart';
import 'package:string_mask/src/mask_pattern.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
part 'browse_products.g.dart';
/** AUTOGENERATE OFF **/

class AddToCartBrowseProductsModel extends AddToCartBrowseProductsBase {
  Map<String, dynamic> json;
  AddToCartBrowseProductsModel(Map<String, dynamic> this.json) : super(json);
}

class BrowseProductsModel extends BrowseProductsBase {
  Map<String, dynamic> json;
  BrowseProductsModel(Map<String, dynamic> this.json) : super(json);
}

////////////////////////
@JsonSerializable()
class ViewModelBrowseProductsRev {
  int? age;
  int? cnt;
  int? page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? description;
  List<int?>? tags_id;
  List<String?>? tags_str;
  List<String?>? tags_url;
  List<FileField?>? trial_version;
  String? trial_version_url;
  String? trial_version_name;
  double? price;
  String? price_str;
  String? logo_url;
  Photo? logo;
  int? seller_id;
  int? rating;
  int? sales_count;
  String? seller_str;
  String? seller_url;
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

  ScreenshotsListingTools? screenshots;

  ProductReviewsListingToolsRev? product_reviews;

  ProductCommentsListingTools? product_comments;
  String? product_id;

  //
  ViewModelBrowseProductsRev(
    this.id,
    this.description,
    this.tags_id,
    this.tags_str,
    this.tags_url,
    this.trial_version,
    this.trial_version_url,
    this.trial_version_name,
    this.price,
    this.price_str,
    this.logo,
    this.logo_url,
    this.seller_id,
    this.rating,
    this.sales_count,
    this.seller_str,
    this.seller_url,
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
    this.screenshots,
    this.product_reviews,
    this.product_comments,
    this.product_id,
  );

  factory ViewModelBrowseProductsRev.fromJson(Map<String, dynamic> json) =>
      _$ViewModelBrowseProductsRevFromJson(json);
}

/*
ViewModelBrowseProductsRev _$ViewModelBrowseProductsRevFromJson(Map<String, dynamic> json) {
  return ViewModelBrowseProductsRev(
      json['id'] as String,
      json['description'] as String,
      (json['tags_id'] as List)?.map((e) => e as int)?.toList(),
      (json['tags_str'] as List)?.map((e) => e as String)?.toList(),
      (json['tags_url'] as List)?.map((e) => e as String)?.toList(),
      (json['trial_version'] as List)
          ?.map((e) =>
      e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['trial_version_url'] as String,
      json['trial_version_name'] as String,
      (json['price'] as num)?.toDouble(),
      json['price_str'] as String,
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String,
      json['seller_id'] as int,
      json['rating'] as int,
      json['sales_count'] as int,
      json['seller_str'] as String,
      json['seller_url'] as String,
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
      json['screenshots'] == null
          ? null
          : ScreenshotsListingTools.fromJson(json['screenshots'] as Map<String, dynamic>),
      json['product_reviews'] == null
          ? null
          : ProductReviewsListingToolsRev.fromJson(json['product_reviews'] as Map<String, dynamic>),
      json['product_comments'] == null
          ? null
          : ProductCommentsListingTools.fromJson(json['product_comments'] as Map<String, dynamic>),
      json['product_id'] as String)
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
class BrowseProductsViewSuperBaseRev {
  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelBrowseProductsRev? model;
  BrowseProductsViewSuperBaseRev(
    this.id,
    this.buttons,
    this.meta,
    this.model,
  );

  factory BrowseProductsViewSuperBaseRev.fromJson(Map<String, dynamic> json) =>
      _$BrowseProductsViewSuperBaseRevFromJson(json);
}
/*
BrowseProductsViewSuperBaseRev _$BrowseProductsViewSuperBaseRevFromJson(Map<String, dynamic> json) {
  return BrowseProductsViewSuperBaseRev(
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
          : ViewModelBrowseProductsRev.fromJson(
          json['model'] as Map<String, dynamic>));
}

 */

class BrowseProductsViewModel extends BrowseProductsViewBase {
  Map<String, dynamic> json;
//  BrowseProductsViewModel(Map<String, dynamic> this.json):super(json);
  BrowseProductsViewModel(Map<String, dynamic> this.json) : super(json) {
    model = BrowseProductsViewSuperBaseRev.fromJson(this.json);
  }
  //ChatBloc _chatBloc;
  Widget viewHeader(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final mediaQueryData = MediaQuery.of(context);
    return (
            // SizedBox(
            //   height: 140.0,
            //   child:
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
          // three line description
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 20.0, 0.0),
            child: InkWell(
              onTap: () {
                // return BidItemInfo(info : this.info!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowItemScreenshots(
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
                      data: model!.meta.title!,
                      style: {
                        "html": Style(
                          fontSize: FontSize.medium,
                        ),
                      },
                      //useRichText: true, defaultTextStyle :  descriptionStyle!.copyWith(  fontSize: model!.meta.title.length < 75 ? 15 : model!.meta.title.length < 150 ?  13 : 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppProvider.getRouter(context)!.navigateTo(
                            context, urlToRoute(this.model!.model!.seller_url));
                      },
                      child: Html(
                        data: filterShortcodes(
                            readText(this.model!.model!.seller_str, 54)),
                        style: {
                          "html": Style(
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        },

                        //  useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.green,fontSize: 12, fontWeight: FontWeight.w500 )
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
        ])

        //  )
        );
  }

  double? avgRating(List<ItemProductReviewsRev> rev) {
    var rv;
    int? revRating = 0;
    int count = 0;
    for (rv in rev) {
      count++;
      revRating = (revRating! + rv.rating) as int?;
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
                        height: 58.0,
                        width: 130.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, right: 2.0, top: 4.0),
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
                                      size: 18.0,
                                      // color: Colors.black87,
                                    ),
                                  ]),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0, right: 8.0, top: 5.0),
                                child: Html(data: 'Seller rating ',
                                    //
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
                        /*  Navigator.of(context)!.push(PageRouteBuilder(
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 8.0, top: 0.0),
                              child: Icon(
                                Icons.attach_money,
                                size: 26.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 8.0, top: 1.0),
                              child: this.model!.model!.price < 100000
                                  ? Html(
                                      data: readText('Low price', 46),

                                      //  defaultTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                                      style: {
                                        "html": Style(
                                          fontSize: FontSize.small,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      },
                                    )
                                  : this.model!.model!.price < 500000
                                      ? Html(
                                          data: readText(' Medium price', 46),
                                          //  defaultTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                                          style: {
                                            "html": Style(
                                              fontSize: FontSize.small,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          },
                                        )
                                      : Html(
                                          data: readText('High price', 46),
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
                        /*  Navigator.of(context)!.push(PageRouteBuilder(
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 8.0, top: 0.0),
                              child: Icon(
                                Icons.note_add,
                                size: 26.0,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 8.0, top: 1.0),
                                child: model!.model!.trial_version == null
                                    ? Html(
                                        data: readText('No trial version', 46),
                                        // defaultTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                                        style: {
                                          "html": Style(
                                            fontSize: FontSize.small,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        },
                                      )
                                    : Html(
                                        data: readText('Free sample', 46),
                                        // defaultTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                                        style: {
                                          "html": Style(
                                            fontSize: FontSize.small,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        },
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
                                  left: 10.0, right: 2.0, top: 4.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    this
                                                .model!
                                                .model!
                                                .product_reviews
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
                                                    .product_reviews
                                                    .items)!
                                                .toStringAsFixed(1),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                    Icon(
                                      Icons.star,
                                      size: 18.0,
                                    ),
                                  ]),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 8.0, top: 5.0),
                                child: this
                                            .model!
                                            .model!
                                            .product_reviews
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
                                                .product_reviews
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
    final size = MediaQuery.of(context)!.size;
    final width = size.width;
    if (model!.model!.trial_version == null) {
      return (Padding(
        padding: EdgeInsets.only(left: 20, bottom: 10),
        child: Text('Trial version: not available'),
      ));
    }
    if (model!.model!.trial_version_name != '') {
      return (Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
                'Trial version: available [${model!.model!.trial_version_name}]'),
          ),
          FileViewAtt(
            ctx: context,
            value: model!.model!.trial_version_name,
            value1: model!.model!.trial_version_url,
            caption: 'Sample',
          )
        ],
      ));
    } else {
      return (Padding(
        padding: EdgeInsets.only(left: 20, bottom: 10),
        child: Text('Trial version: not available'),
      ));
    }
  }

  Widget viewButton(
      BuildContext context, bool? account, String? idHash, ChatBloc? cb) {
    final size = MediaQuery.of(context)!.size;
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;
    final width = size.width;
    var maskOptions = new MaskOptions()..reverse = true;
    var formatter = new StringMask('#,##0', options: maskOptions);
    //this.model!.model!.price_str
    return Column(
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
                                        '/public/browse_products/add_to_cart/${this.model!.model!.product_id}/${this.model!.meta.title}'));
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
                                // cb = new ChatBloc();
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
                                      AppProvider.getApplication(context)!.chat;
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
                                '/public/support/contact_form/1/contact_formReportaViolationhttps:**projects.co.id*public*browse_products*view*${this.model!.model!.product_id}*${this.model!.meta.title.replaceAll('/', ' ')}',
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
                                            await apiRepProvider!.loadAndSaveBlacklist('black', this.model!.model!.product_id + 'BrowseProducts');
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PublicBrowseProductsListing(
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

  /*

  Widget viewButton (BuildContext context, bool? account){
    final size =MediaQuery.of(context)!.size;
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
            ElevatedButton(
                child: Text('Buy ' + this.model!.model!.price_str),
                textColor: Colors.white,
                splashColor : CurrentTheme.ShadeColor,
                color : Color(0xFF037f51),
                onPressed: () {
                  if(account!){
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute('/public/browse_products/add_to_cart/${this.model!.model!.product_id}/${this.model!.meta.title}'));
                  }else{
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        '/login/1');
                  }

                }
            )
          ]
      ),
    );
  }

   */

  Widget viewScreenshots(BuildContext context) {
    if (this.model!.model!.screenshots.items.length == 0) {
      return Container(height: 0, width: 0);
    } else {
      return Container(
        height: 200.0,
        child: this.model!.model!.screenshots.items.length == 0
            ? Container(width: 0.0, height: 0.0)
            : new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int? index) {
                  return index! >= this.model!.model!.screenshots.items.length
                      ? Container(width: 0.0, height: 0.0)
                      : ScreenshotsItem(
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
        .description!
        .replaceAll('<div>', '')
        .replaceAll('<\/div>', '')
        .replaceAll('<br>', ' ')
        .replaceAll('<p>', '')
        .replaceAll('<\/p>', '<br>'));
    var videoList = document.querySelectorAll("iframe");
    List<String?> id = [];
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
                          .description!
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
                                .description!
                                .replaceAll('<div>', '')
                                .replaceAll('<\/div>', '')
                                .replaceAll('<br>', ' ')
                                .replaceAll('<p>', '')
                                .replaceAll('<\/p>', '<br>'),
                            onTapUrl: (url) async {
                              if (url!.contains('projects.co.id')) {
                                if (url!.contains(new RegExp(r'[0-9]'))) {
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
                                  builder: (context) =>
                                      ShowItemScreenshots(image: '$src')),
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
              )
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
                MaterialPageRoute(builder: (context) => DescProductInfo(info : this.model!.model, title: this.model!.meta.title!)),
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

  Widget viewReview(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    var dateformat = DateFormat('dd/MM/yyyy');
    return this.model!.model!.product_reviews.items.length == 0
        ? Container(
            height: 0.0,
            width: 0.0,
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 20.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductReviewsList(
                            id: this.model!.model!.product_id,
                            title: this.model!.meta.title!,
                            url: Env.value!.baseUrl! +
                                '/public/browse_products/product_reviews_list/' +
                                this.model!.model!.product_id +
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
                          'Buyer reviews',
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
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                isThreeLine: false,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 1),
                                //enabled: false,
                                onLongPress: () {},
                                //onTap: () => Navigator.of(context)!.pushNamed('chat'),
                                onTap: () {},

                                leading: Container(
                                  width: 80,
                                  height: 80,
                                  /* decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        offset: Offset(0, 5),
                        blurRadius: 10)
                  ],
                ), */
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned.fill(
                                        top: 13,
                                        left: 30,
                                        child: GestureDetector(
                                          onTap: () {
                                            AppProvider.getRouter(context)!
                                                .navigateTo(
                                                    context,
                                                    urlToRoute(
                                                        'public/browse_users/view/' +
                                                            encode(this
                                                                .model!
                                                                .model!
                                                                .product_reviews
                                                                .items[0]
                                                                .buyer_id) +
                                                            '/z'));
                                          },
                                          child: CircleAvatar(
                                            // radius: 100,
                                            // minRadius: 70,
                                            // maxRadius: 70,
                                            // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                                            backgroundImage: new NetworkImage(
                                                this
                                                    .model!
                                                    .model!
                                                    .product_reviews
                                                    .items[0]
                                                    .buyer_photo_url),
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
                                                AppProvider.getRouter(context)!
                                                    .navigateTo(
                                                        context,
                                                        urlToRoute(
                                                            'public/browse_users/view/' +
                                                                encode(this
                                                                    .model!
                                                                    .model!
                                                                    .product_reviews
                                                                    .items[0]
                                                                    .buyer_id) +
                                                                '/z'));
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 17, right: 5),
                                                child: Text(
                                                  this
                                                      .model!
                                                      .model!
                                                      .product_reviews
                                                      .items[0]
                                                      .buyer_str,
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
                    child:   Text(timeago.format(destination!.item.date), softWrap: true, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end,
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
                                                  .product_reviews
                                                  .items[0]
                                                  .date) +
                                              ' ' +
                                              'WIB',
                                          style: descriptionStyle!
                                              .copyWith(fontSize: 12),
                                        ),
                                        /*
                                    SmoothStarRating(
                                      rating: this.model!.model!.product_reviews.items[0].rating.toDouble(),
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


                  data :"${destination!.item.feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>')}",
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
                child:HtmlWidget( destination!.item.feedback.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
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
                                              .product_reviews
                                              .items[0]
                                              .rating
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
                                            .product_reviews
                                            .items[0]
                                            .rating
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
                                      .product_reviews
                                      .items[0]
                                      .testimony
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
                                                    this.model!.model!.product_reviews.items[0].buyer_str,
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
                                          rating: this.model!.model!.product_reviews.items[0].rating.toDouble(),
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
                                                    dateformat.format(this.model!.model!.product_reviews.items[0].date),
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
                           Html(data: readText(this.model!.model!.product_reviews.items[0].testimony.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),
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
                    List<String?>? buyer_list_str;
                    DateTime? date;
                   */

                  //  Html(data: readText(this.model!.model!.product_reviews.items[0].testimony, 150)),
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
              if (this.model!.model!.product_comments.items.length == 0) {
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCommentsList(
                          id: this.model!.model!.product_id,
                          title: this.model!.meta.title!,
                          url: Env.value!.baseUrl! +
                              '/public/browse_products/product_comments_list/' +
                              this.model!.model!.product_id +
                              '/' +
                              this.model!.meta.title +
                              '?')),
                );
              }
            },
            child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Comments',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.arrow_forward, size: 18.0)
                  ]),
              this.model!.model!.product_comments.items.length == 0
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
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  isThreeLine: false,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 1),
                                  //enabled: false,
                                  onLongPress: () {},
                                  //onTap: () => Navigator.of(context)!.pushNamed('chat'),
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
                                              //      urlToRoute('public/browse_users/view/'+encode(destination!.item.user_id) + '/z'));
                                            },
                                            child: CircleAvatar(
                                              // radius: 100,
                                              // minRadius: 70,
                                              // maxRadius: 70,
                                              // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                                              backgroundImage: new NetworkImage(
                                                  this
                                                      .model!
                                                      .model!
                                                      .product_comments
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
                                                        .product_comments
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
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Text(
                                            dateformat.format(this
                                                    .model!
                                                    .model!
                                                    .product_comments
                                                    .items[0]
                                                    .post_date) +
                                                ' ' +
                                                'WIB',
                                            style: descriptionStyle!
                                                .copyWith(fontSize: 12),
                                          ),
                                          /*
                                                    SmoothStarRating(
                                                      rating: this.model!.model!.product_comments.items[0].user_seller_rating.toDouble(),
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
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child: HtmlWidget(
                                    this
                                        .model!
                                        .model!
                                        .product_comments
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
            ])

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
                    this.model!.model!.product_comments.items.length == 0 ? viewButtonReplay (context,account):
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
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Image.network(
                                            this.model!.model!.product_comments.items[0].user_photo_url,
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
                                                  this.model!.model!.product_comments.items[0].user_user_name,
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
                                          rating: this.model!.model!.product_comments.items[0].user_seller_rating.toDouble(),
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
                                                  dateformat.format(this.model!.model!.product_comments.items[0].post_date),
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
                        Html(data: readText(this.model!.model!.product_comments.items[0].message.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'), 150)),
                      ],
                    )

                  ]
              )

               */

            ));
  }

  Widget viewButtonReplay(BuildContext context, bool? account, String? userid) {
    final size = MediaQuery.of(context)!.size;
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
                        '/public/browse_products/product_comments_new_reply/' +
                            this.model!.model!.product_id +
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
                                      //  color: Colors.black54,
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
                                      // color: Colors.black54,
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
                                      // color: Colors.black54,
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
                                      // color: Colors.black54,
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
                                      // color: Colors.black54,
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
      //tapHeaderToExpand: true,
      // hasIcon: true,
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
                    builder: (context) => DescProductInfo(
                        info: this.model!.model,
                        title: this.model!.meta.title!)),
              );
            },
            child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'About this product',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.arrow_forward, size: 18.0)
                  ]),
              HtmlWidget(readText(
                  this
                      .model!
                      .model!
                      .description!
                      .replaceAll('<div>', '')
                      .replaceAll('<\/div>', '')
                      .replaceAll('<br>', ' ')
                      .replaceAll('<p>', '')
                      .replaceAll('<\/p>', '<br>'),
                  150)),
            ])));
  }

  //@override
  Widget appBar1(BuildContext context, String? idHash, ChatBloc cb) {
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
                      '${model!.meta.title} https://projects.co.id/public/browse_products/view/${this.model!.model!.product_id}/product',
                      subject: '${model!.meta.title}');
                },
                child: Icon(
                  Icons.share,
                  size: 26.0,
                ),
              )),
          PopupMenuButton<int>(
            onSelected: (int value) {
              if (value == 1) {
                if (idHash!.isNotEmpty) {
                  //  _chatBloc = new ChatBloc();
                  // if(widget.id == '')

                  //  _chatBloc.wsSetHandlers();
                  //_chatBloc.lgn(widget.id);
                  // _chatBloc.lg(idHash!);
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
                            "username": "${this.model!.model.seller_user_name}",
                            "userid": "${encode(this.model!.model.seller_id)}",
                            "display": "${this.model!.model.seller_user_name}",
                            "avatar": "${this.model!.model.seller_photo_url}",
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
                    //   _chatBloc.dispose();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('chatlink', true);
                  });
                } else {
                  AppProvider.getRouter(context)!
                      .navigateTo(context, '/login/1');
                }
              }
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
          // Navigator.pushReplacementNamed(context, "/projectscoid");
          AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
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

  Widget viewButton1(
      BuildContext context, bool? account, String idHash, ChatBloc cb) {
    final size = MediaQuery.of(context)!.size;
    final width = size.width;

    //this.model!.model!.price_str
    return Column(
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
                        ElevatedButton(
                            child: Row(
                              children: [
                                Icon(Icons.chat_bubble, size: 18),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Chat With Owner '),
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
                              if (idHash!.isNotEmpty) {
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
                                                "${this.model!.model.seller_user_name}",
                                            "userid":
                                                "${encode(this.model!.model.seller_id)}",
                                            "display":
                                                "${this.model!.model.seller_user_name}",
                                            "avatar":
                                                "${this.model!.model.seller_photo_url}",
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
                                    //   _chatBloc.dispose();
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setBool('chatlink', true);
                                  });
                                } else {
                                  var cb1 =
                                      AppProvider.getApplication(context)!.chat;
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
                                                "${this.model!.model.seller_user_name}",
                                            "userid":
                                                "${encode(this.model!.model.seller_id)}",
                                            "display":
                                                "${this.model!.model.seller_user_name}",
                                            "avatar":
                                                "${this.model!.model.seller_photo_url}",
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
                                    //   _chatBloc.dispose();
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setBool('chatlink', true);
                                  });
                                }
                                //  _chatBloc = new ChatBloc();
                                // if(widget.id == '')

                                //  _chatBloc.wsSetHandlers();
                                //_chatBloc.lgn(widget.id);
                                // _chatBloc.lg(idHash!);
                                //$idHash/${encode(this.model!.model!.owner_id)}

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

  Widget viewBanner(BuildContext context, String? idHash, ChatBloc? cb) {
    final size = MediaQuery.of(context)!.size;

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
                                 child: new Icon(
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
                                '${model!.meta.title} https://projects.co.id/public/browse_products/view/${this.model!.model!.service_id}/product',
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
                              //  cb = new ChatBloc();
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
          data: model!.meta.title!,
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
          : Text('${this.model!.model!.sales_count.toString()} produk terjual',
              style: TextStyle(fontSize: 15)),
    ));
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
                              this.model!.model!.seller_last_seen == null
                                  ? Container()
                                  : Text(
                                      'last seen ' +
                                          timeago.format(this
                                              .model!
                                              .model!
                                              .seller_last_seen),
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

                      //owner_owner_point
                    ]),
              ),
            ),
          ],
        ),
        this.model!.model!.seller_date_registered == null
            ? Container()
            : Row(
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
                ],
              ),

        /*
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.date_range_outlined, size: 50, color: CurrentTheme.PrimaryLightColor),
                Text(DateFormat('dd/MM/yyyy').format(this.model!.model!.seller_date_registered)),
                Text('Anggota sejak'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CircularPercentIndicator(

                  progressColor: this.model!.model!.seller_arbitration_rate / 100 > 0.5 ? Colors.blue: this.model!.model!.seller_arbitration_rate / 100 > 0.25? Colors.yellow : Colors.blue,
                  percent: this.model!.model!.seller_arbitration_rate < 0 ? 0.0 : this.model!.model!.seller_arbitration_rate / 100 ,
                  animation: true,
                  radius: 50.0,
                  lineWidth: 6.0,
                  circularStrokeCap: CircularStrokeCap.round,

                ),
                Text(this.model!.model!.seller_arbitration_rate < 0? '-' :  '${this.model!.model!.seller_arbitration_rate.toStringAsFixed(2)}%'),
                Text('Arbitrase'),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CircularPercentIndicator(

                  progressColor: this.model!.model!.seller_completion_rate / 100 > 0.5 ? Colors.blue: this.model!.model!.seller_completion_rate / 100 > 0.25? Colors.yellow : Colors.blue,
                  percent: this.model!.model!.seller_completion_rate < 0 ? 0.0 : this.model!.model!.seller_completion_rate / 100 ,
                  animation: true,
                  radius: 50.0,
                  lineWidth: 6.0,
                  circularStrokeCap: CircularStrokeCap.round,

                ),
                Text( this.model!.model!.seller_completion_rate < 0? '-' : '${this.model!.model!.seller_completion_rate.toStringAsFixed(2)}%'),
                Text('Penyelesaian'),

              ],
            ),
          ],
        ),

         */
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

//@override
  Widget view1(BuildContext context, ScrollController controller, bool? account,
      String? userid, ChatBloc? cb, String? idHash) {
    viewChildren.clear();

    viewChildren.add(viewBanner(context, idHash, cb));
    viewChildren.add(viewHeader1(context));
    viewChildren.add(viewRating1());
    viewChildren.add(viewSales());
    viewChildren.add(viewDesc(context));

    viewChildren.add(Padding(
        padding: EdgeInsets.only(left: 10.0, top: 0.0),
        child: viewTags1(context, cb)));
    viewChildren.add(viewButton(context, account, idHash, cb));
    viewChildren.add(viewTrialVersion(context));
    viewChildren.add(viewScreenshots(context));
    viewChildren.add(viewSeller(context));

    viewChildren.add(viewReview(context));
    viewChildren.add(viewComment(context, account, userid));

    /*

  viewChildren.add(viewHeader(context));
  viewChildren.add(viewInfo(context));
  viewChildren.add(viewTrialVersion(context));
 // viewChildren.add(viewButton(context, account));
  viewChildren.add(viewScreenshots(context));
  viewChildren.add(viewDesc(context));
  viewChildren.add( Padding(
      padding: EdgeInsets.only(left: 10.0, top: 0.0),
      child: viewTags1(context, cb))
  );

  viewChildren.add(viewReview(context));
 // viewChildren.add(viewButton1(context, account,  idHash, cb));
  viewChildren.add(viewComment(context, account, userid));
  viewChildren.add(viewOwnerInfo(context));

   */

    //product_reviews
    //product-comments

    return (SingleChildScrollView(
        controller: controller!,
        physics: const AlwaysScrollableScrollPhysics(),
        reverse: false,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: viewChildren)));
  }
}

class ShowItemScreenshots extends StatelessWidget {
  final String? image;
  ShowItemScreenshots({this.image});
  final _appbar = AppBar(
    backgroundColor: CurrentTheme.MainAccentColor,
    elevation: 0.0,
    title: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
          this.image!,
        ),
        // Contained = the smallest possible size to fit one dimension of the screen
        minScale: PhotoViewComputedScale.contained * 0.8,
        // Covered = the smallest possible size to fit the whole screen
        maxScale: PhotoViewComputedScale.covered * 2.7,
        enableRotation: true,
        // Set the background color to the "classic white"
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context)!.canvasColor,
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

class ScreenshotsItem extends StatelessWidget {
  final ItemScreenshots? model;
  final ScreenshotsListingTools? info;
  ScreenshotsItem({this.model, this.info});

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
                // return BidItemInfo(info : this.info!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ShowItemScreenshots(image: this.model?.image_url)),
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

class DescProductInfo extends StatelessWidget {
  final ViewModelBrowseProductsRev? info;
  final String? title;
  ScrollController? controller;
  DescProductInfo({this.info, this.title});
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
                          if (url!.contains('projects.co.id')) {
                            if (url!.contains(new RegExp(r'[0-9]'))) {
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
                              builder: (context) =>
                                  ShowItemScreenshots(image: '$src')),
                        ),
                      )),
                ])));
  }
}
///////////////////////////////////////////////////

class BrowseProductsListingModel extends BrowseProductsListingBase {
  Map<String, dynamic> json;
  BrowseProductsListingModel(Map<String, dynamic> this.json) : super(json);

  @override
  Widget viewItemIndex(
      ItemBrowseProductsModel item, String? search, int? index, bool? account) {
    ShapeBorder? shape;
    double? height = 302;
    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item.item.toJson()))!.contains(search!)),
        child: ItemBrowseProductsCard1(
            destination: item,
            search: search,
            shape: shape,
            height: height,
            index: index));
  }

  @override
  Widget viewItem(ItemBrowseProductsModel item, String? search, bool? account) {
    ShapeBorder? shape;
    // double? height = 302;
    double? height = 220;

    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item.item.toJson()))!.contains(search!)),
        child: ItemBrowseProductsCard3(
            destination: item,
            search: search,
            shape: shape,
            height: height,
            account: account,
            idHash: '')
        //  child:  ItemBrowseProductsCard2(destination :item, search : search, shape : shape, height : height)
        );
  }

  @override
  Widget viewItemId1(ItemBrowseProductsModel item, String? search, int? index,
      bool? account, String? id, ChatBloc? cb) {
    ShapeBorder? shape;
    // double? height = 302;
    double? height = 220;

    return Visibility(
        visible: (search == '' ||
            allModelWords(jsonEncode(item.item.toJson()))!.contains(search!)),
        child: ItemBrowseProductsCard3(
            destination: item,
            search: search,
            index: index,
            shape: shape,
            height: height,
            account: account,
            idHash: id,
            cb: cb)
        //  child:  ItemBrowseProductsCard2(destination :item, search : search, shape : shape, height : height)
        );
  }

  /* @override
  Widget viewItem (ItemBrowseProductsModel item,String search) {
    ShapeBorder shape;
     double? height = 302;



    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson()))!.contains(search!)),
        child:  ItemBrowseProductsCard2(destination :item, search : search, shape : shape, height : height)
      //  child:  ItemBrowseProductsCard2(destination :item, search : search, shape : shape, height : height)
    );
  }
  */

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
                  SearchBrowseProductsListing(id: '', title: '')),
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
          ListButtonBrowseProductsWidget(tools.buttons[i], context, account));
    }

    return (buttonChildren);
  }
}

class SearchBrowseProductsListing extends StatefulWidget {
  static const String? PATH = '/public/browse_products/listing/:id';
  final String? id;
  final String? title;
  bool? account;
  ChatBloc? cb;
  SearchBrowseProductsListing(
      {Key? key, this.id, this.title, this.account, this.cb})
      : super(key: key);
  @override
  SearchBrowseProductsListingState createState() =>
      SearchBrowseProductsListingState();
}

class SearchBrowseProductsListingState
    extends State<SearchBrowseProductsListing> with RestorationMixin {
  String? title = 'Browse Products';
  bool? _dialVisible = true;
  bool? search = false;
  String? getPath =
      Env.value!.baseUrl! + '/public/browse_products/listing?page=%d';
  ScrollController? scrollController;
  BrowseProductsController? browse_products;
  TextEditingController searchBoxController = TextEditingController();
  AccountController? accountController;
  final scrollThreshold = 200.0;
  bool? selected = false;
  bool isopen = false;
  String? searchText = '';
  double? initscroll = 0.0;
  String? userid;
  bool? account = true;
  SearchBrowseProductsListingState() {
    // scrollController!.addListener(_onScroll);
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'BrowseProductsSc';

  @override
  void restoreState(RestorationBucket? oldBucket, bool? initialRestore) {
    registerForRestoration(cs, 'BrowseProductsSc');
  }

  @override
  Widget build(BuildContext context) {
    search = true;
    if (widget.id == '') {
      getPath = Env.value!.baseUrl! +
          '/public/browse_products/listing?page=%d&' +
          'search=' +
          searchText!;
    } else {
      getPath = Env.value!.baseUrl! +
          '/public/browse_products/listing/' +
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

    accountController = new AccountController(
        AppProvider.getApplication(context), AppAction.view);
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

    browse_products = BrowseProductsController(
        AppProvider.getApplication(context),
        getPath,
        AppAction.listing,
        '',
        '',
        '',
        search);
    browse_products!.listing!.add(BrowseProductsList());
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
              leading: new IconButton(
                  icon: new Icon(
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
                        hintText: 'Search Products',
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
          style:
              new TextStyle(fontSize: 14.0, height: 0.2, color: Colors.black),
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
    return BlocBuilder<BrowseProductsListing, BrowseProductsState>(
      bloc: browse_products!.listing,
      builder: (BuildContext context, BrowseProductsState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseProductsListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return new Center(
              child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
          ));
        }
        if (state is BrowseProductsListingError) {
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is BrowseProductsListingLoaded) {
          if (state.browse_products!.items.items.isEmpty) {
            if (state.browse_products!.tools.buttons.length == 0) {
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
                  floatingActionButton: state.browse_products!
                      .Buttons(context, _dialVisible, account, open)
                  //floatingActionButton: isLoading? null :  state.browse_products!.Buttons(context, _dialVisible, controller!,browse_products,  this, Env.value!.baseUrl!, '', title!)
                  );
            }
          }
          if (state.browse_products!.tools.buttons.length == 0) {
            return Scaffold(
                body: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int? index) {
                  return index! >= state.browse_products!.items.items.length
                      ? state.browse_products!.tools.paging.total_pages ==
                              state.browse_products!.tools.paging.current_page
                          ? Container(
                              height: 0.0,
                              width: 0.0,
                            )
                          : SearchBrowseProductsBottomLoader()
                      : state.browse_products!.viewItemId1(
                          state.browse_products!.items.items[index],
                          searchText,
                          index,
                          account,
                          userid,
                          widget.cb);
                },
                itemCount: state.hasReachedMax!
                    ? state.browse_products!.items.items.length
                    : state.browse_products!.items.items.length + 1,
                controller: scrollController,
              ),
              onRefresh: _onRefresh,
            ));
          }
          return Scaffold(
              body: RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int? index) {
                    return index! >= state.browse_products!.items.items.length
                        ? state.browse_products!.tools.paging.total_pages ==
                                state.browse_products!.tools.paging.current_page
                            ? Container(
                                height: 0.0,
                                width: 0.0,
                              )
                            : SearchBrowseProductsBottomLoader()
                        : state.browse_products!.viewItemId1(
                            state.browse_products!.items.items[index],
                            searchText,
                            index,
                            account,
                            userid,
                            widget.cb);
                  },
                  itemCount: state.hasReachedMax!
                      ? state.browse_products!.items.items.length
                      : state.browse_products!.items.items.length + 1,
                  controller: scrollController,
                ),
                onRefresh: _onRefresh,
              ),
              floatingActionButton:
                  state.browse_products!.Buttons(context, _dialVisible, account, open)
              //floatingActionButton: isLoading? null :  state.browse_products!.Buttons(context, _dialVisible, controller!,browse_products,  this, Env.value!.baseUrl!, '', title!, account)

              );
        }

        return new Center(
            child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
        ));
      },
    );
  }

  // @override
  /*
  Widget buildListingBar(){
    return BlocBuilder(
      cubit:  browse_products!.listing,
      builder: (BuildContext context, BrowseProductsState state) {
        final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseProductsListingUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return

            new Center(
                child:CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Colors.green),
                ));
        }
        if (state is BrowseProductsListingError) {
          return Center(
            child: Text('failed to ' + widget.title!),
          );
        }
        if (state is BrowseProductsListingLoaded) {
          if (state.browse_products!.items.items.isEmpty) {
            return Center(
              child: Text('no ' + widget.title!),
            );
          }
          return
            Scaffold(
              //  backgroundColor: CurrentTheme.HomeColor,
                body: RefreshIndicator(
                  child:

                  /*  new ListView.builder(

                        itemBuilder: (BuildContext context, int?index) {
                          return index! >= state.browse_products!.items.items.length
                              ? ProjectsBottomLoader()
                              :state.browse_products!.viewItem (state.browse_products!.items.items[index] , searchText );
                        },
                        itemCount: state.hasReachedMax!
                            ? state.browse_products!.items.items.length
                            : state.browse_products!.items.items.length + 1,
                        controller: scrollController,
                      ), */

                  GridView.builder(
                    // shrinkWrap: true,

                    itemCount: state.hasReachedMax!
                        ? state.browse_products!.items.items.length
                        : state.browse_products!.items.items.length + 1,
                    controller: scrollController,
                    // physics: BouncingScrollPhysics(),
                    // padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      //  mainAxisSpacing: 1,
                      // crossAxisSpacing: 1,
                      childAspectRatio: mediaQueryData.size.width/(mediaQueryData.size.height/1.9),
                    ),
                    itemBuilder: (context, index) {
                      return index! >= state.browse_products!.items.items.length
                          ? SearchBrowseProductsBottomLoader()
                          :state.browse_products!.viewItem (state.browse_products!.items.items[index] , searchText, widget.account );
                    },


                  ),
                  onRefresh: _onRefresh,
                ),
                floatingActionButton: state.browse_products!.Buttons(context, _dialVisible, widget.account)
            );
        }
        return new

        Center(
            child:CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                  Colors.green),
            ));
      },
    );
  }

   */

  @override
  void dispose() {
    browse_products!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
    browse_products!.listing!.add(BrowseProductsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
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
      browse_products!.listing!.add(BrowseProductsList());
    }
  }
}

class SearchBrowseProductsBottomLoader extends StatelessWidget {
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

//class ItemBrowseProducts extends class ItemBrowseProductsBase{
//
//}
////////////////////////////

class ItemBrowseProductsCard1 extends StatelessWidget {
  const ItemBrowseProductsCard1(
      {Key? key,
      @required this.destination,
      this.search,
      this.shape,
      this.height,
      this.index})
      : assert(destination != null),
        super(key: key);
  final double? height;
  final ItemBrowseProductsModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;

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
                height: index == 0 ? 460 : height,
                child: index == 0
                    ? ItemBrowseProductsContent2(destination: destination)
                    : ItemBrowseProductsContent1(destination: destination),
              ),

              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                alignment: Alignment.center,
                height: 10.0,
                decoration: new BoxDecoration(
                  //color: Colors.lightBlue[100],
                  color: CurrentTheme.ListColor,
                ),
              )
            ],
          )),
    );
  }
}

class ItemBrowseProductsCard2 extends StatelessWidget {
  const ItemBrowseProductsCard2(
      {Key? key,
      @required this.destination,
      this.search,
      this.shape,
      this.height})
      : assert(destination != null),
        super(key: key);
  final double? height;
  final ItemBrowseProductsModel? destination;
  final String? search;
  final ShapeBorder? shape;

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
            child: ItemBrowseProductsContent1(destination: destination),
          ),
          // ),
          Container(
            // padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            alignment: Alignment.center,
            height: 10.0,
            decoration: new BoxDecoration(
              //color: Colors.lightBlue[100],
              color: CurrentTheme.ListColor,
            ),
          )
        ],
      ),
    );
  }
}

class ItemBrowseProductsCard3 extends StatefulWidget {
  ItemBrowseProductsCard3(
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
  final double? height;
  final ItemBrowseProductsModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final bool? account;
  final String? idHash;
  ChatBloc? cb;
  final int? index;

  @override
  _ItemBrowseProductsCard3State createState() =>
      _ItemBrowseProductsCard3State();
}

class _ItemBrowseProductsCard3State extends State<ItemBrowseProductsCard3> {
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
    return SafeArea(
        top: false,
        bottom: false,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
            child: Column(
              children: [
                Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: _isBannerAdReady
                      ? ItemBrowseProductsContent3(
                          index: widget.index,
                          isBanner: _isBannerAdReady,
                          bannerAd: _bannerAd,
                          destination: widget.destination,
                          account: widget.account,
                          idHash: widget.idHash,
                          cb: widget.cb)
                      : ItemBrowseProductsContent3(
                          index: widget.index,
                          isBanner: _isBannerAdReady,
                          bannerAd: null,
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
    /*
    return Card(
      //padding:EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      elevation: 5.0,
      child: Center(
        child: ItemBrowseProductsContent3(destination: destination, account : account, idHash: idHash),
      ),
      margin: EdgeInsets.all(5.0),
    );

     */
  }
}

class ItemBrowseProductsContent1 extends StatelessWidget {
  const ItemBrowseProductsContent1({Key? key, @required this.destination})
      : assert(destination != null),
        super(key: key);
  final ItemBrowseProductsModel? destination;
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
                  destination!.item.logo_url,
                  fit: BoxFit.cover,
                )),
            Positioned.fill(
                child: new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      splashColor: Colors.lightGreenAccent,
                      onTap: () {
                        AppProvider.getRouter(context)!.navigateTo(context,
                            urlToRoute(destination!.item.buttons[2].url));
                      },
                    ))),
            Positioned.fill(
                bottom: 25,
                left: 0.80 * mediaQueryData.size.width -
                    destination!.item.price_str.length.toDouble() * 1.3,
                top: 0.82 * 230.0,
                right: 30.0 -
                    destination!.item!.price_str!.length.toDouble() * 0.8,
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                child: Container(
                  // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  alignment: Alignment.center,
                  height: 10.0,
                  decoration: new BoxDecoration(
                    //color: Colors.lightBlue[100],
                    color: CurrentTheme.NormalTextColor,
                  ),
                  child: Text(
                    destination!.item.price_str,
                    style: TextStyle(color: CurrentTheme.BackgroundColor),
                  ),
                )),
          ],
        ),
      ),
      SizedBox(
        height: 72.0,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          // three line description

          Container(
            padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                destination!.item.logo_url,
                fit: BoxFit.cover,
                height: 55.0,
                width: 55.0,
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
                        AppProvider.getRouter(context)!.navigateTo(context,
                            urlToRoute(destination!.item.buttons[2].url));
                      },
                      child: Html(
                          data: readText(destination!.item.title, 62),
                          style: {
                            "html": Style(
                                fontSize: FontSize.medium,
                                fontWeight: FontWeight.w500),
                          }),
                    ),
                    Row(children: <Widget>[
                      // three line description
                      Text(
                        destination!.item.seller_str,
                        style: descriptionStyle!
                            .copyWith(color: Colors.black87, fontSize: 13),
                      ),
                      Text(
                        ' . ' +
                            ratingMean(destination!.item.rating_num) +
                            ' . ',
                        style: descriptionStyle!
                            .copyWith(color: Colors.black54, fontSize: 13),
                      ),
                      Text(
                        destination!.item.seller_product_sold.toString() +
                            ' sales',
                        style: descriptionStyle!
                            .copyWith(color: Colors.black54, fontSize: 13),
                      )
                    ])
                  ]))),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: PopupMenuButton<int>(
              onSelected: (int value) {
                if (value == 1) {
                  AppProvider.getRouter(context)!.navigateTo(
                      context, urlToRoute(destination!.item.buttons[0].url));
                }
                if (value == 2) {
                  AppProvider.getRouter(context)!.navigateTo(
                      context, urlToRoute(destination!.item.buttons[1].url));
                }
                if (value == 3) {
                  AppProvider.getRouter(context)!.navigateTo(
                      context, urlToRoute(destination!.item.buttons[2].url));
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
        ]),
      )
      // Description and share/explore buttons.
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class ItemBrowseProductsContent2 extends StatelessWidget {
  const ItemBrowseProductsContent2({Key? key, @required this.destination})
      : assert(destination != null),
        super(key: key);
  final ItemBrowseProductsModel? destination;
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

//real content
class ItemBrowseProductsContent3 extends StatelessWidget {
  ItemBrowseProductsContent3(
      {Key? key,
      this.index,
      @required this.destination,
      this.bannerAd,
      this.isBanner,
      this.account,
      this.idHash,
      this.cb})
      : assert(destination != null),
        super(key: key);
  final ItemBrowseProductsModel? destination;
  final bool? account;
  final String? idHash;
  final BannerAd? bannerAd;
  final bool? isBanner;
  final int? index;
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
    // ChatBloc _chatBloc;
    final ThemeData theme = Theme.of(context);
    APIRepository? apiRepProvider =
        AppProvider.getApplication(context).projectsAPIRepository;
    final TextStyle titleStyle = theme.textTheme.headline1!
        .copyWith(color: CurrentTheme.NormalTextColor);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final mediaQueryData = MediaQuery.of(context);
    int? owner_id1 = destination!.item.seller_id;
    var ownerID = encode(owner_id1!);

    final List<Widget> children = <Widget>[
      //viewHeader(context, account, _chatBloc),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context, urlToRoute(destination!.item.seller_url));
              },
              child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 12),
                  child: new Container(
                    width: 60,
                    height: 63,
                    decoration: new ShapeDecoration(
                      shadows: [
                        BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0)),
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        side: BorderSide(width: 3, color: Colors.white),
                      ),
                      image: new DecorationImage(
                        image: new NetworkImage(destination!.item.logo_url),
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                  /*

                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        destination!.item.logo_url,
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
                    context, urlToRoute(destination!.item.seller_url));
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
                                '${destination!.item.seller_str} ',
                                style: descriptionStyle!.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w800),
                              ),
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0, top: 2.0),
                                  child: RatingBarIndicator(
                                    rating: destination!
                                                .item.seller_seller_rating
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
                                  '(${destination!.item.seller_product_sold.toString()})',
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
                                                          await apiRepProvider!.loadAndSaveBlacklist('black', destination!.item.product_id + 'BrowseProducts');
                                                          Navigator.pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    PublicBrowseProductsListing(
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
                                  await apiRepProvider!.loadAndSaveBlacklist('black', destination!.item.product_id + 'BrowseProducts');
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PublicBrowseProductsListing(
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
                  //  var owner_id_str = destination!.item.buttons[0].url.replaceAll(new RegExp(r'[^0-9]'),'');

                  // int?owner_id = int.parse(owner_id_str);
                  // _chatBloc = new ChatBloc();

                  // if(widget.id == '')

                  // _chatBloc.wsSetHandlers();
                  //_chatBloc.lgn(widget.id);
                  //  _chatBloc.lg(idHash!);
                  //$idHash/${encode(this.model!.model!.owner_id)}
                  String? thread = '';
                  if (decode(idHash!) > destination!.item.seller_id) {
                    thread = '${encode(destination!.item.seller_id)}/$idHash';
                  } else {
                    thread = '$idHash/${encode(destination!.item.seller_id)}';
                  }
                  if (cb != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            user: {
                              "thread": "$thread",
                              "username": "${destination!.item.seller_str}",
                              "userid":
                                  "${encode(destination!.item.seller_id)}",
                              "display": "${destination!.item.seller_str}",
                              "avatar": "${destination!.item.logo_url}",
                              "lastmessage":
                                  "<b>Konteks Percakapan: ${destination!.item.title.replaceAll('&amp;', '&')}</b>",
                              "lastseen": null,
                              "lasttime": null
                            },
                            userID: idHash,
                            chatBloc: cb,
                            trans: true,
                            ctx: context,
                          ),
                        )).then((value) async {
                      //  _chatBloc.dispose();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('chatlink', true);
                    });
                  } else {
                    var cb1 = AppProvider.getApplication(context)!.chat;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(
                            user: {
                              "thread": "$thread",
                              "username": "${destination!.item.seller_str}",
                              "userid":
                                  "${encode(destination!.item.seller_id)}",
                              "display": "${destination!.item.seller_str}",
                              "avatar": "${destination!.item.logo_url}",
                              "lastmessage":
                                  "<b>Konteks Percakapan: ${destination!.item.title.replaceAll('&amp;', '&')}</b>",
                              "lastseen": null,
                              "lasttime": null
                            },
                            userID: idHash,
                            chatBloc: cb1,
                            trans: true,
                            ctx: context,
                          ),
                        )).then((value) async {
                      //  _chatBloc.dispose();
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
                      context, urlToRoute(destination!.item.buttons[1].url));
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
                    Text('Add',
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
                   AppProvider.getRouter(context)!.navigateTo(
                       context, urlToRoute(destination!.item.buttons[1].url));
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
                                           await apiRepProvider!.loadAndSaveBlacklist('black', destination!.item.product_id + 'BrowseProducts');
                                           Navigator.pushAndRemoveUntil(
                                             context,
                                             MaterialPageRoute(
                                                 builder: (context) =>
                                                     PublicBrowseProductsListing(
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
             ]
        ),


      Container(
        // height:  120.0,
        padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 8.0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PublicBrowseProductsView(
                        id:
                            '${urlToRoute(destination!.item.buttons[2].url).split('/')[4]}',
                        title:
                            '${urlToRoute(destination!.item.buttons[2].url).split('/')[5]}',
                        cb: cb)),
              );
              /*
              AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(destination!.item.buttons[2].url ));

               */
            },
            child: Ink(
              // child: Html(data: destination!.item.short_description ,useRichText: true, defaultTextStyle : descriptionStyle!.copyWith(color: Colors.black87,fontSize: 12 ), backgroundColor: CurrentTheme.BackgroundColor, )
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
                  if (url!.contains('projects.co.id')) {
                    if (url!.contains(new RegExp(r'[0-9]'))) {
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
                Html(data: readText(destination!.item.short_description!.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),400) ,
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
        child: destination!.item.tags_str.length >= 2
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
                            AppProvider.getRouter(context)!.navigateTo(context,
                                urlToRoute(destination!.item.tags_url[0]));
                          },
                          child: Badge(
                            toAnimate: false,
                            shape: BadgeShape.square,
                            badgeColor: Colors.black12,
                            borderRadius: BorderRadius.circular(8),
                            badgeContent: Text(
                                _capitalize(destination!.item.tags_str[0])!,
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
                            AppProvider.getRouter(context)!.navigateTo(context,
                                urlToRoute(destination!.item.tags_url[1]));
                          },
                          child: Badge(
                            toAnimate: false,
                            shape: BadgeShape.square,
                            badgeColor: Colors.black12,
                            borderRadius: BorderRadius.circular(8),
                            badgeContent: Text(
                                _capitalize(destination!.item.tags_str[1])!,
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
            : destination!.item.tags_str.length == 1
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
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(destination!.item.tags_url[0]));
                              },
                              child: Badge(
                                toAnimate: false,
                                shape: BadgeShape.square,
                                badgeColor: Colors.black12,
                                borderRadius: BorderRadius.circular(8),
                                badgeContent: Text(
                                    _capitalize(destination!.item.tags_str[0])!,
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
                                destination!.item.price_str,
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
                                    destination!.item.rating.toDouble() / 2 -
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
                                '(${destination!.item.sales_count.toString()})',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300)),
                          ])
                        ]),
                  ],
                ),
              ),
            ]),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );

    /*
    return GridTile(
      footer: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
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
