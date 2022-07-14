import 'my_orders_item_base.dart';
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
import 'my_orders_item.dart';
import 'my_orders_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'package:projectscoid/models/my_orders_base.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/core/components/utility/tool/popup_menu.dart' as mn;
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';

part 'my_orders.g.dart';
/** AUTOGENERATE OFF **/

class ConfirmPaymentMyOrdersModel extends ConfirmPaymentMyOrdersBase{

  Map<String, dynamic> json;
  ConfirmPaymentMyOrdersModel(Map<String, dynamic> this.json):super(json);

  @override
  Widget editAccountNo (State state) {
    return(
        DisplayNameWidget(
          value: model.model.account_no,
          caption: 'Account No',
          hint: 'Masukan No. Rekening Anda ',
          required: true,
          getValue: (String? val) {
            state.setState(() {
              model.model.account_no = val;
            });
          },
        ));}

  @override
  Widget editAccountName (State state) {
    return(
        DisplayNameWidget(
          value: model.model.account_name,
          caption: 'Account Name',
          hint: 'Masukan Nama Pemilik Rekening',
          required: true,
          getValue: (String? val) {
            state.setState(() {
              model.model.account_name = val;
            });
          },
        ));}

	  
}


class MyOrdersModel extends MyOrdersBase{
  Map<String, dynamic> json;
  MyOrdersModel(Map<String, dynamic> this.json):super(json); 	

  
}

/*
    "no": 2,
            "title": "Used Balance",
            "price": -50000,
            "price_str": "Rp -50,000",
            "quantity": 1,
            "total": -50000,
            "total_str": "Rp -50,000"
 */

@JsonSerializable()
class OrderItem{
  int?    no;
  String? title ;
  String? price_str;
  int?   quantity;
  String? total_str;



  OrderItem(
      this.no ,
      this.title,
      this.price_str,
      this.quantity,
      this.total_str
      );

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);



}

/*
OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
      json['no'] as int,
      json['title'] as String,
      json['price_str'] as String,
      (json['quantity'] is String) ?  int.tryParse(json['quantity'] as String) : json['quantity'] as int,
      json['total_str'] as String
      );
}

 */


@JsonSerializable()
class ModelMyOrdersRev {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;

  String? order_id;
  String? track_code;
  int? buyer_id;
  String? buyer_url;
  String? buyer_str;
  List<int?>? buyer_list;
  List<String?>? buyer_list_str;
  DateTime? date;
  int? status_id;
  String? status_str;
  List<int?>? status_list;
  List<String?>? status_list_str;
  int? payment_method_id;
  String? payment_method_str;
  List<int?>? payment_method_list;
  List<String?>? payment_method_list_str;
  int? buyer_payment_id;
  String? buyer_payment_url;
  String? buyer_payment_str;
  List<int?>? buyer_payment_list;
  List<String?>? buyer_payment_list_str;
  double? total_price;
  String? total_price_str;
  String? coupon;
  double? coupon_value;
  String? coupon_value_str;
  double? used_balance;
  String? used_balance_str;
  double? total_sum;
  String? total_sum_str;
  double? unique_code;
  String? unique_code_str;
  String? table;
  String? notes;
  int? cimb_ref;
  String? cimb_ref_str;
  bool? is_test;



  ModelMyOrdersRev(
      this.id,
      this.order_id,
      this.buyer_id,
      this.buyer_str,
      this.buyer_list,
      this.buyer_list_str,
      this.status_id,
      this.status_str,
      this.status_list,
      this.status_list_str,
      this.payment_method_id,
      this.payment_method_str,
      this.payment_method_list,
      this.payment_method_list_str,
      this.buyer_payment_id,
      this.buyer_payment_str,
      this.buyer_payment_list,
      this.buyer_payment_list_str,
      this.total_price,
      this.total_price_str,
      this.coupon_value,
      this.coupon_value_str,
      this.used_balance,
      this.used_balance_str,
      this.total_sum,
      this.total_sum_str,
      this.unique_code,
      this.unique_code_str,
      this.cimb_ref,
      this.cimb_ref_str,

      );
  factory ModelMyOrdersRev.fromJson(Map<String, dynamic> json) => _$ModelMyOrdersRevFromJson(json);



}

/*
ModelMyOrdersRev _$ModelMyOrdersRevFromJson(Map<String, dynamic> json) {
  return ModelMyOrdersRev(
      json['id'] as String,
      json['order_id'] as String,
      json['buyer_id'] as int,
      json['buyer_str'] as String,
      (json['buyer_list'] as List)?.map((e) => e as int)?.toList(),
      (json['buyer_list_str'] as List)?.map((e) => e as String?)?.toList(),
      json['status_id'] as int,
      json['status_str'] as String,
      (json['status_list'] as List)?.map((e) => e as int)?.toList(),
      (json['status_list_str'] as List)?.map((e) => e as String?)?.toList(),
      json['payment_method_id'] as int,
      json['payment_method_str'] as String,
      (json['payment_method_list'] as List)?.map((e) => e as int)?.toList(),
      (json['payment_method_list_str'] as List)
          ?.map((e) => e as String?)
          ?.toList(),
      json['buyer_payment_id'] as int,
      json['buyer_payment_str'] as String,
      (json['buyer_payment_list'] as List)?.map((e) => e as int)?.toList(),
      (json['buyer_payment_list_str'] as List)
          ?.map((e) => e as String?)
          ?.toList(),
      (json['total_price'] as num)?.toDouble(),
      json['total_price_str'] as String,
      (json['coupon_value'] as num)?.toDouble(),
      json['coupon_value_str'] as String,
      (json['used_balance'] as num)?.toDouble(),
      json['used_balance_str'] as String,
      (json['total_sum'] as num)?.toDouble(),
      json['total_sum_str'] as String,
      (json['unique_code'] as num)?.toDouble(),
      json['unique_code_str'] as String,
      json['cimb_ref'] as int,
      json['cimb_ref_str'] as String? )
    ..age = json['age'] as int
    ..cnt = json['cnt'] as int
    ..page = json['page'] as int
    ..ttl = json['ttl'] as String?
    ..pht = json['pht'] as String?
    ..sbttl = json['sbttl'] as String?
    ..track_code = json['track_code'] as String?
    ..buyer_url = json['buyer_url'] as String?
    ..date =
    json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..buyer_payment_url = json['buyer_payment_url'] as String?
    ..coupon = json['coupon'] as String?
    ..table = json['table'] as String?
    ..notes = json['notes'] as String?
    ..is_test = json['is_test'] as bool;
}

 */

@JsonSerializable()
class MyOrdersSuperBaseRev{

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ModelMyOrdersRev? model;
  List<OrderItem?>? items;
  MyOrdersSuperBaseRev(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      this.items
      );



  factory MyOrdersSuperBaseRev.fromJson(Map<String, dynamic> json) => _$MyOrdersSuperBaseRevFromJson(json);




}


/*
MyOrdersSuperBaseRev _$MyOrdersSuperBaseRevFromJson(Map<String, dynamic> json) {
  return MyOrdersSuperBaseRev(
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
          : ModelMyOrdersRev.fromJson(json['model'] as Map<String, dynamic>),

      (json['items'] as List)
      ?.map((e) =>
       e == null ? null : OrderItem.fromJson(e as Map<String, dynamic>))
      ?.toList(),


  );
}

 */









class MyOrdersViewModel  extends MyOrdersViewBase{
  Map<String, dynamic> json;
  static const int? sortNo = 0;
  static const int? sortStatus = 1;
  bool?isAscending = true;
  int? sortType = sortNo;
  MyOrdersViewModel(Map<String, dynamic> this.json):super(json){model = MyOrdersSuperBaseRev.fromJson(this.json);}

  Widget _generateFirstColumnRow(BuildContext context, int? index) {
    return Container(
      child: Text(model.items[index!].no.toString()),
      width: 30,
      height: 52,
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }


  Widget _generateRightHandSideColumnRow(BuildContext context, int? index) {
    return Row(
      children: <Widget>[


        Container(
          child: HtmlWidget(model.items[index!].title,
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
                ),
          width: 400,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),

        Container(
          child: Text(model.items[index!].price_str),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(model.items[index!].quantity.toString()),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(model.items[index!].total_str),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }


  List<Widget> _getTitleWidget() {
    return [


      _getTitleItemWidget('No', 30),
      _getTitleItemWidget('Title', 400),
      _getTitleItemWidget('Price', 200),
      _getTitleItemWidget('Quantity', 200),
      _getTitleItemWidget('Total', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double? width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }


  @override
  Widget viewTable (BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);

    return(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
            padding: EdgeInsets.only(left: 5.0),
              child: Text('ITEMS' , style: TextStyle(fontSize: 12, color: CurrentTheme.DisableTextColor)),
            ),

            Container(
              child: HorizontalDataTable(
                leftHandSideColumnWidth: 50,
                rightHandSideColumnWidth: 1200,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder: _generateFirstColumnRow,
                rightSideItemBuilder: _generateRightHandSideColumnRow,
                itemCount: model.items.length,

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
              height: 80 + double.parse(model.items.length.toString()) * 80 ,
            )
          ],
        )

    );
  }



  Widget viewTrackCode1 (BuildContext context) {
    return(

        Column(
          children: [
            const SizedBox(height: 20,),
            WebsiteView(
              value: model.model.track_code,
              caption: 'Track Code',
            )
          ],
        )
       );}


  String Filter(String str){

    const start = ">";
    const end = "</";

    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);
    return str.substring(startIndex + start.length, endIndex);
  }
  Widget viewStatus1 (BuildContext context) {
    return(

            WebsiteView(
              value: Filter(model.model.status_str),
              caption: 'Status',
            )


       );
  }
  Widget viewPaymentMethod1 (BuildContext context) {
    return(
        WebsiteView(
          value: model.model.payment_method_str,
          caption: 'Payment Method',
        ));}

  @override
  Widget view (BuildContext context, ScrollController controller, bool?account) {


    viewChildren.clear();



    viewChildren.add(viewTrackCode1(context));
    viewChildren.add(viewDate(context));
    viewChildren.add(viewStatus1(context));
    viewChildren.add(viewPaymentMethod1(context));
    viewChildren.add(viewTotalPrice(context));
    viewChildren.add(viewUsedBalance(context));
    viewChildren.add(viewTotalSum(context));
    viewChildren.add(viewTable(context));
   // viewChildren.add(viewTable(context));


    return(  SingleChildScrollView(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        reverse: false,

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: viewChildren
        )
    ));
  }


}


///////////////////////////////////////////////////


class MyOrdersListingModel extends MyOrdersListingBase{
  Map<String, dynamic> json;
  MyOrdersListingModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget viewItem (ItemMyOrdersModel item,String? search, bool?account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemMyOrdersCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemMyOrdersCard1(destination :item, search : search, shape : shape, height : height, account : account)
    );
  }

}


class ItemMyOrdersCard1 extends StatelessWidget {
  const ItemMyOrdersCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyOrdersModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool?account;

//ItemMyOrdersContent2(destination: destination,  account : account) ,

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation : 3.0,
        borderOnForeground: false,
        margin : EdgeInsets.all(6.0),
        child:
        ItemMyOrdersContent2(destination: destination, account: account),
      ),
    );
  }
}

class ItemMyOrdersContent2 extends StatelessWidget {
  ItemMyOrdersContent2({ Key? key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemMyOrdersModel? destination;
  final bool? account ;
  bool?darkMode = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor, fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;

    final List<Widget> children = <Widget>[

    CategoryWidget(
    title: 'Track Code',
      isDark: darkMode,
      subtitle : '${destination!.item!.id}',
    children: <Widget>[



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
      ItemListWidget(
        icon: Icons.check,
        tooltip: 'Send message',
        isDark: darkMode,
        onPressed: (){
        },
        lines:
        'Status',

        wgt: HtmlWidget(
          destination!.item!.status_str, //bodyPadding: EdgeInsets.all(0.0),
        ),
      ),

      ItemListString(
        icon: Icons.account_balance,
        tooltip: 'Send message',
        isDark: darkMode,
        onPressed: () {
        },
        lines: <String>[
          'Payment methode',
          '${destination!.item!.payment_method_str}',
        ],
      ),

      ItemListString(
       // icon: Icons.account_balance,
        tooltip: 'Send message',
        isDark: darkMode,
        onPressed: () {
        },
        lines: <String>[
          'CIMB Ref',
          '${destination!.item!.cimb_ref.toString()}',
        ],
      ),

        ItemListString(
        icon: Icons.card_giftcard,
          isDark: darkMode,
          tooltip: 'Send message',
        onPressed: () {
        },
        lines: <String>[
          'Coupon',
          '${destination!.item!.coupon_value_str}',
        ],
      ),
      ItemListString(
        // icon: Icons.arrow_forward_ios,
        tooltip: 'Send message',
        isDark: darkMode,
        onPressed: () {
        },
        lines: <String>[
          'Unique Code',
          '${destination!.item!.unique_code_str}',
        ],
      ),
      ItemListString(
        icon: Icons.attach_money,
        tooltip: 'Send message',
        isDark: darkMode,
        onPressed: () {
        },
        lines: <String>[
          'Total Price',
          '${destination!.item!.total_price_str}',
        ],
      ),

      ItemListString(
        // icon: Icons.arrow_forward_ios,
        tooltip: 'Send message',
        isDark: darkMode,
        onPressed: () {
        },
        lines: <String>[
          'Balance',
          '${destination!.item!.used_balance_str}',
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

          wgt: HtmlWidget(
            destination!.item!.notes.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
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
//class ItemMyOrders extends class ItemMyOrdersBase{
//
//}
class ItemModel {
  String title;
  IconData icon;

  ItemModel(this.title, this.icon);
}
class MyOrdersIndexModel extends MyOrdersIndexBase{
  Map<String, dynamic> json;
  MyOrdersIndexModel(Map<String, dynamic> this.json):super(json);
  late List<ItemModel> menuItems;


  @override
  List<Widget> _getTitleWidget() {
    final List<Widget> children = [];
    children.add(_getTitleItemWidget('No',50));
    children.add(_getMenuWidget(50));
    children.add(_getTitleItemWidget('Date',140));

    children.add(_getTitleItemWidget('Track Code',140));

    children.add(_getTitleItemWidget('Payment Method',140));

    children.add(_getTitleItemWidget('Total Price',140));

    children.add(_getTitleItemWidget('Used Balance',140));

    children.add(_getTitleItemWidget('Total Sum',140));

    children.add(_getTitleItemWidget('Status',140));

    return children;
  }

  @override
  Widget _generateFirstColumnRow(BuildContext context, int? index) {
    return Container(
      child: Text((index! + 1 + (tools.paging.current_page-1) * 24).toString()),
      width: 50,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  @override
  Widget _getTitleItemWidget(String label, double? width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }


  Widget _getMenuWidget(double? width) {
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
  Widget _generateRightHandSideColumnRow(BuildContext context, int? index) {
    var rv = new List.from(items.items.reversed);
    GlobalKey btnKey = GlobalKey();
    CustomPopupMenuController _controller = CustomPopupMenuController();
    List<ItemModel> menuItems = [
      ItemModel(rv[index!].item.buttons[0].text ,  Icons.circle,),
    ];
    Widget _buildLongPressMenu() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 260,
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
                                 onTap: (){
                                  print('ini saya ${urlToRoute(rv[index!].item.buttons[0].url)}');
                                   if(item.title == rv[index!].item.buttons[0].text){
                                     AppProvider.getRouter(context)!.navigateTo(
                                         context,
                                         urlToRoute(rv[index!].item.buttons[0].url));
                                   }
                                   _controller.hideMenu();
                                 },
                 )

            )
                .toList(),
          ),
        ),
      );
    }
    void stateChanged(bool?isShow) {
      print('menu is ${isShow! ? 'showing' : 'closed'}');
    }

    void onClickMenu(mn.MenuItemProvider item) {
      if(item.menuTitle == rv[index!].item.buttons[0].text){
        AppProvider.getRouter(context)!.navigateTo(
            context,
            urlToRoute(rv[index!].item.buttons[0].url));
      }
     // print('Click menu -> ${item.menuTitle}');
    }

    void onDismiss() {
      print('Menu is dismiss');
    }

    void maxColumn() {
      mn.PopupMenu menu = mn.PopupMenu(
        // backgroundColor: Colors.teal,
        // lineColor: Colors.tealAccent,

          maxColumn: 1,
          items: [

            mn.MenuItem(
                title: rv[index!].item.buttons[0].text ,
                image: const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 20,
                ),
               // textStyle: rv[index!].item.buttons[0].text == 'Confirm Payment'? TextStyle(color: Color(0xffc5c5c5), fontSize: 8.0) : TextStyle(color: Color(0xffc5c5c5), fontSize: 10.0),
            ),

          ],

          onClickMenu: onClickMenu,
          stateChanged: stateChanged,
          onDismiss: onDismiss);
      menu.show(widgetKey: btnKey);
    }


    final List<Widget> children = [];
    double avatarSize = 40;
    children.add(Container(
        width: 60,
        height: 56,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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
        child: rv[index!].viewDate(context)
    ));

    // children.add(items.items[index!].viewDate(context));
    //children.add(Text('helooo'));


    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: rv[index!].viewTrackCode(context)
    ));

    // children.add(items.items[index!].viewTrackCode(context));
    //children.add(Text('helooo'));


    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: rv[index!].viewPaymentMethod(context)
    ));

    // children.add(items.items[index!].viewPaymentMethod(context));
    //children.add(Text('helooo'));


    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: rv[index!].viewTotalPrice(context)
    ));

    // children.add(items.items[index!].viewTotalPrice(context));
    //children.add(Text('helooo'));


    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: rv[index!].viewUsedBalance(context)
    ));

    // children.add(items.items[index!].viewUsedBalance(context));
    //children.add(Text('helooo'));


    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: rv[index!].viewTotalSum(context)
    ));

    // children.add(items.items[index!].viewTotalSum(context));
    //children.add(Text('helooo'));


    children.add(Container(
        width: 140,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: rv[index!].viewStatus(context)
    ));

    // children.add(items.items[index!].viewStatus(context));
    //children.add(Text('helooo'));

    return Row(
        children: children

    );
  }

  @override
  Widget viewTable (BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);

    mn.PopupMenu.context = context;
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
