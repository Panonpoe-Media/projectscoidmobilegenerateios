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
import 'package:url_launcher/url_launcher.dart';
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
import 'my_purchases_item.dart';
import 'my_purchases_item_base.dart';
import 'photo.dart';
import 'paging.dart';
import 'my_purchases_item_base.dart';
import 'dart:io';
import 'package:projectscoid/models/my_purchases_base.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/core/components/utility/tool/popup_menu.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';


/** AUTOGENERATE OFF **/

class DownloadMyPurchasesModel extends DownloadMyPurchasesBase{

  Map<String, dynamic> json;
  DownloadMyPurchasesModel(Map<String, dynamic> this.json):super(json); 
	  
}

class RateProductMyPurchasesModel extends RateProductMyPurchasesBase{

  Map<String, dynamic> json;
  RateProductMyPurchasesModel(Map<String, dynamic> this.json):super(json); 
	  
}


class MyPurchasesModel extends MyPurchasesBase{
  Map<String, dynamic> json;
  MyPurchasesModel(Map<String, dynamic> this.json):super(json); 	

  
}
 


class MyPurchasesViewModel  extends MyPurchasesViewBase{
  Map<String, dynamic> json;
  MyPurchasesViewModel(Map<String, dynamic> this.json):super(json){model = MyPurchasesViewSuperBase.fromJson(this.json);}


  @override
  SpeedDialChild ButtonViewMyPurchasesWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyPurchasesController my_purchases,
      State state, String? sendPath, String? id,  String? title, bool?account){
    if(button.type == 'custom_filter'){
      return (
          SpeedDialChild(
            child: Icon(Icons.search),
            backgroundColor: Colors.green,
            label: button.text,
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
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
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
            onTap: ()async{
              {

                SubModelController my_purchases;
                String getPath = Env.value!.baseUrl! + button.url! ;
                my_purchases = new  SubModelController(AppProvider.getApplication(context),
                    getPath,
                    null);
                final future = my_purchases.getPurchaseDownload();
                future.then((value) {
                  var val = value.queryParameters.values.last;
                  // print('ini $val ku ya1 ${value.toString()}');

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowPurchaseFile(file: value.toString(),fz: '', basename: val,)));

                }).catchError((Error){
                  // print('ini error ku ya ${Error.toString()}');
                  // AppProvider.getRouter(context)!.pop(context);
                });

              }
            }
        ));
      }else{
        return(	SpeedDialChild(
            child: Icon(ic),
            backgroundColor: cl,
            label: button.text,
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
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


///////////////////////////////////////////////////


class MyPurchasesListingModel extends MyPurchasesListingBase{
  Map<String, dynamic> json;
  MyPurchasesListingModel(Map<String, dynamic> this.json):super(json);
  Widget viewItem (ItemMyPurchasesModel item,String? search, bool? account) {
    ShapeBorder? shape;
    double? height = 160;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        //  child:  ItemMyPurchasesCard2(destination :item, search : search, shape : shape, height : height, account : account)
        child:  ItemMyPurchasesCard1(destination :item, search : search, shape : shape, height : height, account : account)
    );
  }

}


class ItemMyPurchasesCard1 extends StatelessWidget {
  const ItemMyPurchasesCard1({ Key? key, @required this.destination, this.search, this.shape, this.height, this.index, this.account})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height ;
  final ItemMyPurchasesModel? destination;
  final String? search;
  final ShapeBorder? shape;
  final int? index;
  final bool? account;

//ItemMyPurchasesContent2(destination: destination,  account : account) ,

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation : 3.0,
        borderOnForeground: false,
        margin : EdgeInsets.all(6.0),
        child:
        ItemMyPurchasesContent2(destination: destination, account: account),
      ),
    );
  }
}



class ItemMyPurchasesContent2 extends StatefulWidget {
  ItemMyPurchasesContent2({ Key? key, @required this.destination, this.account })
      : assert(destination != null),
        super(key: key);

  final ItemMyPurchasesModel? destination;
  final bool? account ;

  @override
  ItemMyPurchasesContent2State createState() => ItemMyPurchasesContent2State();
}

//class _ProjectscoidState extends State<Projectscoid> with TickerProviderStateMixin {


class ItemMyPurchasesContent2State extends State<ItemMyPurchasesContent2> {
//ddmnnnnnnn  const ItemMyPurchasesContent2({ Key? key, @required this.destination, this.account })
 //     : assert(destination != null),
 //       super(key: key);

//  final ItemMyPurchasesModel destination;
//  final bool account ;
  bool darkMode = false;






  @override
  Widget build(BuildContext context) {




    Future<void> _showNotification( String msg, int id, String title) async {
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'your channel id', 'your channel name', 
          importance: Importance.max, priority: Priority.high, ticker: 'ticker');
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android:androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
      /* await AppProvider..flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x'); */
      await AppProvider.getApplication(context).flutterLocalNotificationsPlugin!.show(
          id, title, msg, platformChannelSpecifics,
          payload: title);
    }


    void showProgress(received, total) {
      if (total != -1) {
        setState(() {
          _showNotification("Download " + (received / total * 100).toStringAsFixed(0) + "%", int.fromEnvironment(widget.destination!.item!.order_item_id),
              'My Purchase : \n ${widget.destination!.item!.product_id != 0 ? '${widget.destination!.item!.product_str}': widget.destination!.item!.service_id != 0 ? '${widget.destination!.item!.service_str}' :
              widget.destination!.item!.project_id != 0 ? '${widget.destination!.item!.product_str}' :
              widget.destination!.item!.bid_id != 0 ? '${widget.destination!.item!.bid_str}' : '${widget.destination!.item!.iklan_str}'}');
        });

        print((received / total * 100).toStringAsFixed(0) + "%");
      }
    }
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith(color: CurrentTheme.NormalTextColor, fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle descriptionStyle = theme.textTheme.headline5!;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;

    final List<Widget> children = <Widget>[

      CategoryWidget(
        title: 'Purchase Code',
        isDark: darkMode,
        subtitle : '${widget.destination!.item!.order_item_id}',
        children: <Widget>[

          ItemListWidget(
              icon: Icons.calendar_today,
              tooltip: 'Send message',
              isDark: darkMode,
              onPressed: (){
              },
              lines:
              'Title',

              wgt: HtmlWidget(widget.destination!.item!.title,
                            //bodyPadding: EdgeInsets.all(0.0),
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
                         )
          ),

          ItemListWidget(
              icon: Icons.calendar_today,
              tooltip: 'Send message',
              isDark: darkMode,
              onPressed: (){
              },
              lines:
              'Payment Date',

              wgt: Text(DateFormat('dd/MM/yyyy hh:mm:ss').format(widget.destination!.item!.date))
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
              widget.destination!.item!.status_str, //bodyPadding: EdgeInsets.all(0.0),
            ),
          ),

          ItemListWidget(
            icon: Icons.perm_identity,
            tooltip: 'Send message',
            isDark: darkMode,
            onPressed: (){
            },
            lines:
            'Seller',

            wgt: GestureDetector(
                    onTap: (){
                          AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute(widget.destination!.item!.seller_url));
                          },

                    child: Text(widget.destination!.item!.seller_str)
            ),
          ),

          ItemListString(
            icon: Icons.attach_money,
            tooltip: 'Send message',
            isDark: darkMode,
            onPressed: () {
            },
            lines: <String>[
              'Total Price',
              '${widget.destination!.item!.price_str}',
            ],
          ),

          ItemListString(
            icon: Icons.card_giftcard,
            tooltip: 'Send message',
            isDark: darkMode,
            onPressed: () {
            },
            lines: <String>[
              'Type',
              '${widget.destination!.item!.type_str}',
            ],
          ),
          ItemListString(
            // icon: Icons.arrow_forward_ios,
            tooltip: 'Send message',
            isDark: darkMode,
            onPressed: () {
            },
            lines: <String>[
              widget.destination!.item!.product_id != 0 ? 'Product' : widget.destination!.item!.service_id != 0 ? 'Service' : widget.destination!.item!.project_id != 0 ? 'Projects' :
              widget.destination!.item!.bid_id != 0 ? 'Bid' : 'Iklan',
              widget.destination!.item!.product_id != 0 ? '${widget.destination!.item!.product_str}': widget.destination!.item!.service_id != 0 ? '${widget.destination!.item!.service_str}' :
              widget.destination!.item!.project_id != 0 ? '${widget.destination!.item!.product_str}' :
              widget.destination!.item!.bid_id != 0 ? '${widget.destination!.item!.bid_str}' : '${widget.destination!.item!.iklan_str}',

            ],
          ),

          ItemListString(
            // icon: Icons.arrow_forward_ios,
            tooltip: 'Send message',
            isDark: darkMode,
            onPressed: () {
            },
            lines: <String>[
              'Rating',
              '${ratingMean(widget.destination!.item!.rating.toDouble())}',
            ],
          ),
          ItemListWidget(
            icon: Icons.event_note,
            tooltip: 'Send message',
            isDark: darkMode,
            onPressed: (){
            },
            lines:
            'Testimony',

            wgt:widget.destination!.item!.testimony != null ? HtmlWidget(
              widget.destination!.item!.testimony.replaceAll('<div>', '').replaceAll('<\/div>','').replaceAll('<br>', ' ').replaceAll('<p>', '').replaceAll('<\/p>', '<br>'),
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
            ) : Container(height: 0.0, width: 0.0,),
          ),
          widget.destination!.item!.buttons.length > 2 ?
          LinkViewWidget(
              icon: Icons.arrow_forward_ios,
              tooltip: 'Send message',
              //isDark: darkMode,
              onPressed: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(widget.destination!.item!.buttons[2].url));
              } ,
              lines:  widget.destination!.item!.buttons[2].text
          ) : Container(height: 0.0, width: 0.0,),

          widget.destination!.item!.buttons.length > 1 ?
          LinkViewWidget(
              icon: Icons.arrow_forward_ios,
              tooltip: 'Send message',
              //isDark: darkMode,
              onPressed: () {
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    urlToRoute(widget.destination!.item!.buttons[1].url));
              } ,
              lines:  widget.destination!.item!.buttons[1].text
          ) : Container(height: 0.0, width: 0.0,),
          widget.destination!.item!.buttons.length == 1 ?
            LinkViewWidget(
            icon: Icons.arrow_forward_ios,
            tooltip: 'Send message',
                //isDark: darkMode,
                onPressed: () {
                  AppProvider.getRouter(context)!.navigateTo(
                  context,
                  urlToRoute(widget.destination!.item!.buttons[0].url));
                  } ,
            lines:  widget.destination!.item!.buttons[0].text
            ):

          /*
          FileViewAtt(
            ctx : context,
            value: destination!.item!.buttons[0].text ,
            value1:  Env.value!.baseUrl!  + destination!.item!.buttons[0].url ,
            caption: 'Sample',
          )
          */



          LinkViewWidget(
              icon: Icons.arrow_forward_ios,
              tooltip: 'Send message',
            //  isDark: darkMode,
              onPressed: ()async {
                /*
                      MyPurchasesController my_purchases;
                      my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
                      Env.value!.baseUrl! + widget.destination!.item!.buttons[0].url,
                      AppAction.post,
                      '',
                      'projectscoiddownloadFile',
                      null,
                      false);
                      final future = my_purchases.downloadFile1(showProgress);
                      future.then((value) {
                       setState(() {

                         _showNotification("Filepath : Download/ $value " , int.fromEnvironment(widget.destination!.item!.order_item_id) + 1,
                             'My Purchase : Download complete');
                       });
                      }).catchError((Error){
                      AppProvider.getRouter(context)!.pop(context);
                      });

                 */
                SubModelController my_purchases;
                String getPath = Env.value!.baseUrl! + widget.destination!.item!.buttons[0].url ;
                my_purchases = new  SubModelController(AppProvider.getApplication(context),
                    getPath,
                    null);
                final future = my_purchases.getPurchaseDownload();
                future.then((value) {
                  var val = value.queryParameters.values.last;
                  // print('ini $val ku ya1 ${value.toString()}');

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowPurchaseFile(file: value.toString(),fz: '', basename: val,)));

                }).catchError((Error){
                  // print('ini error ku ya ${Error.toString()}');
                  // AppProvider.getRouter(context)!.pop(context);
                });




              } ,
              lines:  widget.destination!.item!.buttons[0].text
          )




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



//class ItemMyPurchases extends class ItemMyPurchasesBase{
//
//}

class ItemModel1 {
  String title;
  IconData icon;

  ItemModel1(this.title, this.icon);
}

class MyPurchasesIndexModel extends MyPurchasesIndexBase{
  Map<String, dynamic> json;
  MyPurchasesIndexModel(Map<String, dynamic> this.json):super(json);

  @override
  List<Widget> _getTitleWidget() {
    final List<Widget> children = [];
    children.add(_getTitleItemWidget('No',50));
    children.add(_getMenuWidget(50));
    children.add(_getTitleItemWidget('Seller',140));

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
  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    GlobalKey btnKey = GlobalKey();
    CustomPopupMenuController _controller = CustomPopupMenuController();
    List<ItemModel1> menuItems =
        items.items[index].item.buttons.length == 1 ?
        [
          ItemModel1(items.items[index!].item.buttons[0].text ,  Icons.remove_red_eye_outlined,)
        ]:
        items.items[index].item.buttons.length == 2 ?
        [
          ItemModel1('Dload' ,  Icons.cloud_download_outlined,),
          ItemModel1(items.items[index!].item.buttons[1].text ,  Icons.remove_red_eye_outlined,)
        ]:
        [
          ItemModel1('Dload' ,  Icons.cloud_download_outlined,),
          ItemModel1('Rate' ,  Icons.star_border,),
          ItemModel1(items.items[index!].item.buttons[2].text ,  Icons.remove_red_eye_outlined,)
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
                    if (items.items[index].item.buttons.length == 1) {
                      if (item.title ==
                          items.items[index].item.buttons[0].text) {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(items.items[index].item.buttons[0].url));
                      }
                    }
                    if (items.items[index].item.buttons.length == 2) {
                      if (item.title ==
                          items.items[index].item.buttons[0].text) {
                        SubModelController my_purchases;
                        String getPath = Env.value!.baseUrl! + items
                            .items[index].item.buttons[0].url;
                        my_purchases = new SubModelController(AppProvider
                            .getApplication(context),
                            getPath,
                            null);
                        final future = my_purchases.getPurchaseDownload();
                        future.then((value) {
                          var val = value.queryParameters.values.last;
                          // print('ini $val ku ya1 ${value.toString()}');

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  ShowPurchaseFile(file: value.toString(),
                                    fz: '',
                                    basename: val,)));
                        }).catchError((Error) {
                          // print('ini error ku ya ${Error.toString()}');
                          // AppProvider.getRouter(context)!.pop(context);
                        });
                      }

                      if (item.title ==
                          items.items[index].item.buttons[1].text) {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(items.items[index].item.buttons[1].url));
                      }
                    }
                    if (items.items[index].item.buttons.length == 3) {
                      if (item.title ==
                          items.items[index].item.buttons[0].text) {
                        /*
         MyPurchasesController my_purchases;
         my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
             Env.value!.baseUrl! + items.items[index].item.buttons[0].url,
             AppAction.post,
             '',
             'projectscoiddownloadFile',
             null,
             false);
         final future = my_purchases.downloadFile1(showProgress);
         future.then((value) {
           // setState(() {

         //  _showNotification("Filepath : Download/ $value " , int.fromEnvironment(items.items[index].item.order_item_id) + 1,
         //      'My Purchase : Download complete');
           // });
         }).catchError((Error){
           AppProvider.getRouter(context)!.pop(context);
         });

          */


                        SubModelController my_purchases;
                        String getPath = Env.value!.baseUrl! + items
                            .items[index].item.buttons[0].url;
                        my_purchases = new SubModelController(AppProvider
                            .getApplication(context),
                            getPath,
                            null);
                        final future = my_purchases.getPurchaseDownload();
                        future.then((value) {
                          var val = value.queryParameters.values.last;
                          // print('ini $val ku ya1 ${value.toString()}');

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  ShowPurchaseFile(file: value.toString(),
                                    fz: '',
                                    basename: val,)));
                        }).catchError((Error) {
                          // print('ini error ku ya ${Error.toString()}');
                          // AppProvider.getRouter(context)!.pop(context);
                        });
                      }
                      if (item.title ==
                          items.items[index].item.buttons[1].text) {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(items.items[index].item.buttons[1].url));
                      }
                      if (item.title ==
                          items.items[index].item.buttons[2].text) {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(items.items[index].item.buttons[2].url));
                      }
                      _controller.hideMenu();
                    }

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
    Future<void> _showNotification( String msg, int id, String title) async {
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'your channel id', 'your channel name',
          importance: Importance.max, priority: Priority.high, ticker: 'ticker');
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android:androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
      /* await AppProvider..flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x'); */
      await AppProvider.getApplication(context).flutterLocalNotificationsPlugin!.show(
          id, title, msg, platformChannelSpecifics,
          payload: title);
    }
    void showProgress(received, total) {
      if (total != -1) {
      //  setState(() {
          _showNotification("Download " + (received / total * 100).toStringAsFixed(0) + "%", int.fromEnvironment(items.items[index].item.order_item_id), '');
      //  });

        print((received / total * 100).toStringAsFixed(0) + "%");
      }
    }

    void onClickMenu(MenuItemProvider item) {
     if (items.items[index].item.buttons.length == 1){
       if(item.menuTitle == items.items[index].item.buttons[0].text){
         AppProvider.getRouter(context)!.navigateTo(
             context,
             urlToRoute(items.items[index].item.buttons[0].url));
       }
     }
     if (items.items[index].item.buttons.length == 2){
       if(item.menuTitle == items.items[index].item.buttons[0].text){
         /*
         MyPurchasesController my_purchases;
         my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
             Env.value!.baseUrl! + items.items[index].item.buttons[0].url,
             AppAction.post,
             '',
             'projectscoiddownloadFile',
             null,
             false);
         final future = my_purchases.downloadFile1(showProgress);
         future.then((value) {
          // setState(() {

           //  _showNotification("Filepath : Download/ $value " , int.fromEnvironment(items.items[index].item.order_item_id) + 1,
            //     'My Purchase : Download complete');
          // });
         }).catchError((Error){
           AppProvider.getRouter(context)!.pop(context);
         });

          */

         SubModelController my_purchases;
         String getPath = Env.value!.baseUrl! + items.items[index].item.buttons[0].url ;
         my_purchases = new  SubModelController(AppProvider.getApplication(context),
             getPath,
             null);
         final future = my_purchases.getPurchaseDownload();
         future.then((value) {
           var val = value.queryParameters.values.last;
           // print('ini $val ku ya1 ${value.toString()}');

           Navigator.push(context,
               MaterialPageRoute(builder: (context) => ShowPurchaseFile(file: value.toString(),fz: '', basename: val,)));

         }).catchError((Error){
           // print('ini error ku ya ${Error.toString()}');
           // AppProvider.getRouter(context)!.pop(context);
         });

       }

       if(item.menuTitle == items.items[index].item.buttons[1].text){
         AppProvider.getRouter(context)!.navigateTo(
             context,
             urlToRoute(items.items[index].item.buttons[1].url));
       }

     }
     if (items.items[index].item.buttons.length == 3){
       if(item.menuTitle == items.items[index].item.buttons[0].text){
         /*
         MyPurchasesController my_purchases;
         my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
             Env.value!.baseUrl! + items.items[index].item.buttons[0].url,
             AppAction.post,
             '',
             'projectscoiddownloadFile',
             null,
             false);
         final future = my_purchases.downloadFile1(showProgress);
         future.then((value) {
           // setState(() {

         //  _showNotification("Filepath : Download/ $value " , int.fromEnvironment(items.items[index].item.order_item_id) + 1,
         //      'My Purchase : Download complete');
           // });
         }).catchError((Error){
           AppProvider.getRouter(context)!.pop(context);
         });

          */


         SubModelController my_purchases;
         String getPath = Env.value!.baseUrl! + items.items[index].item.buttons[0].url ;
         my_purchases = new  SubModelController(AppProvider.getApplication(context),
             getPath,
             null);
         final future = my_purchases.getPurchaseDownload();
         future.then((value) {
           var val = value.queryParameters.values.last ;
          // print('ini $val ku ya1 ${value.toString()}');

           Navigator.push(context,
               MaterialPageRoute(builder: (context) => ShowPurchaseFile(file: value.toString(),fz: '', basename: val,)));

         }).catchError((Error){
          // print('ini error ku ya ${Error.toString()}');
          // AppProvider.getRouter(context)!.pop(context);
         });



       }
       if(item.menuTitle == items.items[index].item.buttons[1].text){
         AppProvider.getRouter(context)!.navigateTo(
             context,
             urlToRoute(items.items[index].item.buttons[1].url));
       }
       if(item.menuTitle == items.items[index].item.buttons[2].text){
         AppProvider.getRouter(context)!.navigateTo(
             context,
             urlToRoute(items.items[index].item.buttons[2].url));
       }
     }
      // print('Click menu -> ${item.menuTitle}');
    }

    void onDismiss() {
      print('Menu is dismiss');
    }

    void maxColumn() {
      PopupMenu menu =
          items.items[index].item.buttons.length == 1 ? PopupMenu(
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
          onDismiss: onDismiss):
          items.items[index].item.buttons.length == 2 ?
          PopupMenu(
            // backgroundColor: Colors.teal,
            // lineColor: Colors.tealAccent,
              maxColumn: 2,
              items: [

                MenuItem(
                    title: items.items[index].item.buttons[0].text,
                    image: Icon(
                      Icons.cloud_download_outlined ,
                      color: Colors.white,
                    )),
                MenuItem(
                    title: items.items[index].item.buttons[1].text,
                    image: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                    )),

              ],

              onClickMenu: onClickMenu,
              stateChanged: stateChanged,
              onDismiss: onDismiss) :
          PopupMenu(
            // backgroundColor: Colors.teal,
            // lineColor: Colors.tealAccent,
              maxColumn: 3,
              items: [
                MenuItem(
                    title: items.items[index].item.buttons[0].text,
                    image: Icon(
                      Icons.cloud_download_outlined ,
                      color: Colors.white,
                    )),
                MenuItem(
                    title: items.items[index].item.buttons[1].text,
                    image: Icon(
                      Icons.star_border,
                      color: Colors.white,
                    )),
                   MenuItem(
                    title: items.items[index].item.buttons[2].text,
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
        padding: EdgeInsets.fromLTRB(0, 15, 10, 20),
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
        child: items.items[index].viewSeller(context)
    ));

    // children.add(items.items[index].viewSeller(context));
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

            throw 'Could not launch ';
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


class ShowPurchaseFile extends StatefulWidget {
  final String? file;
  final String? fz;
  final String? basename;

  ShowPurchaseFile({this.file, this.fz, this.basename});

  @override
  ShowPurchaseFileState createState() => ShowPurchaseFileState();
}


class ShowPurchaseFileState extends State<ShowPurchaseFile> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File? _fileFile;
  int _progress = 0;
 // final String file1;
  List<File> _mulitpleFiles = [];
 // ShowPurchaseFileState({this.file1});
  @override
  void initState() {
    super.initState();


  }
  //String file;
//  ShowImage({this.file});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
   // print('wf ==== ${widget.file}');
    var fl = widget.file!.replaceAll('cdn.', 'upload.');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0.0,

          title: Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: Text(
              'Download File',
              style: TextStyle(
                  fontFamily: "Gotik",
                  fontSize: 20.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        //resizeToAvoidBottomPadding: false,
        body:
        Center(
            child:  FileViewAttFix(
              st: this,
              getValue: (int? val){
                print('progress === $val');
                setState(() {
                  //progress = val;

                });
              },
              ctx : context,
              value: widget.basename,
              value1: fl,
              fz: widget.fz,
              caption: 'Sample',
            )
        )


    );

  }

}

////////////////////////////
