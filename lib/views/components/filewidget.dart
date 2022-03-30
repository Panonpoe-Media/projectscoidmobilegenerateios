import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import 'package:projectscoid/models/file_fields.dart';
//import 'package:projectscoid/models/image_fields.dart';
import 'package:projectscoid/models/photo.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:projectscoid/views/components/validator.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:path_provider/path_provider.dart';

class FileContent extends StatelessWidget {
  const FileContent({ Key? key, this.link, this.fz})
      :
        super(key: key);

  final String? link;
  final int? fz;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
   // final TextStyle descriptionStyle = theme.textTheme.subhead;
    final TextStyle textStyle = Theme.of(context).textTheme.caption!.copyWith(fontStyle: FontStyle.italic, fontSize: 12,decoration: TextDecoration.underline, color: Colors.blue);
    final List<Widget> children = <Widget>[
      // Photo and title.
          Container(
                      height: 20,
                      alignment: Alignment.bottomLeft,
                      constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0),
                      padding: const EdgeInsets.all(8.0),

                      child: Text(link! + ' ' + formatBytes(fz!,2), style: textStyle),
                    ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

String formatBytes(int bytes, int decimals) {
if (bytes <= 0) return "0 B";
const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
var i = (log(bytes) / log(1024)).floor();
return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
' ' +
suffixes[i];
}

class _FileTile extends StatelessWidget {
  _FileTile({
    Key? key,
    this.label,
    this.link,
    this.filesize,
    this.children,
  }) : super(key: key);

  final String? label;
  final String? link;
  final int? filesize;
  final List<Widget?>? children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[
    ];
    if (link != '') {
      if(link == null){
        final TextStyle textStyle = Theme.of(context).textTheme.caption!.copyWith(fontStyle: FontStyle.italic,fontSize: 14);
        cardChildren.add(
            Semantics(
              container: true,
              child: Container(
                height: 20,
                alignment: Alignment.bottomLeft,
                constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0),
                padding: const EdgeInsets.all(8.0),

                child: Text('No File', style: textStyle),
              ),
            ));
      }else{
        cardChildren.add(FileContent(link: link, fz: filesize));

      }

    } else {
      final TextStyle textStyle = Theme.of(context).textTheme.caption!.copyWith(fontStyle: FontStyle.italic,fontSize: 14);
      cardChildren.add(
        Semantics(
          container: true,
          child: Container(
            height: 20,
            alignment: Alignment.bottomLeft,
            constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0),
            padding: const EdgeInsets.all(8.0),

            child: Text('No File', style: textStyle),
          ),
        ));
    }

    return Column(
        mainAxisSize: MainAxisSize.min,
        children: cardChildren,
      );
  }
}


class FileWidget extends StatefulWidget {
  List<FileField?>? value;

  String? filename;
  String? link;
  String? hint;
  final bool? required;
  String? caption;
  String? oldcaption;

  final ValueChanged<List<FileField?>?>? getValue;




  FileWidget({Key? key,  this.value,  this.caption, this.hint, this.required, this.getValue}) : super(key: key){

    if(required!){
      oldcaption = caption;
      caption = caption! + '*';
    } else{
      oldcaption = caption;
    }
    //filename = '';
    // if(contr[2]==)
    if (value != null){
      if(value!.isEmpty){
        value = null;
      }else if(value![0]!.name! != null){
      link = value![0]!.name!;
      filename = value![0]!.name!;
      }else{
       // val = new FileField('', '',0,0,0, '', '', '','' );
        value = null;

      link = '';
      }

    }else{
      link = '';
      //value.add(FileField('', '',0,0,0, '', '', '','' ));
      value = null;
    }

  }
  @override
  State<StatefulWidget> createState() {
    return _FileStateWidget();
  }

}

class _FileStateWidget extends State<FileWidget>{

  static const String _BASE_URL1= 'https://upload.projects.co.id';
  static const String _UPLOAD_URL1 = '/upload/temp/';
  //{"status":"1","name":"${image.name}","temp":"${image.temp}"}
  List<FileField> fileproperty = []  ;
  bool isvalid = true;
  FileField? dioResultFile;
  String errormessage = '';
  DIOProvider? provider;
  bool validation = true;
  String? filename;
  double progressCount = 0;
  bool failed = false;
  int fl = 0;
 // String link = '';
 // _FileStateWidget({this.link});


  @override
  initState() {
    super.initState();

    if ((widget.value !=  null) && (widget.filename != '')) {
      //link = widget.filename;
    }else {
      widget.link= '';

      setState(() {
        // validation(false);
      });
    }
  }
  String validateFile(_value, _require) {
    String value = _value;
    bool   require =  _require;
    String result = '' ;
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result = 'No File selected';
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

  Future<FileField?> _uploadFile(BuildContext context) async {
    String? filepath;
    // String filename;
    FileField dioResultFile;
    File file;
    DateTime lastmd;
    int filelength;
    int filedate;



    Future<void> _showNotification( String msg, int id, String title) async {
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
          'your channel id', 'your channel name',
          importance: Importance.max, priority: Priority.high, ticker: 'ticker');
      var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android:androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
      /* await AppProvider..flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x'); */
      await AppProvider.getApplication(context).flutterLocalNotificationsPlugin?.show(
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

    Future<FileField>loadFileFile(String filename, String filepath, ProgressULCallback progress)async{

      FormData  formdata = FormData.fromMap({
        "Filename":"filename",
        "Filedata": await MultipartFile.fromFile(filepath, filename: filename),

      });
      FileField? res ;

      try {
        res =  await provider?.uploadFile1(formdata, progress).then(( response) {
          return response;
        });
      }catch(e) {
        failed = true;
      }


      return res!;
    }

    provider = await _init();
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(result != null) {
      filepath = result.files.single.path;
    }
   // filepath = await FilePicker.getFilePath(type: FileType.any);
    widget.filename = p.basename(filepath!);
    file = File(filepath);
    lastmd = file.lastModifiedSync();
    filelength = file.lengthSync();
    fl = filelength;
    filedate = lastmd.toUtc().millisecondsSinceEpoch;
    dioResultFile = await loadFileFile(widget.filename!, filepath, showProgress);
    FileField val = new FileField(dioResultFile.status, dioResultFile.name,filelength,0,0, dioResultFile.temp, '', '',filedate.toString(), );
    // fileproperty.add(val);

    // this.contr.text  = dioResultFile.name;
    widget.link = dioResultFile.name;
    if(dioResultFile != null) {
      fileproperty.add(val);
      // setState(() {
      uploadfile(fileproperty);
      //);
    };
    //link = _BASE_URL1+ _UPLOAD_URL1   +  dioResultFile.temp;

    // print('file===== ${dioResultFile.name}');
    // this.contr1.text = dioResultFile.temp;
    // print('filepath ===' +filepath);

  }



   void uploadfile (List<FileField?>? value){
    widget.getValue!(value!);
  }



   Future<void> _clearFile() async {
   // this.contr.text  = dioResultFile.name;
    //fileproperty.add(FileField('','', 0, 0, 0, '','','',''));
    fileproperty = [];
    uploadfile(fileproperty);
    widget.link = '';
   // link =  _BASE_URL1+ _UPLOAD_URL1 ;
   
  }  

  @override
  Widget build (BuildContext context){



    // InputComponent password;
    return
      ItemListWidget(
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
                    height: widget.filename == '' || widget.filename == null ? 140.0 : 180,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: const Color(0xFF000000), width: 1.0),
                    //color: CurrentTheme.ShadeColor,
                    ),
                    child :
                             Column(
                            children: <Widget>[
                              Validator(
                                value: widget.value == [] || widget.value == null  ? '' : widget.value![0]!.name! ,
                                validator: (value) {
                                  errormessage = validateFile( widget.value == [] || widget.value == null ? '' : widget.value![0]!.name!, widget.required);
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
                              // Expanded( child :
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
                                  child: Column(

                                    children: <Widget>[
                                      widget.filename == '' || widget.filename == null ? _FileTile(label: widget.filename,link: widget.filename,) :
                                      _FileTile(label: widget.filename,link: widget.filename, filesize: fl),
                                      widget.filename == '' || widget.filename == null ? Container(height: 0.0, width: 0.0) :
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
                                          child: Column(
                                            children: <Widget>[
                                              failed ? LinearProgressIndicator(value: 0.0,) :progressCount == 0? Container() : LinearProgressIndicator(value: progressCount,) ,
                                              failed ? Text('Failed') : progressCount == 1.0? Text((progressCount * 100).toStringAsFixed(0) + "%" + " " + 'completed')  :
                                              progressCount == 0? Container() :Text((progressCount * 100).toStringAsFixed(0) + "%") ,
                                            ],
                                          )
                                      )

                                    ],
                                  )


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
                                  Padding(

                                    padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                                    child:
                                    ButtonBarTheme(
                                      data: const ButtonBarThemeData(
                                        alignment: MainAxisAlignment.end,
                                        //buttonMinWidth: 0.9 * width,
                                      ),

                                      child: ButtonBar(
                                        alignment : MainAxisAlignment.end,
                                        children: <Widget>[
                                          RaisedButton(
                                            textTheme: ButtonTextTheme.normal,
                                            color: Colors.grey,
                                            child: const Text('Upload ', style: TextStyle(color: Colors.white)),
                                            onPressed:   ()async { await _uploadFile(context); },
                                          ),
                                          RaisedButton(
                                            textTheme: ButtonTextTheme.normal,
                                            color: Colors.grey,
                                            child: const Text('Remove', style: TextStyle(color: Colors.white)),
                                            onPressed:   () {_clearFile(); },
                                          ),

                                        ],
                                      ),
                                    ),
                                  )

                                ],
                              )
                              //  )
                            ],

                          )
                )
          ),


      );
    /*
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : 
        
         <Widget> [
           new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(widget.caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
                    validation? Text(''): new Text(errormessage, style: TextStyle(color: CurrentTheme.ErrorColor, fontSize: 14), textAlign: TextAlign.right),
                ],)
           ),
           new Column(
             children: <Widget>[
                                 Validator(
                                   value: widget.value == [] || widget.value == null  ? '' : widget.value[0].name ,
                                   validator: (value) {
                                     errormessage = validateFile( widget.value == [] || widget.value == null ? '' : widget.value[0].name, widget.required);
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
                    // Expanded( child :
                                new Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),          
                                  child: Column(

                                              children: <Widget>[
                                                widget.filename == '' || widget.filename == null ? _FileTile(label: widget.filename,link: widget.filename,) :
                                                _FileTile(label: widget.filename,link: widget.filename, filesize: fl),
                                                 widget.filename == '' || widget.filename == null ? Container(height: 0.0, width: 0.0) :
                                                 Padding(
                                                     padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
                                                     child: Column(
                                                     children: <Widget>[
                                                       failed ? LinearProgressIndicator(value: 0.0,) : LinearProgressIndicator(value: progressCount,) ,
                                                       failed ? Text('Failed') : progressCount == 1.0? Text((progressCount * 100).toStringAsFixed(0) + "%" + " " + 'completed')  :
                                                       Text((progressCount * 100).toStringAsFixed(0) + "%") ,
                                                     ],
                                                   )
                                                 )

                                              ],
                                         )


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
                                            ButtonBarTheme(
                                              data: ButtonBarThemeData(
                                                alignment: MainAxisAlignment.end,
                                                //buttonMinWidth: 0.9 * width,
                                              ),

                                                  child: ButtonBar(
                                                    alignment : MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      RaisedButton(
                                                            textTheme: ButtonTextTheme.normal,
                                                            color: CurrentTheme.ShadeColor,
                                                            child: Text('Upload ', style: TextStyle(color: Colors.white)),
                                                            onPressed:   ()async { await _uploadFile(context); },
                                                            ),
                                                            RaisedButton(
                                                            textTheme: ButtonTextTheme.normal,
                                                            color: CurrentTheme.ShadeColor,
                                                            child: Text('Remove', style: TextStyle(color: Colors.white)),
                                                            onPressed:   () {_clearFile(); },
                                                            ),

                                                      ],
                                                    ),
                                                ),
                                          )

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