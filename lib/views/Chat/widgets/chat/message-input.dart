import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
//import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
/*
import 'package:koukicons/addApp.dart';
import 'package:koukicons/moneyTransfer.dart';
import 'package:koukicons/camcorderPro.dart';
import 'package:koukicons/databaseNetwork.dart';
import 'package:koukicons/liveNews.dart';
import 'package:koukicons/electronics.dart';
import 'package:koukicons/galleryX.dart';
import 'package:koukicons/multipleDevices.dart';
import 'package:koukicons/pic2.dart';
import 'package:koukicons/phoneApps.dart';
import 'package:koukicons/Network2.dart';
import 'package:koukicons/bullish.dart';
import 'package:koukicons/newspaper.dart';
import 'package:koukicons/notebook.dart';
import 'package:koukicons/business.dart';
import 'package:koukicons/readingEbook.dart';
import 'package:koukicons/editDoc.dart';
import 'package:koukicons/photoReel.dart';
import 'package:koukicons/news.dart';
import 'package:koukicons/briefcase.dart';
import 'package:koukicons/files.dart';
import 'package:koukicons/camera2.dart';

 */
import 'dart:async';


class MessageInput extends StatefulWidget {
  final TextEditingController? textEditingController;
 // final ZefyrController textEditingController;
  /// Zefyr editor like any other input field requires a focus node.
  final FocusNode? fNode;
  final Function? onPressed;
  final Function? onChanged;
  final Function? onTextChange;
  final ChatBloc?chatBloc;
  final VoidCallback? onAttach;
  final VoidCallback? onPic;
  final VoidCallback? onImage;
  final Function? onVoice;
  final bool? isEmoji;
  final Function? onShowKB;
  final Function? onInsertEmoji;
   const MessageInput(
      {@required this.textEditingController,
      this.fNode,
      this.onPressed,
      this.onChanged,
      this.onTextChange,
      this.onAttach,
        this.onPic,
        this.onImage,
        this.onVoice,
      this.isEmoji,
      this.onShowKB,
      this.onInsertEmoji,
      @required this.chatBloc});

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  bool darkMode = false;
  bool isVoice = true;
  bool isRecording = false;
  bool showSlide = false;
  Stopwatch watch = Stopwatch();
  late Timer timer;
  bool mic = false;
  int secondBefore = 0;

  String elapsedTime = '';
  @override
  void initState() {
    super.initState();
   // widget.chatBloc.getQuickMenuItems();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
    // widget.chatBloc.getQuickMenuItems();
  }

  startWatch() {
    timer.cancel();
    setTime();
    if (!mounted) return;
    setState(() {
      //startStop = false;
      watch.start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }

  stopWatch() {
    timer.cancel();
    setState(() {
      //startStop = true;
      watch.stop();


    });
    watch.reset();
  }

  updateTime(Timer timer) {
    if (watch.isRunning) {
      if (!mounted) return;
      setState(() {
        //print("startstop Inside=$startStop");
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }

  setTime() {
    watch.reset();
    /*
    var timeSoFar = watch.reset();
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });

     */
  }

  transformMilliSeconds(int milliseconds) {
    print('milliseconds == $milliseconds');
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();
    String hoursStr = '';
    if((hours % 60) > 0){
      hoursStr = '${(hours % 60).toString()}.';
    }

    String minutesStr = (minutes % 60).toString();
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    if(seconds - secondBefore == 1){
      secondBefore = seconds;
      if(mic){
         setState(() {
        mic = false;
         });
      }else{
         setState(() {
        mic = true;
         });
      }
    }

    return "$hoursStr$minutesStr.$secondsStr";
  }


  @override
  Widget build(BuildContext context) {
    var space = 4/4.7 * MediaQuery.of(context).size.width;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;

    return

          SizedBox(
            //height: 300,
            width:  space,
            child:
            Card(
                borderOnForeground: false,
                elevation: 2,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child:



                Column(
                  children: <Widget>[

                    //  Divider(
                    //    thickness: 0.5,
                    //  ),

                    Expanded(
                      // flex: 5,
                      child:
                      Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          isRecording? Container():
                          GestureDetector(
                              child: Container(
                                  width: 26,
                                  child: widget.isEmoji!? const Icon(Icons.keyboard, size: 22,color: Colors.black): const Icon(Icons.tag_faces_sharp, size: 22, color: Colors.black)
                              ),
                              onTap:
                                  (){
                                if(isVoice){
                                  setState(() {
                                    isVoice = false;
                                  });
                                }
                                widget.onInsertEmoji!();
                              }


                          ),



                          Container(width: 1, height: 35,color: Colors.grey[300], padding: const EdgeInsets.only(top: 10),),



                          isRecording?


                          Expanded(
                              child:
                              Container(
                                  child: Row(
                                    children: [

                                      mic ? Container(
                                          padding: const EdgeInsets.all(8),
                                          child: const Icon(
                                            Icons.mic,
                                            color: Colors.deepOrange,
                                            size: 25,
                                          )) : Container(padding: EdgeInsets.all(8),
                                          child: const Icon(
                                            Icons.mic,
                                            color: Colors.white,
                                            size: 25,
                                          )),
                                      const SizedBox(width: 3,),
                                      Text(elapsedTime, style: const TextStyle(fontSize: 20.0)),
                                    ],
                                  )
                              )
                          )
                              : Expanded(
                            child:
                            TextField(
                              //scrollPadding:
                              //expands: true,
                              //scrollPadding: EdgeInsets.only(right: 0.5),
                                controller: widget.textEditingController,
                                focusNode: widget.fNode,

                                //  autofocus: true,
                                //style: TextStyle(fontSize: 14, fontFamily: 'NotoColorEmoji', wordSpacing: -8),
                                style: TextStyle(fontSize: 14, color:  darkMode ? Colors.black : Colors.black ),
                                maxLines: 4,
                                minLines: 1,
                                decoration: const InputDecoration(
                                    filled: true,
                                    //  fillColor: Colors.white60,
                                    border: InputBorder.none,
                                    hintText: 'Send a message...'),
                                onTap:(){
                                  widget.onChanged!();
                                  if(widget.textEditingController?.value.text == ''){
                                    if(isVoice){
                                      setState(() {
                                        isVoice = false;
                                      });
                                    }else{

                                    }
                                  }



                                }
                                ,
                                //  onChanged: widget.onTextChange ,

                                onChanged:

                                    (val){
                                  widget.onTextChange!(val);

                                  if(widget.isEmoji!){
                                    if(isVoice){
                                      setState(() {
                                        isVoice = false;
                                      });
                                    }
                                  }
                                  if(val.isNotEmpty  ){
                                    if(isVoice){
                                      setState(() {
                                        isVoice = false;
                                      });
                                    }else{

                                    }


                                  }






                                }

                            ),

                          ),

                          GestureDetector(
                              child: Container(
                                width: 26,
                                child: const Icon(Icons.attach_file, size: 22,color: Colors.black),
                              ),
                              onTap:(){
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 250,
                                      // color: Colors.amber,
                                      child: Center(
                                          child:
                                          GridView.count(
                                              crossAxisCount: 3,
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                                              physics: const NeverScrollableScrollPhysics(),
                                              children: <Widget>[
                                                Container(
                                                  //  color:  CurrentTheme.BackgroundColor,
                                                  color : Colors.transparent,
                                                  height: 80, // tambahkan property berikut
                                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                  child: Center(
                                                    child:
                                                    InkWell(
                                                      onTap: widget.onImage,
                                                      child: Column(
                                                        children: const <Widget>[
                                                          Icon(Icons.photo_album, size: 60,),

                                                         // KoukiconsGalleryX(height : 60, width : 60),


                                                          Padding(padding: EdgeInsets.only(top: 5.0)),
                                                          Text(
                                                            'Galerry',
                                                            maxLines: 2,
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(

                                                              fontFamily: "Sans",
                                                              fontSize: 14.0,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  //  color:  CurrentTheme.BackgroundColor,
                                                  color : Colors.transparent,
                                                  height: 80, // tambahkan property berikut
                                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                  child: Center(
                                                    child:
                                                    InkWell(
                                                      onTap: widget.onPic,
                                                      child: Column(
                                                        children: const <Widget>[
                                                          Icon(Icons.photo_camera, size: 60,),
                                                        //  KoukiconsCamera2(height: 55, width: 55),
                                                          Padding(padding: EdgeInsets.only(top: 5.0)),
                                                          Text(
                                                            'Camera',
                                                            maxLines: 2,
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontFamily: "Sans",
                                                              fontSize: 14.0,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  //  color:  CurrentTheme.BackgroundColor,
                                                  color : Colors.transparent,
                                                  height: 80, // tambahkan property berikut
                                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                  child: Center(
                                                    child:
                                                    InkWell(
                                                      onTap:
                                                      widget.onAttach,

                                                      // Navigator.of(context).pop();

                                                      child: Column(
                                                        children: const <Widget>[
                                                          Icon(Icons.file_copy, size: 60,),
                                                         // KoukiconsFiles(width: 60, height: 60),



                                                          Padding(padding: EdgeInsets.only(top: 5.0)),
                                                          Text(
                                                            'File',
                                                            maxLines: 2,
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(

                                                              fontFamily: "Sans",
                                                              fontSize: 14.0,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),


                                              ]
                                          )
                                      ),
                                    );
                                  },
                                );
                              }
                            // widget.onAttach,
                          ),
                          /*


                          isVoice?

                          Container(
                              height: 40,
                              margin: EdgeInsets.fromLTRB(5, 5, 10, 5),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: isRecording
                                        ? Colors.white
                                        : Colors.black12,
                                    spreadRadius: 6)
                              ], color: Colors.green, shape: BoxShape.circle),
                              child: GestureDetector(
                                onLongPress: () async{
                                  startWatch();
                                  await widget.onVoice(0);
                                  showSlide = true;
                                  // startRecord();
                                  setState(() {
                                    isRecording = true;
                                    mic = true;
                                  });
                                },
                                onLongPressEnd: (details) {
                                  //  print('halo boss');

                                  widget.onVoice(watch.elapsedMilliseconds);
                                  stopWatch();
                                  setState(() {
                                    mic = false;
                                    secondBefore = 0;
                                    isRecording = false;

                                  });
                                  // await widget.onVoice(watch.elapsedMilliseconds);

                                  // stopRecord();


                                },
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.mic,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ))

                          :Container(
                              height: 40,
                              margin: EdgeInsets.fromLTRB(5, 5, 10, 5),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: isRecording
                                        ? Colors.white
                                        : Colors.black12,
                                    spreadRadius: 4)
                              ], color: Colors.green, shape: BoxShape.circle),
                              child: GestureDetector(
                                onTap:
                                    () {
                                  widget.onPressed();

                                  setState(() {
                                    isVoice = true;
                                  });


                                },

                                child: Container(
                                    padding:EdgeInsets.fromLTRB(12, 5, 10, 5),
                                    child: Icon(
                                      Icons.send_rounded,
                                      color: Colors.white,
                                      size: 22,
                                    )),
                              )
                          )

                           */





                        ],
                      ),


                    ),


                    // ),

                  ],
                )

            ),


          );




  }
/*
  void _quickMenuToggle() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return StreamBuilder(
              stream: widget.chatBloc.quickMenuListStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                Widget _widget = new ListTile(
                  leading: new Icon(Icons.list),
                  title: new Text('No quick messages registered yet'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
                if (snapshot.hasData) {
                  _widget = new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: menuItemsList(snapshot.data));
                }
                return _widget;
              });
        });
  }

 */
/*
  List<Widget> menuItemsList(List<QuickMenuItemModel> data) {
    List<ListTile> items = new List();
    data.forEach((d) {
      items.add(new ListTile(
        title: new Text(d.name),
        leading: new Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pop(context);
        //  widget.onQuickMenuSelect(d);
        },
      ));
    });
    return items;
  }

 */
}



class MessageInputSP extends StatefulWidget {
  final TextEditingController? textEditingController;
  // final ZefyrController textEditingController;
  /// Zefyr editor like any other input field requires a focus node.
  final FocusNode? fNode;
  final Function? onPressed;
  final VoidCallback? onChanged;
  final ValueChanged<String>? onTextChange;
  final bool? isEmoji;
  final Function? onShowKB;
  final VoidCallback? onInsertEmoji;
  final BuildContext? ctx;
  const MessageInputSP(
      {@required this.textEditingController,
        this.fNode,
        this.onPressed,
        this.onChanged,
        this.onTextChange,
        this.isEmoji,
        this.onShowKB,
        this.onInsertEmoji,
        this.ctx});

  @override
  _MessageInputSPState createState() => _MessageInputSPState();
}

class _MessageInputSPState extends State<MessageInputSP> {
  bool darkMode = false;
  @override
  void initState() {
    super.initState();
    // widget.chatBloc.getQuickMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;

    return Container(
      child:
      Card(
          borderOnForeground: false,
          elevation: 2,
          shadowColor: Colors.black,
          child:



          Column(
            children: <Widget>[

              //  Divider(
              //    thickness: 0.5,
              //  ),

              Expanded(
                // flex: 5,
                child:
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: SizedBox(
                          width: 26,
                          child: widget.isEmoji!? const Icon(Icons.keyboard, size: 22,color: Colors.black): const Icon(Icons.tag_faces, size: 22, color: Colors.black)
                      ),
                      onTap: widget.onInsertEmoji!,
                    ),


                    Container(width: 1, height: 35,color: Colors.grey[300], padding: EdgeInsets.only(top: 10),),
                    Expanded(
                      child:
                      TextField(
                        //scrollPadding:
                        //expands: true,
                        //scrollPadding: EdgeInsets.only(right: 0.5),
                        controller: widget.textEditingController,
                        focusNode: widget.fNode,
                        //  autofocus: true,
                        //style: TextStyle(fontSize: 14, fontFamily: 'NotoColorEmoji', wordSpacing: -8),
                        style: TextStyle(fontSize: 14, color:  darkMode ? Colors.black : Colors.black ),
                        maxLines: 4,
                        minLines: 1,
                        decoration: const InputDecoration(
                            filled: true,
                            //  fillColor: Colors.white60,
                            border: InputBorder.none,
                            hintText: 'Send a message...'),
                        onTap: widget.onChanged ,
                        onChanged: widget.onTextChange ,
                      ),

                    ),

                    IconButton(
                      color: Colors.black38,
                      padding: const EdgeInsets.only( right:0.0, left: 0),
                      disabledColor: Theme.of(context).primaryColorDark,
                      iconSize: 26,
                      icon: const Icon(Icons.send, color: Colors.black ),
                      onPressed:(){widget.onPressed!(widget.ctx);} ,
                    ),




                  ],
                ),


              ),


            ],
          )

      ),


    );


  }

/*
  List<Widget> menuItemsList(List<QuickMenuItemModel> data) {
    List<ListTile> items = new List();
    data.forEach((d) {
      items.add(new ListTile(
        title: new Text(d.name),
        leading: new Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pop(context);
          //  widget.onQuickMenuSelect(d);
        },
      ));
    });
    return items;
  }

 */

}