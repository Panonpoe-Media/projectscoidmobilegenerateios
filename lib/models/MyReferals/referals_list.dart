import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'referals_list_item.dart';
import 'referals_list_base.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';

/** AUTOGENERATE OFF **/

class ReferalsListingModel extends ReferalsListingBase{
  Map<String, dynamic> json;
  ReferalsListingModel(Map<String, dynamic> this.json):super(json);
  @override
 // Widget viewItem (ItemReferalsModel item,String search, bool account, String id) {
  Widget viewItem1 (ItemReferalsModel item,ItemReferalsModel item1, String? search, BuildContext context,bool? account, String? id , bool? isMax, int? max, int? index) {
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    ShapeBorder? shape;
    double height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemReferalsCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemReferalsCard1(destination :item, search : search, shape : shape, height : height, account : account, isDark:  darkMode,)
    );
  }
}


class ItemReferalsCard1 extends StatelessWidget {
  const ItemReferalsCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account, this.isDark})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemReferalsModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;
  final bool? isDark;

//ItemReferalsContent2(destination: destination,  account : account) ,

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation : 3.0,
        borderOnForeground: false,
        color: isDark!? Colors.black : Colors.white,
        margin : EdgeInsets.all(6.0),
        child:
        ItemReferalsContent1(destination: destination, account: account, isDark:  isDark,),
      ),
    );
  }
}

class ItemReferalsContent1 extends StatelessWidget {
  const ItemReferalsContent1({ Key? key, @required this.destination, this.account, this.isDark })
      : assert(destination != null),
        super(key: key);

  final ItemReferalsModel? destination;
  final bool? account ;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor, fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;

    final List<Widget> children = <Widget>[

      CategoryWidget(
        title: 'Referal ID',
        subtitle : '${destination!.item.user_id}',
        isDark: isDark,
        children: <Widget>[

          ItemListWidget(
              icon: Icons.arrow_forward_ios,
              tooltip: 'Send message',
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PublicBrowseUsersView(id : destination!.item.user_id, title: 'zzz', )),
                );
              },
              lines:
              'Username',

              wgt: Text(destination!.item.user_name, style: TextStyle(color:  isDark!? Colors.white : Colors.black,))

          ),

          ItemListWidget(
            // icon: Icons.calendar_today,
              tooltip: 'Send message',
              onPressed: (){
              },
              lines:
              'Date Registered',

              wgt: Text(DateFormat('dd/MM/yyyy hh:mm:ss').format(destination!.item.date_registered), style: TextStyle(color:  isDark!? Colors.white : Colors.black,))
          ),
          ItemListWidget(
            // icon: Icons.calendar_today,
              tooltip: 'Send message',
              onPressed: (){
              },
              lines:
              'Referer expires',

              wgt: Text(DateFormat('dd/MM/yyyy hh:mm:ss').format(destination!.item.referer_expires), style: TextStyle(color:  isDark!? Colors.white : Colors.black,))
          ),
          ItemListWidget(
            // icon: Icons.calendar_today,
              tooltip: 'Send message',
              isdivided: false,
              onPressed: (){
              },
              lines:
              'Last seen',

              wgt: Text(DateFormat('dd/MM/yyyy hh:mm:ss').format(destination!.item.last_seen), style: TextStyle(color:  isDark!? Colors.white : Colors.black,))
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












  

