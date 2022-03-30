import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
//import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';

class UserMyOrdersAdd extends StatefulWidget {
  static const String PATH = '/user/my_orders/add/:id/:title';
  UserMyOrdersAdd({Key? key}) : super(key: key);
  @override
  UserMyOrdersAddState createState() => UserMyOrdersAddState();
}

class UserMyOrdersAddState extends State<UserMyOrdersAdd>{
  String getPath = Env.value!.baseUrl! + '/user/my_orders/add';
 // String sendPath = Env.value!.baseUrl! + '/user/my_orders/add';
  String sendPath = Env.value!.baseUrl! + '/user/my_orders/add';

  MyOrdersController? my_orders;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
 // var modelOrder;
 var model;
  var formData;
  var postMyOrdersResult;
    var isLoading = true;
  final List<Widget> actionChildren = <Widget>[
	];

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }


 fetchData(MyOrdersController? my_orders)async {
    if (this.model == null) {
      final future = my_orders!.editMyOrders();
      future.then((value) {
        setState(() {
          isLoading = false;
        });
          this.model = value;

        });
      }
    }


  @override
  Widget build(BuildContext context) {
    bool _dialVisible = true;
    my_orders = new  MyOrdersController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        '',
        '',
        null,
		false);

      fetchData(my_orders);
      return Scaffold(
          appBar: AppBar(

            title: Text('MyOrders'),
          ),
          body:isLoading?
             // Center(
             //   child: CircularProgressIndicator(),
             // )
              Container(width: 0.0, height: 0.0)
             :Form(
              key: formKey,
              child: SingleChildScrollView(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  reverse: false,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
					  children: isLoading? [] : [
							  Padding(
								padding: const EdgeInsets.fromLTRB(
									8.0, 14.0, 8.0, 2.0),
								child: Html(data: "<h3>Header</h3>"),
							  ),
							   this.model.editTrackCode(this),  
							   this.model.editBuyer(this),  
							   this.model.editDate(this),  
							   this.model.editStatus(this),  
							   this.model.editPaymentMethod(this),  
							   this.model.editBuyerPayment(this),  
							   this.model.editTotalPrice(this),  
							   this.model.editCoupon(this),  
							   this.model.editCouponValue(this),  
							   this.model.editUsedBalance(this),  
							   this.model.editTotalSum(this),  
							   this.model.editUniqueCode(this),  
							   this.model.editTable(this),  
							   this.model.editNotes(this),  
							   this.model.editCimbRef(this),  
							   this.model.editIsTest(this),  
							   Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: "<h3>footer</h3>"),
								   ),
                       ]
                    
                  )

              )
          ),

            floatingActionButton: isLoading? [] : this.model.Buttons(context, _dialVisible, formKey, controller,my_orders, postMyOrdersResult, this, sendPath, '', '')


      );

  }


  @override
  void dispose() {
    super.dispose();
  }
  
 

}

