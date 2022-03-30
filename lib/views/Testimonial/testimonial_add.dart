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

class PublicTestimonialAdd extends StatefulWidget {
  static const String PATH = '/public/testimonial/add/:id/:title';
  PublicTestimonialAdd({Key? key}) : super(key: key);
  @override
  PublicTestimonialAddState createState() => PublicTestimonialAddState();
}

class PublicTestimonialAddState extends State<PublicTestimonialAdd>{
  String getPath = Env.value!.baseUrl! + '/public/testimonial/add';
 // String sendPath = Env.value!.baseUrl! + '/public/testimonial/add';
  String sendPath = Env.value!.baseUrl! + '/public/testimonial/add';

  TestimonialController? testimonial;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
 // var modelTestimony;
 var model;
  var formData;
  var postTestimonialResult;
    var isLoading = true;
  final List<Widget> actionChildren = <Widget>[
	];

  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }


 fetchData(TestimonialController? testimonial)async {
    if (this.model == null) {
      final future = testimonial!.editTestimonial();
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
    testimonial = new  TestimonialController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        '',
        '',
        null,
		false);

      fetchData(testimonial);
      return Scaffold(
          appBar: AppBar(

            title: Text('Testimonial'),
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
							   this.model.editUser(this),  
							   this.model.editProject(this),  
							   this.model.editDate(this),  
							   this.model.editFeedback(this),  
							   this.model.editPublished(this),  
							   this.model.editStatus(this),  
							   this.model.editPublishedDate(this),  
							   Padding(
									padding: const EdgeInsets.fromLTRB(
										8.0, 14.0, 8.0, 2.0),
									child: Html(data: "<h3>footer</h3>"),
								   ),
                       ]
                    
                  )

              )
          ),

            floatingActionButton: isLoading? [] : this.model.Buttons(context, _dialVisible, formKey, controller,testimonial, postTestimonialResult, this, sendPath, '', '')


      );

  }


  @override
  void dispose() {
    super.dispose();
  }
  
 

}

