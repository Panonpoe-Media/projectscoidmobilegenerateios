import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class CapthcaContent extends StatelessWidget {
  CapthcaContent({Key? key,  this.imagelink, this.bytes, this.label }) : super(key: key){
     if(bytes == null){
       islink = true;
     } else {
       islink = false;
     }
  }
  bool islink = false;
  final String? imagelink;
  final Uint8List? bytes;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    TextStyle? textStyle = Theme.of(context).textTheme.caption?.copyWith(fontStyle: FontStyle.italic,fontSize: 15);
    final List<Widget> children = <Widget>[
      // Photo and title.
      SizedBox(
        height: 115.0,
       // width: 100.0,
        child: Stack(
          children: <Widget>[

            Positioned(
             // bottom: 0.0,
             // left: 20.0,
             // right: 16.0,
               top: 10.0,
              child:    Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // three line description
                      /*
                      islink? Image.network(
                        imagelink!,
                      ):Image.memory(bytes!),

                       */

                      Container(
                          height: Image.network(
                            imagelink!,
                          ).height,
                          width : Image.network(
                            imagelink!,
                          ).width,
                          child : islink? Image.network(
                                 imagelink!,
                              ):Image.memory(bytes!)
                          ,
                         /* CachedNetworkImage(
                                imageUrl: imagelink,
                                
                              ),*/
                      ),


                      Container(
                        height: 20,
                        padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 0.0),

                        child: Text(label!, style:textStyle ,),
                      ),


                    ],
                  ),
                ),
              ),
            ),
            /*
            Positioned(
              //bottom: 0.0,
              // left: 20.0,
              // right: 16.0,
              top: 60.0,
              child:
                      Container(
                            height: 15,
                            alignment: Alignment.bottomLeft,
                            constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
                            padding: const EdgeInsets.all(8.0),

                            child: Text(label, style:textStyle ,),
                          ),

            ),

             */
          ],
        ),
      ),
      // Photo and title.
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              // three line description
              Padding(
                padding: EdgeInsets.only(left: 3.0),

              ),
            ],
          ),
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile({
    Key? key,
    this.label,
    this.link,
    this.bytes,
    this.children,
  }) : super(key: key);

  final String? label;
  final String? link;
  final Uint8List? bytes;
  final List<Widget>? children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[
    ];
    if (link != '') {
      cardChildren.add(CapthcaContent(imagelink: link, bytes : bytes, label: label));
    } else {
      final TextStyle? textStyle = Theme.of(context).textTheme.caption?.copyWith(fontStyle: FontStyle.italic,fontSize: 20);
      cardChildren.add(
        Semantics(
          container: true,
          child: Container(
            height: 30,
            alignment: Alignment.bottomLeft,
            constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
            padding: const EdgeInsets.all(8.0),

            child: Text('No Captcha', style: textStyle),
          ),
        )); 
    } 
/*
    return Card(
      semanticContainer: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: cardChildren,
      )
    );

 */
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: cardChildren,

         );
  }
}

class CaptchaWidget extends StatefulWidget {
   CaptchaWidget({Key? key,
      this.value,  
     // this.contr1,
      this.caption, 
      this.hint, 
      this.required, 
      this.getValue
   }) : super(key: key)
   {
        if(required!){
          oldcaption = caption;
          caption = caption! + '*';
        }
        captchahint = '';
        link = 'https://projects.co.id/public/program/captcha';
   } 
  String? value;
  String? captchahint;
  String? link;
  String? hint;
  final bool? required;
  String? caption;
  String? oldcaption;
  DIOProvider? provider;
  final ValueChanged<String>? getValue;


  @override
  State<StatefulWidget> createState() {
    return new _CaptchaWidget();
  }  
}

class _CaptchaWidget extends State<CaptchaWidget> {
  Uint8List? bytes;
  bool validation = true;
  bool isvalid = true;
  String hint = '';
  String  errormessage = '';
   TextEditingController contr1 = new TextEditingController();
  //_CaptchaWidget(){
     //
  //}
    @override
  initState() {
    super.initState();
   final future = _refreshCaptcha();
   future.then((value) {
      setState(() {
         hint  = value!;
      });
    }); 
  }

  String validateCaptcha(_value, _require, _captcha) {
    String value = _value;
    bool   require = _require;
    String captcha = _captcha;
    String result = 'Refresh your captcha' ;
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result = 'This field is required';
        isvalid= false;
      }
    } else{
      if (value.isEmpty){
        result = '';
        isvalid = true;
      }      
    }
   /* if (value != captcha){
      result = 'Captcha tidak sesuai.';
      isvalid = false;
    } */
    return result;
  }

  Future<DIOProvider> _init()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final DIOProvider provider = await DIOProvider(appDocDir.path);
    return provider;
  }

   void refreshcaptcha (String value){
    widget.getValue!(value);
  }

  Future<String?> _refreshCaptcha() async {
    String? dioResultFile;
    DateTime date;
    String ds;
    widget.provider = await _init();
    bytes =await widget.provider?.getCaptcha1().then(( response) {
      return base64.decode(response);
    });
    date = DateTime.now();
    ds = date.toString();
    dioResultFile = await widget.provider?.getCaptcha('c=$ds').then(( response) {
      return response;
    });
    widget.link =  '';
    setState(() {
      refreshcaptcha (contr1.text);
    });
    return dioResultFile!;
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
      child:
        Container(
        // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.center,
                // height: widget.filename == '' || widget.filename == null ? 150.0 : 350,
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
                  child: _ImageTile(label: hint, link: widget.link, bytes : bytes )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                  child:// <Widget>[

                  Container(
                    // padding: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                    alignment: Alignment.center,
                    height: 45.0,

                    child: TextFormField(

                     // style: TextStyle(color: validation ? CurrentTheme.NormalTextColor : CurrentTheme.BackgroundColor, fontSize: 14),

                      style: TextStyle(color: validation ? CurrentTheme.NormalTextColor : CurrentTheme.NormalTextColor, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        // hintStyle: TextStyle(color: Colors.grey[500]),
                        hintStyle: TextStyle(color: validation ? CurrentTheme.ShadeColor : CurrentTheme.BackgroundColor),
                        //  errorStyle:
                        errorBorder: const UnderlineInputBorder(),
                        filled: true,
                        fillColor: validation ? CurrentTheme.BackgroundColor : CurrentTheme.ErrorColor,
                       // fillColor: validation ? CurrentTheme.BackgroundColor : CurrentTheme.BackgroundColor,
                        // focusedErrorBorder: errorBorder,
                        border: OutlineInputBorder(),
                      ),

                      controller: contr1,
                      validator: (value) {
                        errormessage = validateCaptcha(value, widget.required, widget.captchahint);
                        if (isvalid) {
                          setState(() {
                            validation = true;
                            refreshcaptcha (value!);
                          });
                          return null;
                        } else {
                          setState(() {
                            validation = false;
                            refreshcaptcha (value!);
                          });
                          return null;
                        }

                      },

                    ),

                 //   decoration: new BoxDecoration(
                 //     //color: Colors.lightBlue[100],
                      color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
                   // color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ShadeColor,
                 //   ),

                  )

                // ]
              ),
              Row(
                children: <Widget>[
                  Expanded( child : new Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
                    child:null,
                  ),
                  ),
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
                              MaterialStateProperty.all<Color>(Colors.green),
                              overlayColor: MaterialStateProperty.all<Color>(Colors.green),
                            ),
                            child: Text('Refresh ${widget.oldcaption}', style: TextStyle(color: CurrentTheme.BackgroundColor)),
                            onPressed:   ()async {
                              hint = (await _refreshCaptcha())!;
                              setState(() {
                                widget.captchahint =  hint;
                                refreshcaptcha(contr1.text);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  )

                ],
              ),

            ]
        ),
        )
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

  // Expanded( child :
         new Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
            child: _ImageTile(label: hint, link: widget.link, bytes : bytes )
          ),
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
                      errormessage = validateCaptcha(value, widget.required, widget.captchahint);
                      if (isvalid) {
                        setState(() {
                            validation = true;
                            refreshcaptcha (value);
                        });
                        return null;
                      } else {
                        setState(() {
                            validation = false;
                             refreshcaptcha (value);
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
                    new Padding(

                      padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                      child:
                          ButtonTheme(

                            child: ButtonBar(
                              alignment : MainAxisAlignment.end,
                              children: <Widget>[
                                RaisedButton(
                                      textTheme: ButtonTextTheme.normal,
                                      color: CurrentTheme.ShadeColor,
                                      child: Text('Refresh ${widget.oldcaption}', style: TextStyle(color: CurrentTheme.BackgroundColor)),
                                      onPressed:   ()async {
                                           hint = await _refreshCaptcha();
                                              setState(() {
                                                  widget.captchahint =  hint;
                                                  refreshcaptcha(contr1.text);
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