
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/app/Env.dart';
import '../repository/APIRepository.dart';
import 'meta.dart';
import 'button.dart';
import 'credit.dart';
import 'payment.dart';
import 'package:projectscoid/core/components/utility/tool/expand_space_bar.dart';
import 'photo.dart';
import 'package:projectscoid/models/my_finance_base.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
import 'package:projectscoid/views/route.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/models/MyFinance/action.dart';
import 'package:projectscoid/models/model.dart';

part 'my_finance.g.dart';
/** AUTOGENERATE OFF **/

class ChangePaymentSettingsMyFinanceModel extends ChangePaymentSettingsMyFinanceBase{
  String? verData = '';
  Map<String, dynamic> json;
  ChangePaymentSettingsMyFinanceModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget editBank (State state) {
    return(
        ModelWidget(
          value:  model.model.bank_id,
          caption: 'Bank',
          hint: 'pilih Model',
          required:true,
          idenum: model.model.bank_list,
          nameenum: model.model.bank_list_str,
          getValue: (int? val) {
            state.setState(() {
              model.model.bank_id = val;
            });
          },
        ));}

  Widget editSecureCode (State state) {
    return(
        SecureWidget(
          value: model.model.secure_code,
          caption: 'SecureCode',
          hint: 'Isi dengan secure code Anda',
          required:true,
          isEmail: true,
          verified: verData,
          getValue: (String? val) {
            print('aku disini ya $val');
            state.setState(() {
              model.model.secure_code = val;
            });
          },
          getVerified:(String? val) {
            state.setState(() {
              verData = val!;
            });
          },
        ));}
  @override
  Widget editCutOffPeriod (State state) {
    //model.model.cutoff_period_id = 4;
    return(
        EnumWidget(
          value: model.model.cutoff_period_id,
          caption: 'Cut-off Period',
          hint: 'pilih Enum',
          required: true,
          idenum: model.model.cutoff_period_list,
          nameenum: model.model.cutoff_period_list_str,
          getValue: (int? val) {
            state.setState(() {
              model.model.cutoff_period_id = val;
            });
          },
        ));}

  @override
  Widget editCutOffAmount (State state) {
    var min;
    bool low = false;
    //var ca;
    String? enumname = model.model.bank_list_str[model.model.bank_list.indexOf(model.model.bank_id)];

    if(enumname!.contains('BNI')|| enumname!.contains('BCA') || enumname!.contains('Mandiri') ||enumname!.contains('CIMB')){
      min = '9999';
      low = true;
     // state.setState(() {
        model.model.cutoff_amount = 10000.0;
     // });
     // ca = 10000;
    }else{
      min = '57499';
     // state.setState(() {
        model.model.cutoff_amount = 57500.0;
     // });
     // ca = model.model.cutoff_amount;
    }
    return model.model.cutoff_period_id == 4 ?
    Container()
        :
    (
        MoneyView(value: low ? 10000.0 : 57500.0,
                  caption:'Cut-off Amount' ,
        )
    );
    /*
    return(
        MoneyWidget(
        //  value: model.model.cutoff_amount,
          value: low ? 10000.0 : 57500.0,
          caption: 'Cut-off Amount',
          hint: 'Isi dengan Money Anda',
          required: true,
          min:min,
          max:'100000000',
          getValue: (double? val) {
            state.setState(() {
              model.model.cutoff_amount = val;
            });
          },
        ));

     */
  }

}

class WithdrawPaymentMyFinanceModel extends WithdrawPaymentMyFinanceBase{
  String? verData = '';
  Map<String, dynamic> json;
  WithdrawPaymentMyFinanceModel(Map<String, dynamic> this.json):super(json);
  Widget editSecureCode (State state) {
    return(
        Column(
          children: <Widget>[
            SecureWidget(
              value: model.model.secure_code,
              caption: 'SecureCode',
              hint: 'Isi dengan secure code Anda',
              required:true,
              isEmail: true,
              verified: verData,
              getValue: (String? val) {
                state.setState(() {
                  model.model.secure_code = val;
                });
              },
              getVerified:(String? val) {
                state.setState(() {
                  verData = val!;
                });
              },
            ),
            Container(height: 100,)
          ],
        )
      );}


	  
}

class DepositBalanceMyFinanceModel extends DepositBalanceMyFinanceBase{

  Map<String, dynamic> json;
  DepositBalanceMyFinanceModel(Map<String, dynamic> this.json):super(json);
  @override
  Widget editDepositAmount (State state) {
    return(
        MoneyWidget(
          value: model.model.deposit_amount,
          caption: 'Deposit Amount',
          hint: 'Isi dengan Money Anda',
          required: true,
          min:'49999',
          max:'100000000',
          getValue: (double? val) {
            state.setState(() {
              model.model.deposit_amount = val;
            });
          },
        ));}


  fetchData1(SubModelController cart, BuildContext context)async {



  }

  @override
  Widget RButtonActionMyFinanceWidget(Button button, BuildContext context,var formKey, ScrollController controller, MyFinanceController my_finance,
      var postMyFinanceResult, State state, String? sendPath, String? id,  String? title){
    var cl;
    var ic;
    // final size =MediaQuery.of(context).size;
    double? width = 400;
    APIRepository? apiRepProvider = AppProvider.getApplication(context).projectsAPIRepository;
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
          RaisedButton(
              child: button.text == 'Order by ...' ?  Text(button!.text!) : Text('Order : ' + button!.text!),
              textColor: Colors.white,
              splashColor : CurrentTheme.ShadeColor,
              color : Color(0xFF037f51),
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
                RaisedButton(
                    child:   Row(
                      children: [
                        Icon(ic, size: 20),
                        SizedBox(width: 5,),
                        Text(button!.text!)
                      ],
                    ),
                    textColor: button.color == 'green'? Colors.white : Colors.black,
                    color: button.color == 'green'? Color(0xFF037f51) : Colors.white,
                    splashColor :  CurrentTheme.ShadeColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: button.color == 'green'? Color(0xFF037f51) : Colors.black, width: 1)
                    ),


                    // color : Color(0xFF037f51),
                    onPressed: () async{
                      controller.animateTo(controller.position.minScrollExtent,
                          duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                      if (formKey.currentState.validate()) {

                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        var formData = await convertFormDataDepositBalance(button!.text!, model
                        );
                        my_finance = new MyFinanceController(AppProvider.getApplication(context),
                            sendPath,
                            AppAction.post,
                            id,
                            title,
                            formData,
                            false);
                        if([ 'PlaceNewBid'].contains('DepositBalance')){
                          my_finance.deleteAllDepositBalanceMyFinance(this.model.model.project_title);
                        }else if(['AskOwner'].contains('DepositBalance')){
                          my_finance.deleteAllDepositBalanceMyFinance(this.model.model.project_id.toString());
                        }else if(['HireMe'].contains('DepositBalance')){
                          my_finance.deleteAllDepositBalanceMyFinance(this.model.model.private_worker_id.toString());
                        }else if(['InviteToBid'].contains('DepositBalance')){
                          my_finance.deleteAllDepositBalanceMyFinance(this.model.model.user_id);
                        }else{
                          my_finance.deleteAllDepositBalanceMyFinance('');
                        }
                        var res = await apiRepProvider!.getCookies( Env.value!.baseUrl! + '/public/program/mobile_init');//'/user/cart/view');

                        if(sendPath!.contains('%s')){



                          final future = my_finance.postDepositBalanceMyFinanceWithID();
                          future.then((value) {
                            state.setState(() {
                              postMyFinanceResult = value;
                            });
                          }).catchError((Error){
                           // AppProvider.getRouter(context)!.pop(context);
                            // AppProvider.getRouter(context)!.pop(context);
                            SubModelController _cart;
                            String cartPath = Env.value!.baseUrl! + '/user/cart/view' ;
                            _cart =      SubModelController(AppProvider.getApplication(context),
                                cartPath,
                                null);
                            var vl;
                            final c = _cart.getData();
                            c.then((value) {
                            //  vl = value;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CartPayment(pay_method : CartViewModel(value), cartCookies: res)),
                              );
                              //this.idHash = value;
                            });
                            //fetchData1(_cart, context);


                            //var res;



                          });
                        }else{
                          final future = my_finance.postDepositBalanceMyFinance();
                          future.then((value) {
                            state.setState(() {
                              postMyFinanceResult = value;
                            });
                          }).catchError((Error){
                           // AppProvider.getRouter(context)!.pop(context);
                            // AppProvider.getRouter(context)!.pop(context);
                            SubModelController _cart;
                            String cartPath = Env.value!.baseUrl! + '/user/cart/view' ;
                            _cart =      SubModelController(AppProvider.getApplication(context),
                                cartPath,
                                null);
                            var vl;
                            final c = _cart.getData();
                            c.then((value) {
                             // vl = value;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CartPayment(pay_method : CartViewModel(value), cartCookies: res)),
                              );
                              //this.idHash = value;
                            });
                            //fetchData1(_cart, context);


                            //var res;


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


class MyFinanceModel extends MyFinanceBase{
  Map<String, dynamic> json;
  MyFinanceModel(Map<String, dynamic> this.json):super(json); 	

  
}

@JsonSerializable()
class ViewModelMyFinanceRev {
  int?    age;
  int?    cnt;
  int?    page;
  String? id;
  String? ttl;
  String? pht;
  String? sbttl;


  double? available_balance;
  String? available_balance_str;
  int? bank_id;
  String? bank_str;
  String? bank_url;
  List<int?>? bank_list;
  List<String?>? bank_list_str;
  String? branch;
  String? city;
  String? account_number;
  String? account_name;
  int? cutoff_period_id;
  String? cutoff_period_str;
  List<int?>? cutoff_period_list;
  List<String?>? cutoff_period_list_str;
  double? cutoff_amount;
  String? cutoff_amount_str;
  String?   user_id;
  //CreditHistory credit_history;
  //PaymentHistory payment_history;

  //
  ViewModelMyFinanceRev(
      this.id,
      this.available_balance,
      this.available_balance_str,
      this.bank_id,
      this.bank_str,
      this.bank_url,
      this.bank_list,
      this.bank_list_str,
      this.branch,
      this.city,
      this.account_number,
      this.account_name,
      this.cutoff_period_id,
      this.cutoff_period_str,
      this.cutoff_period_list,
      this.cutoff_period_list_str,
      this.cutoff_amount,
      this.cutoff_amount_str,
      this.user_id,

      );


  factory ViewModelMyFinanceRev.fromJson(Map<String, dynamic> json) => _$ViewModelMyFinanceRevFromJson(json);


}

/*
ViewModelMyFinanceRev _$ViewModelMyFinanceRevFromJson(Map<String, dynamic> json) {
  return ViewModelMyFinanceRev(
      json['id'] as String,
      (json['available_balance'] as num)?.toDouble(),
      json['available_balance_str'] as String,
      json['bank_id'] as int,
      json['bank_str'] as String,
      json['bank_url'] as String,
      (json['bank_list'] as List)?.map((e) => e as int)?.toList(),
      (json['bank_list_str'] as List)?.map((e) => e as String)?.toList(),
      json['branch'] as String,
      json['city'] as String,
      json['account_number'] as String,
      json['account_name'] as String,
      json['cutoff_period_id'] as int,
      json['cutoff_period_str'] as String,
      (json['cutoff_period_list'] as List)?.map((e) => e as int)?.toList(),
      (json['cutoff_period_list_str'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      (json['cutoff_amount'] as num)?.toDouble(),
      json['cutoff_amount_str'] as String,
      json['user_id'] as String? )
    ..age = json['age'] as int
    ..cnt = json['cnt'] as int
    ..page = json['page'] as int
    ..ttl = json['ttl'] as String
    ..pht = json['pht'] as String
    ..sbttl = json['sbttl'] as String;
}

 */

@JsonSerializable()
class MyFinanceViewSuperBaseRev {

  String? id;
  Meta? meta;
  List<Button?>? buttons;
  ViewModelMyFinanceRev? model;
  List<Credit?>? credits;
  List<Payment?>? payments;
  MyFinanceViewSuperBaseRev(
      this.id,
      this.buttons,
      this.meta,
      this.model,
      this.credits,
      this.payments,
      );





  factory MyFinanceViewSuperBaseRev.fromJson(Map<String, dynamic> json) => _$MyFinanceViewSuperBaseRevFromJson(json);

}

/*
MyFinanceViewSuperBaseRev _$MyFinanceViewSuperBaseRevFromJson(
    Map<String, dynamic> json) {
  return MyFinanceViewSuperBaseRev(
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
          : ViewModelMyFinanceRev.fromJson(json['model'] as Map<String, dynamic>),
      (json['credits'] as List)
          ?.map((e) =>
      e == null ? null : Credit.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['payments'] as List)
          ?.map((e) =>
      e == null ? null : Payment.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

 */

class MyFinanceViewModel  extends MyFinanceViewBase{
  static const String? _BASE_URL1= 'https://upload.projects.co.id';
  String? _UPLOAD_URL1 = '';
  bool progresscircular = false;
  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  bool isLoading = true;
  String? link = '';
  Photo? foto;
  DIOProvider? provider;
  Map<String, dynamic> json;
  final double? _appBarHeight = 280.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  //MyFinanceViewModel(Map<String, dynamic> this.json):super(json);
  MyFinanceViewModel(Map<String, dynamic> this.json):super(json)
  {model = MyFinanceViewSuperBaseRev.fromJson(this.json);
  // model.buttons.add(Button( '',  '', '', '',  '',  '', '', []));

  }
  @override
  List<SpeedDialChild>	 listButton(BuildContext context,bool? visible, var formKey, ScrollController controller, MyFinanceController my_finance,
      State state, String? sendPath, String? id,  String? title, bool?account ){



   // String? test = '';
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
   // for(var i = 0; i < model.buttons.length ; i++)
   // {
  //    buttonChildren.add(ButtonViewMyFinanceWidget(model.buttons[i],context,  formKey, controller, my_finance,
  //        state, sendPath, id,  title, account ));
  //  }

   if( model.buttons.length == 3) {
     buttonChildren.add(
         SpeedDialChild(
             child: Icon(Icons.person),
             backgroundColor: Colors.green,
             label: 'Change Payment Settings',
             labelStyle: TextStyle(fontSize: 18.0),
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) =>
                     ChangePaymentSettingsMyFinance(
                         id: model.model.user_id, title: '')),
               );
             }
         )
     );
     buttonChildren.add(
         SpeedDialChild(
             child: Icon(Icons.chat_bubble),
             backgroundColor: Colors.green,
             label: 'Withdraw Payment',
             labelStyle: TextStyle(fontSize: 18.0),
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) =>
                     WithdrawPaymentMyFinance(
                         id: model.model.user_id, title: '')),
               );
             }
         )
     );


     buttonChildren.add(
         SpeedDialChild(
             child: Icon(Icons.monetization_on),
             backgroundColor: Colors.green,
             label: 'Deposit Balance',
             labelStyle: TextStyle(fontSize: 18.0),
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) =>
                     DepositBalanceMyFinance(
                         id: model.model.user_id, title: '')),
               );
             }
         )
     );
   }
    if( model.buttons.length == 2) {
      buttonChildren.add(
          SpeedDialChild(
              child: Icon(Icons.person),
              backgroundColor: Colors.green,
              label: 'Change Payment Settings',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: ()async{
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ChangePaymentSettingsMyFinance(
                          id: model.model.user_id, title: '')),
                ).then((value) {
                 //_tabController.animateTo(1);
                 state.setState(() {
                  // model.model.user_id = '123';
                  // isLoading = true;
                   // refresh state of Page1
                 });
               });
              // var val = await my_finance.viewMyFinance();
              //  state.setState(() {
              //    model = val;
              // //    test = '123';
              //  });
              }
          )
      );



      buttonChildren.add(
          SpeedDialChild(
              child: Icon(Icons.monetization_on),
              backgroundColor: Colors.green,
              label: 'Deposit Balance',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      DepositBalanceMyFinance(
                          id: model.model.user_id, title: '')),
                );
              }
          )
      );
    }



    return(
        buttonChildren
    );
  }



  List<SpeedDialChild>	 listButton1(var str, TabController tb,BuildContext context, bool visible, var formKey, ScrollController controller, MyFinanceController my_finance,
      State state, String? sendPath, String? id,  String? title, bool account ){



    // String? test = '';
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
    // for(var i = 0; i < model.buttons.length ; i++)
    // {
    //    buttonChildren.add(ButtonViewMyFinanceWidget(model.buttons[i],context,  formKey, controller, my_finance,
    //        state, sendPath, id,  title, account ));
    //  }



    buttonChildren.add(
        SpeedDialChild(
            child: Icon(Icons.person),
            backgroundColor: Colors.green,
            label: 'Change Payment Settings',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: ()async{
              await  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    ChangePaymentSettingsMyFinance(
                        id: model.model.user_id, title: '')),
              ).then((value) {
                print('disini jalan');
                 state.setState(() {

                });
                str.add(true);
               // tb.animateTo(0);
               // state.setState(() {

                //});
              });
              // var val = await my_finance.viewMyFinance();
              //  state.setState(() {
              //    model = val;
              // //    test = '123';
              //  });
            }
        )
    );



    buttonChildren.add(
        SpeedDialChild(
            child: Icon(Icons.monetization_on),
            backgroundColor: Colors.green,
            label: 'Deposit Balance',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    DepositBalanceMyFinance(
                        id: model.user_id, title: '')),
              );
            }
        )
    );




    return(
        buttonChildren
    );
  }
  SpeedDial	 Buttons1(var str, TabController tb, BuildContext context, bool visible, var formKey, ScrollController controller, MyFinanceController my_finance,
      State state, String? sendPath, String? id,  String? title, bool account ){
    return(
        SpeedDial(
         
            childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 22.0),
            // this is ignored if animatedIcon is non null
            // child: Icon(Icons.add),
            visible: visible,
            // If true user is forced to close dial manually
            // by tapping main button and overlay is not rendered.
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: CurrentTheme.MainAccentColor,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: CurrentTheme.SecondaryColor,
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: CircleBorder(),
            children:listButton1( str, tb, context, visible, formKey, controller, my_finance,
                state, sendPath, id,  title, account )
        )
    );
  }

 // @override
  Widget? body1 (Stream<bool> str, TabController tb, BuildContext context, ScrollController controller,  bool account, GlobalKey<ScaffoldState> ss, State state) {
    var dateformat = DateFormat('dd/MM/yyyy');
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    /*
    return(

        DefaultTabController(

            length: 3,
            child: NestedScrollView(

              controller: controller,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    //  title: Text('My Finance', style: TextStyle(color: CurrentTheme.DisableTextColor),),

                    //  centerTitle: false,
                    elevation: 4.0,
                    backgroundColor:darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                    expandedHeight: _appBarHeight,
                    forceElevated : true,
                    pinned: true,
                    leading: IconButton(
                      icon: Icon(Icons.close, color: CurrentTheme.DisableTextColor,),
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Projectscoid(id :  model.model.user_id)),
                              (Route<dynamic> route) => false,
                        );
                      },
                    ),
                    //pinned: _appBarBehavior == AppBarBehavior.pinned,
                    floating: false,
                    // snap: _appBarBehavior == AppBarBehavior.snapping,

                    flexibleSpace:
                    ExpandSpaceBar(
                      title: InkWell(
                          onTap : (){
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(model.buttons[0].url));
                          },
                          child : Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('My Finance', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.black87 ,)),
                              ])
                      ),
                      titlePadding: EdgeInsets.only(bottom: 65, left: 50),
                      collapseMode: CollapseBarMode.parallax,
                      // centerTitle: true,
                      background: Stack(
                        fit: StackFit.passthrough,
                        children: <Widget>[
                          InkWell(
                            //  onTap: () {_createProfilePhoto(context, model.model.user_id);},

                            child: Image.asset(
                              'assets/img/profesional.png',
                              fit: BoxFit.cover,
                              // height: 100,
                              // width: 100,
                            ),

                          ),
                          // This gradient ensures that the toolbar icons are distinct
                          // against the background image.

                          const DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.0, -1.0),
                                end: Alignment(0.0, -0.4),
                                colors: <Color>[
                                  Color(0x60000000),
                                  Color(0x00000000)
                                ],
                              ),
                            ),
                          ),



                          // This gradient ensures that the toolbar icons are distinct
                          // against the background image.

                        ],
                      ),

                    ),
                    bottom:
                    TabBar(
                      labelColor: CurrentTheme.PrimaryDarkColor,
                      unselectedLabelColor: CurrentTheme.DisableTextColor,
                      indicatorColor : CurrentTheme.PrimaryDarkColor,
                      indicatorWeight: 3.0,
                      controller: tb,
                      isScrollable: true,
                      indicatorPadding: EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.1),
                      indicatorSize : TabBarIndicatorSize.label,

                      tabs: [
                        Tab( text: "Finance Info ",),
                        Tab( text: "Credit History"),
                        Tab( text: "Payment History"),
                        //  Tab( text: "Change Payment Settings "),
                        //  Tab( text: "Withdraw Payment"),
                        //  Tab( text: "Deposit Balance"),
                      ],
                    ),


                  ),

                ];
              },
              body: TabBarView(
                controller: tb,

                children: [
                  /*
                  Container(
                    color:  darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                    child:
                    SingleChildScrollView(

                      // controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                      reverse: false,
                      child: Column(
                          children: <Widget>[
                            Card(
                              color: darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                              // elevation: 1.0,

                              margin: EdgeInsets.all(10.0),
                              child :CategoryWidget(
                                title: 'My Finance',
                                subtitle : 'Informasi keuangan anda serta fasilitas lain yang membantu anda dalam transaksi pembayaran di Projects.co.id.',
                                isDark: darkMode,
                                children: <Widget>[
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'AVAILABLE BALANCE',
                                        model.model.available_balance_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'BANK',
                                        model.model.bank_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'BRANCH',
                                        model.model.branch,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CITY',
                                        model.model.city,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'ACCOUNT NUMBER',
                                        model.model.account_number,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'ACCOUNT NAME',
                                        model.model.account_name,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CUT OFF PERIOD',
                                        model.model.cutoff_period_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isdivided: false,
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CUT OFF AMOUNT',
                                        model.model.cutoff_amount_str,
                                      ]
                                  ),


                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),

                   */
                  UserMyFinanceView1(),
                  CreditHistoryList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/credit_history_index/'+model.model.user_id +'/' + 'credit_history' + '?'),
                  PaymentHistoryList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/payment_history_index/'+model.model.user_id +'/' + 'payment_history' + '?'),
                  //  ChangePaymentSettingsMyFinance(id: model.model.user_id, title:''),
                  //   WithdrawPaymentMyFinance(id: model.model.user_id, title:''),
                  //  DepositBalanceMyFinance(id: 'model.model.user_id', title:''),
                ],

              ),
            )
        )
    );

     */


    StreamBuilder<bool>(//
        stream: str,
        initialData: true,
        builder: (context, AsyncSnapshot<bool?>?  snapshot) {

      if( snapshot!.hasData) {
        print('disini yahhhhhh');
        return(

            DefaultTabController(

                length: 3,
                child: NestedScrollView(

                  controller: controller,
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        //  title: Text('My Finance', style: TextStyle(color: CurrentTheme.DisableTextColor),),

                        //  centerTitle: false,
                        elevation: 4.0,
                        backgroundColor:snapshot!.data! ? Colors.black87 : CurrentTheme.BackgroundColor,
                        expandedHeight: _appBarHeight,
                        forceElevated : true,
                        pinned: true,
                        leading: IconButton(
                          icon: Icon(Icons.close, color: CurrentTheme.DisableTextColor,),
                          onPressed: (){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Projectscoid(id :  model.model.user_id)),
                                  (Route<dynamic> route) => false,
                            );
                          },
                        ),
                        //pinned: _appBarBehavior == AppBarBehavior.pinned,
                        floating: false,
                        // snap: _appBarBehavior == AppBarBehavior.snapping,

                        flexibleSpace:
                        ExpandSpaceBar(
                          title: InkWell(
                              onTap : (){
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(model.buttons[0].url));
                              },
                              child : Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('My Finance', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.black87 ,)),
                                  ])
                          ),
                          titlePadding: EdgeInsets.only(bottom: 65, left: 50),
                          collapseMode: CollapseBarMode.parallax,
                          // centerTitle: true,
                          background: Stack(
                            fit: StackFit.passthrough,
                            children: <Widget>[
                              InkWell(
                                //  onTap: () {_createProfilePhoto(context, model.model.user_id);},

                                child: Image.asset(
                                  'assets/img/profesional.png',
                                  fit: BoxFit.cover,
                                  // height: 100,
                                  // width: 100,
                                ),

                              ),
                              // This gradient ensures that the toolbar icons are distinct
                              // against the background image.

                              const DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.0, -1.0),
                                    end: Alignment(0.0, -0.4),
                                    colors: <Color>[
                                      Color(0x60000000),
                                      Color(0x00000000)
                                    ],
                                  ),
                                ),
                              ),



                              // This gradient ensures that the toolbar icons are distinct
                              // against the background image.

                            ],
                          ), centerTitle: null,

                        ),
                        bottom:
                        TabBar(
                          labelColor: CurrentTheme.PrimaryDarkColor,
                          unselectedLabelColor: CurrentTheme.DisableTextColor,
                          indicatorColor : CurrentTheme.PrimaryDarkColor,
                          indicatorWeight: 3.0,
                          controller: tb,
                          isScrollable: true,
                          indicatorPadding: EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.1),
                          indicatorSize : TabBarIndicatorSize.label,

                          tabs: [
                            Tab( text: "Finance Info ",),
                            Tab( text: "Credit History"),
                            Tab( text: "Payment History"),
                            //  Tab( text: "Change Payment Settings "),
                            //  Tab( text: "Withdraw Payment"),
                            //  Tab( text: "Deposit Balance"),
                          ],
                        ),


                      ),

                    ];
                  },
                  body: TabBarView(
                    controller: tb,

                    children: [
                      /*
                  Container(
                    color:  darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                    child:
                    SingleChildScrollView(

                      // controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                      reverse: false,
                      child: Column(
                          children: <Widget>[
                            Card(
                              color: darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                              // elevation: 1.0,

                              margin: EdgeInsets.all(10.0),
                              child :CategoryWidget(
                                title: 'My Finance',
                                subtitle : 'Informasi keuangan anda serta fasilitas lain yang membantu anda dalam transaksi pembayaran di Projects.co.id.',
                                isDark: darkMode,
                                children: <Widget>[
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'AVAILABLE BALANCE',
                                        model.model.available_balance_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'BANK',
                                        model.model.bank_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'BRANCH',
                                        model.model.branch,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CITY',
                                        model.model.city,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'ACCOUNT NUMBER',
                                        model.model.account_number,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'ACCOUNT NAME',
                                        model.model.account_name,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CUT OFF PERIOD',
                                        model.model.cutoff_period_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isdivided: false,
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CUT OFF AMOUNT',
                                        model.model.cutoff_amount_str,
                                      ]
                                  ),


                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),

                   */
                      UserMyFinanceView1(),
                      CreditHistoryList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/credit_history_index/'+model.model.user_id +'/' + 'credit_history' + '?'),
                      PaymentHistoryList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/payment_history_index/'+model.model.user_id +'/' + 'payment_history' + '?'),
                      //  ChangePaymentSettingsMyFinance(id: model.model.user_id, title:''),
                      //   WithdrawPaymentMyFinance(id: model.model.user_id, title:''),
                      //  DepositBalanceMyFinance(id: 'model.model.user_id', title:''),
                    ],

                  ),
                )
            )
        );
      }
      print('disini yahhhhhh1');
      return(

          DefaultTabController(

              length: 3,
              child: NestedScrollView(

                controller: controller,
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      //  title: Text('My Finance', style: TextStyle(color: CurrentTheme.DisableTextColor),),

                      //  centerTitle: false,
                      elevation: 4.0,
                      backgroundColor:snapshot!.data! ? Colors.black87 : CurrentTheme.BackgroundColor,
                      expandedHeight: _appBarHeight,
                      forceElevated : true,
                      pinned: true,
                      leading: IconButton(
                        icon: Icon(Icons.close, color: CurrentTheme.DisableTextColor,),
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Projectscoid(id :  model.model.user_id)),
                                (Route<dynamic> route) => false,
                          );
                        },
                      ),
                      //pinned: _appBarBehavior == AppBarBehavior.pinned,
                      floating: false,
                      // snap: _appBarBehavior == AppBarBehavior.snapping,

                      flexibleSpace:
                      ExpandSpaceBar(
                        title: InkWell(
                            onTap : (){
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(model.buttons[0].url));
                            },
                            child : Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text('My Finance', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.black87 ,)),
                                ])
                        ),
                        titlePadding: EdgeInsets.only(bottom: 65, left: 50),
                        collapseMode: CollapseBarMode.parallax,
                        // centerTitle: true,
                        background: Stack(
                          fit: StackFit.passthrough,
                          children: <Widget>[
                            InkWell(
                              //  onTap: () {_createProfilePhoto(context, model.model.user_id);},

                              child: Image.asset(
                                'assets/img/profesional.png',
                                fit: BoxFit.cover,
                                // height: 100,
                                // width: 100,
                              ),

                            ),
                            // This gradient ensures that the toolbar icons are distinct
                            // against the background image.

                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.0, -1.0),
                                  end: Alignment(0.0, -0.4),
                                  colors: <Color>[
                                    Color(0x60000000),
                                    Color(0x00000000)
                                  ],
                                ),
                              ),
                            ),



                            // This gradient ensures that the toolbar icons are distinct
                            // against the background image.

                          ],
                        ), centerTitle: null,

                      ),
                      bottom:
                      TabBar(
                        labelColor: CurrentTheme.PrimaryDarkColor,
                        unselectedLabelColor: CurrentTheme.DisableTextColor,
                        indicatorColor : CurrentTheme.PrimaryDarkColor,
                        indicatorWeight: 3.0,
                        controller: tb,
                        isScrollable: true,
                        indicatorPadding: EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.1),
                        indicatorSize : TabBarIndicatorSize.label,

                        tabs: [
                          Tab( text: "Finance Info ",),
                          Tab( text: "Credit History"),
                          Tab( text: "Payment History"),
                          //  Tab( text: "Change Payment Settings "),
                          //  Tab( text: "Withdraw Payment"),
                          //  Tab( text: "Deposit Balance"),
                        ],
                      ),


                    ),

                  ];
                },
                body: TabBarView(
                  controller: tb,

                  children: [
                    /*
                  Container(
                    color:  darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                    child:
                    SingleChildScrollView(

                      // controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                      reverse: false,
                      child: Column(
                          children: <Widget>[
                            Card(
                              color: darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                              // elevation: 1.0,

                              margin: EdgeInsets.all(10.0),
                              child :CategoryWidget(
                                title: 'My Finance',
                                subtitle : 'Informasi keuangan anda serta fasilitas lain yang membantu anda dalam transaksi pembayaran di Projects.co.id.',
                                isDark: darkMode,
                                children: <Widget>[
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'AVAILABLE BALANCE',
                                        model.model.available_balance_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'BANK',
                                        model.model.bank_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'BRANCH',
                                        model.model.branch,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CITY',
                                        model.model.city,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'ACCOUNT NUMBER',
                                        model.model.account_number,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'ACCOUNT NAME',
                                        model.model.account_name,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CUT OFF PERIOD',
                                        model.model.cutoff_period_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isdivided: false,
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CUT OFF AMOUNT',
                                        model.model.cutoff_amount_str,
                                      ]
                                  ),


                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),

                   */
                    UserMyFinanceView1(),
                    CreditHistoryList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/credit_history_index/'+model.model.user_id +'/' + 'credit_history' + '?'),
                    PaymentHistoryList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/payment_history_index/'+model.model.user_id +'/' + 'payment_history' + '?'),
                    //  ChangePaymentSettingsMyFinance(id: model.model.user_id, title:''),
                    //   WithdrawPaymentMyFinance(id: model.model.user_id, title:''),
                    //  DepositBalanceMyFinance(id: 'model.model.user_id', title:''),
                  ],

                ),
              )
          )
      );
      return(

          DefaultTabController(

              length: 3,
              child: NestedScrollView(

                controller: controller,
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      //  title: Text('My Finance', style: TextStyle(color: CurrentTheme.DisableTextColor),),

                      //  centerTitle: false,
                      elevation: 4.0,
                      backgroundColor:darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                      expandedHeight: _appBarHeight,
                      forceElevated : true,
                      pinned: true,
                      leading: IconButton(
                        icon: Icon(Icons.close, color: CurrentTheme.DisableTextColor,),
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Projectscoid(id :  model.model.user_id)),
                                (Route<dynamic> route) => false,
                          );
                        },
                      ),
                      //pinned: _appBarBehavior == AppBarBehavior.pinned,
                      floating: false,
                      // snap: _appBarBehavior == AppBarBehavior.snapping,

                      flexibleSpace:
                      ExpandSpaceBar(
                        title: InkWell(
                            onTap : (){
                              AppProvider.getRouter(context)!.navigateTo(
                                  context,
                                  urlToRoute(model.buttons[0].url));
                            },
                            child : Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text('My Finance', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.black87 ,)),
                                ])
                        ),
                        titlePadding: EdgeInsets.only(bottom: 65, left: 50),
                        collapseMode: CollapseBarMode.parallax,
                        // centerTitle: true,
                        background: Stack(
                          fit: StackFit.passthrough,
                          children: <Widget>[
                            InkWell(
                              //  onTap: () {_createProfilePhoto(context, model.model.user_id);},

                              child: Image.asset(
                                'assets/img/profesional.png',
                                fit: BoxFit.cover,
                                // height: 100,
                                // width: 100,
                              ),

                            ),
                            // This gradient ensures that the toolbar icons are distinct
                            // against the background image.

                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.0, -1.0),
                                  end: Alignment(0.0, -0.4),
                                  colors: <Color>[
                                    Color(0x60000000),
                                    Color(0x00000000)
                                  ],
                                ),
                              ),
                            ),



                            // This gradient ensures that the toolbar icons are distinct
                            // against the background image.

                          ],
                        ), centerTitle: null,

                      ),
                      bottom:
                      TabBar(
                        labelColor: CurrentTheme.PrimaryDarkColor,
                        unselectedLabelColor: CurrentTheme.DisableTextColor,
                        indicatorColor : CurrentTheme.PrimaryDarkColor,
                        indicatorWeight: 3.0,
                        controller: tb,
                        isScrollable: true,
                        indicatorPadding: EdgeInsets.symmetric(vertical: 0.1, horizontal: 0.1),
                        indicatorSize : TabBarIndicatorSize.label,

                        tabs: [
                          Tab( text: "Finance Info ",),
                          Tab( text: "Credit History"),
                          Tab( text: "Payment History"),
                          //  Tab( text: "Change Payment Settings "),
                          //  Tab( text: "Withdraw Payment"),
                          //  Tab( text: "Deposit Balance"),
                        ],
                      ),


                    ),

                  ];
                },
                body: TabBarView(
                  controller: tb,

                  children: [
                    /*
                  Container(
                    color:  darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                    child:
                    SingleChildScrollView(

                      // controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                      reverse: false,
                      child: Column(
                          children: <Widget>[
                            Card(
                              color: darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                              // elevation: 1.0,

                              margin: EdgeInsets.all(10.0),
                              child :CategoryWidget(
                                title: 'My Finance',
                                subtitle : 'Informasi keuangan anda serta fasilitas lain yang membantu anda dalam transaksi pembayaran di Projects.co.id.',
                                isDark: darkMode,
                                children: <Widget>[
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'AVAILABLE BALANCE',
                                        model.model.available_balance_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'BANK',
                                        model.model.bank_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'BRANCH',
                                        model.model.branch,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CITY',
                                        model.model.city,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'ACCOUNT NUMBER',
                                        model.model.account_number,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'ACCOUNT NAME',
                                        model.model.account_name,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CUT OFF PERIOD',
                                        model.model.cutoff_period_str,
                                      ]
                                  ),
                                  ItemListString(
                                    // icon: Icons.calendar_today,
                                      tooltip: 'Send message',
                                      isdivided: false,
                                      isDark: darkMode,
                                      onPressed: (){
                                      },
                                      lines: <String>[
                                        'CUT OFF AMOUNT',
                                        model.model.cutoff_amount_str,
                                      ]
                                  ),


                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),

                   */
                    UserMyFinanceView1(),
                    CreditHistoryList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/credit_history_index/'+model.model.user_id +'/' + 'credit_history' + '?'),
                    PaymentHistoryList(id: model.model.user_id, title:'', url: Env.value!.baseUrl! + '/user/my_finance/payment_history_index/'+model.model.user_id +'/' + 'payment_history' + '?'),
                    //  ChangePaymentSettingsMyFinance(id: model.model.user_id, title:''),
                    //   WithdrawPaymentMyFinance(id: model.model.user_id, title:''),
                    //  DepositBalanceMyFinance(id: 'model.model.user_id', title:''),
                  ],

                ),
              )
          )
      );

        });


    


  }
  
}



class  UserMyFinanceView1 extends StatefulWidget {
  static const String? PATH = '/user/my_finance/view';
  UserMyFinanceView1({Key? key}) : super(key: key);
  @override
  UserMyFinanceView1State createState() =>  UserMyFinanceView1State();
}

class  UserMyFinanceView1State extends State< UserMyFinanceView1> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_finance/view';

  final double? _appBarHeight = 230.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyFinanceController? my_finance;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller ;
  final _scrollThreshold = 200.0;
  double? lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String? idHash = '';
  // var viewMyFinance;
  var model;
  AccountController? accountController;
  bool account = true;
 


  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'MyFinance';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'MyFinance');
  }



  @override
  initState(){
    super.initState();
    // controller = ScrollController();
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  fetchData(MyFinanceController? my_finance, BuildContext context)async {
    if (this.model == null) {
      final hash = my_finance!.getHash();
      hash.then((value) {
        this.idHash = value;
      });
      final future = my_finance!.viewMyFinance();
      future.then((value) {
        setState(() {
          isLoading = false;
        });
        this.model = value;

      }).catchError((Error){
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
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
    bool _hasSubModel = false;
    int? modelCount = 0;
    String? getSubPath = '';
    bool _dialVisible = true;
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    controller = ScrollController();
    controller!.addListener(_onScroll);
    my_finance =  MyFinanceController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
        '',
        '',

        null,
        false);

    fetchData(my_finance, context);
    accountController = AccountController(AppProvider.getApplication(context),
        AppAction.view   );
    List listAccount = [];
    final future = accountController!.getAccount();
    future.then((val){

      listAccount.addAll(val);
      if(listAccount.length == 0){
        account = false;
      }else{
        account = true;
      }

    });
    _hasSubModel	= true;
    modelCount = modelCount + 1;
    String? getSubPathCreditHistory = Env.value!.baseUrl! + '/user/my_finance/credit_history_index/'+idHash!! +'/' + 'credit_history' + '?';
    // model id user
    _hasSubModel	= true;
    modelCount = modelCount + 1;
    String? getSubPathPaymentHistory = Env.value!.baseUrl! + '/user/my_finance/payment_history_index/'+idHash!! +'/' + 'payment_history' + '?';
    // model id user
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primaryColor: CurrentTheme.BackgroundColor,
        platform: Theme.of(context).platform,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        body: isLoading?
        Center(
            child:CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green),)) :
        Container(
          color:  darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
          child:
          SingleChildScrollView(

            // controller: controller,
            physics: const AlwaysScrollableScrollPhysics(),
            reverse: false,
            child: Column(
                children: <Widget>[
                  Card(
                    color: darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                    // elevation: 1.0,

                    margin: EdgeInsets.all(10.0),
                    child :CategoryWidget(
                      title: 'My Finance',
                      subtitle : 'Informasi keuangan anda serta fasilitas lain yang membantu anda dalam transaksi pembayaran di Projects.co.id.',
                      isDark: darkMode,
                      children: <Widget>[
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'AVAILABLE BALANCE',
                              model.model.model.available_balance_str,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'BANK',
                              model.model.model.bank_str,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'BRANCH',
                              model.model.model.branch,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'CITY',
                              model.model.model.city,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'ACCOUNT NUMBER',
                              model.model.model.account_number,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'ACCOUNT NAME',
                              model.model.model.account_name,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'CUT OFF PERIOD',
                              model.model.model.cutoff_period_str,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isdivided: false,
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'CUT OFF AMOUNT',
                              model.model.model.cutoff_amount_str,
                            ]
                        ),


                      ],
                    ),
                  ),
                ]
            ),
          ),
        ),

      ),
    );

  }



  void _onScroll() {
    final isNotExpanded = controller!.hasClients &&
        controller!.offset > _appBarHeight! - kToolbarHeight;
    if (isNotExpanded != scrollUp) {
      setState(() {
        scrollUp = isNotExpanded;
      });
    }



  }

  @override
  void dispose() {
    super.dispose();
  }
}



class  UserMyFinanceView2 extends StatefulWidget {
  static const String? PATH = '/user/my_finance/view';
  UserMyFinanceView2({Key? key}) : super(key: key);
  @override
  UserMyFinanceView2State createState() =>  UserMyFinanceView2State();
}

class  UserMyFinanceView2State extends State< UserMyFinanceView2> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_finance/view';

  final double? _appBarHeight = 230.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyFinanceController? my_finance;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller ;
  final _scrollThreshold = 200.0;
  double? lastScroll = 0;
  bool scrollUp = false;
  var isLoading = true;
  String? idHash = '';
  // var viewMyFinance;
  var model;
  AccountController? accountController;
  bool account = true;


  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'MyFinance';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'MyFinance');
  }



  @override
  initState(){
    super.initState();
    // controller = ScrollController();
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  fetchData(MyFinanceController? my_finance, BuildContext context)async {
    if (this.model == null) {
      final hash = my_finance!.getHash();
      hash.then((value) {
        this.idHash = value;
      });
      final future = my_finance!.viewMyFinance();
      future.then((value) {
        setState(() {
          isLoading = false;
        });
        this.model = value;

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
    bool _hasSubModel = false;
    int? modelCount = 0;
    String? getSubPath = '';
    bool _dialVisible = true;
    bool darkMode = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    controller = ScrollController();
    controller!.addListener(_onScroll);
    my_finance =  MyFinanceController(AppProvider.getApplication(context),
        getPath,
        AppAction.view,
        '',
        '',

        null,
        false);

    fetchData(my_finance, context);
    accountController = AccountController(AppProvider.getApplication(context),
        AppAction.view   );
    List listAccount = [];
    final future = accountController!.getAccount();
    future.then((val){

      listAccount.addAll(val);
      if(listAccount.length == 0){
        account = false;
      }else{
        account = true;
      }

    });
    _hasSubModel	= true;
    modelCount = modelCount + 1;
    String? getSubPathCreditHistory = Env.value!.baseUrl! + '/user/my_finance/credit_history_index/'+idHash! +'/' + 'credit_history' + '?';
    // model id user
    _hasSubModel	= true;
    modelCount = modelCount + 1;
    String? getSubPathPaymentHistory = Env.value!.baseUrl! + '/user/my_finance/payment_history_index/'+idHash! +'/' + 'payment_history' + '?';
    // model id user
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primaryColor: CurrentTheme.BackgroundColor,
        platform: Theme.of(context).platform,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        body: isLoading?
        Center(
            child:CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green),)) :
        Container(
          color:  darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
          child:
          SingleChildScrollView(

            // controller: controller,
            physics: const AlwaysScrollableScrollPhysics(),
            reverse: false,
            child: Column(
                children: <Widget>[
                  Card(
                    color: darkMode ? Colors.black87 : CurrentTheme.BackgroundColor,
                    // elevation: 1.0,

                    margin: EdgeInsets.all(10.0),
                    child :CategoryWidget(
                      title: 'My Finance',
                      subtitle : 'Informasi keuangan anda serta fasilitas lain yang membantu anda dalam transaksi pembayaran di Projects.co.id.',
                      isDark: darkMode,
                      children: <Widget>[
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'AVAILABLE BALANCE',
                              model.model.model.available_balance_str,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'BANK',
                              model.model.model.bank_str,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'BRANCH',
                              model.model.model.branch,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'CITY',
                              model.model.model.city,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'ACCOUNT NUMBER',
                              model.model.model.account_number,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'ACCOUNT NAME',
                              model.model.model.account_name,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'CUT OFF PERIOD',
                              model.model.model.cutoff_period_str,
                            ]
                        ),
                        ItemListString(
                          // icon: Icons.calendar_today,
                            tooltip: 'Send message',
                            isdivided: false,
                            isDark: darkMode,
                            onPressed: (){
                            },
                            lines: <String>[
                              'CUT OFF AMOUNT',
                              model.model.model.cutoff_amount_str,
                            ]
                        ),


                      ],
                    ),
                  ),
                ]
            ),
          ),
        ),

      ),
    );

  }



  void _onScroll() {
    final isNotExpanded = controller!.hasClients &&
        controller!.offset > _appBarHeight! - kToolbarHeight;
    if (isNotExpanded != scrollUp) {
      setState(() {
        scrollUp = isNotExpanded;
      });
    }



  }

  @override
  void dispose() {
    super.dispose();
  }
}


///////////////////////////////////////////////////


class MyFinanceListingModel extends MyFinanceListingBase{
  Map<String, dynamic> json;
  MyFinanceListingModel(Map<String, dynamic> this.json):super(json);  

}

//class ItemMyFinance extends class ItemMyFinanceBase{
//
//}



////////////////////////////
List<String?>? Banklistname =["Bank Rakyat Indonesia (BRI)" , "Bank Mandiri" , "Bank Negara Indonesia (BNI)" , "Bank Danamon" , "Bank Permata" , "Bank Central Asia (BCA)" , "Bank International Indonesia (BII)" , "Bank Panin" , "Bank CIMB Niaga" , "Bank UOB Buana" , "Bank OCBC NISP" , "Citibank" , "Bank Windu Kencana" , "Bank Artha Graha" , "HSBC" , "Bank of Tokyo-Mitsubishi UFJ" , "Standard Chartered Bank" , "Bank Capital" , "Bank ANZ" , "Bank Bumi Arta" , "Bank Ekonomi Raharja" , "Bank Anda" , "Bank Rabobank" , "Bank Mutiara" , "Bank Mayapada" , "Bank Jabar Banten (BJB)" , "Bank DKI" , "Bank BPD DIY" , "Bank Jateng" , "Bank Jatim" , "Bank Jambi" , "Bank BPD Aceh" , "Bank Sumut" , "Bank Nagari" , "Bank Riau" , "Bank Sumsel Babel" , "Bank Lampung" , "Bank BPD Kalsel" , "Bank Kalbar" , "Bank BPD Kaltim" , "Bank BPD Kalteng" , "Bank Sulsel" , "Bank Sulut" , "Bank NTB" , "Bank BPD Bali" , "Bank NTT" , "Bank Maluku" , "Bank Papua" , "Bank Bengkulu" , "Bank Sulteng" , "Bank Sultra" , "Bank Nusantara Parahyangan (BNP)" , "Bank Swadesi" , "Bank Muamalat Indonesia" , "Bank Mestika" , "Bank Sinarmas" , "Bank Maspion" , "Bank Ganesha" , "Bank Kesawan" , "Bank Tabungan Negara (BTN)" , "Bank Saudara" , "Bank BTPN" , "Bank BRI Syariah" , "Bank Jabar Banten Syariah" , "Bank Mega" , "Bank Bukopin" , "Bank Syariah Mandiri" , "Bank Jasa Jakarta" , "Bank ICB Bumiputera" , "Bank Agroniaga" , "Bank SBI Indonesia" , "Bank Royal Indonesia" , "Bank Mega Syariah" , "Bank Ina Perdana" , "Bank Kesejahteraan" , "Bank BCA Syariah" , "Bank Artos Indonesia" , "Bank Mayora" , "Bank Index" , "Bank Pundi Indonesia" , "BPR Karyajatnika Sadaya" , "BPR Semoga Jaya" , "Bank Victoria" , "Bank Commonwealth" , "Bank BNI Syariah" , "Bank CIMB Syariah" , "Bank Lainnya"];
List<int?>? Banklistid=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99];