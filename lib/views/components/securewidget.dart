import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SecureWidget extends StatefulWidget {
  SecureWidget({  Key? key,
    this.value,
    this.caption,
    this.hint,
    this.verified,
    this.required,
    this.isEmail,
    this.getValue,
    this.getVerified
  }): super(key: key)
  {
    if(required!){
      oldcaption = caption;
      caption = caption! + '*';
    }
    Securehint = null;
    hideButton = false;
  }
  String? value;
  Map<String, dynamic>? Securehint;
  String? hint;
  final bool? required;
  bool? hideButton;
  String? caption;
  bool? isEmail;
  String? oldcaption;
  DIOProvider? provider;
  final verified;
  final ValueChanged<String?>? getValue;
  final ValueChanged<String?>? getVerified;


  @override
  State<StatefulWidget> createState() {
    return _SecureWidget();
  }
}

class _SecureWidget extends State<SecureWidget> {
  Uint8List? bytes;
  bool validation = true;
  bool isvalid = true;
  Object? hint ;
  String  errormessage = '';
  final String linkEmail = '/fw9423';
  final String linkSMS = '/tw6901';
  TextEditingController contr1 = TextEditingController();
//  _SecureWidget(){
    //
 // }
  @override
  initState() {

   // contr1!.text = widget.value!;
    widget.hideButton = false;
    super.initState();
  }

  String? validateSecure(_value, _require, _Secure) {
    String value = _value;
    bool   require = _require;
    String? Secure = _Secure;
    String? result = '' ;
    isvalid = false;
    if(require){
      if (value.isEmpty){
        result = 'This field is required';
        isvalid= false;
      }
    } else{
      if (value.isEmpty){
        result = null;
        isvalid = true;
      }
    }

    return result;
  }

  Future<DIOProvider> _init()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final DIOProvider provider = await DIOProvider(appDocDir.path);
    return provider;
  }

  void refreshSecure (String? value){
    widget.getValue!(value);
  }

  void getVerified (String? value){
    widget.getVerified!(value);
  }

  Future<Map<String, dynamic>> _refreshSecure() async {
    Map<String, dynamic> dioResultFile;
    String tempLink;
    DateTime date;
    String ds;
    if(widget.isEmail!) {
      tempLink = linkSMS;
    } else {
      tempLink = linkEmail;
    }
    widget.provider = await _init();
   // dioResultFile = await widget.provider.getSecureCode('/fw9423').then(( response) {
    dioResultFile = await widget.provider!.getSecureCode(tempLink).then(( response) {
      return response as Map<String, dynamic> ;
    });
    setState(() {
      getVerified (dioResultFile['msg'] as String);
     // refreshSecure (contr1.text);
    });
    return dioResultFile;
  }

  @override
  Widget build (BuildContext context){
    // InputComponent password;
    return ItemListWidget(
      tooltip: 'Send message',
      onPressed: (){
      },
      lines:
      widget.caption,
      lines1:
      errormessage,
      isdivided: false,
      wgt:
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
        child: Container(
          // padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            alignment: Alignment.center,
            //  height: widget.filename == '' || widget.filename == null ? 150.0 : 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: const Color(0xFF000000), width: 0.5),
              //color: CurrentTheme.ShadeColor,
            ),
            child :
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children :

                <Widget> [

                  Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
                      child: widget.verified != ''? HtmlWidget( widget.verified) : Container(width: 0.0, height: 0.0,)
                  ),
                  // Expanded( child :
                  Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 2.0, 0.0, 2.0),
                      child:// <Widget>[

                      Container(
                        // padding: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.fromLTRB(0.0, 2.0, 8.0, 0.0),
                        alignment: Alignment.center,
                        height: 50.0,

                        child: TextFormField(

                          style: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 14),

                          decoration: InputDecoration(
                            hintText: widget.hint,
                            // hintStyle: TextStyle(color: Colors.grey[500]),
                            hintStyle: TextStyle(color: validation ? CurrentTheme.ShadeColor : CurrentTheme.BackgroundColor),
                            //  errorStyle:
                            errorBorder: const UnderlineInputBorder(),
                            filled: true,
                            fillColor: CurrentTheme.BackgroundColor ,
                            // focusedErrorBorder: errorBorder,
                            border: const OutlineInputBorder(),
                          ),

                          controller: contr1,
                          validator: (value) {
                            errormessage = validateSecure(value, widget.required, widget.Securehint)!;
                            if (isvalid) {
                              setState(() {
                                validation = true;
                                refreshSecure (value!);
                              });
                              return null;
                            } else {
                              setState(() {
                                validation = false;
                                refreshSecure (value!);
                              });
                              return null;
                            }

                          },

                        ),



                      )

                    // ]
                  ),
                  // ),
                  // Expanded( child :
                  Row(
                    children: <Widget>[
                      const Expanded( child : Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
                        child:null,
                      ),
                      ),

                      widget.verified != ''? SizedBox(width: 0, height: 0,) :
                      Padding(

                        padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                        child:
                        ButtonTheme(

                          child: ButtonBar(
                            alignment : MainAxisAlignment.end,
                            children: <Widget>[
                              ElevatedButton(
                              //  textTheme: ButtonTextTheme.normal,
                              //  color: Colors.green,
                                style: ButtonStyle(
                                shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                                backgroundColor:
                                MaterialStateProperty.all<Color>( Colors.green),
                                overlayColor: MaterialStateProperty.all<Color>(Colors.green),
                                ),
                                child: Text('Verifikasi', style: TextStyle(color: CurrentTheme.BackgroundColor)),
                                onPressed:   ()async {
                                  hint = await _refreshSecure();

                                  setState(() {
                                    widget.Securehint =  hint as Map<String, dynamic>?;
                                    widget.hideButton = true;
                                  });
                                },

                              ),
                            ],
                          ),
                        ),
                      )

                    ],
                  )

                ]
            )
        ),

      ),



    );
/*
    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children :
        <Widget> [
          new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(widget.caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
                  new Text(errormessage, style: TextStyle(color: CurrentTheme.ErrorColor, fontSize: 14), textAlign: TextAlign.right),


                ],)
          ),
          new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
              child: widget.verified != ''? HtmlWidget( widget.verified) : Container(width: 0.0, height: 0.0,)
          ),
          // Expanded( child :
          new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
              child:// <Widget>[

              new Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
                alignment: Alignment.center,
                height: 50.0,

                child: new TextFormField(

                  style: TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20),

                  decoration: new InputDecoration(
                    hintText: widget.hint,
                    hintStyle: TextStyle(color: CurrentTheme.BackgroundColor),
                    border: InputBorder.none,
                  ),

                  controller: contr1,
                  validator: (value) {
                    errormessage = validateSecure(value, widget.required, widget.Securehint);
                    if (isvalid) {
                      setState(() {
                        validation = true;
                        refreshSecure (value);
                      });
                      return null;
                    } else {
                      setState(() {
                        validation = false;
                        refreshSecure (value);
                      });
                      return null;
                    }

                  },

                ),

                decoration: new BoxDecoration(
                  //color: Colors.lightBlue[100],
                  color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
                ),

              )

            // ]
          ),
          // ),
          // Expanded( child :
          new Row(
            children: <Widget>[
              Expanded( child : new Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
                child:null,
              ),
              ),

              widget.verified != ''? Container(width: 0, height: 0,) :
              new Padding(

                padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                child:
                ButtonTheme(

                  child: ButtonBar(
                    alignment : MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        textTheme: ButtonTextTheme.normal,
                        color: CurrentTheme.ShadeColor,
                        child: Text('Verifikasi', style: TextStyle(color: CurrentTheme.BackgroundColor)),
                        onPressed:   ()async {
                          hint = await _refreshSecure();

                          setState(() {
                            widget.Securehint =  hint;
                            widget.hideButton = true;
                          });
                        },

                      ),
                    ],
                  ),
                ),
              )

            ],
          )
          //  )

        ]
    );

 */


  }
}