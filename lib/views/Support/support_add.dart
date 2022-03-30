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

class PublicSupportAdd extends StatefulWidget {
  static const String PATH = '/public/support/add/:id/:title';
  PublicSupportAdd({Key? key}) : super(key: key);
  @override
  PublicSupportAddState createState() => PublicSupportAddState();
}

class PublicSupportAddState extends State<PublicSupportAdd>{
  String getPath = Env.value!.baseUrl! + '/public/support/add';
 // String sendPath = Env.value!.baseUrl! + '/public/support/add';
  String sendPath = Env.value!.baseUrl! + '/public/support/add';

  SupportController? support;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
 // var modelContactForm;
 var model;
  var formData;
  var postSupportResult;
    var isLoading = true;
  final List<Widget> actionChildren = <Widget>[
	];

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }


 fetchData(SupportController? support)async {
    if (this.model == null) {
      final future = support!.editSupport();
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
    support = new  SupportController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        '',
        '',
        null,
		false);

      fetchData(support);
      return Scaffold(
          appBar: AppBar(

            title: Text('Support'),
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
							   this.model.editYourName(this),  
							   this.model.editEmailAddress(this),  
							   this.model.editQuestion(this),  
							   this.model.editDate(this),  
							   this.model.editIpAddress(this),  
							   this.model.editReplied(this),  
							   this.model.editStatus(this),  
							   this.model.editReply(this),  
							   this.model.editRepliedBy(this),  
							   this.model.editRepliedDate(this),  
							   this.model.editRepliedIp(this),  
							   this.model.editCaptcha(this),  
							   Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: "<h3>footer</h3>"),
								   ),
                       ]
                    
                  )

              )
          ),

            floatingActionButton: isLoading? [] : this.model.Buttons(context, _dialVisible, formKey, controller,support, postSupportResult, this, sendPath, '', '')


      );

  }


  @override
  void dispose() {
    super.dispose();
  }
  
 

}

