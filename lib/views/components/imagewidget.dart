import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:dio/dio.dart';
//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:projectscoid/models/image_fields.dart';
import 'package:projectscoid/models/photo.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
import 'package:projectscoid/views/components/validator.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:image_picker/image_picker.dart' as ip;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';



class ImageContent extends StatelessWidget {
  const ImageContent({ Key? key, @required this.imagelink })
      : assert(imagelink != null),
        super(key: key);

  final String? imagelink;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final List<Widget> children = <Widget>[
      // Photo and title.
      SizedBox(
        height: 170.0,
        width: 160.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 16.0,
             // left: 20.0,
             // right: 16.0,
               top: 16.0,
              child:    Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle!,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      // three line description
                      Container(
                          height: 150.0,
                          width : 150.0,
                          child :Image.network(
                                imagelink!,
                              ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Photo and title.

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
    this.children,
    this.validation,
  }) : super(key: key);

  final String? label;
  final String? link;
  final List<Widget?>? children;
  final bool? validation;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[
    ];
    if (link != '') {
      cardChildren.add(ImageContent(imagelink: link));
    } else {
      final TextStyle textStyle = Theme.of(context).textTheme.caption!.copyWith(fontStyle: FontStyle.italic);
      cardChildren.add(
        Semantics(
          container: true,
          child: Container(
            height: 120,
            alignment: Alignment.center,
            color: validation!? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
            constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
            padding: const EdgeInsets.all(8.0),

            child: Text('No Image', style: textStyle),
          ),
        ));
    }

    return  Column(
        mainAxisSize: MainAxisSize.min,
        children: cardChildren,

    );
  }
}

class ImageWidget extends StatefulWidget {
  Photo? value;
  String? filename;
  String? hint;
  final bool? required;
  String? caption;
  String? oldcaption;
  DIOProvider? provider;
  final ValueChanged<Photo?>? getValue;
  String? link;
  ImageWidget({ this.value,  this.caption, this.hint, this.required,  this.getValue}){
    
    if(required!){
      oldcaption = caption;
      caption = caption! + '*';
    } else{
      oldcaption = this.caption;
    }
     if(value == null){
       filename = '';
     }else{
       filename = value!.name;
     }


  }
  @override
  State<StatefulWidget> createState() {
    return _ImageStateWidget();
  }  

}

class _ImageStateWidget extends State<ImageWidget>{
  static const String _BASE_URL1= 'https://upload.projects.co.id';
  String _UPLOAD_URL1 = '';
 // bool progresscircular = false;
  bool validation = true;
  bool isvalid = true;

 // String widget.link = '';
  double progressCount = 0;
  final picker = ip.ImagePicker();
  int fl = 0;
  bool failed = false;
  String errormessage = '';
  //_ImageStateWidget({this.link});


@override
  initState() {
    super.initState();
    _UPLOAD_URL1 = '/upload/${widget.value!.dir}/';
    if ((widget.value !=  null) && (widget.value!.file != '')) { 
        //link = _BASE_URL1 + _UPLOAD_URL1 +
        widget.link =  _BASE_URL1 + _UPLOAD_URL1 +  widget.value!.file!;

    }else {
      widget.link = '';

       // setState(() {
          // validation(false); 
       // });
    }
  }


  String? validateImage(_value, _require) {
    String value = _value;
    bool   require = _require;
    String result = '' ;
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result = 'No Image selected';
        isvalid= false;
      }
    } else{
      if (value.isEmpty){
        result = '';
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




   void uploadimage (Photo? value){
    widget.getValue!(value!);
  }


/*
 void onProgress(received, total) {
    if (total != -1) {
      
     // print((received / total * 100).toStringAsFixed(0) + "%");
     setState(() {
       progresscircular = true;
       widget.hint = (received / total * 100).toStringAsFixed(0) + "%";
     });
     
    } else{
      setState(() {
        progresscircular = false;
      });
    }  
  }

 */


  Future<Photo?>? _uploadImage(BuildContext context) async {
    String filepath;
   // List<String> image = [];
   // String filename;
    File file;
    DateTime lastmd;
    int filelength;
    int filedate;

    Photo? dioResultImage;



    Future<void> _showNotification( String msg, int id, String title) async {
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'your channel id', 'your channel name', 
          importance: Importance.max, priority: Priority.high, ticker: 'ticker');
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android:androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
      /* await AppProvider..flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x'); */
      await AppProvider.getApplication(context).flutterLocalNotificationsPlugin!.show(
          id, title, msg, platformChannelSpecifics,
          payload: title);
    }

    void showProgress(received, total) {
      if (total != -1) {
        setState(() {
          //  _showNotification(failed? 'failed' : "Upload " + (received / total * 100).toStringAsFixed(0) + "%", 2,
          //     widget.filename);
          progressCount = received / total ;
        });

        print((received / total * 100).toStringAsFixed(0) + "%");
      }
    }




    Future<Photo?>loadImageFile(String filename, String filepath, ProgressULCallback progress)async{
      FormData formdata = FormData.fromMap({
        "Filename":"filename",
        "Filedata": await MultipartFile.fromFile(filepath, filename: filename),

      });
      Photo? res ;
      // String res ;


      try {
        print('apakah masuk sini1');
        res =  await widget.provider?.uploadImage2(formdata, progress);
          failed = false;

      }catch(e) {
        failed = true;
        print('ini adalah gagal');
      }
      print('ini adalah thumb = ${res?.thumb}');
      return res;
    }
   
   //  String dioResultImage;

    setState(() {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });

    widget.provider = await _init();
   // FocusScope.of(context).autofocus();
   // filepath = await FilePicker.getFilePath(type: FileType.any);
  //  FilePickerResult result = await FilePicker.platform.pickFiles();
/*
    if(result != null) {
      filepath = result.files.single.path;
    }
    widget.filename = p.basename(filepath);
    file = File(filepath);
    lastmd = file.lastModifiedSync();
    filelength = file.lengthSync();
    fl = filelength;
    filedate = lastmd.toUtc().millisecondsSinceEpoch;
    print('ini filenya === ${widget.filename} and $filepath ' );
    
    dioResultImage = await loadImageFile(widget.filename, filepath, showProgress);
   // image.add(dioResultImage.status);
   // image.add(dioResultImage.name);
   // image.add(dioResultImage.temp);
   // this.contr.text  = dioResultImage.name;

   // print('upload ==== ${dioResultImage.toJson()}');
     if(dioResultImage != null){
       widget.value!.file = dioResultImage.temp;
       widget.value!.temp = dioResultImage.temp;
       widget.value!.name = dioResultImage.name;
       _UPLOAD_URL1 = '/upload/temp/';
       widget.link = _BASE_URL1+ _UPLOAD_URL1   +  dioResultImage.temp;
       setState(() {
       uploadimage(widget.value);
       });
     } else{
       widget.value!.file = '';
       setState(() {
         uploadimage(widget.value);
       });
     }

 */


    try {
      final pickedFile = await picker.getImage(
        source: ip.ImageSource.gallery,
      );

      if (pickedFile!.path.isNotEmpty) {
        print('apakah masuk sini1');
        var _path = pickedFile.path;
        var filename;
        filename = p.basename(_path);
        var file = File(_path);
        // var lastmd = file.lastModifiedSync();
        var filelength = file.lengthSync();
        var fl = filelength;
        // filedate = lastmd.toUtc().millisecondsSinceEpoch;
        dioResultImage = await loadImageFile(filename, _path, showProgress);
        print('ini filenya === $filename and $_path ' );

       // dioResultImage = await loadImageFile(widget.filename, filepath, showProgress);
        // image.add(dioResultImage.status);
        // image.add(dioResultImage.name);
        // image.add(dioResultImage.temp);
        // this.contr.text  = dioResultImage.name;

        // print('upload ==== ${dioResultImage.toJson()}');
        if(dioResultImage != null){
          widget.value!.file = dioResultImage.temp;
          widget.value!.temp = dioResultImage.temp;
          widget.value!.name = dioResultImage.name;
          _UPLOAD_URL1 = '/upload/temp/';
          widget.link = _BASE_URL1+ _UPLOAD_URL1   +  dioResultImage.temp!;
         // setState(() {
            uploadimage(widget.value);
         // });
        } else{
          widget.value!.file = '';
         // setState(() {
            uploadimage(widget.value);
         // });
        }

      }


    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }


   //  setState(() {
    //    progresscircular = false;
    //  });


    //return dioResultImage;
    //link = _BASE_URL1+ _UPLOAD_URL1   +  dioResultImage.temp;
  
   // print('file===== ${dioResultImage.name)}');
   // this.contr1.text = dioResultImage.temp;
    // print('filepath ===' +filepath);
   
  }  

   Future<void> _clearImage() async {
    //dioResultImage =Photo('','0','', '','', '');
    widget.value!.file = '';
   // uploadimage(dioResultImage);
    uploadimage(new Photo('','0','', '','', ''));
    widget.link = '';
   // widget.link =  _BASE_URL1+ _UPLOAD_URL1 ;
   
  }  

  @override
  Widget build (BuildContext context){


    return

      ItemListWidget(
          tooltip: 'Send message',
          onPressed: (){
          },
          lines:
          widget.caption,
          lines1:
          errormessage??'',
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
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: const Color(0xFF000000), width: 0.5),
                      //color: CurrentTheme.ShadeColor,
                    ),
                    child :
                   Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children :

                        <Widget> [
                         // widget.filename != '' && progressCount < 90.9 ? Container(height: 170.0, width: 160.0, color: CurrentTheme.ShadeColor,) : Container(height: 0.0, width: 0.0,),




                          widget.filename == '' || widget.filename == null ? Container(height: 0.0, width: 0.0,) :
                          widget.link == null || widget.link == '' ?Container(height: 0.0, width: 0.0,) :  _ImageTile(label: widget.filename,link: widget.link),

                          widget.filename == '' || widget.filename == null ? Container(height: 0.0, width: 0.0) :Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
                              child: Column(
                                children: <Widget>[
                                  failed ? Container(height: 0.0, width: 0.0,):progressCount == 0? Container() :LinearProgressIndicator(value: progressCount,) ,
                                  failed ? Text('Failed'): progressCount == 1.0? Text((progressCount * 100).toStringAsFixed(0) + "%" + " " + 'completed')  :
                                  progressCount == 0? Container() :Text((progressCount * 100).toStringAsFixed(0) + "%") ,
                                ],
                              )


                          ),



                         Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Validator(
                                value: widget.value!.file ,
                                validator: (value) {

                                  errormessage = validateImage( widget.value!.file??'', widget.required)!;
                                  if (isvalid) {
                                    setState(() {
                                      validation = true;

                                    });
                                    return null;
                                  } else {
                                    setState(() {
                                      validation = false;
                                    });
                                    return '';
                                  }
                                },
                              ),


                              /*
                             Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: widget.filename == '' || widget.filename == null ? Text(widget.hint, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 20),): Container(height: 0.0, width: 0.0),
                              ),

                               */
                              // Expanded( child :
                             Column(
                                children: <Widget>[
                                 Padding(
                                    padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                                    child:
                                    ButtonBarTheme(
                                      data: ButtonBarThemeData(
                                        alignment: MainAxisAlignment.end,
                                        //buttonMinWidth: 0.9 * width,
                                      ),
                                      child: ButtonBar(
                                        alignment : MainAxisAlignment.start,
                                        children: <Widget>[
                                          ElevatedButton(
                                            //  textTheme: ButtonTextTheme.normal,
                                            //  color: Colors.green,
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                                              backgroundColor:
                                              MaterialStateProperty.all<Color>( Colors.green),
                                              overlayColor: MaterialStateProperty.all<Color>( Colors.green),
                                            ),
                                            child: Text('Upload ${widget.oldcaption}', style: TextStyle(color: Colors.white)),
                                            onPressed:  ()async {
                                             // FocusScope.of(context).unfocus();

                                              await _uploadImage(context);
                                             // setState(() {
                                                // widget.captchahint =  hint;
                                                // refreshcaptcha(hint);
                                             //   uploadimage(widget.value);
                                             // });
                                            },


                                            // () { _uploadImage(context); },
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                 Padding(
                                    padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                                    child:
                                    ButtonBarTheme(
                                      data: ButtonBarThemeData(
                                        alignment: MainAxisAlignment.end,
                                        //buttonMinWidth: 0.9 * width,
                                      ),
                                      child: ButtonBar(
                                        alignment : MainAxisAlignment.start,
                                        children: <Widget>[
                                          ElevatedButton(
                                            //  textTheme: ButtonTextTheme.normal,
                                            //  color: Colors.green,
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
                                              backgroundColor:
                                              MaterialStateProperty.all<Color>( Colors.grey),
                                              overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
                                            ),
                                            child: Text('Clear', style: TextStyle(color: Colors.white)),
                                            onPressed:   () {
                                             // FocusScope.of(context).unfocus();
                                              _clearImage();
                                              },
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              )
                              //  )
                            ],

                          ),

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
          Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                   Text(widget.caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
                    validation? Text(''):Text(errormessage, style: TextStyle(color: CurrentTheme.ErrorColor, fontSize: 14), textAlign: TextAlign.right),
                ],)
           ),
           widget.filename == '' || widget.filename == null ? Container(height: 0.0, width: 0.0,) :
           widget.link == null || widget.link == '' ?Container(height: 0.0, width: 0.0,) : _ImageTile(label: widget.filename,link: link),
          Row(
             children: <Widget>[
                     Validator(
                        value: widget.value!.file ,
                         validator: (value) {

                           errormessage = validateImage( widget.value!.file, widget.required);
                           if (isvalid) {
                             setState(() {
                               validation = true;

                             });
                             return null;
                           } else {
                             setState(() {
                               validation = false;
                             });
                             return '';
                           }
                         },
                     ),
 
                     Expanded( child :
                                   widget.filename == '' || widget.filename == null ? Container(height: 0.0, width: 0.0) :Padding(
                                   padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
                                   child: Column(
                                     children: <Widget>[
                                       failed ? Container(height: 0.0, width: 0.0,):LinearProgressIndicator(value: progressCount,) ,
                                       failed ? Text('Failed'): progressCount == 1.0? Text((progressCount * 100).toStringAsFixed(0) + "%" + " " + 'completed')  :
                                       Text((progressCount * 100).toStringAsFixed(0) + "%") ,
                                     ],
                                   )
                               )

                               /*
                               Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),          
                                  child: progresscircular?LinearProgressIndicator(): _ImageTile(label: widget.filename,link: link, validation: validation)
                                ),
                               */
                     ),
                    Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: widget.filename == '' || widget.filename == null ? Text(widget.hint, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 20),): Container(height: 0.0, width: 0.0),
                      ), 
                    // Expanded( child :
                               Column(
                                  children: <Widget>[
                                         Padding(
                                            padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0), 
                                            child:
                                            ButtonBarTheme(
                                              data: ButtonBarThemeData(
                                                alignment: MainAxisAlignment.end,
                                                //buttonMinWidth: 0.9 * width,
                                              ),
                                                  child: ButtonBar(
                                                    alignment : MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      RaisedButton(
                                                            textTheme: ButtonTextTheme.normal,
                                                            color: CurrentTheme.ShadeColor,
                                                            child: Text('Upload ${widget.oldcaption}', style: TextStyle(color: Colors.white)),
                                                            onPressed:  ()async {

                                                                  await _uploadImage();
                                                                    setState(() {
                                                                       // widget.captchahint =  hint;
                                                                       // refreshcaptcha(hint);
                                                                        uploadimage(widget.value);
                                                                    });                                                             
                                                               },
                                                            
                                                            
                                                             // () { _uploadImage(context); },
                                                            ),

                                                      ],
                                                    ),
                                                ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0), 
                                            child:
                                            ButtonBarTheme(
                                              data: ButtonBarThemeData(
                                                alignment: MainAxisAlignment.end,
                                                //buttonMinWidth: 0.9 * width,
                                              ),
                                                  child: ButtonBar(
                                                    alignment : MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      RaisedButton(
                                                            textTheme: ButtonTextTheme.normal,
                                                            color: CurrentTheme.ShadeColor,
                                                            child: Text('Clear', style: TextStyle(color: Colors.white)),
                                                            onPressed:   () {_clearImage(); },
                                                            ),

                                                      ],
                                                    ),
                                                ),
                                          ),

                                  ],
                                )
                //  )
             ],

           )
         ] 
    );

       */


  }
}