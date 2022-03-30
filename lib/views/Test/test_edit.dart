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
class PublicTestEdit extends StatefulWidget {
  static const String PATH = '/public/test/edit/:id/:title';
  final String? id ;
  final String? title;
  PublicTestEdit({Key? key, this.id, this.title}) : super(key: key);
  @override
  PublicTestEditState createState() => PublicTestEditState();
}

class PublicTestEditState extends State<PublicTestEdit>  with RestorationMixin{
  String getPath = Env.value!.baseUrl! + '/public/test/edit/%s/%s';
 // String sendPath = Env.value!.baseUrl! + '/public/test/add';
  String sendPath = Env.value!.baseUrl! + '/public/test/edit/%s/%s';

  TestController? test;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
  //var modelTest;
  var model;
  var formData;
  var postTestResult;
  var isLoading = true;


final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'Test';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }



  @override
  initState(){
    super.initState();
	sendPath = Env.value!.baseUrl! + '/public/test/edit/' +widget.id! +'/' + widget.title!;
    controller = ScrollController();
    validation.add(true);
  }

 fetchData(TestController? test)async {
    if (this.model == null) {
      final future = test!.editTest();
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
    test = new  TestController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id,
        widget.title,
        null,
		false);

     fetchData(test);

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
							   this.model.editUserName(this),  
							   this.model.editPassword(this),  
							   this.model.editDisplayName(this),  
							   this.model.editTitle(this),  
							   this.model.editEmail(this),  
							   this.model.editModel(this),  
							   this.model.editEnum(this),  
							   this.model.editAddress(this),  
							   this.model.editMultiline(this),  
							   this.model.editDate(this),  
							   this.model.editDateTime(this),  
							   this.model.editTime(this),  
							   this.model.editRating(this),  
							   this.model.editNumber(this),  
							   this.model.editMoney(this),  
							   this.model.editDouble(this),  
							   this.model.editBoolean(this),  
							   this.model.editPercent(this),  
							   this.model.editWebsite(this),  
							   this.model.editArticle(this),  
							   this.model.editInlineTags(this),  
							   this.model.editHandphone(this),  
							   this.model.editImage(this),  
							   this.model.editFile(this),  
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

            floatingActionButton:  isLoading? null : this.model.Buttons(context, _dialVisible, formKey, controller,test, postTestResult, this, sendPath, widget.id, widget.title)

      );


  }


  @override
  void dispose() {
    super.dispose();
  }
  
  
}



