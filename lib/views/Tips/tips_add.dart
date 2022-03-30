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

class PublicTipsAdd extends StatefulWidget {
  static const String PATH = '/public/tips/add/:id/:title';
  PublicTipsAdd({Key? key}) : super(key: key);
  @override
  PublicTipsAddState createState() => PublicTipsAddState();
}

class PublicTipsAddState extends State<PublicTipsAdd>{
  String getPath = Env.value!.baseUrl! + '/public/tips/add';
 // String sendPath = Env.value!.baseUrl! + '/public/tips/add';
  String sendPath = Env.value!.baseUrl! + '/public/tips/add';

  TipsController? tips;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
 // var modelArticle;
 var model;
  var formData;
  var postTipsResult;
    var isLoading = true;
  final List<Widget> actionChildren = <Widget>[
	];

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }


 fetchData(TipsController? tips)async {
    if (this.model == null) {
      final future = tips!.editTips();
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
    tips = new  TipsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        '',
        '',
        null,
		false);

      fetchData(tips);
      return Scaffold(
          appBar: AppBar(

            title: Text('Tips'),
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
							   this.model.editCategory(this),  
							   this.model.editAuthor(this),  
							   this.model.editTitle(this),  
							   this.model.editPublished(this),  
							   this.model.editPublishedDate(this),  
							   this.model.editTeaser(this),  
							   this.model.editContent(this),  
							   this.model.editKeywords(this),  
							   this.model.editImage(this),  
							   this.model.editFiles(this),  
							   Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: "<h3>footer</h3>"),
								   ),
                       ]
                    
                  )

              )
          ),

            floatingActionButton: isLoading? [] : this.model.Buttons(context, _dialVisible, formKey, controller,tips, postTipsResult, this, sendPath, '', '')


      );

  }


  @override
  void dispose() {
    super.dispose();
  }
  
 

}

