// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/MyFinance/my_finance_action.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/core/components/utility/secure/secure.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:projectscoid/models/cart_base.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'meta.dart';
import 'button.dart';
import 'package:projectscoid/models/Cart/cart_items_list_base.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:flutter_html/style.dart';
//import 'package:flutter_credit_card/credit_card_form.dart';
//import 'package:flutter_credit_card/credit_card_model.dart';
//import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:webview_flutter/webview_flutter.dart' as wv;
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart' ;
import 'dart:io';
import 'dart:ui' as ui;
import 'package:permission_handler/permission_handler.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

/** AUTOGENERATE OFF **/

class EmptyCartCartModel extends EmptyCartCartBase{

  Map<String, dynamic> json;
  EmptyCartCartModel(Map<String, dynamic> this.json):super(json); 
	  
}

class ApplyCouponCartModel extends ApplyCouponCartBase{

  Map<String, dynamic> json;
  ApplyCouponCartModel(Map<String, dynamic> this.json):super(json); 
	  
}


class CartModel extends CartBase{
  Map<String, dynamic> json;
  CartModel(Map<String, dynamic> this.json):super(json); 	

  
}
 
///////////////////////////////////
@JsonSerializable()
class ViewModelCartRev {
  int?   age;
  int?   cnt;
  int?   page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  //CartItems cart_items;

  double?available_balance;
  String? available_balance_str;
  double?total_harga;
  String? total_harga_str;
  String? coupon_code;
  int?coupon_value;
  String? coupon_value_str;
  double?payable_with_balance;
  String? payable_with_balance_str;
  double?total_tagihan;
  String? total_tagihan_str;
  CartItemsListingTools? cart_items;
  String? user_id;
  //
  ViewModelCartRev(
      this.id,
      this.available_balance,
      this.available_balance_str,
      this.total_harga,
      this.total_harga_str,
      this.coupon_code,
      this.coupon_value,
      this.coupon_value_str,
      this.payable_with_balance,
      this.payable_with_balance_str,
      this.total_tagihan,
      this.total_tagihan_str,
      this.cart_items,
      this.user_id,

      );


  factory ViewModelCartRev.fromJson(Map<String, dynamic> json) => _$ViewModelCartRevFromJson(json);

}
/*
ViewModelCartRev _$ViewModelCartRevFromJson(Map<String, dynamic> json) {
  return ViewModelCartRev(
      json['id'] as String,
      (json['available_balance'] as num)?.toDouble(),
      json['available_balance_str'] as String,
      (json['total_harga'] as num)?.toDouble(),
      json['total_harga_str'] as String,
      json['coupon_code'] as String,
      (json['coupon_value'] as num)?.toInt(),
      json['coupon_value_str'] as String,
      (json['payable_with_balance'] as num)?.toDouble(),
      json['payable_with_balance_str'] as String,
      (json['total_tagihan'] as num)?.toDouble(),
      json['total_tagihan_str'] as String,
    json['cart_items'] == null
        ? null
        : CartItemsListingTools.fromJson(json['cart_items'] as Map<String, dynamic>),
      json['user_id'] as String)
    ..age = json['age'] as int
    ..cnt = json['cnt'] as int
    ..page = json['page'] as int
    ..ttl = json['ttl'] as String
    ..pht = json['pht'] as String
    ..sbttl = json['sbttl'] as String;
}

 */

@JsonSerializable()
class CartViewSuperBaseRev {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelCartRev? model;
  CartViewSuperBaseRev(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      );


  factory CartViewSuperBaseRev.fromJson(Map<String, dynamic> json) => _$CartViewSuperBaseRevFromJson(json);

}
/*
CartViewSuperBaseRev _$CartViewSuperBaseRevFromJson(Map<String, dynamic> json) {
  return CartViewSuperBaseRev(
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
          : ViewModelCartRev.fromJson(json['model'] as Map<String, dynamic>));
}

 */



abstract class CartViewEvent extends Equatable {
  const CartViewEvent();
  @override
  List<Object> get props => [];

}

class CartViewIncrease extends CartViewEvent {
  @override
  String  toString() => 'CartViewIncrease';
}
class CartViewEmpty extends CartViewEvent {
  @override
  String  toString() => 'CartViewEmpty';
}

class CartViewDecrease extends CartViewEvent {
  @override
  String  toString() => 'CartViewDecrease';
}

class CartViewGet extends CartViewEvent {
  @override
  String  toString() => 'CartViewGet';
}

abstract class CartViewState extends Equatable {
  const CartViewState();
  @override
  List<Object> get props => [];
}

class CartViewUninitialized extends CartViewState {
  @override
  String  toString() => 'CartViewUninitialized';
}

class CartViewError extends CartViewState {
  @override
  String  toString() => 'CartViewError';
}

class CartViewLoaded extends CartViewState {
  final CartViewModel? cart_view;


  CartViewLoaded({
    this.cart_view,

  }) ;
  @override
  List<Object> get props => [cart_view!];

  CartViewLoaded copyWith({
    CartViewModel? cart_view,
  }) {
    return CartViewLoaded(
      cart_view: cart_view ?? this.cart_view,
    );
  }

  @override
  String  toString() =>
      'CartViewLoaded  CartView: ${ cart_view!.model.meta.title} ';
}


class CartGetView extends Bloc<CartViewEvent, CartViewState> {


  final ProjectscoidApplication application;
  final String? url;
  final String? id;
  CartGetView(this.application, this.url, this.id, CartViewState initialState):super(initialState);
  @override
  void dispose() {
    //super.dispose();
  }


  @override
  EventTransformer<CartViewEvent> transform<CartViewEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<CartViewEvent, CartViewState> transition) {
    print(transition);
  }

  @override
  get initialState => CartViewUninitialized();

  @override

  Stream<CartViewState> mapEventToState(CartViewEvent event) async* {
    final currentState = state;
    if (event is CartViewGet) {
      try {
        if (currentState is CartViewUninitialized){
          CartViewModel cart_view = await viewCart();
          yield CartViewLoaded( cart_view: cart_view);


        }
      } catch (_) {
        yield CartViewError();
      }
    } else if (event is CartViewIncrease){
      try {
        CartViewModel cart_view = await viewCart();
        yield CartViewLoaded( cart_view: cart_view);
      } catch (_) {
        yield CartViewError();
      }
    }
    else if (event is CartViewEmpty){
      try {
        CartViewModel cart_view = await viewCart();
        yield CartViewLoaded( cart_view: cart_view);
      } catch (_) {
        yield CartViewError();
      }
    }
    else if (event is CartViewDecrease){
      try {
        CartViewModel cart_view = await viewCart();
        yield CartViewLoaded( cart_view: cart_view);

      } catch (_) {
        yield CartViewError();
      }
    }
  }



  Future viewCart()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewCart;
    viewCart = await apiRepProvider!.getCartView(url! , id!, '123');
    return viewCart;
  }

/*
  Future<ProductReviewsListingModel> listingRefreshProductReviews() async {
    APIRepository apiRepProvider = application.projectsAPIRepository;
    int?page = 0;
    var dt  = ProductReviewsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
    final data = await _loadAndSaveProductReviewsListSearch(dt ,'',page);

    return data;
  }
  */

}



class CartViewModel  extends CartViewBase{
  Map<String, dynamic> json;
 // CartViewModel(Map<String, dynamic> this.json):super(json);
  CartViewModel(Map<String, dynamic> this.json):super(json){model = CartViewSuperBaseRev.fromJson(this.json);}
  CartGetView? cart_view;


  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          /*
          Expanded(
            child: InkWell(
              onTap: (){

              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "VOUCHER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),

           */
         // SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DepositBalanceMyFinance(id: 'model.model.user_id', title:'')),
                );

              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Deposit Fund",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: (){
                AppProvider.getRouter(context)!.navigateTo(
                    context,
                    "/public/browse_products/listing/12");
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildEmptyButtons(BuildContext context, CartViewModel mdl) {
    return
      Column(
        children:<Widget>[
          Divider(
            // color: Color(0xFFDBDBDB),
            thickness: 3,
            color: CurrentTheme.ShadeColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child:
            Column(
                children: <Widget>[
                  Divider(
                    // color: Color(0xFFDBDBDB),
                    thickness: 1,
                    color: CurrentTheme.ShadeColor,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height: 30.0,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Center(
                              child:  Text(
                                "Voucher",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),

                          ),
                        ),
                      ),
                      SizedBox(width: 40.0),
                      Expanded(
                        child: InkWell(
                          onTap: ()async{
                            SubModelController del;
                            String? delPath = Env.value!.baseUrl! + '/user/cart/empty_cart/${mdl.model.model.user_id}/123' ;
                            del = SubModelController(AppProvider.getApplication(context),
                                delPath,
                                null);
                            await del.getData();
                            _onEmpty();

                          },
                          child: Container(
                            height: 30.0,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              color: Color(0xFF404A5C),
                            ),
                            child: Center(
                              child: Text(
                                "Empty Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Divider(
                    // color: Color(0xFFDBDBDB),
                    thickness: 1,
                    color: CurrentTheme.ShadeColor,
                  ),
                ]
            ),
          )
        ]
      );


  }


  Widget _buildInvoice(BuildContext context, CartViewModel mdl) {
    TextStyle _statLabelTextStyle = const TextStyle(
      fontFamily: 'Roboto',
    //  color: Colors.black87,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );
    return
      Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             Divider(
               // color: Color(0xFFDBDBDB),
               thickness: 3,
               color: CurrentTheme.ShadeColor,
             ),

              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 13.0, right: 15.0 ),
                child : Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Text('Sub total', style: _statLabelTextStyle,),
                             Text(mdl.model.model.total_harga_str, style: _statLabelTextStyle),
                           ],
                       )
            ),
             Padding(
                 padding: const EdgeInsets.only(top: 10.0, left: 13.0, right: 15.0, bottom: 8.0 ),
                 child : Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Text('Payable with balance', style: _statLabelTextStyle,),
                           Text(mdl.model.model.payable_with_balance_str, style: _statLabelTextStyle),
                         ],
                       )
             ),
             Divider(
               // color: Color(0xFFDBDBDB),
               thickness: 3,
               color: CurrentTheme.ShadeColor,
             ),


             Padding(
                 padding: const EdgeInsets.only(top: 15.0, left: 13.0, right: 15.0 ),
                 child : Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text('Available balance', style: _statLabelTextStyle,),
                     Text(mdl.model.model.available_balance_str, style: _statLabelTextStyle,),
                   ],
                 )
             ),
             Padding(
                 padding: const EdgeInsets.only(top: 10.0, left: 13.0, right: 15.0, bottom: 8.0 ),
                 child : Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text('Total Tagihan', style:_statLabelTextStyle),
                     Text(mdl.model.model.total_tagihan_str, style: _statLabelTextStyle),
                   ],
                 )
             ),
             Divider(
               // color: Color(0xFFDBDBDB),
               thickness: 3,
               color: CurrentTheme.ShadeColor,
             ),
             /*
             Padding(
                 padding: const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0 ),
                 child :

                   SizedBox(
                   width: mediaQueryData.size.width,
                   height:mediaQueryData.size.height * 1/7,
                   child:


                         Column(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: <Widget>[
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text('Available balance', style: _totalSadeStyle,),
                                 Text(mdl.model.model.available_balance_str, style: _totalSadeStyle,),
                               ]
                             ),
                             Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: <Widget>[
                                   Text('Total', style: _totalSadeStyle),
                                   Text(mdl.model.model.total_tagihan_str, style: _totalSadeStyle),

                                 ]
                             ),


                           ],
                         ),




                 ),



             ),

              */

           ],

    );

  }

  Widget viewButton (BuildContext context, CartViewModel mdl){
    final size =MediaQuery.of(context).size;
    final width =size.width;
    APIRepository? apiRepProvider = AppProvider.getApplication(context).projectsAPIRepository;
    return
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
                child: mdl.model.model.total_tagihan ==  0.0 &&   mdl.model.model.payable_with_balance > 0.0 ? Text('Pay with balance ' +  mdl.model.model.payable_with_balance_str)  :   Text('Pay ' +  mdl.model.model.total_tagihan_str),
                style: ButtonStyle(
                            textStyle: MaterialStateProperty.all<TextStyle>( const TextStyle(color: Colors.white,)),
                            overlayColor : MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                            foregroundColor : MaterialStateProperty.all<Color>(const Color(0xFF037f51)),
                ),

                onPressed: ()async {
                  if(mdl.model.model.total_tagihan ==  0.0 &&   mdl.model.model.payable_with_balance > 0.0 ){
                    SubModelController paytransfer;
                    String? delPath = Env.value!.baseUrl! + '/user/checkout/pay_with_available_balance/${mdl.model.model.user_id}/123' ;
                    paytransfer = SubModelController(AppProvider.getApplication(context),
                        delPath,
                        null);
                    var data = await paytransfer.getData();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BalanceSent (buyinstruction: data,)),
                    );

                  }else{

                 //  var res = await apiRepProvider!.getCookies( Env.value!.baseUrl! + '/user/cart/view/${this.model.model.user_id}/123/ ');

                    var res = await apiRepProvider!.getCookies( Env.value!.baseUrl! + '/public/program/mobile_init');//'/user/cart/view');
                   //var res;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPayment(pay_method : mdl, cartCookies: res)),
                    );

                  }



                }
            )
          ]
      ),
    );
  }

  Widget buildCart(BuildContext context, State state, VoidCallback increment, VoidCallback decrement,CartViewModel mdl ) {
    return
      Stack(
          children: <Widget>[
                  SafeArea(

                      child: Column(
                        children: <Widget>[
                          Container(
                              height : 100,
                              child:_buildButtons(context),
                           ),



                          Container(
                                 height: mdl.model.model.cart_items.items.length * 240.0,
                                  child : ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: mdl.model.model.cart_items.items.length,
                                    itemBuilder: (context,position){
                                      ///
                                      /// Widget for list view slide delete
                                      ///
                                      ///
                                      ///

                                      SubModelController inc;
                                      String? delPath = Env.value!.baseUrl! + '/user/cart/cart_items_increase/${mdl.model.model.user_id}/123/${mdl.model.model.cart_items.items[position].cart_id.toString()}/${mdl.model.model.cart_items.items[position].total_price.round().toString()}' ;
                                      inc = SubModelController(AppProvider.getApplication(context),
                                          delPath,
                                          null);
                                      SubModelController dec;
                                      String? del1Path = Env.value!.baseUrl! + '/user/cart/cart_items_decrease/${mdl.model.model.user_id}/123/${mdl.model.model.cart_items.items[position].cart_id.toString()}/${mdl.model.model.cart_items.items[position].total_price.round().toString()}' ;
                                      dec = SubModelController(AppProvider.getApplication(context),
                                          del1Path,
                                          null);
                                      SubModelController del;

                                      String? del2Path = Env.value!.baseUrl! + '/user/cart/cart_items_remove/${mdl.model.model.user_id}/123/${mdl.model.model.cart_items.items[position].cart_id.toString()}/${mdl.model.model.cart_items.items[position].total_price.round().toString()}' ;
                                      del = SubModelController(AppProvider.getApplication(context),
                                          del2Path,
                                          null);

                                      return Slidable(
                                      // startActionPane: SlidableDrawerActionPane(),
                                       // actionExtentRatio: 0.25,
                                        key: Key(mdl.model.model.cart_items.items[position].id.toString()),
                                        startActionPane: ActionPane(
                                          // A motion is a widget used to control how the pane animates.
                                          motion: const ScrollMotion(),

                                          // A pane can dismiss the Slidable.
                                          dismissible: DismissiblePane(onDismissed: () {}),

                                          // All actions are defined in the children parameter.
                                          children:  [

                                            // A SlidableAction can have an icon and/or a label.
                                            SlidableAction(
                                              onPressed: (BuildContext? context)async{
                                                SubModelController del;
                                                String? delPath = Env.value!.baseUrl! + '/user/cart/cart_items_remove/${mdl.model.model.user_id}/123/${mdl.model.model.cart_items.items[position].cart_id.toString()}/${mdl.model.model.cart_items.items[position].total_price.round().toString()}' ;
                                                del = SubModelController(AppProvider.getApplication(context!),
                                                delPath,
                                                null);
                                                increment();
                                                del.getData();

                                                // ignore: unnecessary_non_null_assertion
                                                ScaffoldMessenger.of(context!)
                                                    .showSnackBar(const SnackBar(content: Text('cartDeleted'),duration: Duration(seconds: 2),backgroundColor: Colors.redAccent,));
                                                },
                                              backgroundColor: const Color(0xFFFE4A49),
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete,
                                              label: 'Delete',
                                            ),

                                          ],
                                        ),

                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
                                          /// Background Constructor for card
                                          child: Container(
                                            height: 300.0,
                                            padding: EdgeInsets.all(0.0),

                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Divider(
                                                  height: 1,
                                                  thickness: 1.0,
                                                  color: CurrentTheme.DisableTextColor,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                        padding: EdgeInsets.only(left: 10.0),

                                                        /// Image item
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors.white.withOpacity(0.1),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors.black12.withOpacity(0.1),
                                                                      blurRadius: 0.5,
                                                                      spreadRadius: 0.1)
                                                                ]),
                                                            child: mdl.model.model.cart_items.items[position].title.contains('browse_products')?
                                                            Icon(
                                                              Icons.cloud_download,
                                                              size: 70.0,
                                                              color: CurrentTheme.SecondaryAccentColor,
                                                            ) : mdl.model.model.cart_items.items[position].title.contains('browse_services')?
                                                            Icon(
                                                              Icons.work,
                                                              size: 70.0,
                                                              color: CurrentTheme.SecondaryAccentColor,
                                                            ):
                                                            Icon(
                                                              Icons.business_center,
                                                              size: 70.0,
                                                              color: CurrentTheme.SecondaryAccentColor,
                                                            )
                                                          /*Image.asset('assets/img/projectscoid.png',
                                                              height: 100.0,
                                                              width: 100.0,
                                                              fit: BoxFit.cover,
                                                            ) */
                                                           )),
                                                    Flexible(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(
                                                            top: 0.0, left: 10.0, right: 5.0),
                                                        child: Column(

                                                          /// Text Information Item
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: <Widget>[

                                                           // Padding(padding: EdgeInsets.only(top: 10.0)),
                                                            HtmlWidget(
                                                              readText(mdl.model.model.cart_items.items[position].title, 250),
                                                            // bodyPadding: EdgeInsets.only(top: 0.0, left: 0.0,right: 5.0, bottom: 0.0),
                                                              textStyle: TextStyle(
                                                                color: Colors.black54,
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 15.0,
                                                              ),
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
                                                                throw 'Could not launch';
                                                              },
                                                            ),
                                                            Padding(padding: EdgeInsets.only(top: 5.0)),
                                                            Text('${mdl.model.model.cart_items.items[position].item_price_str}', style: TextStyle(fontSize: 12),),


                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                          Padding(
                                                            padding: EdgeInsets.all(5.0),

                                                            /// Image item
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(
                                                                  top: 0.0, left: 0.0, right: 5.0),
                                                              child: Column(

                                                                /// Text Information Item
                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                  mainAxisAlignment: MainAxisAlignment.end,

                                                                  children: <Widget>[

                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                      children: <Widget>[
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              top: 10.0, left: 0.0),
                                                                          child: Container(
                                                                            width: 80.0,
                                                                            decoration: BoxDecoration(
                                                                                color: Colors.white70,
                                                                                border: Border.all(
                                                                                    color: Colors.black12.withOpacity(0.1))),
                                                                            child: Column(
                                                                              //mainAxisAlignment: MainAxisAlignment
                                                                               //   .spaceAround,
                                                                              children: <Widget>[
                                                                                ButtonBarTheme(
                                                                                  data: ButtonBarThemeData(
                                                                                    alignment: MainAxisAlignment.start,

                                                                                      buttonMinWidth: 18,
                                                                                    buttonHeight: 18
                                                                                  ),
                                                                                  child: ButtonBar(
                                                                                      alignment: MainAxisAlignment.start,
                                                                                      buttonHeight: 18,
                                                                                      buttonMinWidth: 18,
                                                                                      children: <Widget>[
                                                                                        TextButton(
                                                                                            child: Text('-'),
                                                                                            style: ButtonStyle(

                                                                                              // textStyle: Colors.white,
                                                                                              foregroundColor : MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                                                                              backgroundColor : MaterialStateProperty.all<Color>(Color(0xFF037f51)),
                                                                                            ),
                                                                                            onPressed: (){
                                                                                              //print('helooooooooooo');


                                                                                              dec.getData();
                                                                                              decrement();


                                                                                            }
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.symmetric(
                                                                                              horizontal: 20.0),
                                                                                          child:
                                                                                          Center(
                                                                                            child:  Text(mdl.model.model.cart_items.items[position].quantity.toString(),style: TextStyle(fontSize: 11),),

                                                                                          )
                                                                                        ),

                                                                                        TextButton(
                                                                                            child: Text('+'),
                                                                                            style: ButtonStyle(

                                                                                              // textStyle: Colors.white,
                                                                                              foregroundColor : MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                                                                              backgroundColor : MaterialStateProperty.all<Color>(Color(0xFF037f51)),
                                                                                            ),

                                                                                            onPressed: (){
                                                                                              //print('helooooooooooo');

                                                                                              inc.getData();
                                                                                              increment();





                                                                                            }
                                                                                        ),

                                                                                        TextButton(
                                                                                            child: Center(child: Icon(
                                                                                                        Icons.delete,
                                                                                                        color: Colors.red,
                                                                                                        size: 18,
                                                                                                      )),
                                                                                            style: ButtonStyle(

                                                                                              // textStyle: Colors.white,
                                                                                              foregroundColor : MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                                                                              backgroundColor : MaterialStateProperty.all<Color>(Colors.white),
                                                                                            ),

                                                                                            onPressed: (){
                                                                                              //print('helooooooooooo');

                                                                                              del.getData();
                                                                                              increment();




                                                                                            }
                                                                                        ),


                                                                                      ]
                                                                                  ),
                                                                                ),
                                                                                /// Decrease of value item
                                                                                /*
                                                                                GestureDetector(
                                                                                  onTap: ()async {
                                                                                    SubModelController dec;
                                                                                    String? delPath = Env.value!.baseUrl! + '/user/cart/cart_items_decrease/${mdl.model.model.user_id}/123/${mdl.model.model.cart_items.items[position].cart_id.toString()}/${mdl.model.model.cart_items.items[position].total_price.round().toString()}' ;
                                                                                    dec = SubModelController(AppProvider.getApplication(context),
                                                                                        delPath,
                                                                                        null);
                                                                                    await dec.getData();
                                                                                    decrement();
                                                                                    /*  state.setState(() {
                                                                                mdl.model.model.cart_items.items[position].total_price = mdl.model.model.cart_items.items[position].total_price - mdl.model.model.cart_items.items[position].item_price ;
                                                                                mdl.model.model.cart_items.items[position].quantity = mdl.model.model.cart_items.items[position].quantity - 1;
                                                                                // value = value - 1;
                                                                                //pay= 950 * value;
                                                                              }); */
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 25.0,
                                                                                    width: 25.0,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border(
                                                                                            right: BorderSide(
                                                                                                color: Colors.black12
                                                                                                    .withOpacity(0.1)))),
                                                                                    child: Center(child: Text("-")),
                                                                                  ),
                                                                                ),

                                                                                 */
                                                                                /*
                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(
                                                                                      horizontal: 18.0),
                                                                                  child: Text(mdl.model.model.cart_items.items[position].quantity.toString(),style: TextStyle(fontSize: 11),),
                                                                                ),

                                                                                ButtonBarTheme(
                                                                                  data: ButtonBarThemeData(
                                                                                      alignment: MainAxisAlignment.center,

                                                                                      buttonHeight: 25
                                                                                  ),
                                                                                  child: ButtonBar(
                                                                                      alignment: MainAxisAlignment.center,
                                                                                      buttonHeight: 25,
                                                                                      children: <Widget>[
                                                                                        TextButton(
                                                                                            child: Text('+'),
                                                                                            style: ButtonStyle(

                                                                                                // textStyle: Colors.white,
                                                                                                foregroundColor : MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                                                                                 backgroundColor : MaterialStateProperty.all<Color>(Color(0xFF037f51)),
                                                                                            ),

                                                                                            onPressed: ()async{
                                                                                              //print('helooooooooooo');
                                                                                              SubModelController inc;
                                                                                              String? delPath = Env.value!.baseUrl! + '/user/cart/cart_items_increase/${mdl.model.model.user_id}/123/${mdl.model.model.cart_items.items[position].cart_id.toString()}/${mdl.model.model.cart_items.items[position].total_price.round().toString()}' ;
                                                                                              inc = SubModelController(AppProvider.getApplication(context),
                                                                                                  delPath,
                                                                                                  null);
                                                                                              await inc.getData();
                                                                                              increment();
                                                                                            }
                                                                                        ),
                                                                                      ]
                                                                                  ),
                                                                                ),

                                                                                 */

                                                                                /// Increasing value of item
                                                                                /*
                                                                                GestureDetector(
                                                                                  onTap: ()async {
                                                                                    SubModelController inc;
                                                                                    String? delPath = Env.value!.baseUrl! + '/user/cart/cart_items_increase/${mdl.model.model.user_id}/123/${mdl.model.model.cart_items.items[position].cart_id.toString()}/${mdl.model.model.cart_items.items[position].total_price.round().toString()}' ;
                                                                                    inc = SubModelController(AppProvider.getApplication(context),
                                                                                        delPath,
                                                                                        null);
                                                                                    await inc.getData();
                                                                                    increment();
                                                                                    /*  state.setState(() {
                                                                                mdl.model.model.cart_items.items[position].total_price = mdl.model.model.cart_items.items[position].total_price + mdl.model.model.cart_items.items[position].item_price ;
                                                                                mdl.model.model.cart_items.items[position].quantity = mdl.model.model.cart_items.items[position].quantity + 1;
                                                                                //  value = value + 1;
                                                                                // pay = 950 * value;
                                                                              }); */
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 25.0,
                                                                                    width: 25.0,
                                                                                    decoration: BoxDecoration(
                                                                                        border: Border(
                                                                                            left: BorderSide(
                                                                                                color: Colors.black12
                                                                                                    .withOpacity(0.1)))),
                                                                                    child: Center(child: Text("+")),
                                                                                  ),

                                                                                ),
                                                                                */



                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(bottom: 10.0,
                                                                          top: 9.0, left: 2.0, right: 10.0),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                        children: <Widget>[
                                                                          /*   Padding(
                                                              padding: const EdgeInsets.only(left: 10.0),

                                                              /// Total price of item buy
                                                              child: Text(
                                                                'Total ',
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 15.5,
                                                                    fontFamily: "Sans"),
                                                              ),
                                                            ), */
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(left: 10.0),

                                                                            /// Total price of item buy
                                                                            child: Text(
                                                                              '${mdl.model.model.cart_items.items[position].total_price_str}',
                                                                              style: TextStyle(
                                                                                  color: Colors.black54,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontSize: 15.5,
                                                                                  fontFamily: "Sans"),
                                                                            ),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ),
                                                                    ]
                                                              )
                                                            )
                                                          )

                                                  ],
                                                ),
                                              //  Padding(padding: EdgeInsets.only(top: 8.0)),

                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    scrollDirection: Axis.vertical,
                                  )
                                  ),

                          _buildEmptyButtons(context, mdl),
                         Container(
                            height : 220,
                            child:_buildInvoice(context, mdl),
                          ),
                         Container(
                            height : 100,
                            child:viewButton(context, mdl),
                          ),

                        ]

                       )

                  )
           ]
      );

  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

  //@override
  Widget view1(BuildContext context, ScrollController controller, State st) {
   // viewChildren.clear();

   /* if (this.model.meta.before_title != null) {
      viewChildren.add(Padding(
        padding: const EdgeInsets.fromLTRB(
            8.0, 14.0, 8.0, 2.0),
        child: Html(data: this.model.meta.before_title),
      ));
    }
    if (this.model.meta.title != null) {
      viewChildren.add(Padding(
        padding: const EdgeInsets.fromLTRB(
            8.0, 14.0, 8.0, 2.0),
        child: Html(data: this.model.meta.title),
      ));
    }
    if (this.model.meta.after_title != null) {
      viewChildren.add(Padding(
        padding: const EdgeInsets.fromLTRB(
            10.0, 10.0, 10.0, 2.0),
        child: Html(data: this.model.meta.after_title),
      ));
    }
    if (this.model.meta.warning != null) {
      viewChildren.add(Padding(
        padding: const EdgeInsets.fromLTRB(
            8.0, 14.0, 8.0, 2.0),
        child: Html(data: this.model.meta.warning.message, defaultTextStyle: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: 12.0,
         ), padding: const EdgeInsets.fromLTRB(
            10.0, 10.0, 10.0, 2.0),
            backgroundColor: CurrentTheme.WarningColor),
      ));
    }

    if (this.model.meta.before_content != null) {
      viewChildren.add(Padding(
        padding: const EdgeInsets.fromLTRB(
            8.0, 14.0, 8.0, 2.0),
        child: Html(data: this.model.meta.before_content),
      ));
    }
     */
   // viewChildren.add(buildCart(context, state));
   /* viewChildren.add(viewAvailableBalance(context));
    viewChildren.add(viewTotalHarga(context));
    viewChildren.add(viewCouponCode(context));
    viewChildren.add(viewCouponValue(context));
    viewChildren.add(viewPayableWithBalance(context));
    viewChildren.add(viewTotalTagihan(context));
     */
    //
    /*
   if (this.model.meta.after_content != null) {
      viewChildren.add(Padding(
        padding: const EdgeInsets.fromLTRB(
            8.0, 14.0, 8.0, 2.0),
        child: Html(data: this.model.meta.after_content),
      ));
    }

    */

   // String? getPath = Env.value!.baseUrl! + '/user/cart/view/${this.model.model.user_id}/123/ ';
    String? getPath = Env.value!.baseUrl! + '/user/cart/view';

    cart_view =  CartGetView(AppProvider.getApplication(context),getPath, '${this.model.model.user_id}' , CartViewUninitialized());
    cart_view!.add(CartViewGet());




    return BlocBuilder<CartGetView, CartViewState>(
    //  cubit: cart_view,

      builder: (BuildContext context, CartViewState state) {
        if (state is CartViewUninitialized) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          return Center(
              child:CircularProgressIndicator(
                valueColor:AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
        if (state is CartViewError) {
          _onWidgetDidBuild(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                backgroundColor: Colors.red,
              ),
            );
          });
          return Center(
            child: Text('failed to ' + 'cart view'),
          );
        }
        if (state is CartViewLoaded) {
          return (SingleChildScrollView(
              controller: controller,
              physics: const AlwaysScrollableScrollPhysics(),
              reverse: false,

              child:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children:<Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          8.0, 14.0, 8.0, 2.0),
                      child: Html(data: this.model.meta.title,
                        style: {
                          "html": Style(
                            fontSize: FontSize.medium,
                          ),
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          8.0, 14.0, 8.0, 2.0),
                      child: Html(data: this.model.meta.warning.message,
                        style: {
                        "html": Style(
                        fontSize: FontSize.small,
                        padding: const EdgeInsets.fromLTRB(
                        10.0, 10.0, 10.0, 2.0),
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        backgroundColor: CurrentTheme.WarningColor
                        ),
                        },

                      ),
                    ),
                    buildCart(context, st, _onInc , _onDec,  state.cart_view!),

                  ]
              )
          ));

        }

        return const Center(
            child:CircularProgressIndicator(
              valueColor:AlwaysStoppedAnimation<Color>(
                  Colors.green),
            ));
      },
    );

  }


  void _onInc() {

    cart_view!.add(CartViewIncrease());

  }

  void _onEmpty() {

    cart_view!.add(CartViewEmpty());

  }
  void _onDec() {

    cart_view!.add(CartViewDecrease());

  }
}

class CartPayment extends StatefulWidget {
  final CartViewModel? pay_method;
  ScrollController? controller;
   String?  cartCookies;
  CartPayment({this.pay_method, this.cartCookies});
  @override
  CartPaymentState createState() => CartPaymentState();
}

class CartPaymentState extends State< CartPayment>  with RestorationMixin{
  ScrollController?  scrollController;
  /*
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

   */

  final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'CartPayment';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            backgroundColor: CurrentTheme.MainAccentColor,
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            elevation: 0.0,
            title: Row (
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0 , 0.0),
                  child:
                  Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Text(
                          readText('Checkout', 30),
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
              ],
            )


        ),
        body:
        ListView.builder(
          itemBuilder: (BuildContext context, int?index) {

            return   ListTile(
              leading: Icon(Icons.account_balance),
              title: index == 2 ? Text('Pay with QRIS'): widget.pay_method!.model.buttons[index!].text == 'Pay with PayPal'? Text('Pay with QRIS') : Text(widget.pay_method!.model.buttons[index].text),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: ()async {
                if (widget.pay_method!.model.buttons[index!].text ==
                    'Pay with Bank Transfer') {
                  SubModelController paytransfer;
                  String? delPath = Env.value!.baseUrl! +
                      '/user/checkout/pay_via_bank_transfer/${widget.pay_method!
                          .model.model.user_id}/123';
                  paytransfer =
                 SubModelController(AppProvider.getApplication(context),
                      delPath,
                      null);
                  var data = await paytransfer.getData();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        BuyInstructionSentTransf(buyinstruction: data,
                            userid: widget.pay_method!.model.model.user_id)),
                  );
                }
                else if (widget.pay_method!.model.buttons[index].text ==
                    'Pay with Credit Card' ) {
                  print('https://projects.co.id${widget.pay_method!.model.buttons[index].url}');

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        CreditCartPayment(urlCC: 'https://projects.co.id${widget.pay_method!.model.buttons[index].url}', paymethod : widget.pay_method, cartCookies: widget.cartCookies, index: index, header: 'Credit Card Payment')),
                  );

               //https://projects.co.id/user/checkout/pay_with_qris/
//https://api.projects.co.id/user/checkout/pay_with_qris/3a1711/theroot
                } else {
                  /*

                  final response = await http.get(Uri.https('api.projects.co.id', '/user/checkout/pay_with_qris/${widget.pay_method!.model.model.user_id}/1234'),
                      headers: <String, String>{
                        'Cookie': '${widget.cartCookies}',
                        'Content-Type': 'application/json; charset=UTF-8',
                      });

                  if (response.statusCode == 200) {
                    // If the server did return a 200 OK response,
                    // then parse the JSON.
                    //return Album.fromJson(jsonDecode(response.body));

                    // throwIfNoSuccess(response);
                    print('dataku123 ==== ${response.body}');
                    return jsonDecode('{}');

                  } else {
                    // If the server did not return a 200 OK response,
                    // then throw an exception.
                    throw Exception('Failed to load album');
                  }

                   */
                  /*

                 //https://api.projects.co.id/user/checkout/pay_with_qris/cd231c/irvanhermawan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        CreditCartP ayment(urlCC: 'https://api.projects.co.id/user/checkout/pay_with_qris/${widget.pay_method!.model.model.user_id}/1224', paymethod : widget.pay_method, cartCookies: widget.cartCookies, index: index, header: 'Credit Card Payment')),
                  );


                   */


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        QRISPayment(urlCC: Env.value!.baseUrl! + '/user/checkout/pay_with_qris/${widget.pay_method!.model.model.user_id}/1224', paymethod : widget.pay_method, cartCookies: widget.cartCookies, index: index,  header: 'Pay with QRIS')),
                  );





                }
              }

            );
          },
          itemCount: widget.pay_method!.model.buttons[1].text == 'Pay with PayPal' ? 2 : 3,

          controller: scrollController,
        ),

            /*
        widget.pay_method!.model.model.total_tagihan ==  0.0 &&   widget.pay_method!.model.model.payable_with_balance > 0.0 ?
        ListView(
                      children: <Widget>[



                        ListTile(
                          leading: Icon(Icons.account_balance),
                          title: Text(widget.pay_method!.model.buttons[0].text),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: ()async{
                            SubModelController paytransfer;
                            String? delPath = Env.value!.baseUrl! + '/user/checkout/pay_with_available_balance/${widget.pay_method!.model.model.user_id}/123' ;
                            paytransfer = SubModelController(AppProvider.getApplication(context),
                                delPath,
                                null);
                            var data = await paytransfer.getData();

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BalanceSent (buyinstruction: data,)),
                            );

                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.credit_card),
                          title: Text(widget.pay_method!.model.buttons[1].text),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                        ListTile(
                          leading: Icon(Icons.credit_card),
                          title: Text(widget.pay_method!.model.buttons[2].text),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        )

                      ],
                    ) :
        ListView(
                      children: <Widget>[

                        ListTile(
                          leading: Icon(Icons.account_balance),
                          title: Text(widget.pay_method!.model.buttons[0].text),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: ()async{
                            SubModelController paytransfer;
                            String? delPath = Env.value!.baseUrl! + '/user/checkout/pay_via_bank_transfer/${widget.pay_method!.model.model.user_id}/123' ;
                            paytransfer = SubModelController(AppProvider.getApplication(context),
                                delPath,
                                null);
                            var data = await paytransfer.getData();

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BuyInstructionSent (buyinstruction: data, userid: widget.pay_method!.model.model.user_id)),
                            );

                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.credit_card),
                          title: Text(widget.pay_method!.model.buttons[1].text),
                          trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: ()async{

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CreditCard()),
                              );

                            }
                        ),
                        ListTile(
                          leading: Icon(Icons.credit_card),
                          title: Text(widget.pay_method!.model.buttons[2].text),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_balance),
                          title: Text(widget.pay_method!.model.buttons[3].text),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_balance),
                          title: Text(widget.pay_method!.model.buttons[4].text),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_balance),
                          title: Text(widget.pay_method!.model.buttons[5].text),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: ()async{
                            SubModelController paytransfer;
                            String? delPath = Env.value!.baseUrl! + '/user/checkout/pay_with_available_balance/${widget.pay_method!.model.model.user_id}/123' ;
                            paytransfer = SubModelController(AppProvider.getApplication(context),
                                delPath,
                                null);
                            await paytransfer.getData();
                          },
                        ),


                        /*
                                    ListTile(
                                      leading: Icon(Icons.account_balance),
                                      title: Text(widget.pay_method!.model.buttons[3].text),
                                      trailing: Icon(Icons.keyboard_arrow_right),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.account_balance),
                                      title: Text(widget.pay_method!.model.buttons[4].text),
                                      trailing: Icon(Icons.keyboard_arrow_right),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.account_balance),
                                      title: Text(widget.pay_method!.model.buttons[5].text),
                                      trailing: Icon(Icons.keyboard_arrow_right),
                                      onTap: ()async{
                                        SubModelController paytransfer;
                                        String? delPath = Env.value!.baseUrl! + '/user/checkout/pay_with_available_balance/${widget.pay_method!.model.model.user_id}/123' ;
                                        paytransfer = SubModelController(AppProvider.getApplication(context),
                                            delPath,
                                            null);
                                        await paytransfer.getData();
                                      },
                                    ),

                                     */
                      ],
                    )

             */

    );


  }
}




class BuyInstructionSentTransf extends StatefulWidget {
  final dynamic  buyinstruction;
  final String? userid;
  ScrollController? controller;
  BuyInstructionSentTransf({this.buyinstruction, this.userid});
  @override
  BuyInstructionSentTransfState createState() => BuyInstructionSentTransfState();
}



class BuyInstructionSentTransfState extends State< BuyInstructionSentTransf>  with RestorationMixin{
  final formKey = GlobalKey<FormState>();

  final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'BuyIntructionSentTransf';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            backgroundColor: CurrentTheme.MainAccentColor,
            leading:IconButton(
              icon:Icon(Icons.close, color: CurrentTheme.DisableTextColor,),
              onPressed: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Projectscoid(id :  widget.userid!)),
                      (Route<dynamic> route) => false,
                );
              },
            ),
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            elevation: 0.0,
            title: Row (
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0 , 0.0),
                  child:
                  Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Buy Instruction Sent',
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
              ],
            )


        ),
        body:
        Form(
            key: formKey,
            child: SingleChildScrollView(
              // controller: controller,
              // physics: const AlwaysScrollableScrollPhysics(),
              // reverse: false,
              //  child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //    children: <Widget>[
              //header
              //    Padding(
              //       padding: const EdgeInsets.fromLTRB(
              //         8.0, 14.0, 8.0, 2.0),


              child:
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child:HtmlWidget(
                    widget.buyinstruction!['content'],

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
                     throw 'Could not launch';
                    },


                    onTapImage:(src) =>
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShowItemScreenshots(image:'$src')),
                        )




                ),
              )

            )
        )

    );


  }
}



class BuyInstructionSent extends StatefulWidget {
  final Map<String, dynamic>?  buyinstruction;
  final String? userid;
  ScrollController? controller;
  BuyInstructionSent({this.buyinstruction, this.userid});
  @override
  BuyInstructionSentState createState() => BuyInstructionSentState();
}



class BuyInstructionSentState extends State< BuyInstructionSent>  with RestorationMixin{
  final formKey = GlobalKey<FormState>();

  final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'BuyIntructionSent';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: CurrentTheme.MainAccentColor,
          leading:IconButton(
            icon:Icon(Icons.close, color: CurrentTheme.DisableTextColor,),
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Projectscoid(id :  widget.userid!)),
                    (Route<dynamic> route) => false,
              );
            },
          ),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          elevation: 0.0,
          title: Row (
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0 , 0.0),
                child:
                Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      Text(
                        readText(widget.buyinstruction!['title'], 30),
                        style: TextStyle(
                            fontFamily: "Gotik",
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
              ),
            ],
          )


      ),
      body:
      Form(
        key: formKey,
        child: SingleChildScrollView(
          // controller: controller,
          // physics: const AlwaysScrollableScrollPhysics(),
          // reverse: false,
          //  child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //    children: <Widget>[
          //header
          //    Padding(
          //       padding: const EdgeInsets.fromLTRB(
          //         8.0, 14.0, 8.0, 2.0),


          child: HtmlWidget(
              widget.buyinstruction!['content'],
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


              onTapImage:(src) =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowItemScreenshots(image:'$src')),
                  )




          ),
        )
      )

    );


  }
}



class QRISPayment extends StatefulWidget {
  final CartViewModel? paymethod;
  final String? urlCC;
  ScrollController? controller;
  String?   cartCookies;
  int?index;
  String? header;
  QRISPayment({this.urlCC, this.paymethod, this.cartCookies, this.index, this.header});
  @override
  QRISPaymentState createState() => QRISPaymentState();
}

class QRISPaymentState extends State< QRISPayment>  with RestorationMixin{
  ScrollController?  scrollController;
  SubModelController? QRIS;
  var viewQRIS;
  var isLoading = true;
  var isError = false;
  //int _counter = 0;
  GlobalKey _globalKey = GlobalKey();
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  ScrollController? controller;

  final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'Qris';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    Permission.values
        .where((permission) {
      if (Platform.isIOS) {
        return permission != Permission.unknown &&
            permission != Permission.sms &&
            permission != Permission.storage &&
            permission != Permission.ignoreBatteryOptimizations &&
            permission != Permission.accessMediaLocation &&
            permission != Permission.activityRecognition &&
            permission != Permission.manageExternalStorage &&
            permission != Permission.systemAlertWindow &&
            permission != Permission.requestInstallPackages &&
            permission != Permission.accessNotificationPolicy &&
            permission != Permission.bluetoothScan &&
            permission != Permission.bluetoothAdvertise &&
            permission != Permission.bluetoothConnect;
      } else {
        return permission == Permission.storage;
      }
    }).map((permission) => _requestPermission(permission));



  }

/*

  Future<bool> _requestPermission() async {
   // if (widget.platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
   // } else {
   //   return true;
   // }
    return false;
  }

 */

  Future<void> _requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }

  List<Widget> _getTitleWidget() {
    final List<Widget> children = [];
    children.add(_getTitleItemWidget('No',25));

    children.add(_getTitleItemWidget('Title',150));

    children.add(_getTitleItemWidget('Qty',30));

    children.add(_getTitleItemWidget('Price',90));
    children.add(_getTitleItemWidget('Total Price',90));


    return children;
  }

  Widget _generateFirstColumnRow(BuildContext context, int?index) {
    return Container(
      child: Text((index! + 1 ).toString()),
      width: 25,
      height: 56,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }


  Widget _getTitleItemWidget(String? label, double?width) {
    return Container(
      child: Text(label!, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }







  Widget _generateRightHandSideColumnRow(BuildContext context, int?index) {
    var rv =List.from(this.viewQRIS['model']['items']);





    final List<Widget> children = [];

    children.add(Container(
        width: 150,
        height: 56,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Html(data: rv[index!]['title'])
    ));
    children.add(Container(
        width: 30,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Text(rv[index]['quantity'].toString())
    ));
    children.add(Container(
        width: 80,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Text(rv[index]['price_str'], style: TextStyle(fontSize: 11))
    ));
    children.add(Container(
        width: 80,
        height: 56,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Text(rv[index]['total_str'], style: TextStyle(fontSize: 11))
    ));



    return Row(
        children: children

    );
  }


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
  }



    fetchData(SubModelController? Home, BuildContext context)async {
    if (this.viewQRIS == null) {

      final future = Home!.getData();
      future.then((value) {

       // print('here1 ${value['meta']['title']}');
        if(value['errors'].isNotEmpty){
          this.viewQRIS = value ;
         // print('here2');
          setState(() {
            isLoading = false;
            isError = true;
          });

        }else{
          this.viewQRIS = value;
         // print('here3');
          setState(() {
            isError = false;
            isLoading = false;
          });

        }





      }).catchError((Error){
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
        });
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);

    QRIS = SubModelController(AppProvider.getApplication(context),
        widget.urlCC,
        null);

    fetchData(QRIS, context);


    return Scaffold(
      appBar: AppBar(
          backgroundColor: CurrentTheme.MainAccentColor,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          elevation: 0.0,
          title: Row (
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0 , 0.0),
                child:
                Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.header!,
                        style: TextStyle(
                            fontFamily: "Gotik",
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
              ),
            ],
          )


      ),
      body:
        isLoading? Container() :

         isError? Container()

         :
    Screenshot(
    controller: screenshotController,
    child:
    SingleChildScrollView(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        reverse: false,

         child:Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: EdgeInsets.symmetric( horizontal: 10, vertical: 10),
               child:   Text('Order :  ${this.viewQRIS['model']['track_code']}', style: TextStyle(fontSize: 25)),
             ),
             Padding(
               padding: EdgeInsets.only(left: 10, bottom: 20),
               child:   Text('${this.viewQRIS['model']['user_name']}', style: TextStyle(fontSize: 22)),
             ),

             Center(
                 child:

                 RepaintBoundary(
                   key: _globalKey,
                   child:Container(
                             width: 260,
                               height: 260,
                               decoration:ShapeDecoration(
                                 shadows:[
                                   BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
                                 ],

                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(1.0),
                                   side: BorderSide(
                                       width: 1,
                                       color: Colors.white
                                   ),
                                 ),
                                 image:DecorationImage(
                                   image: NetworkImage(this.viewQRIS['model']['qr_image']),
                                   fit: BoxFit.contain,

                                 ),
                               ),
                             ),
                 ),
             ),
             Padding(
               padding: EdgeInsets.only(left: 10, bottom: 20),
               child:   Text('Untuk screenshot QR code QRIS klik tombol di bawah ini.', style: TextStyle(fontSize: 13)),
             ),
             ButtonBar(
                 alignment: MainAxisAlignment.center,
                 buttonMinWidth: 100,
                 children: <Widget>[
                   ElevatedButton(
                       child:Text('Screenshot'),


                       onPressed: ()async {
                         RenderRepaintBoundary boundary =
                         _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                         ui.Image image = await boundary.toImage();
                         ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png) as FutureOr<ByteData?>);
                         if (byteData != null) {
                           final result =
                           await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
                           print(result);
                           //_toastInfo(result.toString());
                         }

                         /*
                         _imageFile = null;
                         screenshotController
                             .capture(delay: Duration(milliseconds: 10))
                             .then((Uint8List image) async {
                           setState(() {
                             _imageFile = image;
                           });
                           final result =
                           await ImageGallerySaver.saveImage(image); // Save image to gallery,  Needs plugin  https://pub.dev/packages/image_gallery_saver
                           print("File Saved to Gallery");
                         }).catchError((onError) {
                           print(onError);
                         });

                          */


                       }
                   )
                 ]
             ),

                Container(

                 child: HorizontalDataTable(
                   leftHandSideColumnWidth: 50,
                   rightHandSideColumnWidth: 900,
                   isFixedHeader: true,
                   headerWidgets: _getTitleWidget(),
                   leftSideItemBuilder: _generateFirstColumnRow,
                   rightSideItemBuilder: _generateRightHandSideColumnRow,
                   itemCount: this.viewQRIS['model']['items'].length,

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
                 height: 100 + double.parse(this.viewQRIS['model']['items'].length.toString()) * 80 ,

             ),



                  Center(
                      child:Text('Total Sum :  ${this.viewQRIS['model']['total_sum_str']}', style: TextStyle(fontSize: 23)),
                    )



           ],
         )
      )
    )






    );


  }


}



class CreditCartPayment extends StatefulWidget {
  final CartViewModel? paymethod;
  final String? urlCC;
  ScrollController? controller;
  String?   cartCookies;
  int?index;
  String? header;
  CreditCartPayment({this.urlCC, this.paymethod, this.cartCookies, this.index, this.header});
  @override
  CreditCartPaymentState createState() => CreditCartPaymentState();
}

class CreditCartPaymentState extends State< CreditCartPayment>  with RestorationMixin{
  ScrollController?  scrollController;

  final Completer<wv.WebViewController> _controller =
  Completer<wv.WebViewController>();
 // InAppWebViewController _webViewController1;
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }


  final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'CCPayment';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
   // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }



  final cookieManager = WebviewCookieManager();

  //InAppWebViewController _webViewController1;

 // CookieManager _cookieManager = CookieManager.instance();

  @override
  Widget build(BuildContext context) {
    /*
    _controller.future.then((controller) {
      _webViewController = controller;
      Map<String, String> header = {'Cookie':'${widget.cartCookies}'};
      _webViewController.loadUrl(widget.urlCC, headers: header);
    });

     */


    return Scaffold(
      appBar: AppBar(
          backgroundColor: CurrentTheme.MainAccentColor,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          elevation: 0.0,
          title: Row (
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0 , 0.0),
                child:
                Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.header!,
                        style: TextStyle(
                            fontFamily: "Gotik",
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
              ),
            ],
          )


      ),
      body:
          /*
      InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(widget.urlCC)),
        initialOptions: InAppWebViewGroupOptions(
          android: AndroidInAppWebViewOptions(
              textZoom: 100,
              useWideViewPort: true,
              layoutAlgorithm: AndroidLayoutAlgorithm.TEXT_AUTOSIZING,
             // minimumFontSize: 8,
             // preferredContentMode: UserPreferredContentMode.RECOMMENDED
             ),
          ),

      onWebViewCreated: (controller) async{
        await _cookieManager.deleteAllCookies();
          _webViewController1 = controller;
          _webViewController1.loadUrl(urlRequest: URLRequest(url: Uri.parse(widget.urlCC), headers: header));
        },
      ),

           */

      wv.WebView(
       // initialUrl: widget.urlCC,
       // initialUrl: 'https://projects.co.id' ,
        javascriptMode: JavascriptMode.unrestricted,

        onWebViewCreated: (wv.WebViewController webViewController)async {
          await cookieManager.clearCookies();
         // await WebviewCookieManager().setCookies(

         // );
         // print('cookie   ${widget.cartCookies}; pro_v=6628968bb49ff10aaecce3d9788e6365124d5bf1026468c661284f9b10d19964; pro_s=4bbc1f017b4cf4af37f63abaa12d3c951f106b0473536e9e8975dd1e54a57e17; _gat=1');

         Map<String, String> header = {'Cookie':'${widget.cartCookies}'};

          await webViewController.loadUrl(widget.urlCC!, headers:header);

            _controller.complete(webViewController);
        },
        onWebResourceError: (WebResourceError error){
          print('error = ${error.description} ');

        },
        // TODO(iskakaushik): Remove this when collection literals makes it to stable.
        // ignore: prefer_collection_literals
        javascriptChannels: <JavascriptChannel>[
          _toasterJavascriptChannel(context),
        ].toSet(),
        navigationDelegate: (wv.NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('blocking navigation to $request}');
            return wv.NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return wv.NavigationDecision.navigate;
        },
        onPageStarted: (String? url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String? url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
      ),




    );


  }
}



class BalanceSent extends StatefulWidget {
  final Map<String, dynamic>?  buyinstruction;
  ScrollController? controller;
  BalanceSent({this.buyinstruction});
  @override
  BalanceSentState createState() => BalanceSentState();
}



class BalanceSentState extends State< BalanceSent>  with RestorationMixin{
  final formKey = GlobalKey<FormState>();

  final RestorableInt _counter = RestorableInt(0);
  bool isLoading = false;

  @override
  String? get restorationId => 'BalanceSent';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            backgroundColor: CurrentTheme.MainAccentColor,
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            elevation: 0.0,
            title: Row (
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0 , 0.0),
                  child:
                  Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Text(
                          readText(widget.buyinstruction!['meta']['title'], 30),
                          style: TextStyle(
                              fontFamily: "Gotik",
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
              ],
            )


        ),
        body:

        isLoading?
        Center(
          child:CircularProgressIndicator(
        valueColor:AlwaysStoppedAnimation<Color>(
            Colors.green),
    )
        ):
        Form(
            key: formKey,
            child: SingleChildScrollView(
              // controller: controller,
              // physics: const AlwaysScrollableScrollPhysics(),
              // reverse: false,
              //  child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //    children: <Widget>[
              //header
              //    Padding(
              //       padding: const EdgeInsets.fromLTRB(
              //         8.0, 14.0, 8.0, 2.0),


              child:
                Column(
                        children: <Widget>[
                          ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                           // isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'username',
                              widget.buyinstruction!['model']['user_name'],
                            ]
                        ),
                          ItemListString(
                            // icon: Icons.calendar_today,
                              tooltip: 'Send message',
                             // isDark: darkMode,
                              onPressed: (){
                              },
                              lines: <String>[
                                'AVAILABLE BALANCE',
                              widget.buyinstruction!['model']['available_balance_str'],
                              ]
                          ),
                          ElevatedButton(
                              child:  Text('Pay with Available Balance'),
                              style: ButtonStyle(
                                textStyle: MaterialStateProperty.all<TextStyle>( const TextStyle(color: Colors.white,)),
                                overlayColor : MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                foregroundColor : MaterialStateProperty.all<Color>(const Color(0xFF037f51)),
                              ),
                            onPressed:  ()async{
                                SubModelController paytransfer;
                                String? delPath = Env.value!.baseUrl! + '/user/checkout/pay_with_available_balance/${widget.buyinstruction!['model']['user_id']}/123' ;
                                paytransfer = SubModelController(AppProvider.getApplication(context),
                                    delPath,
                                    {
                                      "user[_trigger_]": "pay_with_available_balance"
                                    }
                                    );

                               // var data =  await paytransfer.sendData();

                                setState(() {
                                  isLoading = true;
                                });
                                try{
                                  final future = await paytransfer.sendData();
                                  future.then((value) {
                                    setState(() {
                                      isLoading = false;
                                    });

                                    print('ini value $value');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BuyInstructionSent (buyinstruction: value,userid: widget.buyinstruction!['model']['user_id'])),
                                    );
                                  }).catchError((Error){
                                    setState(() {
                                      isLoading = false;
                                    });

                                    print('Error = $Error');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BuyInstructionSent (buyinstruction: {
                                        "title": "Payment Complete",
                                        "content": "Your payment Success"
                                      },userid: widget.buyinstruction!['model']['user_id'])),
                                    );
                                  });
                                }catch(error){
                                  print('error   $error');
                                  if(error.toString().contains('302')){
                                    setState(() {
                                      isLoading = false;
                                    });

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BuyInstructionSent (buyinstruction: {
                                        "title": "Order Complete",
                                        "content": "\r\n\r\n\r\n<h1 class=\"title\">Order Complete<\/h1>\r\n\r\n<img class=\"img-responsive pull-right\" src=\"https:\/\/cdn.projects.co.id\/assets\/cartoon300\/12817090_xxl_2.png\"> \r\n<p>Selamat, pembayaran Anda telah berhasil.<\/p>\r\n<p>Jika Anda membeli produk digital, kami akan segera mengirim link untuk mendownload produk melalui email dan notivikasi.<\/p>\r\n<p>Jika Anda membayar untuk project, kami telah mengirimkan pemberitahuan kepada worker\/freelancer terpilih untuk segera memulai pekerjaan.<\/p>\r\n<p>Terima kasih telah menggunakan jasa Projects.co.id untuk membeli produk digital dan pengerjaan projects.<\/p>\r\n<p>Anda dapat melihat detail transaksi Anda dengan mengklik tombol di bawah ini.<\/p>\r\n\r\n<a class=\"btn green\" href=\"https:\/\/projects.co.id\/user\/my_orders\/view\/0b9614\/0b9614\">View Order<\/a>\r\n\r\n\r\n"
                                      }, userid: widget.buyinstruction!['model']['user_id'],)),
                                    );
                                  }


                                }

                              },
                          )
                        ],
                )
            )
        )


    );


  }
}


//class BuyInstructionSent extends Sta
///////////////////////////////////////////////////


class CartListingModel extends CartListingBase{
  Map<String, dynamic> json;
  CartListingModel(Map<String, dynamic> this.json):super(json);  

}

//class ItemCart extends class ItemCartBase{
//
//}



////////////////////////////
/*
class CreditCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreditCardState();
  }
}

class CreditCardState extends State<CreditCard> {
  String? cardNumber = '';
  String? expiryDate = '';
  String? cardHolderName = '';
  String? cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumberDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: const Text(
                            'Validate',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
                          ),
                        ),
                        color: const Color(0xff1b447b),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            print('valid!');
                            String? txt = "test1234";
                            var myPublic = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAivRSxN2wgd0ienmdEs3ZiBbmsC9Wul1cpIb5PJbR0cwSy4HDoX6UeLYkM4IAwKaVkx5L52tNYn1gBDaK3BWvlhQ97z7olKmRjTNYaQSkY9I+KyQ9zsjJIWAkVsVHBxb1GV5rx6KaRW84ieLPy/ds5snPcTUyRkrnHVWRGSw7fA/0b4hEgRWRXKW2VdSkqswo84PrB3xo1Dx/lJM3TNHjmXO4quM70s6RfHnKfbQLm8BdQjYQAzwNcb2LnO1xYZ33zANy9LE6D/VHdl6R8eCH9EJPNc+n+G/4UPoJIQ7fKs1DOwEQsPIJdoCGEXL4KsyEOdMCAfnQgmHyjW7vEg2Q/wIDAQAB';
                            List<int> encodeTxt = txt.codeUnits;
                            String? ecdtx = SDKBase64.encode(encodeTxt);
                            rsaEncrypt(myPublic, encodeTxt);
                            print("test Data encript = .............." + ecdtx);

                           // print('cadr number =  $cardNumber');
                          } else {
                            print('invalid!');
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

 */



/*
class SDKBase64
{
  static final List<int> ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".codeUnits;

  //SDKBase64() {}

  static String? encode(List<int> buf)
  {
    Utf8Decoder decoder;
    String? rtn = '';//decoder.convert(buf);
    int?size = buf.length;
    print('buf length${buf.length.toString()}');
    var ar =List<int>((size + 2) ~/ 3 * 4);
    int?a = 0;
    int?b2;
    int?mask;
    for (int i = 0; i < size; (ar[a++] = ALPHABET[b2 & mask])) {
      int?b0 = buf[i++];

      int?b1 = ((i < size) ? buf[i++] : 0);
      b2 = ((i < size) ? buf[i++] : 0);
      mask = 63;
      ar[a++] = ALPHABET[(b0 >> 2) & mask];
      ar[a++] = ALPHABET[((b0 << 4) | ((b1 & 255) >> 4)) & mask];
      ar[a++] = ALPHABET[((b1 << 2) | ((b2 & 255) >> 6)) & mask];
    }
  //  rtn = String.fromCharCodes(ar);

    switch(size % 3) {
      case 1: {
        --a;
        ar[a] = 61;
        --a;
        ar[a] = 61;
        rtn = String.fromCharCodes(ar);
       // rtn = String.fromCharCodes(ar);
      }
      break;

      case 2: {
        --a;
        ar[a] = 61;
        rtn = String.fromCharCodes(ar);
      }
      break;

      default: {
        rtn = String.fromCharCodes(ar);
      }
      break;
    }
    return rtn;
    /*
    switch ((size % 3)) {
      case 1:
        --a;
        ar[a] = 61;
      case 2:
        --a;
        ar[a] = 61;
      default:
        return decoder.convert(ar);
    }

     */
  }
}

 */
