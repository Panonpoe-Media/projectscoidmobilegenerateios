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

class UserMyPurchasesAdd extends StatefulWidget {
  static const String PATH = '/user/my_purchases/add/:id/:title';
  UserMyPurchasesAdd({Key? key}) : super(key: key);
  @override
  UserMyPurchasesAddState createState() => UserMyPurchasesAddState();
}

class UserMyPurchasesAddState extends State<UserMyPurchasesAdd>{
  String getPath = Env.value!.baseUrl! + '/user/my_purchases/add';
 // String sendPath = Env.value!.baseUrl! + '/user/my_purchases/add';
  String sendPath = Env.value!.baseUrl! + '/user/my_purchases/add';

  MyPurchasesController? my_purchases;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
 // var modelOrderItem;
 var model;
  var formData;
  var postMyPurchasesResult;
    var isLoading = true;
  final List<Widget> actionChildren = <Widget>[
	];

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }


 fetchData(MyPurchasesController? my_purchases)async {
    if (this.model == null) {
      final future = my_purchases!.editMyPurchases();
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
    my_purchases = new  MyPurchasesController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        '',
        '',
        null,
		false);

      fetchData(my_purchases);
      return Scaffold(
          appBar: AppBar(

            title: Text('MyPurchases'),
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
							   this.model.editSeller(this),  
							   this.model.editOrder(this),  
							   this.model.editTitle(this),  
							   this.model.editType(this),  
							   this.model.editProduct(this),  
							   this.model.editProject(this),  
							   this.model.editService(this),  
							   this.model.editBid(this),  
							   this.model.editIklan(this),  
							   this.model.editDate(this),  
							   this.model.editPrice(this),  
							   this.model.editStatus(this),  
							   this.model.editBuyer(this),  
							   this.model.editBuyerPayment(this),  
							   this.model.editSellerCredit(this),  
							   this.model.editRating(this),  
							   this.model.editTestimony(this),  
							   Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: "<h3>footer</h3>"),
								   ),
                       ]
                    
                  )

              )
          ),

            floatingActionButton: isLoading? [] : this.model.Buttons(context, _dialVisible, formKey, controller,my_purchases, postMyPurchasesResult, this, sendPath, '', '')


      );

  }


  @override
  void dispose() {
    super.dispose();
  }
  
 

}

