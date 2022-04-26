
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/app/Env.dart';
import 'dart:convert';
import 'image_fields.dart';
import 'file_fields.dart';
import 'meta.dart';
import 'item_button.dart';
import 'button.dart';
import 'credit.dart';
import 'payment.dart';
import 'selection.dart';
import 'my_sales_item.dart';
import 'my_sales_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:projectscoid/models/my_sales_base.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:projectscoid/core/components/utility/tool/popup_menu.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';

/** AUTOGENERATE OFF **/


class MySalesModel extends MySalesBase{
  Map<String, dynamic> json;
  MySalesModel(Map<String, dynamic> this.json):super(json); 	

  
}
 


class MySalesViewModel  extends MySalesViewBase{
  Map<String, dynamic> json;
  MySalesViewModel(Map<String, dynamic> this.json):super(json){model = MySalesViewSuperBase.fromJson(this.json);}
  
}


///////////////////////////////////////////////////


class MySalesListingModel extends MySalesListingBase{
  Map<String, dynamic> json;
  MySalesListingModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget viewItem (ItemMySalesModel item,String? search, bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemMySalesCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemMySalesCard1(destination :item, search : search, shape : shape, height : height, account : account)
    );
  }

}



class ItemMySalesCard1 extends StatelessWidget {
  const ItemMySalesCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMySalesModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;

//ItemMySalesContent2(destination: destination,  account : account) ,

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation : 3.0,
        borderOnForeground: false,
        margin : EdgeInsets.all(6.0),
        child:
        ItemMySalesContent2(destination: destination, account: account),
      ),
    );
  }
}

class ItemMySalesContent2 extends StatelessWidget {
  ItemMySalesContent2({ Key? key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemMySalesModel? destination;
  final bool? account ;
  bool darkMode = false;


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor, fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;

    final List<Widget> children = <Widget>[

      CategoryWidget(
        title: 'Buyer',
        isDark: darkMode,
        subtitle : '${destination!.item!.buyer_str}',
        children: <Widget>[



          ItemListWidget(
              icon: Icons.shop,
              tooltip: 'Send message',
              isDark: darkMode,
              onPressed: (){
              },
              lines:
              'Product',

              wgt: Text(destination!.item!.product_str)
          ),
          ItemListWidget(
            icon: Icons.check,
            tooltip: 'Send message',
            isDark: darkMode,
            onPressed: (){
            },
            lines:
            'Order',

            wgt: Text(destination!.item!.order_str),
          ),
          ItemListWidget(
            icon: Icons.event_note,
            tooltip: 'Send message',
            isDark: darkMode,
            onPressed: (){
            },
            lines:
            'Title',

            wgt:
                Container(
                width: 200,
                child:  HtmlWidget(
                  destination!.item!.title,
                ),
            ),

          ),

          ItemListWidget(
              icon: Icons.calendar_today,
              tooltip: 'Send message',
              isDark: darkMode,
              onPressed: (){
              },
              lines:
              'Payment Date',

              wgt: Text(DateFormat('dd/MM/yyyy hh:mm:ss').format(destination!.item!.date))
          ),

          ItemListString(
            icon: Icons.attach_money,
            tooltip: 'Send message',
            isDark: darkMode,
            onPressed: () {
            },
            lines: <String>[
              'Price',
              '${destination!.item!.price_str}',
            ],
          ),

          ItemListWidget(
            icon: Icons.event_note,
            tooltip: 'Send message',
            isDark: darkMode,
            onPressed: (){
            },
            lines:
            'Notes',

            wgt: destination!.item!.testimony == null? Container(width: 0.0, height: 0.0,): HtmlWidget(
              destination!.item!.testimony.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
            ),
          ),
          LinkViewWidget(
              icon: Icons.arrow_forward_ios,
              tooltip: 'Send message',
              onPressed: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(destination!.item!.buttons[0].url));
              } ,
              lines:  destination!.item!.buttons[0].text
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

//class ItemMySales extends class ItemMySalesBase{
//
//}
class ItemModel2 {
  String title;
  IconData icon;

  ItemModel2(this.title, this.icon);
}

class MySalesIndexModel extends MySalesIndexBase{
  Map<String, dynamic> json;
  MySalesIndexModel(Map<String, dynamic> this.json):super(json);

  @override
  List<Widget> _getTitleWidget() {
    final List<Widget> children = [];
    children.add(_getTitleItemWidget('No',50));
    children.add(_getMenuWidget(50));
    children.add(_getTitleItemWidget('Buyer',140));

    children.add(_getTitleItemWidget('Product',140));

    children.add(_getTitleItemWidget('Title',350));

    children.add(_getTitleItemWidget('Date',140));

    children.add(_getTitleItemWidget('Price',140));

    children.add(_getTitleItemWidget('Status',140));

    return children;
  }
  @override
  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text((index + 1 + (tools.paging.current_page-1) * 24).toString()),
      width: 50,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _getMenuWidget(double width) {
    return Container(
      child: Icon(
        Icons.settings,
      ),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  @override
  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  @override
  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    GlobalKey btnKey = GlobalKey();
    CustomPopupMenuController _controller = CustomPopupMenuController();
    List<ItemModel2> menuItems = [
      ItemModel2(items.items[index!].item.buttons[0].text ,  Icons.remove_red_eye_outlined,),
    ];

    Widget _buildLongPressMenu() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 220,
          color: const Color(0xFF4C4C4C),
          child: GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            crossAxisCount: 5,
            crossAxisSpacing: 0,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: const  NeverScrollableScrollPhysics(),
            children: menuItems
                .map((item) =>
                GestureDetector(child:
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      item.icon,
                      size: 20,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      child: Text(
                        item.title,
                        style: const  TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                    //  behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print('ini saya ${urlToRoute(items.items[index!].item
                          .buttons[0].url)}');
                      if(item.title == items.items[index].item.buttons[0].text){
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(items.items[index].item.buttons[0].url));
                      }
                      _controller.hideMenu();
                    }
                )

            )
                .toList(),
          ),
        ),
      );
    }
    void stateChanged(bool isShow) {
      print('menu is ${isShow ? 'showing' : 'closed'}');
    }

    void onClickMenu(MenuItemProvider item) {
      if(item.menuTitle == items.items[index].item.buttons[0].text){
        AppProvider.getRouter(context)!.navigateTo(
            context,
            urlToRoute(items.items[index].item.buttons[0].url));
      }
     // print('Click menu -> ${item.menuTitle}');
    }

    void onDismiss() {
      print('Menu is dismiss');
    }

    void maxColumn() {
      PopupMenu menu = PopupMenu(
        // backgroundColor: Colors.teal,
        // lineColor: Colors.tealAccent,
          maxColumn: 1,
          items: [

            MenuItem(
                title: items.items[index].item.buttons[0].text,
                image: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.white,
                )),

          ],

          onClickMenu: onClickMenu,
          stateChanged: stateChanged,
          onDismiss: onDismiss);
      menu.show(widgetKey: btnKey);
    }

    final List<Widget> children = [];
    double avatarSize = 40;
    children.add(Container(
      width: 50,
      height: 56,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      alignment: Alignment.centerLeft,
      child:
      CustomPopupMenu(
        child: Container(
          padding: const  EdgeInsets.all(5),
          constraints: BoxConstraints(maxWidth: 240, minHeight: avatarSize),
          decoration: BoxDecoration(
            color:  Colors.white ,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: const Icon(
            Icons.more_horiz_rounded,
          ),
        ),
        menuBuilder: _buildLongPressMenu,
        barrierColor: Colors.transparent,
        pressType: PressType.singleClick,
        controller: _controller,
      )
          /*
      MaterialButton(
        height: 45.0,
        key: btnKey,
        padding: EdgeInsets.fromLTRB(0, 15, 12, 20),
        onPressed: maxColumn,
        child: Icon(
          Icons.more_horiz_rounded,
        ),
      ),

           */


    ));
    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: items.items[index].viewBuyer(context)
    ));

    // children.add(items.items[index].viewBuyer(context));
    //children.add(Text('helooo'));


    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: items.items[index].viewProduct(context)
    ));

    // children.add(items.items[index].viewProduct(context));
    //children.add(Text('helooo'));

    children.add(
      Container(
        child: HtmlWidget(items.items[index].item.title,
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

            throw 'Could not launch';
          },
        ),
        width: 350,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
    );


    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: items.items[index].viewDate(context)
    ));

    // children.add(items.items[index].viewDate(context));
    //children.add(Text('helooo'));


    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: items.items[index].viewPrice(context)
    ));

    // children.add(items.items[index].viewPrice(context));
    //children.add(Text('helooo'));


    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: items.items[index].viewStatus(context)
    ));

    // children.add(items.items[index].viewStatus(context));
    //children.add(Text('helooo'));

    return Row(
        children: children

    );
  }



  @override
  Widget viewTable (BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);

    PopupMenu.context = context;
    return(
        Container(
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 50,
            rightHandSideColumnWidth: 1200,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: items.items.length,

            rowSeparatorWidget:
            themeManager.themeMode == ThemeMode.dark?
            const Divider(
              color: Colors.white,
              height: 1.0,
              thickness: 0.0,
            ) :
            const Divider(
              color: Colors.black,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor:  themeManager.themeMode == ThemeMode.dark? Colors.black : Color(0xFFFFFFFF),
            rightHandSideColBackgroundColor: themeManager.themeMode == ThemeMode.dark? Colors.black :Color(0xFFFFFFFF),


          ),
          height: 80 + double.parse(items.items.length.toString()) * 80 ,
        )
    );
  }


}

////////////////////////////
