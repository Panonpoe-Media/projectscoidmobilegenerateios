
import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projectscoid/models/model.dart';
import 'service_comments_new_reply_base.dart';
/** AUTOGENERATE OFF **/





class ServiceCommentsNewReplyBaseRev extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ServiceCommentsNewReplyBaseRev({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ServiceCommentsNewReplyBaseRevState createState() => ServiceCommentsNewReplyBaseRevState();
}

Future<Map> NewReplyServiceCommentsINIT()async{
  String jsonstring;
  String meta = '{' +
      '"title": "Reply"' +
      '}';
  String bnt1 =    '{' +
      '"id": "reply",' +
      '"url": "",' +
      '"color": "yellow",' +
      '"icon": "fa fa-edit",' +
      '"text": "Reply"' +
      '}';
  String btnlist = '[]';

  String mdl = '{' +
      '"message": null,' +
      '"captcha": null' +
      '}';

  jsonstring = '{' +
      '"meta": $meta, ' +
      '"buttons": $btnlist,' +
      '"model": $mdl,' +
      '"errors": []' +
      ' }';

  //Map<String, dynamic> past_projects_json;
  return jsonDecode(jsonstring);

}

class ServiceCommentsNewReplyBaseRevState extends State<ServiceCommentsNewReplyBaseRev>{
  String getPath = '';
  String sendPath = '';

  SubModelController? service_comments;
  final formKey = GlobalKey<FormState>();
  ScrollController? controller;
  List<bool> validation = [];
  var model;
  var formData;
  var postServiceCommentsResult;
  var isLoading = true;
  final List<Widget> actionChildren = <Widget>[
  ];
  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }

  fetchData(SubModelController? service_comments)async {
    if (this.model == null) {
      // final future = service_comments.getData();
      final future = NewReplyServiceCommentsINIT();
      future.then((value) {
        setState(() {
          isLoading = false;
        });
        this.model = NewReplyServiceCommentsModel(Map<String, dynamic>.from(value));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _dialVisible = true;
    getPath = Env.value!.baseUrl! + widget.url!;
    sendPath = Env.value!.baseUrl! + widget.url!;
    service_comments = new SubModelController(AppProvider.getApplication(context),
        getPath,
        null);

    fetchData(service_comments);

    return Scaffold(
        appBar: AppBar(
          title: Text('Tanya Seller'),
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


                      this.model.editMessage(this),
                      this.model.editCaptcha(this),


                      Container(
                        height: 30,
                           ),
                      isLoading? null : this.model.RButtons(context, _dialVisible, formKey, controller,service_comments, postServiceCommentsResult, this, sendPath, widget.id, widget.title),

                      Container(
                        height: 60,
                        ),

                    ]

                )

            )
        ),
      // floatingActionButton: isLoading? null :  this.model.Buttons(context, _dialVisible, formKey, controller,service_comments, postServiceCommentsResult, this, sendPath, widget.id, widget.title)
    );


  }


  @override
  void dispose() {
    super.dispose();
  }


}

class BrowseServicesServiceCommentsNewReply extends ServiceCommentsNewReplyBaseRev{
  static const String PATH = '/public/browse_services/service_comments_new_reply/:id/:title';
  String? url;
  final String? id ;
  final String? title;
  BrowseServicesServiceCommentsNewReply({Key? key, this.id,  this.title,  this.url}): super(key: key);
}












  

