import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:html/parser.dart' show parse;



class ShowThreadAcceptOrRejectWorkBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ShowThreadAcceptOrRejectWorkBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ShowThreadAcceptOrRejectWorkBaseState createState() => ShowThreadAcceptOrRejectWorkBaseState();
}

class ShowThreadAcceptOrRejectWorkBaseState extends State<ShowThreadAcceptOrRejectWorkBase>  with RestorationMixin{
  String getPath = '';
  String sendPath = '';

  SubModelController? show_thread;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
  var model;
  var formData;
  var postShowThreadResult;
  var isLoading = true;
    var isError = false;
  var errmsg= 'Unauthorized  :'+'Accept or Reject Work';
  final List<Widget> actionChildren = <Widget>[ 
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'ShowThreadAcceptOrRejectWork';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(SubModelController? show_thread, BuildContext context)async {
    if (this.model == null) {
       final future = show_thread!.getData();
       future.then((value) {
        setState(() {
          isLoading = false;
        });
		
		  try{
		   this.model = AcceptOrRejectWorkShowThreadModel(value);
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		  
		  isError = false;
        }).catchError((Error){
		 isError = true;
		  
		     if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
		
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		   setState(() {
              // isLoading = false;
            });
		  }
		
		 
		});
      }
    }
  @override
  Widget build(BuildContext context) {
    bool _dialVisible = true;
	getPath = Env.value!.baseUrl! + widget.url!;
	sendPath = Env.value!.baseUrl! + widget.url!;
    show_thread = new SubModelController(AppProvider.getApplication(context),
        getPath,
        null);
		
	 fetchData(show_thread,  context );

      return Scaffold(
          appBar: AppBar(
		    title: Text('Accept or Reject Work'),
          ),
          body:isLoading?
             // Center(
             //   child: CircularProgressIndicator(),
             // )
               Center( 
                      child:CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      ))
             :isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
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
					  children: isLoading? [] : [
					  
								// Padding(
								//	padding: const EdgeInsets.fromLTRB(
								//		8.0, 14.0, 8.0, 2.0),
								//	child: Html(data: "<h3>Header</h3>"),
								//  ),
								SizedBox(height:15),
								  this.model.editUser(this), 
								  this.model.editProject(this), 
								  this.model.editThread(this), 
								  this.model.editPostType(this), 
								  this.model.editPostDate(this), 
								  this.model.editBidAmount(this), 
								  this.model.editMessage(this), 
								  this.model.editAttachments(this), 
								  this.model.editReadByOwner(this), 
								  this.model.editReadByWorker(this), 
								// Padding(
								//		padding: const EdgeInsets.fromLTRB(
								//			8.0, 14.0, 8.0, 2.0),
								//		child: Html(data: "<h3>footer</h3>"),
								//	   ),
					  Container(
                              height: 30,
                            ),
                            isLoading?  null : this.model.RButtons(context, _dialVisible, formKey, controller,show_thread, postShowThreadResult, this, sendPath, widget.id, widget.title),
                      
                        Container(
                          height: 60,
                        ),
					  
					  ]
                   
                  )

              )
          ),
		  //  floatingActionButton: isLoading? [] :  this.model.Buttons(context, _dialVisible, formKey, controller,show_thread, postShowThreadResult, this, sendPath, widget.id, widget.title)
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}











  

