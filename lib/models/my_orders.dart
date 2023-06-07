


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
import 'dart:async';
import 'dart:io';
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
import 'package:projectscoid/views/route.dart' as rt;
import 'package:projectscoid/models/MyOrders/action.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:intl/intl.dart'as intl1;
import 'package:string_mask/string_mask.dart';
import 'package:string_mask/src/mask_pattern.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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


  Widget RButtonActionMyOrdersWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyOrdersController my_orders,
      var postMyOrdersResult, State state, String? sendPath, String? id,  String? title){
    var cl;
    var ic;
    // final size =MediaQuery.of(context).size;
    double? width = 400;
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
    if (button.icon == 'fa fa-send'){
      ic = Icons.send;
    }
    if (button.icon == 'fa fa-comments'){
      ic = Icons.comment_bank;
    }
    if (button.icon == 'fa fa-files-o'){
      ic = Icons.file_copy_outlined;
    }

    if(button.type == 'custom_filter'){
      return (
          ElevatedButton(
              child: button.text == 'Order by ...' ?  Text(button!.text!) : Text('Order : ' + button!.text!),
              style: ButtonStyle(
                textStyle:
                MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Colors.white)),
                backgroundColor:
                MaterialStateProperty.all<Color>(
                    const Color(0xFF037f51)),
              ),
              onPressed: () {
                showSearchSelectDialog(context: context,
                    caption:button!.text!,
                    initialitems: button.selections,
                    initvalue: button!.selections![0]);
              }
          )
      );
    }else{
      return(
          ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.43 * width,
              children: <Widget>[
                ElevatedButton(
                    child:   Row(
                      children: [
                        Icon(ic, size: 20),
                        SizedBox(width: 5,),
                        Text(button!.text!)
                      ],
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                      overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                    ),


                    // color : Color(0xFF037f51),
                    onPressed: () async{
                      controller.animateTo(controller.position.minScrollExtent,
                          duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                      if (formKey.currentState.validate()) {

                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        var formData = await convertFormDataConfirmPayment(button!.text!, model
                            , attachmentlast
                        );
                        my_orders = new MyOrdersController(AppProvider.getApplication(context),
                            sendPath,
                            AppAction.post,
                            id,
                            title,
                            formData,
                            false);
                        if([ 'PlaceNewBid'].contains('ConfirmPayment')){
                          my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.project_title);
                        }else if(['AskOwner'].contains('ConfirmPayment')){
                          my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.project_id.toString());
                        }else if(['HireMe'].contains('ConfirmPayment')){
                          my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.private_worker_id.toString());
                        }else if(['InviteToBid'].contains('ConfirmPayment')){
                          my_orders.deleteAllConfirmPaymentMyOrders(this.model.model.user_id);
                        }else{
                          my_orders.deleteAllConfirmPaymentMyOrders('');
                        }
                        if(sendPath!.contains('%s')){
                          final future = my_orders.postConfirmPaymentMyOrdersWithID();
                          future.then((value) {
                            state.setState(() {
                              postMyOrdersResult = value;
                            });
                          }).catchError((Error){
                            AppProvider.getRouter(context)!.pop(context);
                            // AppProvider.getRouter(context)!.pop(context);

                            /*
                            	   model.model.transfer_date,
			                           model.model.amount,
                             */


                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  DashBoardScreen(account:title, id : id, date: model.model.transfer_date,amount : model.model.amount )),
                                //  (Route<dynamic> route) => false,
                            );

                          /*
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => rt.UserMyOrdersIndex(id :  id!)),
                                  (Route<dynamic> route) => false,
                            );

                           */
                          });
                        }else{
                          final future = my_orders.postConfirmPaymentMyOrders();
                          future.then((value) {
                            state.setState(() {
                              postMyOrdersResult = value;
                            });
                          }).catchError((Error){
                            AppProvider.getRouter(context)!.pop(context);
                            // AppProvider.getRouter(context)!.pop(context);

                            if(Error.toString().contains('302')){

                             /*

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => rt.UserMyOrdersIndex(id :  id!)),
                                    (Route<dynamic> route) => false,
                              );




                              */
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  DashBoardScreen(account:title,  id: id, date: model.model.transfer_date,amount : model.model.amount )),
                                  //  (Route<dynamic> route) => false,
                              );


                            }else if(Error.toString().contains('429')){
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => rt.LoginLinkView(id :  id!, title: 'Anda Terkena Pembatasan Limit',)),
                                    (Route<dynamic> route) => false,
                              );
                            }else{


                            }


                          });
                        }


                      } else {}
                    }


                )
              ]
          )
      );
    }

  }


}


class DashBoardScreen extends StatelessWidget {
  final String? account;
  final String? id;
  final DateTime? date ;
  final double? amount ;
  const DashBoardScreen({Key? key,this.account, this.id,  this.date, this.amount}) : super(key: key);

  SizedBox addVerticalSpace(double value) {
    return SizedBox(
      height: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    //print('yang ditunggu $id');
    return SafeArea(
      child: WillPopScope(
      onWillPop: () async{
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Projectscoid(id : account,isChat: true, ctx : null)),
              (Route<dynamic> route) => false,
        );

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading:IconButton(
              icon:const Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: ()async{

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Projectscoid(id : account,isChat: true, ctx : null)),
                      (Route<dynamic> route) => false,
                );


              }
          ),
          //iconTheme: IconThemeData(
          //  color: Colors.white, //change your color here
          // ),

          title: const Text('Bank Transfer' , style : TextStyle( color: Colors.white, ))  ,
          // title: selected? buildSearchBar(title) : Text(title , style : TextStyle( color: Colors.white, ))  ,
        ),
        backgroundColor: Colors.white60,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              addVerticalSpace(20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child:
                Text(
                  'Silahkan lakukan transfer pembayaran untuk order $id sebesar:',
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),

              addVerticalSpace(10.0),
              BalanceCard(
                  date: date!,amount: amount!
              ),
              addVerticalSpace(10.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child:
                Text(
                  'Tranfer ke salah satu rekening Projects.co.id a.n. Panonpoe Media PT:',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child:
                SelectableText(
                  '- BCA                  : 4373037667',

                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child:
                SelectableText(
                  '- BNI                   : 13100115570639',

                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child:
                SelectableText(
                  '- Mandiri            : 13100115570639',

                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child:
                SelectableText(
                  '- CIMB Niaga     : 0260109113009',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child:
                SelectableText(
                  '- BRI                   : 035401001596306',

                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),

           ]
          )

        ),
       ),
      )
    );
  }
}


class BalanceCard extends StatelessWidget {

  final DateTime? date ;
  final double? amount ;
  const BalanceCard( {Key? key,this.date, this.amount}) : super(key: key);

  SizedBox addVerticalSpace(double value) {
    return SizedBox(
      height: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    var dateformat = intl1.DateFormat('dd/MM/yyyy  hh:mm:ss');
    var maskOptions = MaskOptions()
      ..reverse = true;
    var formatter = StringMask('#.##0', options: maskOptions);
    return InkWell(

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 25.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dateformat.format(date!),
                style: const TextStyle(color: Colors.white60),
              ),
              addVerticalSpace(30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Rp ${formatter.apply(amount!.toInt().toString())},00',
                      style: const TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60),
                    ),
                  ),


            ],
          ),
              Row(
                children:[
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white54),),
                      onPressed: (){
                        Clipboard.setData(ClipboardData(text: amount!.toInt().toString()));
                      },
                      child: const Text("Copy", style: TextStyle(color: Colors.white),)
                  ),

                ],
              ),
        ],

        ),
       ),
      )
    );
  }
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

  Widget printButton(BuildContext context){
    return(
            Row(
              children: [
                const Expanded( child : Padding(
                       padding: EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
                       child:null,
                    ),
                ),
                Padding(

                  padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                  child:
                  ButtonTheme(

                    child: ButtonBar(
                      alignment : MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(

                            backgroundColor:
                            MaterialStateProperty.all<Color>( Colors.grey),

                          ),
                          child: const Text('Print', style: TextStyle(color: CurrentTheme.BackgroundColor)),
                          onPressed:   ()async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PdfPreviewPage(invoice: model),
                              ),
                            );

                          },

                        ),
                      ],
                    ),
                  ),
                )
              ],
            )

    );
  }

  @override
  Widget view (BuildContext context, ScrollController controller, bool?account, bool _isBannerAdReady,  _bannerAd) {


    viewChildren.clear();


    viewChildren.add(printButton(context));
    viewChildren.add(viewTrackCode1(context));
    viewChildren.add(viewDate(context));
    viewChildren.add(viewStatus1(context));
    viewChildren.add(viewPaymentMethod1(context));
    viewChildren.add(viewTotalPrice(context));
    viewChildren.add(viewUsedBalance(context));
    viewChildren.add(viewTotalSum(context));
    viewChildren.add(viewTable(context));
   // viewChildren.add(viewTable(context));


    viewChildren!.add(

        Column(
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
            const SizedBox(
              height: 10,
            ),
          ],
        )
    );
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


class PdfPreviewPage extends StatelessWidget {
  final MyOrdersSuperBaseRev invoice;

   PdfPreviewPage({Key? key, required this.invoice}) : super(key: key);
  String? _logo;
  String? _bgShape;
  static const _darkColor = PdfColors.blueGrey800;
  static const _lightColor = PdfColors.white;
  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }



  Future<void> _saveAsFile(
      BuildContext context,
      LayoutCallback build,
      PdfPageFormat pageFormat,
      ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File(appDocPath + '/' + 'document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }






  @override
  Widget build(BuildContext context) {
    final actions = <PdfPreviewAction>[

      PdfPreviewAction(
        icon: const Icon(Icons.save),
        onPressed: _saveAsFile,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Order'),
      ),
      body: PdfPreview(

        maxPageWidth: 700,
        build: (format) => buildPdf(invoice, format),
         actions: actions,
         onPrinted: _showPrintedToast,
         onShared: _showSharedToast,
      ),
    );
  }

  Future<Uint8List> buildPdf(MyOrdersSuperBaseRev invoice,
      PdfPageFormat pageFormat) async {
    // Create a PDF document.

    final doc = pw.Document();

    _logo = await rootBundle.loadString('assets/img/projectscoid.svg');
    _bgShape = await rootBundle.loadString('assets/img/invoice.svg');

    // Add page to the PDF
    doc.addPage(
      pw.MultiPage(
        pageTheme: _buildTheme(
          pageFormat,
          await PdfGoogleFonts.robotoRegular(),
          await PdfGoogleFonts.robotoBold(),
          await PdfGoogleFonts.robotoItalic(),
        ),
        header: _buildHeader,
        footer: _buildFooter,
        build: (context) =>
        [
          _contentHeader(context),
          _contentTable(context),
          pw.SizedBox(height: 20),
          _contentFooter(context),
          pw.SizedBox(height: 20),
        //_termsAndConditions(context),
        ],
      ),
    );


    // Return the PDF file content
    return doc.save();
  }

  pw.PageTheme _buildTheme(PdfPageFormat pageFormat, pw.Font base, pw.Font bold, pw.Font italic) {
    return pw.PageTheme(
      pageFormat: pageFormat,
      theme: pw.ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
      buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.SvgImage(svg: _bgShape!),
      ),
    );
  }

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Column(
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: pw.Column(
                children: [
                  pw.Container(
                    height: 50,
                    padding: const pw.EdgeInsets.only(left: 20),
                    alignment: pw.Alignment.centerLeft,
                    child: pw.Text(
                      'VIEW ORDER',
                      style: pw.TextStyle(
                        color: PdfColors.grey700,
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  pw.Container(
                    decoration: pw.BoxDecoration(
                      borderRadius:
                      const pw.BorderRadius.all(pw.Radius.circular(2)),
                      color: PdfColors.grey700,
                    ),
                    padding: const pw.EdgeInsets.only(
                        left: 40, top: 10, bottom: 10, right: 10),
                    alignment: pw.Alignment.centerLeft,
                    height: 60,
                    child: pw.DefaultTextStyle(
                      style: pw.TextStyle(
                        color: PdfColors.white,
                        fontSize: 10,
                      ),
                      child: pw.GridView(
                        crossAxisCount: 2,
                        children: [
                          pw.Text('Track Code #'),
                          pw.Text(invoice!.model!.track_code!),
                          pw.Text('Date:'),
                          pw.Text(_formatDate(invoice!.model!.date!)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            pw.Expanded(
              child: pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Container(
                    alignment: pw.Alignment.topRight,
                    padding: const pw.EdgeInsets.only(bottom: 8, left: 30),
                    height: 72,
                    child:
                    _logo != null ? pw.SvgImage(svg: _logo!) : pw.PdfLogo(),
                  ),
                  // pw.Container(
                  //   color: baseColor,
                  //   padding: pw.EdgeInsets.only(top: 3),
                  // ),
                ],
              ),
            ),
          ],
        ),
        if (context.pageNumber > 1) pw.SizedBox(height: 20)
      ],
    );
  }

  pw.Widget _buildFooter(pw.Context context) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Container(
          height: 20,
          width: 100,
          child: pw.BarcodeWidget(
            barcode: pw.Barcode.pdf417(),
            data: 'Order ID# ${invoice!.model!.order_id!}',
            drawText: false,
          ),
        ),
        pw.Text(
          'Page ${context.pageNumber}/${context.pagesCount}',
          style: const pw.TextStyle(
            fontSize: 12,
            color: PdfColors.white,
          ),
        ),
      ],
    );
  }

  pw.Widget _contentHeader(pw.Context context) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: pw.Container(
            margin: const pw.EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            child: pw.FittedBox(
              child: pw.Text(
                'Status: ${invoice.model!.status_str!.split('>')[1].split('<')[0]}',

                style: pw.TextStyle(
                  color: PdfColors.grey700,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            margin: const pw.EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            child: pw.FittedBox(
              child: pw.Text(
                'Total Sum: ${invoice.model!.total_sum_str}',
                style: pw.TextStyle(
                  color: PdfColors.grey700,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
            ),
          ),
        ),


        pw.Expanded(
          child: pw.Container(
            margin: const pw.EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            child: pw.FittedBox(
              child: pw.Text(
                'Total Price: ${invoice.model!.total_price_str}',
                style: pw.TextStyle(
                  color: PdfColors.grey700,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            margin: const pw.EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            child: pw.FittedBox(
              child: pw.Text(
                'User Balance: ${invoice.model!.used_balance_str}',
                style: pw.TextStyle(
                  color: PdfColors.grey700,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  pw.Widget _contentTable(pw.Context context) {
    const tableHeaders = [
      'No',
      'Item Description',
      'Price',
      'Quantity',
      'Total'
    ];

    return pw.Table.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.center,
      headerAlignment: pw.Alignment.center,
      headerDecoration: const pw.BoxDecoration(
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
        color:PdfColors.grey400,
      ),
      headerHeight: 25,
      cellHeight: 40,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.centerLeft,
        4: pw.Alignment.centerRight,
      },
      headerStyle: pw.TextStyle(
        color: PdfColors.blueGrey800,
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(
        color: _darkColor,
        fontSize: 8,
      ),
      rowDecoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColors.blueGrey900,
            width: .5,
          ),
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
            (col) => tableHeaders[col],
      ),
      data: List<List<String>>.generate(
        invoice.items!.length,
            (row) => List<String>.generate(
          tableHeaders.length,
              (col) {

                  switch (col) {
                    case 0:
                      return invoice.items![row]!.no.toString()+ '        ';
                    case 1:
                      return Bidi.stripHtmlIfNeeded(invoice.items![row]!.title!);
                    case 2:
                      return invoice.items![row]!.price_str!;
                    case 3:
                      return '       ' + invoice.items![row]!.quantity.toString()! +  '               ';
                    case 4:
                      return invoice.items![row]!.total_str!;
                  }
                  return '';

              },
        ),
      ),
    );
  }

pw.Widget _contentFooter(pw.Context context) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 2,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Thank you for your business',
                style: pw.TextStyle(
                  color: _darkColor,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.Container(
                margin: const pw.EdgeInsets.only(top: 20, bottom: 8),
                child:    pw.Text(
                  'Payment Method',
                  style: const pw.TextStyle(
                    fontSize: 8,

                    color: _darkColor,
                  ),
                ),
              ),
              pw.Text(
                invoice.model!.payment_method_str! ,
                style: pw.TextStyle(
                  color: PdfColors.grey700,
                  lineSpacing: 5,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.DefaultTextStyle(
            style: const pw.TextStyle(
              fontSize: 10,
              color: _darkColor,
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Total Price:'),
                    pw.Text(invoice.model!.total_price_str!),
                  ],
                ),
                pw.SizedBox(height: 5),
                pw.Divider(color: PdfColors.blueGrey900),
                pw.DefaultTextStyle(
                  style: pw.TextStyle(
                    color: PdfColors.grey700,
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('Total Sum:'),
                      pw.Text(invoice.model!.total_sum_str!),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _formatCurrency(double amount) {
    return 'Rp ${amount.toStringAsFixed(2)}';
  }

  String _formatDate(DateTime date) {
   // var dateformat =
    final format = intl1.DateFormat('dd/MM/yyyy  hh:mm:ss');
    return format.format(date);
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
