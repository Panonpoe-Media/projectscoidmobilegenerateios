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
class PublicBlogEdit extends StatefulWidget {
  static const String PATH = '/public/blog/edit/:id/:title';
  final String? id ;
  final String? title;
  PublicBlogEdit({Key? key, this.id, this.title}) : super(key: key);
  @override
  PublicBlogEditState createState() => PublicBlogEditState();
}

class PublicBlogEditState extends State<PublicBlogEdit>  with RestorationMixin{
  String getPath = Env.value!.baseUrl! + '/public/blog/edit/%s/%s';
 // String sendPath = Env.value!.baseUrl! + '/public/blog/add';
  String sendPath = Env.value!.baseUrl! + '/public/blog/edit/%s/%s';

  BlogController? blog;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
  //var modelArticle;
  var model;
  var formData;
  var postBlogResult;
  var isLoading = true;


final RestorableInt _counter = RestorableInt(0);

  @override
  String get restorationId => 'Blog';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }



  @override
  initState(){
    super.initState();
	sendPath = Env.value!.baseUrl! + '/public/blog/edit/' +widget.id! +'/' + widget.title!;
    controller = ScrollController();
    validation.add(true);
  }

 fetchData(BlogController? blog)async {
    if (this.model == null) {
      final future = blog!.editBlog();
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
    blog = new  BlogController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id,
        widget.title,
        null,
		false);

     fetchData(blog);

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

            floatingActionButton:  isLoading? null : this.model.Buttons(context, _dialVisible, formKey, controller,blog, postBlogResult, this, sendPath, widget.id, widget.title)

      );


  }


  @override
  void dispose() {
    super.dispose();
  }
  
  
}



