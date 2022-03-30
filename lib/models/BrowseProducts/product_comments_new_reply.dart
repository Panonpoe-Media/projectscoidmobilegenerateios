
import 'product_comments_new_reply_base.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'dart:convert';
import 'dart:async';
import 'package:projectscoid/core/AppProvider.dart';

/** AUTOGENERATE OFF **/



class NewReplyProductCommentsModel extends NewReplyProductCommentsBase {

  Map<String, dynamic> json ;
  NewReplyProductCommentsModel(Map<String, dynamic> this.json ):super(json);
/*
  @override
  Map<String, dynamic> convertFormDataAction(var data){

    var formData = {
      "product_post[_trigger_]":"",
      "product_post[message]": "${model.model.message }",
      "product_post[captcha]": "${model.model.captcha }",

    };


    return( formData);
  }

 */



  @override
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController product_comments,
      var postNewReplyResult, State state, String? sendPath, String? id,  String? title){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[

    ];
    buttonChildren.add(SpeedDialChild(
        child: Icon(Icons.send),
        backgroundColor: CurrentTheme.SecondaryColor,
        label: 'Reply',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: ()async{
          {
            controller.animateTo(controller.position.minScrollExtent,
                duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
            if (formKey.currentState.validate()) {
              //Map<String, dynamic> res = model.toJson();
              //print('json result == $res');
              var formData = await convertFormDataAction(model);
              product_comments = new  SubModelController(AppProvider.getApplication(context),
                  sendPath,
                  formData);
               final future = product_comments.sendData();
              future.then((value) {
                state.setState(() {
                  postNewReplyResult = value;
                });
              }).catchError((Error){
                AppProvider.getRouter(context)!.pop(context);
              });

            } else {}
          }
        }
       )
    );
    return buttonChildren;

  }

  @override
  SpeedDial	 Buttons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController product_comments,
      var postNewReplyResult, State state, String? sendPath, String? id,  String? title ){
    return(
        SpeedDial(
            childMargin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 22.0),
            // this is ignored if animatedIcon is non null
            // child: Icon(Icons.add),
            visible: visible!,
            // If true user is forced to close dial manually
            // by tapping main button and overlay is not rendered.
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: CurrentTheme.SecondaryColor,
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: CircleBorder(),
            children:listButton(context, formKey,controller,product_comments, postNewReplyResult, state, sendPath, id,  title )
        )
    );
  }


  /*
  @override
  Widget editMessage (State state) {
      return(
          new ArticleWidget(
            value: '',
            caption: 'Message',
            hint: 'isi dengan Article Anda',
            required: true,
            getValue:(String val) {
              state.setState(() {
                model.model.message = val;
              });
            },
          ));
  }
  @override
  Widget editCaptcha (State state) {

      return(
          new CaptchaWidget(
            value: '',
            caption: 'Captcha',
            hint: '',
            required: true,
            getValue:(String val) {
              state.setState(() {
                model.model.captcha = val;
              });
            },
          ));

  }

   */
}













  

