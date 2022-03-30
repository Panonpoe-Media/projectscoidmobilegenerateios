
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';

//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import '../image_fields.dart';
import '../file_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import 'payment_history_list_item.dart';
import 'payment_history_list_item_base.dart';
import '../photo.dart';
import '../paging.dart';
import 'payment_history_list_base.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';

/** AUTOGENERATE OFF **/

class PaymentHistoryListingModel extends PaymentHistoryListingBase{
  Map<String, dynamic> json;
  PaymentHistoryListingModel(Map<String, dynamic> this.json):super(json);

  @override
  //Widget viewItem (ItemPaymentHistoryModel item,String search, bool account, String id) {
  Widget viewItem1 (ItemPaymentHistoryModel item,ItemPaymentHistoryModel item1, String search, BuildContext context,bool account, String id , bool isMax, int max, int index) {
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    ShapeBorder? shape;
    double height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemPaymentHistoryCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemPaymentHistoryCard1(destination :item, search : search, shape : shape, height : height, account : account, isDark: darkMode,)
    );
  }
}

class ItemPaymentHistoryCard1 extends StatelessWidget {
  const ItemPaymentHistoryCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account, this.isDark})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemPaymentHistoryModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;
  final bool? isDark;

//ItemPaymentHistoryContent2(destination: destination,  account : account) ,

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation : 3.0,
        borderOnForeground: false,
        color: isDark!? Colors.black : Colors.white,
        margin : EdgeInsets.all(6.0),
        child:
        ItemPaymentHistoryContent1(destination: destination, account: account, isDark: isDark,),
      ),
    );
  }
}

class ItemPaymentHistoryContent1 extends StatelessWidget {
  const ItemPaymentHistoryContent1({ Key? key, @required this.destination, this.account , this.isDark})
      : assert(destination != null),
        super(key: key);

  final ItemPaymentHistoryModel? destination;
  final bool? account ;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor, fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;

    final List<Widget> children = <Widget>[

      CategoryWidget(
        title: 'Payment Code',
        isDark: isDark,
        subtitle : '${destination!.item.payment_id}',
        children: <Widget>[


          ItemListWidget(
            // icon: Icons.calendar_today,
              tooltip: 'Send message',
              onPressed: (){
              },
              lines:
              'Payment Date',

              wgt: Text(DateFormat('dd/MM/yyyy hh:mm:ss').format(destination!.item.transfer_date), style: TextStyle(color:  isDark!? Colors.white : Colors.black,))
          ),
          ItemListString(
            // icon: Icons.attach_money,
            tooltip: 'Send message',
            isDark: isDark,
            onPressed: () {
            },
            lines: <String>[
              'Bank',
              '${destination!.item.bank_str}',
            ],
          ),


          ItemListString(
            // icon: Icons.attach_money,
            tooltip: 'Send message',
            isDark: isDark,
            onPressed: () {
            },
            lines: <String>[
              'Amount',
              '${destination!.item.amount_str}',
            ],
          ),

          ItemListString(
            // icon: Icons.attach_money,
            isDark: isDark,
            tooltip: 'Send message',
            onPressed: () {
            },
            lines: <String>[
              'Direction',
              '${destination!.item.direction_str}',
            ],
          ),
          ItemListString(
            // icon: Icons.attach_money,
            isDark: isDark,
            tooltip: 'Send message',
            onPressed: () {
            },
            lines: <String>[
              'Fee',
              '${destination!.item.transfer_fee_str}',
            ],
          ),
          ItemListWidget(
            // icon: Icons.card_giftcard,
            isDark: isDark,
            tooltip: 'Send message',
            onPressed: (){
            },
            lines:
            'Status',

            wgt: HtmlWidget(
              destination!.item.status_str, //bodyPadding: EdgeInsets.all(0.0),
                textStyle: TextStyle(color:  isDark!? Colors.white : Colors.black,)
            ),
          ),
        ],
      ),
    ];



    // }
    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }



}










  

