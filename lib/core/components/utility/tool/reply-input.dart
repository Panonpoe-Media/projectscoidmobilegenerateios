//import 'dart:html';

// ignore_for_file: unused_local_variable



import 'package:projectscoid/app/theme_manager.dart';
import 'package:flutter/material.dart';
//import 'dart:ui' as ui;
//import 'dart:convert';
//import 'dart:io';
//import 'dart:html' as ht
import 'package:provider/provider.dart';







class ReplyInput extends StatefulWidget {
  final TextEditingController? textEditingController;
  // final ZefyrController textEditingController;
  /// Zefyr editor like any other input field requires a focus node.
  final FocusNode? fNode;
  final VoidCallback? onPressed;
  final VoidCallback? onChanged;
  //final ht.FunctionStringCallback? onTextChange;
  final ValueChanged<String>? onTextChange;
  final VoidCallback? onAttach;
  final VoidCallback? onPic;
  final VoidCallback? onImage;
  final bool? isEmoji;
  final VoidCallback? onShowKB;
  final VoidCallback? onInsertEmoji;
  ReplyInput(
      {@required this.textEditingController,
        this.fNode,
        this.onPressed,
        this.onChanged,
        this.onTextChange,
        this.onAttach,
        this.onPic,
        this.onImage,
        this.isEmoji,
        this.onShowKB,
        this.onInsertEmoji});

  @override
  _ReplyInputState createState() => _ReplyInputState();
}

class _ReplyInputState extends State<ReplyInput> {
  bool darkMode = false;
  @override
  void initState() {
    super.initState();
    // widget.chatBloc.getQuickMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    var space = 4/7 * MediaQuery.of(context).size.width;
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
                          child: widget.isEmoji!? const Icon(Icons.keyboard, size: 22,color: Colors.black): const Icon(Icons.face, size: 22, color: Colors.black)
                      ),
                      onTap: widget.onInsertEmoji,
                    ),



                    Container(width: 1, height: 35,color: Colors.grey[300], padding: const EdgeInsets.only(top: 10),),
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
                            fillColor: Colors.white60,
                            border: InputBorder.none,
                            hintText: 'Send a message to this thread'),
                        onTap: widget.onChanged ,
                        onChanged: widget.onTextChange ,
                      ),

                    ),

                    GestureDetector(
                        child: const SizedBox(
                          width: 26,
                          child: Icon(Icons.attach_file, size: 22,color: Colors.black),
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
                                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                            child: Center(
                                              child:
                                              InkWell(
                                                onTap: widget.onImage,
                                                child: Column(
                                                  children: const <Widget>[

                                                   // KoukiconsGalleryX(height : 60, width : 60),
                                                    Icon(
                                                      Icons.close,
                                                      size: 60,

                                                    ),

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
                                                    //KoukiconsCamera2(height: 55, width: 55),
                                                    Icon(
                                                      Icons.camera,
                                                      size: 60
                                                    ),
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

                                                    //KoukiconsFiles(width: 60, height: 60),
                                                   Icon(
                                                     Icons.file_copy,
                                                     size: 60
                                                   ),


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


                    IconButton(
                      color: Colors.black38,
                      padding: EdgeInsets.only( right:0.0, left: 0),
                      disabledColor: Theme.of(context).primaryColorDark,
                      iconSize: 26,
                      icon: const Icon(Icons.send_time_extension, color: Colors.black ),
                      onPressed: widget.onPressed,
                    ),



                  ],
                ),


              ),


              // ),

            ],
          )

      ),


    );


  }


}
