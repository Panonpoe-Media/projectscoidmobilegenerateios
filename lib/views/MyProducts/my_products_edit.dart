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
//123
class UserMyProductsEdit extends StatefulWidget {
  static const String PATH = '/user/my_products/edit/:id/:title';
  final String? id ;
  final String? title;
  UserMyProductsEdit({Key? key, this.id, this.title}) : super(key: key);
  @override
  UserMyProductsEditState createState() => UserMyProductsEditState();
}

class UserMyProductsEditState extends State<UserMyProductsEdit>  with RestorationMixin{
  String getPath = Env.value!.baseUrl! + '/user/my_products/edit/%s/%s';
 // String sendPath = Env.value!.baseUrl! + '/user/my_products/add';
  String sendPath = Env.value!.baseUrl! + '/user/my_products/edit/%s/%s';

  MyProductsController? my_products;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
  //var modelProduct;
  var model;
  var formData;
  var postMyProductsResult;
  var isLoading = true;


final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'MyProducts';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }



  @override
  initState(){
    super.initState();
	sendPath = Env.value!.baseUrl! + '/user/my_products/edit/' +widget.id! +'/' + widget.title!;
    controller = ScrollController();
    validation.add(true);
  }

 fetchData(MyProductsController? my_products)async {
    if (this.model == null) {
      final future = my_products!.editMyProducts();
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
    my_products = new  MyProductsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id,
        widget.title,
        null,
		false);

     fetchData(my_products);

      return Scaffold(
          appBar: AppBar(

            title: Text(widget.title!),
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
							   this.model.editLogo(this),  
							   this.model.editCategory(this),  
							   this.model.editTitle(this),  
							   this.model.editDescription(this),  
							   this.model.editShortDescription(this),  
							   this.model.editDeliverable(this),  
							   this.model.editTrialVersion(this),  
							   this.model.editPrice(this),  
							   this.model.editTags(this),  
							   this.model.editStatus(this),  
							   this.model.editRegisteredBy(this),  
							   this.model.editRegisteredDate(this),  
							   this.model.editRegisteredFromIp(this),  
							   this.model.editVerifiedBy(this),  
							   this.model.editVerifiedDate(this),  
							   this.model.editVerifiedFromIp(this),  
							   this.model.editVerifierNote(this),  
							   this.model.editApprovedBy(this),  
							   this.model.editApprovedDate(this),  
							   this.model.editApprovedFromIp(this),  
							   this.model.editApproverNote(this),  
							   this.model.editPublishedBy(this),  
							   this.model.editPublishedDate(this),  
							   this.model.editPublishedFromIp(this),  
							   this.model.editRejectedBy(this),  
							   this.model.editRejectedDate(this),  
							   this.model.editRejectedFromIp(this),  
							   this.model.editAdminNote(this),  
							   this.model.editLastBump(this),  
							   this.model.editSalesCount(this),  
							   this.model.editSalesAmount(this),  
							   this.model.editRating(this),  
							   this.model.editPoints(this),  
							   this.model.editRanking(this),  
							   this.model.editRatingNum(this),  
							   this.model.editRatingSum(this),  
							   this.model.editRatingDiv(this),  
							   Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: "<h3>footer</h3>"),
								   ),
                       ]
                   
                  )

              )
          ),

            floatingActionButton:  isLoading? null : this.model.Buttons(context, _dialVisible, formKey, controller,my_products, postMyProductsResult, this, sendPath, widget.id, widget.title)

      );


  }


  @override
  void dispose() {
    super.dispose();
  }
  
  
}



