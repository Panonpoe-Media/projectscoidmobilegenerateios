import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/views/route.dart';


/** AUTOGENERATE OFF **/

class AddToCartBrowseProducts extends StatefulWidget {

  static const String PATH = '/public/browse_products/add_to_cart/:id/:title';
  final String? id ;
  final String? title;
  AddToCartBrowseProducts({Key?key, this.id, this.title}) : super(key: key);

  @override
  AddToCartBrowseProductsState createState() => AddToCartBrowseProductsState();
}

class AddToCartBrowseProductsState extends State<AddToCartBrowseProducts>{
  /*
  String getPath = Env.value!.baseUrl! + '/public/browse_products/add_to_cart/%s/%s';
 // String sendPath = Env.value!.baseUrl! + '/public/browse_products/add';
  String sendPath = Env.value!.baseUrl! + '/public/browse_products/add_to_cart/%s/%s';
	String getPath1 = Env.value!.baseUrl! + '/user/cart/view/%s/%s';
	BrowseProductsController add_to_cart;
	CartController cart;
	String idHash = '';
  final formKey = GlobalKey<FormState>();

   */
  String getPath = Env.value!.baseUrl! + '/public/browse_products/add_to_cart/%s/%s';
  BrowseProductsController? add_to_cart;
  var model;
  var isLoading = true;
  var isError = false;
  ScrollController? controller;

  /*
  List<bool> validation = [];
  //var modelAddToCart;
  var model;
	var model1;
  var formData;
  var postAddToCartResult;
  var isLoading = true;
	var isLoading1 = true;
  var isError = false;

   */

  late BehaviorSubject<dynamic> _cartController;
  // final _cartController = BehaviorSubject();
  // var viewCart;
  Stream<dynamic> get onMessage => _cartController.stream;
  final List<Widget> actionChildren = <Widget>[
	];
  @override
  initState(){
    super.initState();
    controller = ScrollController();
    _cartController = BehaviorSubject<dynamic>.seeded([]);
   // validation.add(true);
  }

 fetchData(BrowseProductsController? add_to_cart)async {
    if (this.model == null) {
       final future = add_to_cart!.editAddToCartBrowseProducts();
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          this.model = value;
		  if(this.model.model.meta == null){
            isError = true;
          }
        }).catchError((Error){
		   isError = true;
		});
      }
    }



/*
  fetchData1(CartController cart, BuildContext context)async {
		if (this.model1 == null) {
			final hash = cart.getHash();
			hash.then((value) {
				this.idHash = value;
			});
			final future = cart.viewCart();
			future.then((value) {
				setState(() {
					isLoading1 = false;
				});
				this.model1 = value;

			});
		}
	}

 */

  fetchData1(SubModelController cart, BuildContext context)async {

    final c = cart.getData();
    c.then((value) {
      _cartController.add(value);

      //this.idHash = value;
    });

  }
  Future<bool> _onWillPop() async{
    Navigator.pop(context); Navigator.pop(context);
    return false;
  }
  @override
  Widget build(BuildContext context) {
    bool _dialVisible = true;




    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      //  color: Colors.black87,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );
    TextStyle _totalStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
    );
    TextStyle _totalSadeStyle = TextStyle(
      fontFamily: 'Roboto',
      color: CurrentTheme.ShadeColor,
      fontSize: 18.0,
      fontWeight: FontWeight.w900,
    );
    final size =MediaQuery.of(context).size;
    final width =size.width;
    APIRepository? apiRepProvider = AppProvider.getApplication(context).projectsAPIRepository;


    add_to_cart = BrowseProductsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id,
        widget.title,
        null,
        false);

    fetchData(add_to_cart);

    SubModelController _cart;
    String cartPath = Env.value!.baseUrl! + '/user/cart/view' ;
    _cart =  SubModelController(AppProvider.getApplication(context),
        cartPath,
        null);

    fetchData1(_cart, context);

    return
      WillPopScope(
        onWillPop: _onWillPop,
        child:

        Scaffold(
      appBar: AppBar(   automaticallyImplyLeading: false,
          title:
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: _onWillPop,
                  child:
                  Padding(padding: EdgeInsets.only(right: 6.0),
                    child: Icon(Icons.arrow_back,
                        color: Colors.white),

                  ),
                ),
                Text('Shopping Cart', style: TextStyle(color: Colors.white),),
              ]
          ),),
      body:
      StreamBuilder<dynamic>(//
          stream: onMessage,
          initialData: [],
          builder: (context, AsyncSnapshot<dynamic>  snapshot) {

            if( snapshot.hasData) {
              if(snapshot.data.isEmpty){
                return Container();
              }
              // return Text('${jsonEncode(snapshot.data['model'])}');

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
                          child: Html(data: snapshot.data['meta']['title'],
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
                          child: Html(data: snapshot.data['meta']['warning']['message'],
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
                        Stack(
                            children: <Widget>[
                              SafeArea(

                                  child: Column(
                                      children: <Widget>[
                                        Container(
                                          height : 100,
                                          child:Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                            child: Row(
                                              children: <Widget>[

                                                // SizedBox(width: 10.0),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: (){
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => DepositBalanceMyFinance(id: snapshot.data['model']['user_id'], title:'')),
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
                                          ),
                                        ),



                                        Container(
                                            height: snapshot.data['model']['cart_items']['items'].length * 240.0,
                                            child : ListView.builder(
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: snapshot.data['model']['cart_items']['items'].length,
                                              itemBuilder: (context,position){
                                                ///
                                                /// Widget for list view slide delete
                                                ///
                                                ///
                                                ///

                                                SubModelController inc;
                                                String delPath = Env.value!.baseUrl! + '/user/cart/cart_items_increase/${snapshot.data['model']['user_id']}/123/${snapshot.data['model']['cart_items']['items'][position]['cart_id'].toString()}/${snapshot.data['model']['cart_items']['items'][position]['total_price'].round().toString()}' ;
                                                inc =  SubModelController(AppProvider.getApplication(context),
                                                    delPath,
                                                    null);
                                                SubModelController dec;
                                                String del1Path = Env.value!.baseUrl! + '/user/cart/cart_items_decrease/${snapshot.data['model']['user_id']}/123/${snapshot.data['model']['cart_items']['items'][position]['cart_id'].toString()}/${snapshot.data['model']['cart_items']['items'][position]['total_price'].round().toString()}' ;
                                                dec =  SubModelController(AppProvider.getApplication(context),
                                                    del1Path,
                                                    null);
                                                SubModelController del;

                                                String del2Path = Env.value!.baseUrl! + '/user/cart/cart_items_remove/${snapshot.data['model']['user_id']}/123/${snapshot.data['model']['cart_items']['items'][position]['cart_id'].toString()}/${snapshot.data['model']['cart_items']['items'][position]['total_price'].round().toString()}' ;
                                                del =  SubModelController(AppProvider.getApplication(context),
                                                    del2Path,
                                                    null);

                                                return Slidable(

                                                  key: Key(snapshot.data['model']['cart_items']['items'][position]['id'].toString()),

                                                  // The start action pane is the one at the left or the top side.
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
                                                          String delPath = Env.value!.baseUrl! + '/user/cart/cart_items_remove/${snapshot.data['model']['user_id']}/123/${snapshot.data['model']['cart_items']['items'][position]['cart_id'].toString()}/${snapshot.data['model']['cart_items']['items'][position]['total_price'].round().toString()}' ;
                                                          del =  SubModelController(AppProvider.getApplication(context!),
                                                              delPath,
                                                              null);

                                                          // del.getData();
                                                          // fetchData1(_cart, context);
                                                          final ic = del.getData1();
                                                          ic.then((value) {
                                                            _cartController.add(value);

                                                          });

                                                          /*  state.setState(() {
                                                snapshot.data['model']['cart_items']['items'].removeAt(position);

                                              }); */

                                                          ///
                                                          /// SnackBar show if cart delete
                                                          ///
                                                          Scaffold.of(context!)
                                                              .showSnackBar(SnackBar(content: Text('cartDeleted'),duration: Duration(seconds: 2),backgroundColor: Colors.redAccent,));

                                                        },
                                                        backgroundColor: Color(0xFFFE4A49),
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
                                                                      child: snapshot.data['model']['cart_items']['items'][position]['title'].contains('browse_products')?
                                                                      Icon(
                                                                        Icons.cloud_download,
                                                                        size: 70.0,
                                                                        color: CurrentTheme.SecondaryAccentColor,
                                                                      ) : snapshot.data['model']['cart_items']['items'][position]['title'].contains('browse_services')?
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
                                                                        readText(snapshot.data['model']['cart_items']['items'][position]['title'], 250),
                                                                        // bodyPadding: EdgeInsets.only(top: 0.0, left: 0.0,right: 5.0, bottom: 0.0),
                                                                        textStyle: TextStyle(
                                                                          color: Colors.black54,
                                                                          fontWeight: FontWeight.w500,
                                                                          fontSize: 15.0,
                                                                        ),
                                                                        onTapUrl: (url) async{
                                                                          if(url.contains('projects.co.id')){


                                                                            if(url.contains(RegExp(r'[0-9]'))){
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
                                                                      Padding(padding: EdgeInsets.only(top: 5.0)),
                                                                      Text('${snapshot.data['model']['cart_items']['items'][position]['item_price_str']}', style: TextStyle(fontSize: 12),),


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
                                                                                                      //dec.getData1();
                                                                                                      // fetchData1(_cart, context);

                                                                                                      final ic = dec.getData1();
                                                                                                      ic.then((value) {
                                                                                                        _cartController.add(value);

                                                                                                      });


                                                                                                    }
                                                                                                ),
                                                                                                Padding(
                                                                                                    padding: const EdgeInsets.symmetric(
                                                                                                        horizontal: 20.0),
                                                                                                    child:
                                                                                                    Center(
                                                                                                      child:  Text(snapshot.data['model']['cart_items']['items'][position]['quantity'].toString(),style: TextStyle(fontSize: 11),),

                                                                                                    )
                                                                                                ),

                                                                                                TextButton(
                                                                                                    child: Text('+'),
                                                                                                    style: ButtonStyle(

                                                                                                      // textStyle: Colors.white,
                                                                                                      foregroundColor : MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                                                                                      backgroundColor : MaterialStateProperty.all<Color>(Color(0xFF037f51)),
                                                                                                    ),

                                                                                                    onPressed: ()async{
                                                                                                      //print('helooooooooooo');
                                                                                                      final ic = inc.getData1();
                                                                                                      ic.then((value) {
                                                                                                        _cartController.add(value);

                                                                                                      });

                                                                                                      // fetchData1(_cart, context);







                                                                                                    }
                                                                                                ),

                                                                                                TextButton(
                                                                                                    child: Center(child: Icon(
                                                                                                      Icons.delete,
                                                                                                      color: Colors.red,
                                                                                                      size: 18,
                                                                                                    )),
                                                                                                    style: ButtonStyle(

                                                                                                      foregroundColor : MaterialStateProperty.all<Color>(CurrentTheme.ShadeColor),
                                                                                                      backgroundColor : MaterialStateProperty.all<Color>(Colors.white),
                                                                                                    ),

                                                                                                    onPressed: ()async{
                                                                                                      //print('helooooooooooo');
                                                                                                      final ic = del.getData1();
                                                                                                      ic.then((value) {
                                                                                                        _cartController.add(value);

                                                                                                      });
                                                                                                      // del.getData();
                                                                                                      // fetchData1(_cart, context);

                                                                                                      // textStyle: Colors.white,




                                                                                                    }
                                                                                                ),


                                                                                              ]
                                                                                          ),
                                                                                        ),




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
                                                                                      '${snapshot.data['model']['cart_items']['items'][position]['total_price_str']}',
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
                                                                String delPath = Env.value!.baseUrl! + '/user/cart/empty_cart/${snapshot.data['model']['user_id']}/123' ;
                                                                del =  SubModelController(AppProvider.getApplication(context),
                                                                    delPath,
                                                                    null);
                                                                // await del.getData();
                                                                // _onEmpty();
                                                                final ic = del.getData1();
                                                                ic.then((value) {
                                                                  _cartController.add(value);

                                                                });

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
                                        ),
                                        Container(
                                          height : 220,
                                          child:Column(
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
                                                      Text(snapshot.data['model']['total_harga_str'], style: _statLabelTextStyle),
                                                    ],
                                                  )
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.only(top: 10.0, left: 13.0, right: 15.0, bottom: 8.0 ),
                                                  child : Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      Text('Payable with balance', style: _statLabelTextStyle,),
                                                      Text(snapshot.data['model']['payable_with_balance_str'], style: _statLabelTextStyle),
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
                                                      Text(snapshot.data['model']['available_balance_str'], style: _statLabelTextStyle,),
                                                    ],
                                                  )
                                              ),
                                              Padding(
                                                  padding: const EdgeInsets.only(top: 10.0, left: 13.0, right: 15.0, bottom: 8.0 ),
                                                  child : Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      Text('Total Tagihan', style:_statLabelTextStyle),
                                                      Text(snapshot.data['model']['total_tagihan_str'], style: _statLabelTextStyle),
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

                                          ),
                                        ),
                                        Container(
                                          height : 100,
                                          child:ButtonBarTheme(
                                            data: ButtonBarThemeData(
                                              alignment: MainAxisAlignment.center,
                                              buttonMinWidth: 0.9 * width,
                                            ),
                                            child: ButtonBar(
                                                alignment: MainAxisAlignment.center,
                                                buttonMinWidth: 0.9 * width,
                                                children: <Widget>[
                                                  RaisedButton(
                                                      child: snapshot.data['model']['total_tagihan'] ==  0.0 &&   snapshot.data['model']['payable_with_balance'] > 0.0 ? Text('Pay with balance ' +  snapshot.data['model']['payable_with_balance_str'])  :   Text('Pay ' +  snapshot.data['model']['total_tagihan_str']),
                                                      textColor: Colors.white,
                                                      splashColor : CurrentTheme.ShadeColor,
                                                      color : Color(0xFF037f51),
                                                      onPressed: ()async {
                                                        if(snapshot.data['model']['total_tagihan'] ==  0.0 &&    snapshot.data['model']['payable_with_balance'] > 0.0 ){
                                                          SubModelController paytransfer;
                                                          String delPath = Env.value!.baseUrl! + '/user/checkout/pay_with_available_balance/${snapshot.data['model']['user_id']}/123' ;
                                                          paytransfer =  SubModelController(AppProvider.getApplication(context),
                                                              delPath,
                                                              null);
                                                          var data = await paytransfer.getData();

                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(builder: (context) => BalanceSent (buyinstruction: data,)),
                                                          );

                                                        }else{

                                                          //  var res = await apiRepProvider.getCookies( Env.value!.baseUrl! + '/user/cart/view/${this.model.model.user_id}/123/ ');

                                                          if(snapshot.data['model']['total_tagihan'] >  0.0){
                                                            var res = await apiRepProvider!.getCookies( Env.value!.baseUrl! + '/public/program/mobile_init');//'/user/cart/view');
                                                            //var res;
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) => CartPayment(pay_method : CartViewModel(snapshot.data), cartCookies: res)),
                                                            );

                                                          }


                                                        }



                                                      }
                                                  )
                                                ]
                                            ),
                                          ),
                                        ),

                                      ]

                                  )

                              )
                            ]
                        )


                      ]
                  )



              ));




            }
            if(snapshot.hasError){
              return Text('error');
            }
            return Container();

          }
      ),

      //  floatingActionButton: isLoading? null :  this.model.Buttons(context, _dialVisible)
        )
      );


   /*


    add_to_cart = BrowseProductsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id,
        widget.title,
        null,
		false);

		isLoading1? fetchData(add_to_cart) : null;

		cart =  CartController(AppProvider.getApplication(context),
				getPath1,
				AppAction.view,
				widget.id,
				widget.title,

				null,
				false);

		fetchData1(cart, context);

		return Scaffold(
				appBar: isLoading?  AppBar(title: Text('', style : TextStyle( color: Colors.white, )), iconTheme: IconThemeData(
					color: Colors.white, //change your color here
				),)
						: isLoading1? AppBar(title: Text('', style : TextStyle( color: Colors.white, )), iconTheme: IconThemeData(
					color: Colors.white, //change your color here
				),)
						: AppBar(title: Text('Shooping Cart', style : TextStyle( color: Colors.white, )), iconTheme: IconThemeData(
						color: Colors.white),),
				body:isLoading?
				Container(width: 0.0, height: 0.0)
						:isLoading1?
				Container(width: 0.0, height: 0.0)
				    :
				Form(
						key: formKey,
						child: this.model1.view1(context, controller, this)
				),
			//	floatingActionButton: isLoading? null :  this.model1.Buttons(context, _dialVisible)
		);

*/


/*
      return Scaffold(
          appBar: AppBar(
            title: Text('Add to Cart'),
          ),
          body:isLoading? 
             // Center(
             //   child: CircularProgressIndicator(),
             // )
              Center( 
           child:CircularProgressIndicator(
           valueColor: AlwaysStoppedAnimation<Color>(
            Colors.green),
          )):isError? 
		  Form(
              key: formKey,
              child: SingleChildScrollView(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  reverse: false,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
					  children: isLoading? null :[

                       Padding(
                          padding: const EdgeInsets.fromLTRB(
                              8.0, 14.0, 8.0, 2.0),
                          child:  Html(data: 'Unauthorized page :'+ sprintf(getPath, [widget.id,widget.title]) ),
                        ),
					  				  
					  ]
                   
                  )

              )
          )
             :Form(
              key: formKey,
              child: SingleChildScrollView(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  reverse: false,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
					  children: isLoading? null :[
					  
								/* Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: this.model.model.meta.include_before),
								  ),*/
								/*
                              		1) before_title
									2) title
									3) after_title
									4) warning / error
									5) before_content
									6) content
									7) after_content						
								*/  
								  
								
								 this.model.model.meta.before_title == null ? Container(width: 0.0, height: 0.0) : Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child:  Html(data: this.model.model.meta.before_title,									
									  onLinkTap: (url) async{
											if(url.contains('projects.co.id')){
												if(url.contains(RegExp(r'[0-9]'))){
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
										  }),

									),
								 
								 Padding(padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child:  Html(data: this.model.model.meta.title,
																			onLinkTap: (url) async{
											if(url.contains('projects.co.id')){
												if(url.contains(RegExp(r'[0-9]'))){
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
										  }
									),
								),								

								this.model.model.meta.after_title == null ? Container(width: 0.0, height: 0.0) :
								  Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: this.model.model.meta.after_title,
																			onLinkTap: (url) async{
											if(url.contains('projects.co.id')){
												if(url.contains(RegExp(r'[0-9]'))){
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
										  }
									),
								  ),
									  
								this.model.model.meta.warning == null ? Container(width: 0.0, height: 0.0) :
								  Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: this.model.model.meta.warning.message, backgroundColor: CurrentTheme.WarningColor,
																			onLinkTap: (url) async{
											if(url.contains('projects.co.id')){
												if(url.contains(RegExp(r'[0-9]'))){
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
										  }
									),
								  ),
									  
								this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
								  Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: this.model.model.meta.before_content,
										onLinkTap: (url) async{
											if(url.contains('projects.co.id')){
												if(url.contains(RegExp(r'[0-9]'))){
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
										  }),
									),
								  
									  
								//	this.model.viewTitle(context),
									this.model.viewShortDescription(context),
								//	this.model.viewPrice(context),
								//	this.model.viewSeller(context),
								  
								 this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
								  Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: this.model.model.meta.after_content,
																			onLinkTap: (url) async{
											if(url.contains('projects.co.id')){
												if(url.contains(RegExp(r'[0-9]'))){
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
										  }
									),
								  ),
									
								/* Padding(
										padding: const EdgeInsets.fromLTRB(
											8.0, 14.0, 8.0, 2.0),
										child: Html(data: this.model.model.meta.after_after),
									   ), */
					  
					  
					  ]
                   
                  )

              )
          ),

		    floatingActionButton: isLoading?  null : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,add_to_cart, postAddToCartResult, this, sendPath, widget.id, widget.title)


      );

 */
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}

