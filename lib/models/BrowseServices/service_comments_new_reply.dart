

import 'package:projectscoid/views/components/index.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'dart:convert';
import 'dart:async';
import 'package:projectscoid/core/AppProvider.dart';
import 'service_comments_new_reply_base.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import '../photo.dart';
import '../paging.dart';
import '../image_fields.dart';
import '../file_fields.dart';
import '../option_fields.dart';
/** AUTOGENERATE OFF **/
class NewReplyServiceCommentsModel extends NewReplyServiceCommentsBase{

  Map<String, dynamic> json;
  NewReplyServiceCommentsModel(Map<String, dynamic> this.json):super(json);
/*
  @override
  Map<String, dynamic> convertFormDataAction(var data){

    var formData = {
      "service_post[_trigger_]":"",
      "service_post[message]": "${model.model.message }",
      "service_post[captcha]": "${model.model.captcha }",

    };


    return( formData);
  }

 */



  @override
  Widget RButtonActionServiceCommentsWidget(Button button, BuildContext context,var formKey, ScrollController controller,  SubModelController service_comments,
      var postServiceCommentsResult, State state, String? sendPath, String? id,  String? title){
    var cl;
    var ic;
    final size =MediaQuery.of(context).size;
    final width =size.width;
    if (button.color == 'green'){
      cl = Colors.green;
    }
    if (button.color == 'yellow'){
      cl = Colors.yellow;
    }
    if (button.color == 'blue'){
      cl = Colors.blue;
    }
    if (button.color == 'red'){
      cl = Colors.red;
    }
    if (button.color == 'orange'){
      cl = Colors.orange;
    }
    if (button.color == 'grey'){
      cl = Colors.grey;
    }
    if (button.color == 'black'){
      cl = Colors.black;
    }
    if (button.color == 'brown'){
      cl = Colors.brown;
    }
    if (button.icon == 'fa fa-briefcase'){
      ic = Icons.work;
    }
    if (button.icon == 'fa fa-plus'){
      ic = Icons.add;
    }
    if (button.icon == 'fa fa-list-alt'){
      ic = Icons.list;
    }

    if (button.icon == 'fa fa-credit-card'){
      ic = Icons.credit_card;
    }
    if (button.icon == 'fa fa-paypal'){
      ic = Icons.account_balance_wallet;
    }
    if (button.icon == 'fa fa-bank'){
      ic = Icons.account_balance;
    }
    if (button.icon == 'fa fa-dollar'){
      ic = Icons.attach_money;
    }
    if (button.icon == 'fa fa-user'){
      ic = Icons.person;
    }
    if (button.icon == 'fa fa-edit'){
      ic = Icons.edit;
    }
    if (button.icon == 'fa fa-picture-o'){
      ic = Icons.picture_in_picture;
    }
    if (button.icon == 'fa fa-asterisk'){
      ic = Icons.ac_unit;
    }
    if (button.icon == 'fa fa-envelope-o'){
      ic = Icons.local_post_office;
    }
    if (button.icon == 'fa fa-mobile'){
      ic = Icons.phone_iphone;
    }
    if (button.icon == 'fa fa-bullhorn'){
      ic = Icons.wifi_tethering;
    }

    if (button.icon == 'fa fa-arrow-circle-down'){
      ic = Icons.arrow_downward;
    }
    if (button.icon == 'fa fa-comment'){
      ic = Icons.comment;
    }
    if (button.icon == 'fa fa-send'){
      ic = Icons.send;
    }
    if (button.icon == 'fa fa-comments'){
      ic = Icons.comment_bank;
    }
    if (button.icon == 'fa fa-files-o'){
      ic = Icons.file_copy_outlined;
    }

    if(button.type == 'custom_filter'){
      return (
          ElevatedButton(
              child: button.text == 'Order by ...' ?  Text(button.text!) : Text('Order : ' + button.text!),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
              ),
              onPressed: () {
                showSearchSelectDialog(context: context,
                    caption:button.text,
                    initialitems: button.selections,
                    initvalue: button.selections![0]);
              }
          )
      );
    }else{
      return(
          ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.43 * width,
              children: <Widget>[
                ElevatedButton(
                    child:   Row(
                      children: [
                        Icon(ic, size: 20),
                        SizedBox(width: 5,),
                        Text('Tanya Seller'),
                      ],
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                      overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                    ),


                    // color : Color(0xFF037f51),
                    onPressed: () async{
                      controller.animateTo(controller.position.minScrollExtent,
                          duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                      if (formKey.currentState.validate()) {
                        //Map<String, dynamic> res = model.toJson();
                        //print('json result == $res');
                        var formData = await convertFormDataAction(model);
                        service_comments = new  SubModelController(AppProvider.getApplication(context),
                            sendPath,
                            formData);
                        final future = service_comments.sendData();
                        future.then((value) {
                          state.setState(() {
                            postServiceCommentsResult = value;
                          });
                        }).catchError((Error){
                          AppProvider.getRouter(context)!.pop(context);
                        });



                      } else {}
                    }


                )
              ]
          )
      );
    }

  }

  @override
  List<Widget> RlistButton(BuildContext context,var formKey, ScrollController controller, SubModelController service_comments,
      var postNewReplyResult, State state, String? sendPath, String? id,  String? title){
    final size =MediaQuery.of(context).size;
    final width =size.width;
    final List<Widget> buttonChildren = <Widget>[
    ];

    buttonChildren.add(
        ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 0.43 * width,
            children: <Widget>[
              ElevatedButton(
                  child:   Row(
                    children: [
                      Icon(Icons.question_answer, size: 20),
                      SizedBox(width: 5,),
                      Text('Kirim Pertanyaan'),
                    ],
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                    overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                  ),


                  // color : Color(0xFF037f51),
                  onPressed: () async{
                    controller.animateTo(controller.position.minScrollExtent,
                        duration: Duration(milliseconds: 1000), curve: Curves.easeInOutCirc);
                    if (formKey.currentState.validate()) {
                      //Map<String, dynamic> res = model.toJson();
                      //print('json result == $res');
                      var formData = await convertFormDataAction(model);
                      service_comments = new  SubModelController(AppProvider.getApplication(context),
                          sendPath,
                          formData);
                      final future = service_comments.sendData();
                      future.then((value) {
                        state.setState(() {
                          postNewReplyResult = value;
                        });
                      }).catchError((Error){
                        AppProvider.getRouter(context)!.pop(context);
                      });



                    } else {}
                  }


              )
            ]
        )
    );

    return(
        buttonChildren
    );
  }



  @override
  Widget	 RButtons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController service_comments,
      var postNewReplyResult, State state, String? sendPath, String? id,  String? title ){
    final size =MediaQuery.of(context).size;
    final width =size.width;

    return(
        ButtonBarTheme(
            data: ButtonBarThemeData(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 0.9 * width,
            ),
            child: ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 0.9 * width,
                children:
                RlistButton(context, formKey,controller,service_comments, postNewReplyResult, state, sendPath, id,  title )

            )
        )
    );

  }



  @override
  List<SpeedDialChild> listButton(BuildContext context,var formKey, ScrollController controller, SubModelController service_comments,
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
              service_comments = new  SubModelController(AppProvider.getApplication(context),
                  sendPath,
                  formData);
              final future = service_comments.sendData();
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
  SpeedDial	 Buttons(BuildContext context, bool?  visible, var formKey, ScrollController controller, SubModelController service_comments,
      var postNewReplyResult, State state, String? sendPath, String? id,  String? title ){
    return(
        SpeedDial(
            childMargin : const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
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
            children:listButton(context, formKey,controller,service_comments, postNewReplyResult, state, sendPath, id,  title )
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













  

