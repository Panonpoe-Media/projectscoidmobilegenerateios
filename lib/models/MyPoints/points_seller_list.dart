
import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'points_seller_list_item.dart';
import 'points_seller_list_base.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
/** AUTOGENERATE OFF **/

class PointsSellerListingModel extends PointsSellerListingBase{
  Map<String, dynamic> json;
  PointsSellerListingModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget viewItem1 (ItemPointsSellerModel item,ItemPointsSellerModel item1, String? search, BuildContext context,bool? account, String? id , bool? isMax, int? max, int? index) {
    ShapeBorder? shape;
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    double height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemPointsSellerCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemPointsSellerCard1(destination :item, search : search, shape : shape, height : height, account : account, isDark:  darkMode,)
    );
  }
}


class ItemPointsSellerCard1 extends StatelessWidget {
  const ItemPointsSellerCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account, this.isDark})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemPointsSellerModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;
  final bool? isDark;

//ItemPointsSellerContent2(destination: destination,  account : account) ,

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation : 3.0,
        borderOnForeground: false,
        margin : EdgeInsets.all(6.0),
        color: isDark!? Colors.black : Colors.white,
        child:
        ItemPointsSellerContent1(destination: destination, account: account, isDark:  isDark),
      ),
    );
  }
}

class ItemPointsSellerContent1 extends StatelessWidget {
  const ItemPointsSellerContent1({ Key? key, @required this.destination, this.account , this.isDark})
      : assert(destination != null),
        super(key: key);

  final ItemPointsSellerModel? destination;
  final bool? account ;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor, fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;

    final List<Widget> children = <Widget>[

      CategoryWidget(
        title: 'Point Code',
        isDark:  isDark,
        subtitle : '${destination!.item.point_id}',
        children: <Widget>[

          ItemListWidget(
            // icon: Icons.calendar_today,
              isDark:  isDark,
              tooltip: 'Send message',
              onPressed: (){
              },
              lines:
              'Title',

              wgt: HtmlWidget(destination!.item.title, textStyle: TextStyle(color:  isDark!? Colors.white : Colors.black,),
                //bodyPadding: EdgeInsets.all(0.0),
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
              )
          ),

          ItemListWidget(
            // icon: Icons.calendar_today,
              tooltip: 'Send message',
              onPressed: (){
              },
              lines:
              'Date',

              wgt: Text(DateFormat('dd/MM/yyyy hh:mm:ss').format(destination!.item.date), style: TextStyle(color:  isDark!? Colors.white : Colors.black,))
          ),

          ItemListString(
            // icon: Icons.attach_money,
            isDark:  isDark,
            tooltip: 'Send message',
            onPressed: () {
            },
            lines: <String>[
              'Amount',
              '${destination!.item.amount.toString()}',
            ],
          ),
          ItemListString(
            // icon: Icons.attach_money,
            isDark:  isDark,
            tooltip: 'Send message',
            isdivided: false,
            onPressed: () {
            },
            lines: <String>[
              'Balance',
              '${destination!.item.balance.toString()}',
            ],
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












  

