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

class UserMyBidsAdd extends StatefulWidget {
  static const String PATH = '/user/my_bids/add/:id/:title';
  UserMyBidsAdd({Key? key}) : super(key: key);
  @override
  UserMyBidsAddState createState() => UserMyBidsAddState();
}

class UserMyBidsAddState extends State<UserMyBidsAdd>{
  String getPath = Env.value!.baseUrl! + '/user/my_bids/add';
 // String sendPath = Env.value!.baseUrl! + '/user/my_bids/add';
  String sendPath = Env.value!.baseUrl! + '/user/my_bids/add';

  MyBidsController? my_bids;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
 // var modelBid;
 var model;
  var formData;
  var postMyBidsResult;
    var isLoading = true;
  final List<Widget> actionChildren = <Widget>[
	];

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }


 fetchData(MyBidsController? my_bids)async {
    if (this.model == null) {
      final future = my_bids!.editMyBids();
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
    my_bids = new  MyBidsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        '',
        '',
        null,
		false);

      fetchData(my_bids);
      return Scaffold(
          appBar: AppBar(

            title: Text('MyBids'),
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
							   this.model.editProject(this),  
							   this.model.editStatus(this),  
							   this.model.editDate(this),  
							   this.model.editWorker(this),  
							   this.model.editLocation(this),  
							   this.model.editRating(this),  
							   this.model.editMatchingSkills(this),  
							   this.model.editAmount(this),  
							   this.model.editMessage(this),  
							   this.model.editAttachments(this),  
							   this.model.editReadByOwner(this),  
							   this.model.editShortlisted(this),  
							   this.model.editCaptcha(this),  
							   this.model.editProjectTitle(this),  
							   this.model.editProjectOwner(this),  
							   this.model.editDescription(this),  
							   this.model.editPublishedBudget(this),  
							   this.model.editBudgetRange(this),  
							   Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: "<h3>footer</h3>"),
								   ),
                       ]
                    
                  )

              )
          ),

            floatingActionButton: isLoading? [] : this.model.Buttons(context, _dialVisible, formKey, controller,my_bids, postMyBidsResult, this, sendPath, '', '')


      );

  }


  @override
  void dispose() {
    super.dispose();
  }
  
 

}

