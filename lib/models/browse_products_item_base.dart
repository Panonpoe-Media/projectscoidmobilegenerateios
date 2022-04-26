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
part 'browse_products_item_base.g.dart';

/** AUTOGENERATE OFF **/

class ItemBrowseProductsBase {
  var item;
  Map<String, dynamic> json;
  ItemBrowseProductsBase(this.json) {
    item = ItemBrowseProducts.fromJson(json);
  }

  List<Widget?>? listButtonAction(BuildContext context) {
    final List<Widget> buttonChildren = <Widget>[];
    for (var i = 0; i < item.buttons.length; i++) {
      buttonChildren.add(itemButton(i, context));
    }
  }

  Widget itemButton(int? index, BuildContext context) {
    return (FlatButton(
      child:
          Text(item.buttons[index].text, semanticsLabel: 'Share ${item.ttl}'),
      textColor: CurrentTheme.MainAccentColor,
      splashColor: CurrentTheme.ShadeColor,
      color: CurrentTheme.SecondaryAccentColor,
      onPressed: () {
        AppProvider.getRouter(context)!
            .navigateTo(context, urlToRoute(item.buttons[index].url));
      },
    ));
  }

  Widget viewTitle(BuildContext context) {
    return (TitleView(
      value: item.title,
      caption: 'Title',
    ));
  }

  Widget viewRating(BuildContext context) {
    return (RatingView(value: item.rating, caption: 'Rating'));
  }

  Widget viewRatingNum(BuildContext context) {
    return (DoubleView(
      value: item.rating_num,
      caption: 'Rating Num',
    ));
  }

  Widget viewSalesCount(BuildContext context) {
    return (NumberView(
      value: item.sales_count,
      caption: 'Sales Count',
    ));
  }

  Widget viewPrice(BuildContext context) {
    return (MoneyView(
      value: item.price,
      caption: 'Price',
    ));
  }

  Widget viewSeller(BuildContext context) {
    return (ModelView(
      value: item.seller_id,
      caption: 'Seller',
      idenum: item.seller_list,
      nameenum: item.seller_str,
    ));
  }

  Widget viewSellerRating(BuildContext context) {
    return (RatingView(
        value: item.seller_seller_rating, caption: 'Seller Rating'));
  }

  Widget viewSellerRanking(BuildContext context) {
    return (NumberView(
      value: item.seller_seller_ranking,
      caption: 'Seller Ranking',
    ));
  }

  Widget viewProductSold(BuildContext context) {
    return (NumberView(
      value: item.seller_product_sold,
      caption: 'Product Sold',
    ));
  }

  Widget viewShortDescription(BuildContext context) {
    return (DisplayNameView(
      value: item.short_description,
      caption: 'Short Description',
    ));
  }

  Widget viewTrialVersion(BuildContext context) {
    if (item.trial_version == null) {
      return (StringView(
        value: '',
        caption: 'Trial Version',
      ));
    }
    if (item.trial_version_name != '') {
      return (FileViewRev(
        value: item.trial_version_name,
        value1: item.trial_version_url,
        caption: 'Trial Version',
      ));
    } else {
      return (StringView(
        value: '',
        caption: 'Trial Version',
      ));
    }
  }

  Widget viewTags(BuildContext context) {
    return (ChannelRouteTagsWidget(
      value: item.tags_id,
      caption: '',
      hint: ' ',
      required: true,
      idroutetags: item.tags_id,
      nameroutetags: item.tags_str,
      urlroutetags: item.tags_url,
      getValue: (String? val) {
        AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(val!));
      },
    ));
  }

  Widget viewLogo(BuildContext context) {
    return (ImageView(
      value: item.logo_url,
      caption: 'Logo',
    ));
  }
}

@JsonSerializable()
class ItemBrowseProducts {
  int? age;
  int? cnt;
  int? page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  List<ItemButton?>? buttons;
  String? product_id;
  String? title;
  int? rating;
  double? rating_num;
  String? rating_num_str;
  int? sales_count;
  String? sales_count_str;
  double? price;
  String? price_str;
  int? seller_id;
  String? seller_str;
  String? seller_url;
  List<int?>? seller_list;
  List<String?>? seller_list_str;
  int? seller_product_sold;
  int? seller_seller_rating;
  int? seller_seller_ranking;
  String? short_description;
  String? trial_version_name;
  String? trial_version_url;
  List<FileField?>? trial_version;
  List<int?>? tags_id;
  List<String?>? tags_str;
  List<String?>? tags_url;
  String? logo_url;
  Photo? logo;

  ItemBrowseProducts(
    this.buttons,
    this.product_id,
    this.title,
    this.rating,
    this.rating_num,
    this.rating_num_str,
    this.sales_count,
    this.sales_count_str,
    this.price,
    this.price_str,
    this.seller_id,
    this.seller_str,
    this.seller_url,
    this.seller_list,
    this.seller_list_str,
    this.seller_product_sold,
    this.seller_seller_rating,
    this.seller_seller_ranking,
    this.short_description,
    this.trial_version_name,
    this.trial_version_url,
    this.trial_version,
    this.tags_id,
    this.tags_str,
    this.tags_url,
    this.logo,
    this.logo_url,
  );

  factory ItemBrowseProducts.fromJson(Map<String, dynamic> json) =>
      _$ItemBrowseProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemBrowseProductsToJson(this);
}

////////////////////////////////////////////////
///

///
////////////////////////////////////////////////
