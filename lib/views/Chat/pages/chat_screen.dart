
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:projectscoid/views/Chat/models/chat_model.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/views/Chat/widgets/widgets.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:projectscoid/views/Chat/models/messages/commons/commons.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/views/Chat/models/models.dart';
import '../widgets/emoji_picker.dart';
import 'dart:io';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart' as ip;
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as a;
//import 'package:projectscoid/app/projectscoid.dart';
import 'dart:ui' as ui;
import 'package:projectscoid/models/file_fields.dart';
import 'package:path/path.dart' as p;
import 'package:projectscoid/views/components/uploadprovider.dart';
//import 'dart:io';
//import 'dart:math';
import 'package:projectscoid/models/photo.dart';
import 'package:dio/dio.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:camera/camera.dart';
import 'package:photo_view/photo_view.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image/image.dart' as img;
import 'dart:async';
//import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:intl/intl.dart'as intl1;
import 'package:filesize/filesize.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:projectscoid/core/components/utility/tool/slide_button.dart';
//import 'package:blockquote/blockquote.dart';
import 'package:projectscoid/core/components/utility/tool/blockquote.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' show parse;
List<CameraDescription> cameras = [];


class SearchThreadItm extends StatefulWidget {
  final dynamic message;
  final int? index;
  final String? userID;
  ChatBloc? chatBloc;
  final List<dynamic>? allData;
  String? search;
  final String? display;
  final dynamic userInfo;
  final String? avatar;

  SearchThreadItm(
      {Key? key, @required this.message,@required this.index, @required this.userID, @required this.chatBloc, @required this.allData, this.search, this.display, this.userInfo,  this.avatar
      }) : super(key: key);

  get _jsonMessage =>
      (this.message is String) ? jsonDecode(this.message) : this.message;

  @override
  _SearchThreadItmState createState() => _SearchThreadItmState();
}

class _SearchThreadItmState extends State<SearchThreadItm>  with RestorationMixin {
  var parser = EmojiParser();

  bool? darkMode = false;
  var format = intl1.DateFormat('dd/MM/yyyy');

  String? readTimestamp(int? timestamp) {
    var now = DateTime.now();
    var format = intl1.DateFormat('mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp! * 1000);
    var diff = now.difference(date);
    //var time = '';
    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;
    const check = '0';
    String mnt = format.format(date);
    String n = format.format(now);
    if(mnt.indexOf(check) == 0 ){
      mnt.replaceAll('0', '');
    }
    if(n.indexOf(check) == 0 ){
      n.replaceAll('0', '');
    }
    if (diff.inHours < 1) {
      final diffInMinutes = now.difference(date).inMinutes;
      timeValue = int.parse(n) - int.parse(mnt);// diffInMinutes;
      timeValue.isNegative ? timeValue = (int.parse(n) + 60) - int.parse(mnt)  : timeValue = timeValue;
      timeUnit = 'minute';
      // time = format.format(date);
    } else if (diff.inHours < 24) {
      timeValue = diff.inHours;
      timeUnit = 'hour';
    } else if (diff.inHours >= 24 && diff.inHours < 24 * 7) {
      timeValue = (diff.inHours / 24).floor();
      timeUnit = 'day';
    } else if (diff.inHours >= 24 * 7 && diff.inHours < 24 * 30) {
      timeValue = (diff.inHours / (24 * 7)).floor();
      timeUnit = 'week';
    } else if (diff.inHours >= 24 * 30 && diff.inHours < 24 * 12 * 30) {
      timeValue = (diff.inHours / (24 * 30)).floor();
      timeUnit = 'month';
    } else {
      timeValue = (diff.inHours / (24 * 365)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';
    // if (diff.inHours < 1) {
    timeAgo =  timeAgo + ' ago';
    if(timeValue == 1 && timeUnit == 'day'){
      timeAgo = 'yesterday';
    }
    if(timeUnit == 'hour' || timeUnit == 'minute'){
      timeAgo = intl1.DateFormat('hh:mm').format(date);
    }else{
      if(timeValue > 1){
        timeAgo = intl1.DateFormat('dd/MM/yyyy').format(date);
      }
    }

    return timeAgo!;

    /*
    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {

        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;

     */
  }
  bool isOnline(int timestamp) {
    var now = DateTime.now();
    var format = intl1.DateFormat('mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    bool _isOnline = false;
    int timeValue = 0;
    const check = '0';
    String mnt = format.format(date);
    String n = format.format(now);
    if(mnt.indexOf(check) == 0 ){
      mnt.replaceAll('0', '');
    }
    if(n.indexOf(check) == 0 ){
      n.replaceAll('0', '');
    }
    if (diff.inMinutes < 5) {
      _isOnline = true;

    }

    return _isOnline;
  }

  bool isFile(String ext ){
    bool isFile = false;
    if( ext.contains('https://upload.projects.co.id/upload/')){
      isFile = true;
    }
    return isFile;
  }


  String addTag(String keyword, String str){
    int length = keyword.length;
    if(keyword == ''){
      return str;
    }else{
      int idx = str.toLowerCase().indexOf(keyword.toLowerCase());
      if(idx > -1){
        str = str.substring(0, idx + length) + '</a>' +str.substring(idx + length);
        str = str.substring(0, idx ) + '<a style="color:orange">' +str.substring(idx );
        return str;
      }else{
        return str;
      }
    }

  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'ThreadItemScr';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'ThreadItemScr');
  }

  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    double cWidth = MediaQuery.of(context).size.width * 0.64;
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;





    return  Column(
        children: <Widget>[
          widget.index == 0? Container(height: 0): const Divider(
            thickness: 1,
            height:5,
          ),
          ListTile(
            isThreeLine: true,
          //  contentPadding: EdgeInsets.symmetric(horizontal: 2.0 , vertical: 5),
            contentPadding: const EdgeInsets.only(left: 2, right: 10,top: 5, bottom: 5),
            //enabled: false,
            onLongPress: () {},
            //onTap: () => Navigator.of(context).pushNamed('chat'),
            onTap: () async{
              /*
                final SendMsgModel1 message = SendMsgModel1(
                    thread: '${widget._jsonMessage['thread']}',
                    // sender: '${widget.userID}',
                    // message:  parser.emojify(parser.unemojify(_textEditingController.text)),
                    message:  ' ',
                    attachment: '');
                widget.chatBloc!.sendMsg(message);

                 */
              bool result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    user: widget.userInfo,
                    userID : widget.userID,
                    chatBloc : widget.chatBloc,
                    page: widget._jsonMessage['page'],
                      search: widget.search,
                    display: widget.display,
                    avatar: widget.avatar,
                    itemSearch: widget._jsonMessage['message'],
                  ),
                ),
              );
              if(!result){
                setState(() {

                });
              }
            },
            title:
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child:
              Text(
                '${widget.display}',
                maxLines: 2,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                style: TextStyle(fontSize: 17, color: darkMode!?Colors.white : Colors.black54),
              ),
            ),
            subtitle:
                   Padding(
                     padding: const EdgeInsets.only(left: 10.0),
                     child:  Column(

                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           /*
                           Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children:<Widget>[
                                 Expanded(
                                   child:
                                   Text(
                                     '${widget.display}',
                                     //'${widget._jsonMessage['userid']}',
                                     maxLines: 2,
                                     textAlign: TextAlign.left,
                                     overflow: TextOverflow.ellipsis,
                                     //   textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                     style: TextStyle(fontSize: 16,color: darkMode!?Colors.white : Colors.black, fontWeight: FontWeight.bold),
                                   ),
                                 ),
                                 /*
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, right: 5),
                        child:   Text("${readTimestamp(widget._jsonMessage['lasttime'])}",
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 11, color: darkMode!?Colors.white :Colors.grey, fontWeight: FontWeight.w100))
                      ),

                       */
                               ]
                           ),

                          */


                           Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children:<Widget>[
                                 Expanded(
                                     child:
                                     isFile(widget._jsonMessage['message'].toString())?
                                     Text(
                                       '📎 attachment \n',
                                       maxLines: 2,
                                       textAlign: TextAlign.left,
                                       overflow: TextOverflow.ellipsis,
                                       //   textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                       style: widget.userID != widget._jsonMessage['userid']? darkMode!? const TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold):const TextStyle(color: Colors.black87, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold) : darkMode!? const TextStyle(color: Colors.white , fontStyle: FontStyle.italic)
                                       :  const TextStyle(color:  Colors.black87, fontStyle: FontStyle.italic),
                                     )
                                         :  widget.userID != widget._jsonMessage['userid']? HtmlWidget(
                                       //(widget._jsonMessage['lastmessage'].substring(widget._jsonMessage['lastmessage'].length - 5) == '  ✓✓ ')
                                       ' ${widget.display} : ${parser.emojify(addTag(widget.search!, widget._jsonMessage['message']))}\n',

                                       //textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                       textStyle: darkMode!?  const TextStyle(color: Colors.white) : const TextStyle(color:Colors.black87) ,
                                     ) :  HtmlWidget(
                                       //(widget._jsonMessage['lastmessage'].substring(widget._jsonMessage['lastmessage'].length - 5) == '  ✓✓ ')
                                       'Anda : ${parser.emojify(addTag(widget.search!, widget._jsonMessage['message']))}\n',
                                      // maxLines: 2,
                                      // textAlign: TextAlign.left,
                                      // overflow: TextOverflow.ellipsis,
                                       //textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                         textStyle: darkMode!?  const TextStyle(color: Colors.white) : const TextStyle(color:Colors.black87) ,
                                     )
                                 )
                               ]
                           ),

                         ]
                     ),
                   ),





            /*
              Html(


              data :"${readText(widget._jsonMessage['lastmessage'], 100)}",
              style: {
                "html": Style(
                    fontSize: FontSize.medium,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NotoColorEmoji',
                    wordSpacing: -8
                ),
              }

            ),

               */
            // trailing: Text(readTimestamp(widget._jsonMessage['lasttime'])),

            trailing: Container(
              //  width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        /*
                        widget._jsonMessage['unread'] > 0
                            ? Icon(
                          Icons.check,
                          size: 10,
                        )
                            : Container(height: 10, width: 10),

                         */

                        Text("${readTimestamp(widget._jsonMessage['time'])}",
                            style: TextStyle(fontSize: 13, color: darkMode!?Colors.white :Colors.grey, fontWeight: FontWeight.w100))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),


                  widget._jsonMessage['rcvstatus'] == 0 ?
                  const SizedBox(height: 25,
                             width: 25,) :
                  widget._jsonMessage['rcvstatus'] == 1 ?
                  Padding(
                      padding : const EdgeInsets.only(top: 5, right: 8),
                      child:     Container(
                          height: 12,
                          width: 18,
                          decoration:
                          BoxDecoration(
                            color: darkMode!? Colors.black54:Colors.white,
                            image: const DecorationImage( image: const ExactAssetImage('assets/img/tickgrey.png'),
                              fit: BoxFit.contain,),
                          )
                      )
                  ):
                  widget._jsonMessage['rcvstatus'] == 2 ?
                  Padding(
                      padding : const EdgeInsets.only(top: 5, right: 8),
                      child:    Container(
                          height: 12,
                          width: 18,
                          decoration:
                          BoxDecoration(
                            color: darkMode!? Colors.black54:Colors.white,
                            image: const DecorationImage( image: const ExactAssetImage('assets/img/doubletickgrey.png'),
                              fit: BoxFit.contain,),
                          )
                      )
                  ):
                  widget._jsonMessage['rcvstatus'] == 3 ?
                  Padding(
                      padding : const EdgeInsets.only(top: 10, right: 8),
                      child:     Container(
                          height: 18,
                          width: 25,
                          decoration:
                          BoxDecoration(
                            color: darkMode!? Colors.black54:Colors.white,
                            image: const DecorationImage( image: ExactAssetImage('assets/img/doubletickgreen.png'),
                              fit: BoxFit.contain,),
                          )
                      )
                  ): const SizedBox(height: 25,
                          width: 25,),


                  /*
                        widget._jsonMessage['unread'] > 0
                            ? Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.amber[600],
                            shape: BoxShape.circle,
                          ),
                          child:  Text(
                            "${widget._jsonMessage['unread'].toString()}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                            : Container(
                          height: 25,
                          width: 25,
                        ),

                         */

                ],
              ),
            ),




          ),
        ]
    );
  }

  Color getBackgroundColor(dynamic selectedMessage) {
    if (selectedMessage != null && selectedMessage == widget._jsonMessage) {
      return const Color.fromRGBO(189, 208, 235, 0.8);
    } else {
      return Colors.transparent;
    }
  }
}

class SearchThread extends StatefulWidget {

  final String? user;
  ChatBloc? chatBloc;
  final dynamic thread;
  final String? avatar;
  final String? display;
  final dynamic userInfo;
  SearchThread({Key? key, @required this.user, @required this.chatBloc, this.thread, this.display, this.userInfo, this.avatar})
      : super(key: key);

  @override
  _SearchThreadState createState() => _SearchThreadState();
}

class _SearchThreadState extends State<SearchThread>  with RestorationMixin {
  final scrollThreshold = 200.0;
  int _currentIndex = 0;
  List<Widget> _children = [];
  ScrollController? _scrollController;
  List<dynamic> listt = [];
  double initscroll = 0.0;
  List<dynamic>? message;
  String searchText = '';
  TextEditingController searchBoxController = TextEditingController();
  bool selected = false;

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'SearchThread';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'SearchThread');
  }


  @override
  void initState() {

    super.initState();
    // widget.chatBloc!.closeConnection();
    //  widget.chatBloc = ChatBloc();
    //   widget.chatBloc!.lg(widget.user);
    // _currentIndex = 1;
    _scrollController = ScrollController();
    // listt.addAll(widget.listThread);

    // listt.removeAt(0);
    //print('death chat');
    //widget.chatBloc!.thread.clear();
    //  print('id ${widget.chatBloc!.id}');
    // message = widget.chatBloc!.thread;
    // widget.chatBloc!.wsSetHandlers();


    // widget.chatBloc!.getIndex(1);


  }



  void _onScroll()async {
    final maxScroll = _scrollController!.position.maxScrollExtent;
    final currentScroll = _scrollController!.position.pixels;
    cs.value = currentScroll;


  }



  void _onSubmitted(String value) {
    if(value.length >= 3){
      searchText = value;
      setState(() {
       // widget.chatBloc!.searchIndex(value);
        widget.chatBloc!.searchInThread(widget.thread, value);


      });
    }else{
      searchText = value;

    }

  }

  Widget? buildSearchBar(String? tiltle) {
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
          style:
          const TextStyle(fontSize: 14.0, height: 0.2, color: Colors.black),
          onSubmitted: (String value) {
            _onSubmitted(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,
            //hasFloatingPlaceholder: false,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                gapPadding: 20.0),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {

    _scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
    _scrollController!.addListener(_onScroll);
    // print('helooooo');

    return

      Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white,),
                onPressed: ()async{

                  Navigator.pop(context);
                }
            ),
            // iconTheme: IconThemeData(
            //  color: Colors.white, //change your color here
            // ),
            title: TextField(
              textInputAction: TextInputAction.search,
              style: const TextStyle(color: Colors.white),
              // textInputAction: TextInputAction.search ,
              onTap: (){

              },
              autofocus: true,
              onSubmitted: (String value) {
                _onSubmitted(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search Chat ',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(right: 10.0, left: 0.0, top: 10.0, bottom:  10.0),
              ),
            ),
          ),
          body: searchText.isEmpty ? Container():

          // return Container(width: 0.0, height: 0.0);

          searchText.length < 3 ?
          const Center(
            child: Text('Minimal 3 karakter untuk keyword yang dipakai.'),
          )
              :


          StreamBuilder(
            stream: widget.chatBloc!.searchListStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.hasError) return Text(snapshot.error.toString());
              if (snapshot.data == null) {
                //   _recoveryHistoryMessages();
                return
                  Container(height: 0.0, width: 0.0);
              }
              if (snapshot.hasData) {
                // return(Text('haloo2'));


                if (snapshot.data is List && snapshot.data.length == 0) {
                  // return
                  // Container(height: 0.0, width: 0.0);
                  return
                    Container(height: 0.0, width: 0.0);
                }

                return
                  ListView.builder(
                    controller: _scrollController,
                    itemCount: snapshot.data != null ? snapshot.data.length : 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => SearchThreadItm(
                      chatBloc: widget.chatBloc,
                      index: index,
                      userID:  widget.user,
                      message:  snapshot.data[index],
                      allData: snapshot.data,
                      search: searchText,
                      display: widget.display,
                      userInfo: widget.userInfo,
                      avatar: widget.avatar



                    ),
                  );
                //widget.chatBloc!.readSignal(widget._jsonMessage['thread']);
                // _scrollDown();
              }
              if (snapshot.data is List && snapshot.data.length == 0) {
                return
                  Container(height: 0.0, width: 0.0);
                // return(Text('haloo2'));
              }
              //return(Text('haloo3'));

              return
                ListView.builder(
                  controller: _scrollController,
                  itemCount: snapshot.data != null ? listt.length : 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SearchThreadItm(
                    chatBloc: widget.chatBloc,
                    index: index,
                    userID:  widget.user,
                    message:  snapshot.data[index],
                    allData: snapshot.data,
                    search: searchText,



                  ),
                );


            },
          )








      );




  }






}

class ChatCamera extends StatefulWidget {
  final String?  id;
  final String? thread;
  ChatBloc? chatBloc;
  final DIOProvider? provider;
  ChatCamera({Key? key, this.id, this.thread, this.chatBloc, this.provider}) : super(key: key);
  @override
  _ChatCameraState createState() {
    return _ChatCameraState();
  }
}

class _ChatCameraState extends State<ChatCamera>
    with WidgetsBindingObserver, RestorationMixin  {
  CameraController? controller;
 // MyProfileController my_profile;
  String imagePath = '';
  bool failed = false;
  int progressCount = 0;
  // var model;
  var isLoading = true;

final RestorableInt _counter = RestorableInt(0);

@override
String get restorationId => 'ChatCamera';

@override
void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
  registerForRestoration(_counter, 'counter');
}

  @override
  void initState() {
    super.initState();
    _initCamera();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }


  Future<void> _initCamera() async {
    //  cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.low);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (controller == null || !controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (controller != null) {
        onNewCameraSelected(controller!.description);
      }
    }
  }


  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (controller != null) {
      if (!controller!.value.isInitialized) {
        return Container();
      }
    } else {
      return const Center(
        child: const SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(),
        ),
      );
    }


    if (!controller!.value.isInitialized) {
      return Container();
    }

    //fetchData(my_profile);
    return Scaffold(
      // key: _scaffoldKey,
      extendBody: true,
      body:
      Stack(
        children: <Widget>[
          _cameraPreviewWidget(size) ,
          Align(
            alignment: const Alignment(0.9, -0.9),
            child:IconButton(
              iconSize: 40.0,
              color: Colors.white,
              icon: const Icon(
               // Ionicons.md_reverse_camera,
                Icons.camera,
                color: Colors.white,
              ),
              onPressed: () {
                _onCameraSwitch();
              },
            ),
          ),

          Positioned.fill(
            top: size.height - 180,
            left: 0.0,
            right: 0.0,
            child:
            _buildBottomNavigationBar(context),
          )

        ],
      ),

    );

  }



  Widget _buildBottomNavigationBar(BuildContext  context) {
    return Container(
      color: Colors.transparent,
      height: 100.0,
      width: double.infinity,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column( children: <Widget>[
            IconButton(
              iconSize: 80.0 ,
              padding: const EdgeInsets.all(0),
              icon: const Icon(Icons.circle,

                // size: 80.0,
                color:Colors.white,
              ),
              onPressed: () {
                onTakePictureButtonPressed(context);
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child : Text('Tap untuk mengambil gambar', style: TextStyle(color: Colors.white   ),),
            )

          ],
          )

        ],
      ),
    );
  }


  Future<void> _onCameraSwitch() async {
    final CameraDescription cameraDescription =
    (controller!.description == cameras[0]) ? cameras[1] : cameras[0];
    if (controller != null) {
      await controller!.dispose();
    }

    controller = CameraController(
      cameraDescription,
      ResolutionPreset.low,
    );

    // If the controller is updated then update the UI.
    controller!.addListener(() {
      if (mounted) setState(() {});
      if (controller!.value.hasError) {
        
        showInSnackBar('Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }


  }


  Future<FileSystemEntity?>? getLastImage() async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/media';
    final myDir = Directory(dirPath);
    List<FileSystemEntity> _images;
    _images = myDir.listSync(recursive: true, followLinks: false);
    _images.sort((a, b) {
      return b.path.compareTo(a.path);
    });
    // var lastFile = _images[0];
    /* var extension = path.extension(lastFile.path);
    if (extension == '.jpeg') {
      return lastFile;
    } else {
      String thumb = await Thumbnails.getThumbnail(
          videoFile: lastFile.path, imageType: ThumbFormat.PNG, quality: 30);
      return File(thumb);
    }
    */

  }
  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget(Size size) {
    final _size = size;
    return ClipRect(
      child: Container(
        child: Transform.scale(
          scale: controller!.value.aspectRatio / _size.aspectRatio,
          child: Center(
            child: AspectRatio(
              aspectRatio: controller!.value.aspectRatio,
              child: CameraPreview(controller!),
            ),
          ),
        ),
      ),
    );
  }



  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.low,
    );

    // If the controller is updated then update the UI.
    controller!.addListener(() {
      if (mounted) setState(() {});
      if (controller!.value.hasError) {
        showInSnackBar('Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }


  Future<Photo?>loadImageFile(String filename, String filepath, ProgressULCallback progress)async{
    FormData formdata = FormData.fromMap({
      "Filename":"filename",
      "Filedata": await MultipartFile.fromFile(filepath, filename: filename),

    });
    Photo? res ;
    // String? res ;


    try {
      res =  await widget.provider!.uploadImage1(formdata, progress).then(( response) {
        return response;
      });
    }catch(e) {
      failed = true;
    }

    return res!;
  }
  void showProgress(received, total) {
    if (total != -1) {
      setState(() {
        //  _showNotification(failed? 'failed' : "Upload " + (received / total * 100).toStringAsFixed(0) + "%", 2,
        //     widget.filename);
        progressCount = (received / total) == 1.0 ? 0 : (received / total);

      });

      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  void onTakePictureButtonPressed(BuildContext context) async{
    takePicture().then((String? filePath) async{
      if (mounted) {
        setState(() {
          imagePath = filePath!;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditChatPic(id : widget.id, filePath: filePath, provider: widget.provider, thread: widget.thread, chatBloc: widget.chatBloc )),
        );
        //showInSnackBar('Picture saved to $filePath');
      }
    });
  }




  Future<String?> takePicture() async {
    if (!controller!.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory? extDir = await getExternalStorageDirectory();
    final String dirPath = '${extDir?.path}/Pictures/my_profile';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller!.takePicture();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void _showCameraException(CameraException e) {
   // logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}

class EditChatPic extends StatefulWidget{
 // final ViewModelMyProfileRev model;
  final String? id;
  DIOProvider? provider;
  final String? filePath;
  ChatBloc? chatBloc;
  final String? thread;
  EditChatPic({Key? key, this.id, this.filePath, this.provider, this.chatBloc, this.thread}): super (key : key);

  @override
  EditChatPicState createState(){
    return  EditChatPicState();
  }

}

class EditChatPicState extends State<EditChatPic>{
  //MyProfileController my_profile;
  double progressCount = 0;
  bool progresscircular = false;
  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String errormessage = 'Upload your Image.';
  bool failed = false;

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // key: _scaffoldKey,
      extendBody: true,
      body:
      Stack(
        children: <Widget>[
          _profilePreview(size, widget.filePath!, context) ,
          Align(
            alignment: const Alignment(-0.9, -0.9),
            child:
            IconButton(
              iconSize: 40.0,
              color: Colors.white,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          progresscircular?  const Center(
              child:CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green),)): const SizedBox(width: 0.0, height: 0.0,),
          Positioned.fill(
            top: size.height - 180,
            left: 0.0,
            right: 0.0,
            child:
            _buildBottomNavigationBar(context, widget.id, widget.filePath),
          )

        ],
      ),

    );
  }

  Widget _profilePreview(Size size, String image, BuildContext context) {
    final _size = size;
    // print('image == $image');

    return PhotoView(
      imageProvider: FileImage(
        File(image)
        ,
      ),
      // Contained = the smallest possible size to fit one dimension of the screen
      minScale: PhotoViewComputedScale.contained * 1.3,
      // minScale: PhotoViewComputedScale.covered  ,
      // Covered = the smallest possible size to fit the whole screen
      maxScale: PhotoViewComputedScale.covered * 2.7,
      enableRotation: true,
      // Set the background color to the "classic white"
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
      loadingBuilder: (context, event) => Center(
        child: Container(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
          ),
        ),
      ),
    );
  }
  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<File> fixExifRotation(String imagePath) async {
    final originalFile = File(imagePath);
    List<int> imageBytes = await originalFile.readAsBytes();

    final originalImage = img.decodeImage(imageBytes);
    img.Image originalImg;
    originalImg = img.copyResize(originalImage!, height: 320, width : 320);
    // Here you can select whether you'd like to save it as png
    // or jpg with some compression
    // I choose jpg with 100% quality
    final fixedFile =
    await originalFile.writeAsBytes(img.encodeJpg(originalImg));

    return fixedFile;
  }

  void showProgress(received, total) {
    if (total != -1) {
      setState(() {
        //  _showNotification(failed? 'failed' : "Upload " + (received / total * 100).toStringAsFixed(0) + "%", 2,
        //     widget.filename);
      //  progressCount = received / total ;
        progressCount = (received / total) == 1.0 ? 0 : (received / total);

      });

      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  Widget _buildBottomNavigationBar(BuildContext?  context, String? id, String? ft) {
  //  MyProfileController my_profile;
  //  String sendPath = Env.value!.baseUrl + '/user/my_profile/edit_profile/' + widget.model.user_id +'/';
    // var formData ;
    var postMyProfileResult;
    Photo foto1;
    Photo foto2;
    return Container(
      color: Colors.transparent,
      height: 300.0,
      width: double.infinity,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding : const EdgeInsets.only(right: 10),
            child : Text('Kirim photo ini', style : TextStyle(color : Colors.white)),
          ),

          IconButton(
            iconSize: 60.0 ,
            padding: EdgeInsets.all(0),
            icon: const Icon(Icons.send,

              // size: 80.0,
              color:Colors.white,
            ),
            onPressed: ()async{
              setState(() {
                progresscircular = true;
              });
              final Directory? extDir = await getExternalStorageDirectory();
              final String dirPath = '${extDir?.path}/Pictures/my_profile';
              await Directory(dirPath).create(recursive: true);
              final String filePath = '$dirPath/${timestamp()}.jpg';
              await File(ft!).copy(filePath);
              await fixExifRotation(filePath);

              if (filePath.isNotEmpty) {
                var _path = filePath;
                String filename;
                filename = p.basename(_path);
                var file = File(_path);
                // var lastmd = file.lastModifiedSync();
                var filelength = file.lengthSync();
                var fl = filelength;
                // filedate = lastmd.toUtc().millisecondsSinceEpoch;
                var dioResultFile = await loadImageFile(filename, _path, showProgress);
                /*
        _path = await FilePicker.getFilePath(
          type: _pickingType,
          allowedExtensions: (_extension?.isNotEmpty ?? false)
              ? _extension?.replaceAll(' ', '')?.split(',')
              : null,
        );

         */
                if(dioResultFile!.status == '1'){

                  filename = dioResultFile!.temp!;
                  var  filethumbname = dioResultFile!.temp!.replaceAll('.', '-thumb.');
                  //var res await getUploadFolder(filename, 'usr${widget.userID}' );
                  String? res ;

                  try {
                    res =  await widget.provider!.getUploadFolder1(filename, 'usr${widget.id}' ).then(( response) {
                      return response;
                    });
                  }catch(e) {
                    failed = true;
                  }

                  try {
                    res =  await widget.provider!.getUploadFolder1(filethumbname, 'usr${widget.id}' ).then(( response) {
                      return response;
                    });
                  }catch(e) {
                    failed = true;
                    AppProvider.getRouter(context!)!.pop(context);

                    //  Navigator.of(context).pop();

                  }
                  if(res!  == 'OK'){
                   var  attMessage = "<div class='chat-image'> <a href='https://upload.projects.co.id/upload/usr${widget.id}/$filename' rel='lightbox'><img class='chat-thumbnail' src='https://upload.projects.co.id/upload/usr${widget.id}/$filethumbname'></a></div>";
                   // var attMessage = 'https://upload.projects.co.id/upload/usr${widget.id}/$filename';
                    // var attMessage = 'https://upload.projects.co.id/upload/temp/$filename';

                    // print('attMessage == $attMessage');
                    final SendMsgModel1 message = SendMsgModel1(
                        thread: '${widget.thread}',
                        // sender: '${widget.userID}',
                        message:  attMessage,
                        attachment: '');
                    widget.chatBloc!.sendMsg(message);
                    setState(() {
                      progresscircular = false;
                    });
                    AppProvider.getRouter(context!)!.pop(context!);
                    AppProvider.getRouter(context!)!.pop(context!);
                    AppProvider.getRouter(context!)!.pop(context!);

                  }

                }

              }

            },
          ),

        ],
      ),
    );
  }


  void _showToast(BuildContext context, String info) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(info),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }



  Future<Photo>loadImageFile(String filename, String filepath, ProgressCallback onProgress )async{
    FormData formdata = FormData.fromMap({
      "Filename":"filename",
      "Filedata": await MultipartFile.fromFile(filepath, filename: filename),

    });
    Photo res ;
    // String? res ;
    res =  await widget.provider!.uploadImage2(formdata, onProgress).then(( response) {
      return response;
    });
    return res;
  }

// void uploadimage (Photo value){
//   widget.getValue(value);
// }


//"user[address]": "${widget.model.address }"
}

class ShowSentImage extends StatefulWidget {
  final String? image;
  List<String?>? msg;
  ShowSentImage({Key? key, this.image, this.msg}) : super(key: key);

  @override
  ShowSentImageState createState() => ShowSentImageState();
}

class ShowSentImageState extends State<ShowSentImage> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File? _imageFile;
  int _progress = 0;
 // final String image1;
  double heightTI = 53;
  List<File> _mulitpleFiles = [];
  final TextEditingController _textEditingController =
  TextEditingController();
  FocusNode? _focusNode;
  bool isShowKB = false;
  bool isShowEG = false;
  int tapCount = 0;
  int _flex1 = 9;
  int OldNumberLine = 1;
 // ShowSentImageState({this.image1});
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();


  }
  //String image;
//  ShowImage({this.image});

  @override
  Widget build(BuildContext context) {
    //widget.msg!.add('Horeeeee');
    print('my image == ${widget.image}');
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pop(context, false);
            },
            child:
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:  Text('X' , style: TextStyle(fontSize: 20, color : Colors.redAccent),),
            ),



          ),
          const SizedBox(width: 30),

          GestureDetector(
            onTap: (){
              bool blank = _textEditingController.text?.trim()?.isEmpty ?? true;
              // print('hereeee');
              if (_textEditingController.text.isNotEmpty && !blank) {
                // print('hereeee');
                String str = _textEditingController.text;
                String newString = '';

                newString = str.replaceAllMapped(RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+'), (match) {
                  if(match.group(0)!.contains('..')) {
                    return "${match.group(0)}";
                  }else{
                    return "<p><a href='${match.group(0)}'>${match.group(0)}</a></p>";
                  }

                });

                widget.msg!.add(newString);

                //  widget.chatBloc!.getFirstThread('${widget._jsonMessage['thread']}');

                // att= '';

                // _flex = 1;
                _flex1 = 9;
                // if(isShowEG){
                //    isShowEG = false;
                //  }

                _textEditingController.clear();
                FocusScope.of(context).requestFocus(_focusNode);





              }

              Navigator.pop(context, true);
            },
            child:
            const Padding(
             padding: EdgeInsets.symmetric(vertical: 10),
             child: Text('OK',  style: TextStyle(fontSize: 20),),
             ),



          ),
          const SizedBox(width: 20),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0,right: 10.0),
          child: Text(
            'View',
            style: TextStyle(
                fontFamily: "Gotik",
                fontSize: 20.0,
                color: Colors.black54,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      //resizeToAvoidBottomPadding: false,
      body:
       Stack(
         children: [
           PhotoView(
             imageProvider: FileImage(
                 File(widget.image!)
             ),
             // Contained = the smallest possible size to fit one dimension of the screen
             minScale: PhotoViewComputedScale.contained * 0.8,
             // Covered = the smallest possible size to fit the whole screen
             maxScale: PhotoViewComputedScale.covered * 2.7,
             enableRotation: true,
             // Set the background color to the "classic white"
             backgroundDecoration: BoxDecoration(
               color: Theme.of(context).canvasColor,
             ),  loadingBuilder: (context, event) => Center(
             child: Container(
               width: 20.0,
               height: 20.0,
               child: CircularProgressIndicator(
                 value: event == null
                     ? 0
                     : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
               ),
             ),
            ),
           ),

           Column(
             children: [
                Expanded(
                flex:  _flex1 ,
                child: Container()),

               Align(
                 alignment: Alignment.bottomCenter,
                 child:  Container(
                     height: heightTI,
                     child:

                         MessageInputSP(

                             textEditingController: _textEditingController,
                             fNode: _focusNode,
                             onPressed: _sendMessage,
                             onChanged: _sendTyping,
                             isEmoji: isShowEG,
                             onInsertEmoji: _insertEmoji,
                             onTextChange: _textChange,
                             ctx: context

                         ),

                 ),
               ),
               isShowEG ? MediaQuery.of(context).viewInsets.bottom == 0.0? Expanded(
                   flex: 8,
                   child:
                   Container(
                   color: Colors.white,
                    child: EmojiPicker(
                      rows: 4,
                      columns: 9,
                      buttonMode: ButtonMode.MATERIAL,
                      //recommendKeywords: ["racing", "horse"],
                      numRecommended: 0,
                      onEmojiSelected: (emoji, category) {
                        // print('here${emoji.name}');
                        if(_textEditingController.value.text == '') {

                          insertText('');
                        }
                        insertText(emoji.emoji!);
                      },
                    ),
                   )

               ):
               Container(height: 0.0, width: 0.0,):
               Container(height: 0.0, width: 0.0,),
             ],
           )



         ],
       )


    );




  }


  void insertText(String text) {
    var value = _textEditingController.value;
    var start = value.selection.baseOffset;
    var end = value.selection.extentOffset;
    if (value.selection.isValid) {
      String newText = "";
      if (value.selection.isCollapsed) {
        if (end > 0) {
          newText += value.text.substring(0, end);
        }
        newText += text;
        if (value.text.length > end) {
          newText += value.text.substring(end, value.text.length);
        }
      } else {
        newText = value.text.replaceRange(start, end, text);
      }

      setState(() {
        _textEditingController.value = value.copyWith(
            text: newText,
            selection: value.selection.copyWith(
                baseOffset: end + text.length,
                extentOffset: end + text.length));
      });
    }else{
      setState(() {
        _textEditingController.value = value.copyWith(
            text: text,
            selection: TextSelection.collapsed(offset: text.length));
      });
    }
  }

  void _sendMessage(BuildContext context) {
    // final blank = _textEditingController.text == null || _textEditingController.text.trim() == '';
    bool blank = _textEditingController.text?.trim()?.isEmpty ?? true;
    // print('hereeee');
    if (_textEditingController.text.isNotEmpty && !blank) {
      // print('hereeee');
      String str = _textEditingController.text;
      String newString = '';

        newString = str.replaceAllMapped(RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+'), (match) {
          if(match.group(0)!.contains('..')) {
            return "${match.group(0)}";
          }else{
            return "<p><a href='${match.group(0)}'>${match.group(0)}</a></p>";
          }

        });

      widget.msg!.add(newString);

      //  widget.chatBloc!.getFirstThread('${widget._jsonMessage['thread']}');

     // att= '';

     // _flex = 1;
      _flex1 = 9;
      // if(isShowEG){
      //    isShowEG = false;
      //  }

        _textEditingController.clear();
        FocusScope.of(context).requestFocus(_focusNode);
        Navigator.pop(context, true);




    }else

    Navigator.pop(context, true);

  }

  void _sendTyping() {
    if(isShowEG){
      // insertText('');
      setState(() {
        isShowEG = false;
      });
    }
    tapCount ++;

  }

  void _textChange(String text) {
    double temp = 53;
    int temp1 = 8;
    final span = TextSpan(text: _textEditingController.value.text,
        style: TextStyle(fontSize: 14, fontFamily: 'Amazon Ember'));
    final tp = TextPainter(text: span, textDirection: TextDirection.ltr ,);
    bool isNextLine = false;
    tp.layout(
      minWidth: 20,
      maxWidth: 0.6 * MediaQuery
          .of(context)
          .size
          .width ,
    );
    List<ui.LineMetrics> lines = tp.computeLineMetrics();
    int numberOfLines = lines.length;

    if(numberOfLines > OldNumberLine) isNextLine = true;
    OldNumberLine = numberOfLines;
    if (MediaQuery
        .of(context)
        .viewInsets
        .bottom == 0.0) {
      // print('testkeyboard' + _textEditingController.value.text);
      if (isShowEG)
      {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      } else
      {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      }
    } else {
      // print('testkeyboardyes' + _textEditingController.value.text);
      if (isShowEG) {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 125;
            }
            break;
        }
      } else {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      }

      if(isNextLine){
        setState(() {
          //  _flex = temp;
          heightTI = temp;
          _flex1 = temp1;
        });
      }
    }
  }

  void _insertEmoji() {
    tapCount ++;
    if(!isShowEG){
      setState(() {
        FocusScope.of(context).requestFocus(_focusNode);
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      });
      isShowEG = true;
    }else{
      isShowEG = false;
      setState(() {
        SystemChannels.textInput.invokeMethod('TextInput.show');
      });
    }
    if(isShowEG){
    }else{
      if(_textEditingController.value.text == ''){
        FocusScope.of(context).requestFocus(_focusNode);
      }
    }



    if(_textEditingController.value.text == ''){

      // SystemChannels.textInput.invokeMethod('TextInput.hide');
      // FocusScope.of(context).requestFocus(_focusNode);
    }


  }
}

class ShowSentFile extends StatefulWidget {

  final  int? fz;
  final DateTime? date;
  final String? basename;

  List<String?>? msg;
  ShowSentFile({Key? key,  this.fz, this.date, this.basename, this.msg}) : super(key: key);

  @override
  ShowSentFileState createState() => ShowSentFileState();
}

class ShowSentFileState extends State<ShowSentFile> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File? _fileFile;
  int _progress = 0;
  //final String file1;
  double heightTI = 53;
  var dateformat = intl1.DateFormat('dd/MM/yyyy  hh:mm:ss');
  List<File> _mulitpleFiles = [];
  final TextEditingController _textEditingController =
  TextEditingController();
  FocusNode? _focusNode;
  bool isShowKB = false;
  bool isShowEG = false;
  int tapCount = 0;
  int _flex1 = 9;
  int OldNumberLine = 1;
 // ShowSentFileState();
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

  }
  //String file;
//  ShowImage({this.file});

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
   //print('wf ==== ${widget.file}');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0.0,

          title: Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: Text(
              'Sent File',
              style: TextStyle(
                  fontFamily: "Gotik",
                  fontSize: 20.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: (){
                  Navigator.pop(context, false);
              },
              child:
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:  Text('X' , style: TextStyle(fontSize: 20, color : Colors.redAccent),),
              ),



            ),
            const SizedBox(width: 30),

            GestureDetector(
              onTap: (){

                bool blank = _textEditingController.text?.trim()?.isEmpty ?? true;
                // print('hereeee');
                if (_textEditingController.text.isNotEmpty && !blank) {
                  // print('hereeee');
                  String str = _textEditingController.text;
                  String newString = '';

                  newString = str.replaceAllMapped(RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+'), (match) {
                    if(match.group(0)!.contains('..')) {
                      return "${match.group(0)}";
                    }else{
                      return "<p><a href='${match.group(0)}'>${match.group(0)}</a></p>";
                    }

                  });

                  widget.msg!.add(newString);

                  //  widget.chatBloc!.getFirstThread('${widget._jsonMessage['thread']}');

                  // att= '';

                  // _flex = 1;
                  _flex1 = 9;
                  // if(isShowEG){
                  //    isShowEG = false;
                  //  }

                  _textEditingController.clear();
                  FocusScope.of(context).requestFocus(_focusNode);





                }


                Navigator.pop(context, true);
              },
              child:
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('OK',  style: TextStyle(fontSize: 20),),
              ),



            ),
            const SizedBox(width: 20),
          ],
        ),
        //resizeToAvoidBottomPadding: false,
        body:
        Column(
          children: [
            Expanded(
                flex:  _flex1 ,
                child: Center(
                    child: GestureDetector(
                        child:   Container(
                          width: width * 3/4,
                          height: 70,

                          decoration: ShapeDecoration(
                            color:Colors.red[50],
                            shadows:[
                              BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
                            ],

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                  width: 1,
                                  color: Colors.white
                              ),
                            ),

                          ),
                          child:

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Attachment: ', style: TextStyle(fontSize: 10),),
                                Text('${widget.basename}', style: const TextStyle(color: Colors.red, fontSize: 12),),
                                widget.fz == null? Container() : Text('(${filesize(widget.fz)}, ${dateformat.format(widget.date!)} WIB)', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),

                        ),

                        onTap: (){

                        }

                    )
                )),

            Align(
              alignment: Alignment.bottomCenter,
              child:  Container(
                height: heightTI,
                child:

                MessageInputSP(

                    textEditingController: _textEditingController,
                    fNode: _focusNode,
                    onPressed: _sendMessage,
                    onChanged: _sendTyping,
                    isEmoji: isShowEG,
                    onInsertEmoji: _insertEmoji,
                    onTextChange: _textChange,
                    ctx: context

                ),

              ),
            ),
            isShowEG ? MediaQuery.of(context).viewInsets.bottom == 0.0? Expanded(
                flex: 8,
                child:
                Container(
                  color: Colors.white,
                  child: EmojiPicker(
                    rows: 4,
                    columns: 9,
                    buttonMode: ButtonMode.MATERIAL,
                    //recommendKeywords: ["racing", "horse"],
                    numRecommended: 0,
                    onEmojiSelected: (emoji, category) {
                      // print('here${emoji.name}');
                      if(_textEditingController.value.text == '') {

                        insertText('');
                      }
                      insertText(emoji.emoji!);
                    },
                  ),
                )

            ):
            Container(height: 0.0, width: 0.0,):
            Container(height: 0.0, width: 0.0,),
          ],
        )




    );

  }

  void insertText(String text) {
    var value = _textEditingController.value;
    var start = value.selection.baseOffset;
    var end = value.selection.extentOffset;
    if (value.selection.isValid) {
      String newText = "";
      if (value.selection.isCollapsed) {
        if (end > 0) {
          newText += value.text.substring(0, end);
        }
        newText += text;
        if (value.text.length > end) {
          newText += value.text.substring(end, value.text.length);
        }
      } else {
        newText = value.text.replaceRange(start, end, text);
      }

      setState(() {
        _textEditingController.value = value.copyWith(
            text: newText,
            selection: value.selection.copyWith(
                baseOffset: end + text.length,
                extentOffset: end + text.length));
      });
    }else{
      setState(() {
        _textEditingController.value = value.copyWith(
            text: text,
            selection: TextSelection.collapsed(offset: text.length));
      });
    }
  }

  void _sendMessage(BuildContext context) {
    // final blank = _textEditingController.text == null || _textEditingController.text.trim() == '';
    bool blank = _textEditingController.text?.trim()?.isEmpty ?? true;
    // print('hereeee');
    if (_textEditingController.text.isNotEmpty && !blank) {
      // print('hereeee');
      String str = _textEditingController.text;
      String newString = '';

      newString = str.replaceAllMapped(RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+'), (match) {
        if(match.group(0)!.contains('..')) {
          return "${match.group(0)}";
        }else{
          return "<p><a href='${match.group(0)}'>${match.group(0)}</a></p>";
        }

      });

      widget.msg!.add(newString);

      //  widget.chatBloc!.getFirstThread('${widget._jsonMessage['thread']}');

      // att= '';

      // _flex = 1;
      _flex1 = 9;
      // if(isShowEG){
      //    isShowEG = false;
      //  }

      _textEditingController.clear();
      FocusScope.of(context).requestFocus(_focusNode);
      Navigator.pop(context, true);




    }else

    Navigator.pop(context, true);

  }

  void _sendTyping() {
    if(isShowEG){
      // insertText('');
      setState(() {
        isShowEG = false;
      });
    }
    tapCount ++;

  }

  void _textChange(String text) {
    double temp = 53;
    int temp1 = 8;
    final span = TextSpan(text: _textEditingController.value.text,
        style: TextStyle(fontSize: 14, fontFamily: 'Amazon Ember'));
    final tp = TextPainter(text: span, textDirection: TextDirection.ltr ,);
    bool isNextLine = false;
    tp.layout(
      minWidth: 20,
      maxWidth: 0.6 * MediaQuery
          .of(context)
          .size
          .width ,
    );
    List<ui.LineMetrics> lines = tp.computeLineMetrics();
    int numberOfLines = lines.length;

    if(numberOfLines > OldNumberLine) isNextLine = true;
    OldNumberLine = numberOfLines;
    if (MediaQuery
        .of(context)
        .viewInsets
        .bottom == 0.0) {
      // print('testkeyboard' + _textEditingController.value.text);
      if (isShowEG)
      {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      } else
      {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      }
    } else {
      // print('testkeyboardyes' + _textEditingController.value.text);
      if (isShowEG) {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 125;
            }
            break;
        }
      } else {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      }

      if(isNextLine){
        setState(() {
          //  _flex = temp;
          heightTI = temp;
          _flex1 = temp1;
        });
      }
    }
  }

  void _insertEmoji() {
    tapCount ++;
    if(!isShowEG){
      setState(() {
        FocusScope.of(context).requestFocus(_focusNode);
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      });
      isShowEG = true;
    }else{
      isShowEG = false;
      setState(() {
        SystemChannels.textInput.invokeMethod('TextInput.show');
      });
    }
    if(isShowEG){
    }else{
      if(_textEditingController.value.text == ''){
        FocusScope.of(context).requestFocus(_focusNode);
      }
    }



    if(_textEditingController.value.text == ''){

      // SystemChannels.textInput.invokeMethod('TextInput.hide');
      // FocusScope.of(context).requestFocus(_focusNode);
    }


  }


}

class ChatScreen extends StatefulWidget {
  final dynamic  user;
     ChatBloc? chatBloc;
  final String? userID;
  final bool? trans;
  BuildContext? ctx;
  final int? page;
  final String? search;
  final String? display;
  final String? avatar;
  final String? itemSearch;

  ChatScreen({Key? key, this.user, this.userID, this.chatBloc, this.trans = false, this.ctx, this.page = 0, this.search = '', this.display, this.avatar , this.itemSearch}) : super(key: key);
  get _jsonMessage =>
      (user is String) ? jsonDecode(user) : user;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with RestorationMixin{
  bool isShowKB = false;
  bool isShowEG = false;
  int tapCount = 0;
  final TextEditingController _textEditingController =
  TextEditingController();
  SubModelController? onlineInfo;
  var parser = EmojiParser();
  int _flex = 1;
  int _flex1 = 9;
  double heightTI = 53;
  String att = '';
  int deltaEmoji = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _fileName;
  String? _path;
  Map<String, String>? _paths;
  String? _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  int OldNumberLine = 1;
  bool darkMode = false;
  DIOProvider? provider;
  bool failed = false;
  FocusNode? _focusNode;
  File? _image;
  final picker = ip.ImagePicker();
  var viewUserStatus;
  var isLoading = true;
  double progressCount = 0;
  Timer? _timer;
  bool isSelect = false;
  bool isReply = false;
  var selectMsg;
  List<dynamic> multiSelectedMessage = [];
  String recordFilePath ='';
  bool isPlayingMsg = false,  isSending = false;
  bool yes = false;
  var copyFormat = a.DateFormat('M/dd  HH:mm');
  bool isSend = false;
  String? username1;
  String? peerid1;
  String? myname1;

  String? parseThumb(String? htmlText) {
    //print('ini html image == $htmlText');
    var document = parse(htmlText);
    var data = document.getElementsByClassName('thumbnail');
    if (data.isNotEmpty) {
      return data[0].attributes['src'];
    } else {
      var data = document.getElementsByClassName('chat-thumbnail');
      return data[0].attributes['src'];
    }
  }

  String? readTimestamp(int? timestamp) {
    var now = DateTime.now();
    var format = a.DateFormat('mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp! * 1000);
    var diff = now.difference(date);
    var time = '';
    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;
    const check = '0';
    String mnt = format.format(date);
    String n = format.format(now);
    if(mnt.indexOf(check) == 0 ){
      mnt.replaceAll('0', '');
    }
    if(n.indexOf(check) == 0 ){
      n.replaceAll('0', '');
    }
    if (diff.inHours < 1) {
      final diffInMinutes = now.difference(date).inMinutes;
      timeValue = int.parse(n) - int.parse(mnt);// diffInMinutes;
      timeValue.isNegative ? timeValue = (int.parse(n) + 60) - int.parse(mnt)  : timeValue = timeValue;
      timeUnit = 'minute';
      // time = format.format(date);
    } else if (diff.inHours < 24) {
      timeValue = diff.inHours;
      timeUnit = 'hour';
    } else if (diff.inHours >= 24 && diff.inHours < 24 * 7) {
      timeValue = (diff.inHours / 24).floor();
      timeUnit = 'day';
    } else if (diff.inHours >= 24 * 7 && diff.inHours < 24 * 30) {
      timeValue = (diff.inHours / (24 * 7)).floor();
      timeUnit = 'week';
    } else if (diff.inHours >= 24 * 30 && diff.inHours < 24 * 12 * 30) {
      timeValue = (diff.inHours / (24 * 30)).floor();
      timeUnit = 'month';
    } else {
      timeValue = (diff.inHours / (24 * 353)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';
    // if (diff.inHours < 1) {

    return timeAgo + ' ago';

    /*
    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {

        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;

     */
  }

  bool? isOnline(int? timestamp) {
    var now = DateTime.now();
    var format = a.DateFormat('mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp! * 1000);
    var diff = now.difference(date);
    var time = '';
    String timeAgo = '';
    String timeUnit = '';
    bool _isOnline = false;
    int timeValue = 0;
    const check = '0';
    String mnt = format.format(date);
    String n = format.format(now);
    if(mnt.indexOf(check) == 0 ){
      mnt.replaceAll('0', '');
    }
    if(n.indexOf(check) == 0 ){
      n.replaceAll('0', '');
    }
    if (diff.inHours < 1) {
      final diffInMinutes = now.difference(date).inMinutes;
      timeValue = int.parse(n) - int.parse(mnt);// diffInMinutes;
      timeValue.isNegative ? timeValue = (int.parse(n) + 60) - int.parse(mnt)  : timeValue = timeValue;
      timeUnit = 'minute';
      if(timeValue < 5){
        _isOnline = true;
      }
      // time = format.format(date);
    }

    return _isOnline;
  }

  String? readDate(DateTime? date) {
    var now = DateTime.now();
    var format = a.DateFormat('mm');
   // var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date!);
    var time = '';
    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;
    const check = '0';
    String mnt = format.format(date);
    String n = format.format(now);
    if(mnt.indexOf(check) == 0 ){
      mnt.replaceAll('0', '');
    }
    if(n.indexOf(check) == 0 ){
      n.replaceAll('0', '');
    }
    if (diff.inHours < 1) {
      final diffInMinutes = now.difference(date).inMinutes;
      timeValue = int.parse(n) - int.parse(mnt);// diffInMinutes;
      timeValue.isNegative ? timeValue = (int.parse(n) + 60) - int.parse(mnt)  : timeValue = timeValue;
      timeUnit = 'minute';
      // time = format.format(date);
    } else if (diff.inHours < 24) {
      timeValue = diff.inHours;
      timeUnit = 'hour';
    } else if (diff.inHours >= 24 && diff.inHours < 24 * 7) {
      timeValue = (diff.inHours / 24).floor();
      timeUnit = 'day';
    } else if (diff.inHours >= 24 * 7 && diff.inHours < 24 * 30) {
      timeValue = (diff.inHours / (24 * 7)).floor();
      timeUnit = 'week';
    } else if (diff.inHours >= 24 * 30 && diff.inHours < 24 * 12 * 30) {
      timeValue = (diff.inHours / (24 * 30)).floor();
      timeUnit = 'month';
    } else {
      timeValue = (diff.inHours / (24 * 353)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';
    // if (diff.inHours < 1) {

    return timeAgo + ' ago';

    /*
    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {

        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;

     */
  }

  bool? isOnlineDate(DateTime? date) {
    var now = DateTime.now();
    var format = a.DateFormat('mm');
    print('dateeeee = $date');
    var diff = now.difference(date!);
    bool _isOnline = false;
    int timeValue = 0;
    const check = '0';
    String mnt = format.format(date);
    String n = format.format(now);
    if(mnt.indexOf(check) == 0 ){
      mnt.replaceAll('0', '');
    }
    if(n.indexOf(check) == 0 ){
      n.replaceAll('0', '');
    }
    if (diff.inMinutes < 5) {
      _isOnline = true;

    }

    return _isOnline;
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'Chat';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'Chat');
  }

  @override
  void initState() {
    checkPermissionAudio();
    if(widget.trans!!){
      super.initState();
     // if(widget.chatBloc != null){
        widget.chatBloc!.deleteMsg();
     // }



     // _sendMessage1(widget.user['lastmessage'].toString());
      onlineInfo =  SubModelController(AppProvider.getApplication(widget.ctx!),
          '${Env.value!.baseUrl}/public/browse_users/view/${widget._jsonMessage['userid']}/zz',
          null);

      _focusNode = FocusNode();
      fetchData(onlineInfo);
      /*
      if(widget.user['lastmessage'].toString().contains('Konteks Percakapan:')){
        _sendMessage1(widget.user['lastmessage'].toString());
      }

       */

    }else{
      super.initState();
      widget.chatBloc!.deleteMsg();
      _focusNode = FocusNode();
    }
    /*
    _timer = Timer.periodic(Duration(milliseconds: 3000), (timer) {
      //print('ini tidak sama $currentThread dengan $thread');
      final SendTypingModel message = SendTypingModel(
          thread: widget._jsonMessage['thread']);
      widget.chatBloc!.sendTyp1(message);
    });

     */

 }

  Future<void> fetchData(SubModelController? Online)async {
    // if (!mounted) {

    //   return Future.value(null);

    // }
   /* Timer.periodic(Duration(milliseconds: 5000), (timer) {
      final SendTypingModel message = SendTypingModel(
          thread: widget._jsonMessage['thread']);
      widget.chatBloc!.sendTyp(message);

     });

    */


    if (viewUserStatus == null) {

      final future = Online?.getData();
      future?.then((value) {
        if (!mounted) {
          viewUserStatus = null;

        }else{
           viewUserStatus =  ViewModelBrowseUsersRev.fromJson(value['model']);
           if(widget.user['lastmessage'].toString().contains('Konteks Percakapan:')){
             _sendMessage1(widget.user['lastmessage'].toString());
           }
         // print('Userr ${value}');
          setState(() {
            isLoading = false;
          });
          setState(() {
            viewUserStatus = ViewModelBrowseUsersRev.fromJson(value['model']);
          });


        }



      });
    }else{

      final future = Online?.getData();
      future?.then((value) {
        if (!mounted) {
          viewUserStatus = null;

        }else{
          viewUserStatus = ViewModelBrowseUsersRev.fromJson(value);
          setState(() {
            isLoading = false;
          });


        }


      });
   }

  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    var heightRatio = MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
    bool ish = true;
    heightRatio <= 1.66 ? ish = false : ish = true;
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    String av = widget._jsonMessage['avatar']?? widget.avatar ?? widget._jsonMessage['index']['avatar']?? 'https://cdn.projects.co.id/upload/usr561611/20141107545caba002e77-thumb.jpg'??'';

    var username = "${widget._jsonMessage['username'] ?? widget.display ?? widget._jsonMessage['index']['username'] ??  widget._jsonMessage['userid']}";
    var peerid = "${widget._jsonMessage['userid'] ?? widget.userID ?? widget._jsonMessage['index']['userid']}";
    var myname = widget.chatBloc!.getUsername();
    username1 = username;
    peerid1 = peerid;
    myname1 =  myname;

    Future<bool> _onWillPop()async{
       if(isShowEG){
         setState(() {
           isShowEG = false;
         });
          return false;
        }
      if(widget.trans!!){
        widget.chatBloc!.getIndexSpecial(1);
        widget.chatBloc!.setCurrentThread();
        Navigator.pop(context, false);
        return true;
      }else{
        widget.chatBloc!.getIndexSpecial(1);
        widget.chatBloc!.setCurrentThread();
        Navigator.pop(context, false);
        return true;
      }
    }
    return
    WillPopScope(
          child:
        isLoading?
        Scaffold(
          // resizeToAvoidBottomPadding: false,
          backgroundColor: darkMode!? Colors.grey: Colors.white,
          // resizeToAvoidBottomInset: true,
          appBar:
              isSelect?
            AppBar(
                // backgroundColor: Colors.white,
                // iconTheme: IconThemeData(color: Colors.black54),
                automaticallyImplyLeading: false,


                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()async{
                        //  widget.chatBloc!.nextTread(0);
                        //Navigator.pop(context, false);
                        isSelect = false;

                        final prefs = await SharedPreferences.getInstance();
                        prefs.setDouble("position", 0.0);
                       // widget.chatBloc!.selectMessageToggle(selectMsg);

                        widget.chatBloc!.multiSelectMessageToggle({"time": 0});
                        multiSelectedMessage = [];
                        setState(() {

                        });


                      },

                      child:
                      Padding(padding: const EdgeInsets.only(right: 10.0),
                        child: const Icon(Icons.arrow_back,),
                      ),
                    ),

                  ],
                ),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: GestureDetector(
                      onTap: () async{
                        isSelect = false;
                      //  isReply = false;

                        // widget.chatBloc!.selectMessageToggle(selectMsg);



                        print('multiSelectedMessage.length == ${multiSelectedMessage.length.toString()}');
                        if(multiSelectedMessage.length != 1){

                        }else{

                        }
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setDouble("position", 0.0);
                        // widget.chatBloc!.selectMessageToggle(selectMsg);
                        FocusScope.of(context).requestFocus(_focusNode);
                        widget.chatBloc!.multiSelectMessageToggle({"time": 0});
                       // multiSelectedMessage = [];

                        // print(dataMsg);

                      //  widget.chatBloc!.multiSelectMessageToggle({"time": 0});
                      //  multiSelectedMessage = [];
                        setState(() {
                          // _textEditingController.text = parser.emojify(selectMsg['message']);

                         // Clipboard.setData(ClipboardData(text: dataMsg ));
                         // Clipboard.setData(ClipboardData(text: 'dataMsg '));
                          isReply = true;

                        });
                      },
                      child: Icon(
                        Icons.reply,
                        size: 26.0,
                      ),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: GestureDetector(
                      onTap: () {

                        isSelect = false;
                       // widget.chatBloc!.selectMessageToggle(selectMsg);

                        FocusScope.of(context).requestFocus(_focusNode);
                        String dataMsg = '';
                        print('multiSelectedMessage.length == ${multiSelectedMessage.length.toString()}');
                        if(multiSelectedMessage.length == 1){
                          dataMsg = parser.emojify(multiSelectedMessage[0]['message']);
                        }else{
                          for(var item in multiSelectedMessage){
                            var dt = DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000);
                             if(item['msgtype'] == 2){
                               dataMsg =   dataMsg + '[${copyFormat.format(dt.toUtc())}]'   + ' Admin: ' + parser.emojify(item['message'])   + "\n";
                             }else if( item['userid'] == peerid){
                               dataMsg =   dataMsg + '[${copyFormat.format(dt.toUtc())}]'   + ' $username: ' + parser.emojify(item['message'])   + "\n";


                             }else{
                               dataMsg =   dataMsg + '[${copyFormat.format(dt.toUtc())}]'   + ' $myname: ' + parser.emojify(item['message'])   + "\n";

                             }

                            print(dataMsg);
                          }
                        }


                       // print(dataMsg);

                        widget.chatBloc!.multiSelectMessageToggle({"time": 0});
                        multiSelectedMessage = [];
                        setState(() {
                          // _textEditingController.text = parser.emojify(selectMsg['message']);

                          Clipboard.setData(ClipboardData(text: dataMsg ));



                          //  Clipboard.setData(ClipboardData(text: parser.emojify(selectMsg['message'])));

                        });
                      },
                      child: Icon(
                        Icons.copy,
                        size: 26.0,
                      ),
                    )
                ),
                PopupMenuButton<int>(
                  onSelected: (int value) {

                    if(value == 1) {

                      isSelect = false;
                     // widget.chatBloc!.selectMessageToggle(selectMsg);

                      FocusScope.of(context).requestFocus(_focusNode);
                      String dataMsg = '';
                      if(multiSelectedMessage.length == 1){
                        dataMsg = parser.emojify(multiSelectedMessage[0]['message']);
                      }else{
                        for(var item in multiSelectedMessage){
                          var dt = DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000);

                          dataMsg =   dataMsg + '[${copyFormat.format(dt.toUtc())}]'   + ' ' + parser.emojify(item['message'])   + "\n";
                        }
                      }



                      widget.chatBloc!.multiSelectMessageToggle({"time": 0});
                      multiSelectedMessage = [];
                      setState(() {
                        // _textEditingController.text = parser.emojify(selectMsg['message']);

                        Clipboard.setData(ClipboardData(text: dataMsg ));


                        //  Clipboard.setData(ClipboardData(text: parser.emojify(selectMsg['message'])));

                      });

                    }


                    //  }

                  },
                  itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text('Copy'),
                    ),

                  ],
                ),
              ],
              )
          : av == '' ?
              AppBar(
                // backgroundColor: Colors.white,
                // iconTheme: IconThemeData(color: Colors.black54),
                automaticallyImplyLeading: false,

                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()async{
                        if(widget.trans!){
                          widget.chatBloc!.getIndexSpecial(1);
                          widget.chatBloc!.setCurrentThread();
                          setState(() {
                          });
                          Navigator.pop(context, false);
                          setState(() {
                          });

                        }else{
                          widget.chatBloc!.getIndexSpecial(1);
                          widget.chatBloc!.setCurrentThread();
                          setState(() {
                          });
                          Navigator.pop(context, false);
                          setState(() {
                          });
                        }
                      },

                      child:
                      Padding(padding: const EdgeInsets.only(right: 10.0),
                        child: const Icon(Icons.arrow_back,),
                      ),
                    ),
                    // isLoading? Container(width: 0.0, height: 0.0, color: Colors.white,):

                    StreamBuilder(
                        stream: widget.chatBloc!.messagesInfoStream,
                        // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                        initialData: [],
                        builder: (BuildContext context, AsyncSnapshot snapshot) {

                          if (snapshot.hasError) {

                            _onWidgetDidBuild(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            });

                            return Text(snapshot.error.toString());
                          }
                          if (snapshot.data == null ) {
                          }
                          if (snapshot.hasData) {
                            // print('snap == ${snapshot.data}');
                            if(snapshot.data.isNotEmpty){

                              String title = jsonDecode(snapshot.data)['type'];
                              if(title == 'thread'){
                                return
                                  GestureDetector(
                                    child:    MyCircleAvatar(
                                      imgUrl: "${jsonDecode(snapshot.data)['avatar']}",
                                      // imgUrl: "${this.viewUserStatus.photo_url}",
                                      //json['photo_url'] as String,
                                      //       json['display_name'] as String,

                                    ),
                                    onTap: ()async{
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                                      });
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute('public/browse_users/view/${jsonDecode(snapshot.data)['userid']}/zzz'));

                                    },
                                  );
                              }
                            }else{
                              return GestureDetector(
                                child:   const Icon(Icons.supervised_user_circle_sharp, size: 40, color: Colors.blue),
                                onTap: ()async{
                                      }

                              );

                            }
                          }
                          return
                            GestureDetector(
                              child:    MyCircleAvatar(
                                imgUrl: "${jsonDecode(snapshot.data)['avatar']}",
                                // imgUrl: "${this.viewUserStatus.photo_url}",
                                //json['photo_url'] as String,
                                //       json['display_name'] as String,

                              ),
                              onTap: ()async{
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                                });
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute('public/browse_users/view/${jsonDecode(snapshot.data)['userid']}/zzz'));

                              },
                            );

                        }
                    ),

                    const SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // isLoading? Container(width: 0.0, height: 0.0, color: Colors.white,):

                        StreamBuilder(
                            stream: widget.chatBloc!.messagesInfoStream,
                            // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                            initialData: [],
                            builder: (BuildContext context, AsyncSnapshot snapshot) {

                              if (snapshot.hasError) {

                                _onWidgetDidBuild(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                });


                                return Text(snapshot.error.toString());
                              }
                              if (snapshot.data == null ) {

                              }
                              if (snapshot.hasData) {
                                // print('snap == ${snapshot.data}');
                                if(snapshot.data.isNotEmpty){

                                  String title = jsonDecode(snapshot.data)['type'];
                                  if(title == 'thread'){
                                    return
                                      GestureDetector(
                                        child: Text(
                                          "${jsonDecode(snapshot.data)['username']}",
                                          // "${this.viewUserStatus.display_name}",
                                          style: Theme.of(context).textTheme.subtitle2,
                                          overflow: TextOverflow.clip,
                                        ),
                                        onTap: ()async{
                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            SystemChannels.textInput.invokeMethod('TextInput.hide');
                                          });
                                          AppProvider.getRouter(context)!.navigateTo(
                                              context,
                                              urlToRoute('public/browse_users/view/${jsonDecode(snapshot.data)['userid']}/zzz'));

                                        },
                                      );
                                  }
                                }else{

                                  return
                                    GestureDetector(
                                      child: Text(
                                        "",
                                        // "${this.viewUserStatus.display_name}",
                                        style: Theme.of(context).textTheme.subtitle2,
                                        overflow: TextOverflow.clip,
                                      ),
                                      onTap: ()async{


                                      },
                                    );

                            }
                          }
                              return
                                GestureDetector(
                                  child: Text(
                                    "",
                                    // "${this.viewUserStatus.display_name}",
                                    style: Theme.of(context).textTheme.subtitle2,
                                    overflow: TextOverflow.clip,
                                  ),
                                  onTap: ()async{


                                  },
                                );

                            }
                        ),


                        StreamBuilder(
                            stream: widget.chatBloc!.onMessage,
                            // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                            initialData: [],
                            builder: (BuildContext context, AsyncSnapshot snapshot) {

                              if (snapshot.hasError) {

                                _onWidgetDidBuild(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                });


                                return Text(snapshot.error.toString());
                              }
                              if (snapshot.data == null ) {

                              }
                              if (snapshot.hasData) {
                                // print('snap == ${snapshot.data}');
                                if(snapshot.data.isNotEmpty){

                                  String title = jsonDecode(snapshot.data)['type'];
                                  if(title == 'typing' && jsonDecode(snapshot.data)['thread'] == widget._jsonMessage['thread'] ){
                                    return
                                      Text( "typing..." , style: Theme.of(context).textTheme.subtitle2!.apply(
                                        //     color: myGreen,
                                      ),
                                      );
                                  }
                                }

                              }
                              return

                                widget.trans!?
                                isLoading? Container(width: 0.0, height: 0.0, color: Colors.white,)  : isOnlineDate(this.viewUserStatus.last_seen)!  ?
                                Text( "Currently Online" , style: Theme.of(context).textTheme.subtitle2!.apply(
                                  color: myGreen,
                                ),
                                )
                                    :
                                Text( "Last seen ${readDate(this.viewUserStatus.last_seen)}" , style: Theme.of(context).textTheme.subtitle2!.apply(
                                  // color: myGreen,
                                ),
                                )
                                    :isOnline(widget._jsonMessage['lastseen'])!?
                                Text( "Currently Online" , style: Theme.of(context).textTheme.subtitle2!.apply(
                                  // color: myGreen,
                                ),
                                )
                                    :
                                Text( "Last seen ${readTimestamp(widget._jsonMessage['lastseen'])}" , style: Theme.of(context).textTheme.subtitle2!.apply(
                                  // color: myGreen,
                                ),
                                );

                            }
                        ),

                      ],
                    ),

                  ],
                ),
                actions: [
                  PopupMenuButton<int>(
                    padding :const EdgeInsets.all(0.0),
                    //padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 12.0),
                    icon: const Icon(Icons.search),
                    onSelected: (int value) {

                      if(value == 1) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SearchThread(

                                user: widget.userID,
                                chatBloc : widget.chatBloc,
                                thread: widget._jsonMessage['thread'],
                                display: widget._jsonMessage['username'],
                                userInfo: widget._jsonMessage,
                                avatar: widget._jsonMessage['avatar']
                            ),
                          ),
                        );
                      }
                      if(value == 2) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBrowseProjectsListing(id : '', title : '', cb:widget.chatBloc!)),
                        );
                      }
                      if(value == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBrowseServicesListing1(id : '', title : '', cb:widget.chatBloc!)),
                        );

                      }
                      if(value == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBrowseProductsListing(id : '', title : '', cb:widget.chatBloc!)),
                        );
                      }
                      if(value == 5) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBrowseUsersListing1(id : '', title : '', cb:widget.chatBloc!)),
                        );
                      }

                      if(value == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPastProjectsListing(id : '', title : '')),
                        );
                      }

                    },
                    itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Search This Chat'),
                      ),
                      const PopupMenuItem<int>(
                        value: 2,
                        child: Text('Search Projects'),
                      ),
                      const PopupMenuItem<int>(
                        value: 3,
                        child: Text('Search Services'),
                      ),
                      const PopupMenuItem<int>(
                        value: 4,
                        child: Text('Search Products'),
                      ),
                      const PopupMenuItem<int>(
                        value: 5,
                        child: Text('Search Users'),
                      ),
                      const PopupMenuItem<int>(
                        value: 6,
                        child: Text('Search Past Projects'),
                      ),

                      /*
                                  const PopupMenuItem<int>(
                                    value: 7,
                                    child: Text('test field'),
                                  ),

                                   */

                    ],
                  ),
                  PopupMenuButton<int> (
                    padding :const EdgeInsets.all(0.0),
                    onSelected: (int value) {

                      if(value == 1) {
                        widget.chatBloc!.blacklist(widget._jsonMessage['thread']);

                        widget.chatBloc!.getIndexSpecial(1);
                        // widget.chatBloc!.getBlacklist(widget.userID, context);

                        widget.chatBloc!.setCurrentThread();
                        //widget.chatBloc!.getIndexSpecial(1);
                        // widget.chatBloc!.getFirstThread1(widget._jsonMessage['thread']);
                        setState(() {

                        });
                        Navigator.pop(context, false);
                        setState(() {

                        });
                      }


                    },
                    itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Blacklist User'),
                      ),

                    ],
                  ),
                ],

              )
              :AppBar(
           // backgroundColor: Colors.white,
           // iconTheme: IconThemeData(color: Colors.black54),
            automaticallyImplyLeading: false,


            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: ()async{
                    //  widget.chatBloc!.nextTread(0);

                    if(widget.trans!){
                      widget.chatBloc!.getIndexSpecial(1);
                      widget.chatBloc!.setCurrentThread();
                      setState(() {

                      });
                     // widget.chatBloc!.getFirstThread(widget._jsonMessage['thread']);
                      Navigator.pop(context, false);
                      setState(() {

                      });

                    }else{

                      widget.chatBloc!.getIndexSpecial(1);
                      widget.chatBloc!.setCurrentThread();
                      setState(() {

                      });
                      Navigator.pop(context, false);
                      setState(() {

                      });

                    }

                  },

                  child:
                  Padding(padding: const EdgeInsets.only(right: 10.0),
                    child: const Icon(Icons.arrow_back,),
                  ),
                ),
               // isLoading? Container(width: 0.0, height: 0.0, color: Colors.white,):

                GestureDetector(
                  child:    MyCircleAvatar(
                    imgUrl: "${widget._jsonMessage['avatar']?? widget.avatar ?? widget._jsonMessage['index']['avatar']?? 'https://cdn.projects.co.id/upload/usr561611/20141107545caba002e77-thumb.jpg'}",
                   // imgUrl: "${this.viewUserStatus.photo_url}",
                    //json['photo_url'] as String,
                    //       json['display_name'] as String,

                  ),
                  onTap: ()async{
                    FocusScope.of(context).unfocus();
                    setState(() {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                    });
                    AppProvider.getRouter(context)!.navigateTo(
                        context,
                        urlToRoute('public/browse_users/view/${widget._jsonMessage['userid']}/zzz'));

                  },
                ),

                const SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   // isLoading? Container(width: 0.0, height: 0.0, color: Colors.white,):
                    GestureDetector(
                      child: Text(

                        "${widget._jsonMessage['username'] ?? widget.display ?? widget._jsonMessage['index']['username'] ??  widget._jsonMessage['userid']}",
                       // "${this.viewUserStatus.display_name}",
                        style: Theme.of(context).textTheme.subtitle2,
                        overflow: TextOverflow.clip,
                      ),
                      onTap: ()async{
                        FocusScope.of(context).unfocus();
                        setState(() {
                          SystemChannels.textInput.invokeMethod('TextInput.hide');
                        });
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute('public/browse_users/view/${widget._jsonMessage['userid']}/zzz'));

                      },
                    ),


                    StreamBuilder(
                        stream: widget.chatBloc!.onMessage,
                        // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                        initialData: [],
                        builder: (BuildContext context, AsyncSnapshot snapshot) {

                          if (snapshot.hasError) {

                            _onWidgetDidBuild(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            });


                            return Text(snapshot.error.toString());
                          }
                          if (snapshot.data == null ) {

                          }
                          if (snapshot.hasData) {
                            // print('snap == ${snapshot.data}');
                            if(snapshot.data.isNotEmpty){

                              String title = jsonDecode(snapshot.data)['type'];
                              if(title == 'typing' && jsonDecode(snapshot.data)['thread'] == widget._jsonMessage['thread'] ){
                                return
                                  Text( "typing..." , style: Theme.of(context).textTheme.subtitle2!.apply(
                               //     color: myGreen,
                                  ),
                                  );
                              }
                            }





                          }

                          return

                            widget.trans!?
                            isLoading? Container(width: 0.0, height: 0.0, color: Colors.white,)



                            : isOnlineDate(this.viewUserStatus.last_seen)! ?
                            Text( "Currently Online" , style: Theme.of(context).textTheme.subtitle2!.apply(
                              color: myGreen,
                            ),
                            )
                                :
                            Text( "Last seen ${readDate(this.viewUserStatus.last_seen)}" , style: Theme.of(context).textTheme.subtitle2!.apply(
                             // color: myGreen,
                            ),
                            )
                                : widget._jsonMessage['online'].toString() != '0'  ? Text( "Currently Online" , style: Theme.of(context).textTheme.subtitle2!.apply(
                              // color: myGreen,
                            ),)
                            :widget._jsonMessage['online'].toString() == '0' && widget._jsonMessage['username'].toLowerCase().contains('admin') ? Text( "Currently Offline" , style: Theme.of(context).textTheme.subtitle2!.apply(
                              // color: myGreen,
                            ),)

                            :isOnline(widget._jsonMessage['lastseen']?? widget._jsonMessage['index']['lastseen'])!?
                            Text( "Currently Online" , style: Theme.of(context).textTheme.subtitle2!.apply(
                             // color: myGreen,
                            ),
                            )
                                :
                            Text( "Last seen ${readTimestamp(widget._jsonMessage['lastseen']?? widget._jsonMessage['index']['lastseen'])}" , style: Theme.of(context).textTheme.subtitle2!.apply(
                             // color: myGreen,
                            ),
                            );

                        }
                    ),

                  ],
                ),


              ],


            ),
                actions: [

                  PopupMenuButton<int>(
                    padding :const EdgeInsets.all(0.0),
                    //padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 12.0),
                    icon: const Icon(Icons.search),
                    onSelected: (int value) {

                      if(value == 1) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SearchThread(
                                user: widget.userID,
                                chatBloc : widget.chatBloc,
                                thread: widget._jsonMessage['thread'],
                                display: widget._jsonMessage['username'],
                                userInfo: widget._jsonMessage,
                                avatar: widget._jsonMessage['avatar']
                            ),
                          ),
                        );
                      }
                      if(value == 2) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBrowseProjectsListing(id : '', title : '', cb: widget.chatBloc!)),
                        );
                      }
                      if(value == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBrowseServicesListing1(id : '', title : '', cb: widget.chatBloc!)),
                        );

                      }
                      if(value == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBrowseProductsListing(id : '', title : '', cb: widget.chatBloc!)),
                        );
                      }
                      if(value == 5) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchBrowseUsersListing1(id : '', title : '', cb: widget.chatBloc!)),
                        );
                      }

                      if(value == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPastProjectsListing(id : '', title : '')),
                        );
                      }

                      if(value == 7) {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute("/public/test/listing/123"));
                      }




                    },
                    itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Search This Chat'),
                      ),
                      const PopupMenuItem<int>(
                        value: 2,
                        child: Text('Search Projects'),
                      ),
                      const PopupMenuItem<int>(
                        value: 3,
                        child: Text('Search Services'),
                      ),
                      const PopupMenuItem<int>(
                        value: 4,
                        child: Text('Search Products'),
                      ),
                      const PopupMenuItem<int>(
                        value: 5,
                        child: Text('Search Users'),
                      ),
                      const PopupMenuItem<int>(
                        value: 6,
                        child: Text('Search Past Projects'),
                      ),

                      /*
                    const PopupMenuItem<int>(
                      value: 7,
                      child: Text('test field'),
                    ),

                    */

                    ],
                  ),

                  PopupMenuButton<int> (
                    padding :const EdgeInsets.all(0.0),
                    onSelected: (int value) {

                      if(value == 1) {
                        widget.chatBloc!.blacklist(widget._jsonMessage['thread']);

                        widget.chatBloc!.getIndexSpecial(1);
                        // widget.chatBloc!.getBlacklist(widget.userID, context);

                        widget.chatBloc!.setCurrentThread();
                        //widget.chatBloc!.getIndexSpecial(1);
                        // widget.chatBloc!.getFirstThread1(widget._jsonMessage['thread']);
                        setState(() {

                        });
                        Navigator.pop(context, false);
                        setState(() {

                        });
                      }


                    },
                    itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Blacklist User'),
                      ),

                    ],
                  ),
                ],

          ),
          body:
         Stack(
              children:[
                Column(

                  children: <Widget>[
                    progressCount == 0 ? Container() : Container(height: 30,),
                    progressCount == 0 ? Container() : LinearProgressIndicator(
                      backgroundColor: Colors.lightGreenAccent,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      minHeight: 25,value: progressCount,) ,
                    progressCount == 1.0? Text((progressCount * 100).toStringAsFixed(0) + "%" + " " + 'completed')  :
                    progressCount == 0? Container() :Text((progressCount * 100).toStringAsFixed(0) + "%") ,

                    Expanded(
                      flex:  _flex1 ,
                      child:

                      MessageList(
                          chatBloc: widget.chatBloc,
                          user: widget.user,
                          userID : widget.userID,
                          onPayloadPress: _onPayloadPress1,
                          onSelect: _onSelect,
                          page: widget.page,
                          onMediaView: _onMediaViewHandler,
                          search: widget.search,
                          itemsearch: widget.itemSearch
                      ),


                    ),
                    StreamBuilder(
                        stream: widget.chatBloc!.onMessage,
                        // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                        initialData: [],
                        builder: (BuildContext context, AsyncSnapshot snapshot) {

                          if (snapshot.hasError) {

                            _onWidgetDidBuild(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            });


                            return Text(snapshot.error.toString());
                          }
                          if (snapshot.data == null ) {

                          }
                          if (snapshot.hasData) {
                            // print('snap == ${snapshot.data}');
                            if(snapshot.data.isNotEmpty){
                              String title = jsonDecode(snapshot.data)['type'];
                              if(title == 'typing' && jsonDecode(snapshot.data)['thread'] == widget._jsonMessage['thread'] ){
                                return
                                  Container(
                                      height: 30,
                                      width:  400,
                                      child:  Padding(
                                          padding: const EdgeInsets.only(left: 25,),
                                          child:  SizedBox(
                                            width: 250.0,
                                            child:
                                            AnimatedTextKit(
                                              animatedTexts: [
                                                FadeAnimatedText('Typing.'),
                                                FadeAnimatedText('Typing..'),
                                                FadeAnimatedText('Typing...'),
                                              ],
                                              onTap: () {
                                                print("Tap Event");
                                              },
                                            ),



                                          )
                                      )


                                  );
                              }
                            }





                          }

                          return Container();

                        }
                    ),
                    isReply ? Container(
                             // width: MediaQuery.of(context).size.width * 4/5,
                              color: Colors.transparent,
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    children: [
                                      const SizedBox(height : 12),
                                      Container(
                                          width: MediaQuery.of(context).size.width * 3/4,
                                       //   height: 100,
                                          child :
                                          BlockQuote(
                                              blockColor: Colors.green,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  Text(
                                                    multiSelectedMessage[0]['userid'] == peerid ? '$username' : 'Anda',
                                                    textAlign: TextAlign.start,
                                                  ),
                                                 multiSelectedMessage[0]['message'].contains('chat-image') ? Container(
                                                    height: 100,
                                                    width: MediaQuery.of(context).size.width * 3/4,
                                                    decoration: BoxDecoration(
                                                      color: Colors.greenAccent,
                                                      image:  DecorationImage(
                                                        alignment: Alignment.topCenter,
                                                          image: NetworkImage(parseThumb(multiSelectedMessage[0]['message']!)!),
                                                          fit: BoxFit.fitWidth),
                                                    ),
                                                  ) :
                                                  Html( data:
                                                  multiSelectedMessage[0]['message'].contains('chat-file') ?
                                                  multiSelectedMessage[0]['message'] :


                                                    ' ${readText(multiSelectedMessage[0]['message'], 100)}',

                                                  ),

                                                ],
                                              )
                                          )

                                      ),
                                    ],
                                  ),

                                  Container(
                                      width: MediaQuery.of(context).size.width * 7/8,
                                      child :
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: TextButton(
                                            onPressed: () {
                                              multiSelectedMessage = [];
                                              setState(() {
                                                isReply = false;
                                              });
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 16.0,
                                            ),
                                            style:  TextButton.styleFrom(
                                              minimumSize: Size(12, 12) ,
                                              shape: CircleBorder(),
                                              backgroundColor: Colors.black38,
                                            ),

                                          )
                                      )

                                  ),

                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Container()
                                  )



                                ],
                              ),
                    ):Container(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child:
                      Container(
                        height: heightTI,
                        child:
                        MessageInput(
                          chatBloc: widget.chatBloc,
                          textEditingController: _textEditingController,
                          // textEditingController: _controller,
                          fNode: _focusNode,
                          onPressed: _sendMessage,
                          onChanged: _sendTyping,
                          onAttach: _sendMAttachment,

                          onPic: _takePic,
                          onImage: getImage,
                          onVoice: _sendVoice,
                          isEmoji: isShowEG,
                          onInsertEmoji: _insertEmoji,
                          onTextChange: _textChange,

                        ),
                      ),

                    ),
                    /*
              Expanded(
                flex:  _flex ,
                child: MessageInput(
                  chatBloc: widget.chatBloc,
                  textEditingController: _textEditingController,
                  // textEditingController: _controller,
                  fNode: _focusNode,
                  onPressed: _sendMessage,
                  onChanged: _sendTyping,
                  onAttach: _sendMAttachment,
                  onImage: getImage,
                  isEmoji: isShowEG,
                  onInsertEmoji: _insertEmoji,
                  onTextChange: _textChange,

                ),
              ),

               */
                    isShowEG ? MediaQuery.of(context).viewInsets.bottom == 0.0? Expanded(
                        flex: 8,
                        child:
                        EmojiPicker(
                          rows: 4,
                          columns: 9,
                          buttonMode: ButtonMode.MATERIAL,
                          //recommendKeywords: ["racing", "horse"],
                          numRecommended: 0,
                          onEmojiSelected: (emoji, category) {
                            // print('here${emoji.name}');
                            if(_textEditingController.value.text == '') {

                              insertText('');
                            }
                            insertText(emoji.emoji!);
                          },
                        )
                    ):
                    Container(height: 0.0, width: 0.0,):
                    Container(height: 0.0, width: 0.0,),


                  ],
                ),

                isSend?
                Align(
                    alignment: isShowEG?  Alignment(0.96, - 0.17) : Alignment.bottomRight,
                    child:
                            GestureDetector(
                                 onTap:(){
                                   _sendMessage();
                                   setState(() {
                                     isSend = false;
                                   });
                                 } ,

                                child: Container(
                                    width: 50.0 ,
                                    height: 50.0 ,
                                    decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                    ),
                                    ),
                                    child:
                                          Center(
                                          child:const Icon(Icons.send_rounded, color: Colors.white,)
                                          )



                                    ),
                            )
                )
                :Align(
                alignment: isShowEG?  Alignment(0.96, - 0.17) : Alignment.bottomRight,
                child: SlideButton(
                    label1:'1',
                    label2:'2',
                    label3:'3',
                    label4:'4',
                    widthSC: MediaQuery.of(context).size.width,
                    onSelected :(label){
                      print('label === $label');
                      if(label == '1'){

                        _sendVoice1(1);
                      }else
                      if(label == '2'){
                        _sendVoice1(2);
                      }else
                      if(label == '3'){
                        
                        _sendVoice1(0);
                        
                      }else{
                        if(label.contains('i')){
                          var lbl = label.replaceAll('i', '');
                         // print('halo mang === $lbl ');
                          _sendVoice(int.tryParse(lbl));
                        }else{
                         // print('halo mang1');
                          _sendVoice1(int.tryParse(label));
                        }
                      }
                      
                    }
                )
                )

              ]


          )




        )
            :
        Scaffold(
        // resizeToAvoidBottomPadding: false,
        backgroundColor: darkMode!? Colors.grey: Colors.white,
        // resizeToAvoidBottomInset: true,
        appBar:   isSelect?
                 AppBar(
          // backgroundColor: Colors.white,
          // iconTheme: IconThemeData(color: Colors.black54),
          automaticallyImplyLeading: false,


          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: ()async{
                  //  widget.chatBloc!.nextTread(0);
                  //Navigator.pop(context, false);
                  isSelect = false;
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setDouble("position", 0.0);
                //  widget.chatBloc!.selectMessageToggle(selectMsg);
                  widget.chatBloc!.multiSelectMessageToggle({"time": 0});
                  multiSelectedMessage = [];
                  setState(() {

                  });
                },

                child:
                Padding(padding: const EdgeInsets.only(right: 10.0),
                  child: const Icon(Icons.arrow_back,),
                ),
              ),

            ],
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: GestureDetector(
                  onTap: () {

                    isSelect = false;
                  //  widget.chatBloc!.selectMessageToggle(selectMsg);

                    FocusScope.of(context).requestFocus(_focusNode);
                    String dataMsg = '';
                    print('multiSelectedMessage.length == ${multiSelectedMessage.length.toString()}');
                    if(multiSelectedMessage.length == 1){
                      dataMsg = parser.emojify(multiSelectedMessage[0]['message']);
                    }else{
                      for(var item in multiSelectedMessage){
                        var dt = DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000);
                        if(item['msgtype'] == 2){
                          dataMsg =   dataMsg + '[${copyFormat.format(dt.toUtc())}]'   + ' Admin: ' + parser.emojify(item['message'])   + "\n";
                        }else if( item['userid'] == peerid){
                          dataMsg =   dataMsg + '[${copyFormat.format(dt.toUtc())}]'   + ' $username: ' + parser.emojify(item['message'])   + "\n";


                        }else{
                          dataMsg =   dataMsg + '[${copyFormat.format(dt.toUtc())}]'   + ' $myname: ' + parser.emojify(item['message'])   + "\n";

                        }

                        print(dataMsg);

                      }
                    }

                   // print(dataMsg);

                    widget.chatBloc!.multiSelectMessageToggle({"time": 0});
                    multiSelectedMessage = [];
                    setState(() {
                      // _textEditingController.text = parser.emojify(selectMsg['message']);

                      Clipboard.setData(ClipboardData(text: dataMsg ));


                      //  Clipboard.setData(ClipboardData(text: parser.emojify(selectMsg['message'])));

                    });
                  },
                  child: Icon(
                    Icons.copy,
                    size: 26.0,
                  ),
                )
            ),
            PopupMenuButton<int>(
              onSelected: (int value) {

                if(value == 1) {

                  isSelect = false;
                 // widget.chatBloc!.selectMessageToggle(selectMsg);

                  FocusScope.of(context).requestFocus(_focusNode);
                  String dataMsg = '';

                  if(multiSelectedMessage.length == 1){
                    dataMsg = parser.emojify(multiSelectedMessage[0]['message']);
                  }else{
                    for(var item in multiSelectedMessage){
                      var dt = DateTime.fromMillisecondsSinceEpoch(item['time'] * 1000);

                      dataMsg =   dataMsg + '[${copyFormat.format(dt.toUtc())}]'   + ' ' + parser.emojify(item['message'])   + "\n";
                    }
                  }



                  widget.chatBloc!.multiSelectMessageToggle({"time": 0});
                  multiSelectedMessage = [];
                  setState(() {
                    // _textEditingController.text = parser.emojify(selectMsg['message']);

                   Clipboard.setData(ClipboardData(text: dataMsg ));


                    //  Clipboard.setData(ClipboardData(text: parser.emojify(selectMsg['message'])));

                  });

                }


                //  }

              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Copy'),
                ),

              ],
            ),
          ],
        )
                 : widget._jsonMessage['avatar'] == '' ?
                   AppBar(
          // backgroundColor: Colors.white,
          // iconTheme: IconThemeData(color: Colors.black54),
          automaticallyImplyLeading: false,


          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: ()async{
                  //  widget.chatBloc!.nextTread(0);

                  if(widget.trans!){
                    //   widget.chatBloc!.nextTread(0);
                    //  widget.chatBloc!.closeConnection();
                    // Navigator.pop(context);
                    //  _timer.cancel();
                   // widget.chatBloc!.getFirstThread1(widget._jsonMessage['thread']);
                    widget.chatBloc!.getIndexSpecial(1);
                    widget.chatBloc!.setCurrentThread();
                    //  widget.chatBloc!.getIndexSpecial(1);
                    setState(() {

                    });
                    // widget.chatBloc!.getFirstThread(widget._jsonMessage['thread']);
                    Navigator.pop(context, false);
                    setState(() {

                    });
                    /*
                       Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Projectscoid(id :  widget.userID, isChat: true)),
                            (Route<dynamic> route) => false,
                      );

                       */
                  }else{
                    //  _timer.cancel();
                    // widget.chatBloc!.getFirstThread2(widget._jsonMessage['thread']);
                  //  widget.chatBloc!.getFirstThread1(widget._jsonMessage['thread']);
                    widget.chatBloc!.getIndexSpecial(1);
                    widget.chatBloc!.setCurrentThread();
                    //   widget.chatBloc!.getIndexSpecial(1);
                    setState(() {

                    });
                    //  widget.chatBloc!.getFirstThread1(widget._jsonMessage['thread']);
                    Navigator.pop(context, false);
                    setState(() {

                    });
                    //  _timer.cancel();
                    // widget.chatBloc!.nextThread(0);

                    /*  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => Projectscoid(id :  widget.userID, isChat: true)),
                                        (Route<dynamic> route) => false,
                                  );

                                 */
                  }

                },

                child:
                Padding(padding: const EdgeInsets.only(right: 10.0),
                  child: const Icon(Icons.arrow_back,),
                ),
              ),
              // isLoading? Container(width: 0.0, height: 0.0, color: Colors.white,):




              StreamBuilder(
                  stream: widget.chatBloc!.messagesInfoStream,
                  // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                  initialData: [],
                  builder: (BuildContext context, AsyncSnapshot snapshot) {

                    if (snapshot.hasError) {

                      _onWidgetDidBuild(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      });


                      return Text(snapshot.error.toString());
                    }
                    if (snapshot.data == null ) {

                    }
                    if (snapshot.hasData) {
                      // print('snap == ${snapshot.data}');
                      if(snapshot.data.isNotEmpty){

                        String title = jsonDecode(snapshot.data)['type'];
                        if(title == 'thread'){
                          return
                            GestureDetector(
                              child:    MyCircleAvatar(
                                imgUrl: "${jsonDecode(snapshot.data)['avatar']}",
                                // imgUrl: "${this.viewUserStatus.photo_url}",
                                //json['photo_url'] as String,
                                //       json['display_name'] as String,

                              ),
                              onTap: ()async{
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                                });
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute('public/browse_users/view/${jsonDecode(snapshot.data)['userid']}/zzz'));

                              },
                            );
                        }
                      } else{

                        return
                          GestureDetector(
                            child: const Icon(Icons.supervised_user_circle_outlined, size: 40, color: Colors.blue),
                            onTap: ()async{


                            },
                          );

                      }





                    }

                    return

                      GestureDetector(
                        child:    MyCircleAvatar(
                          imgUrl: "${jsonDecode(snapshot.data)['avatar']}",
                          // imgUrl: "${this.viewUserStatus.photo_url}",
                          //json['photo_url'] as String,
                          //       json['display_name'] as String,

                        ),
                        onTap: ()async{
                          FocusScope.of(context).unfocus();
                          setState(() {
                            SystemChannels.textInput.invokeMethod('TextInput.hide');
                          });
                          AppProvider.getRouter(context)!.navigateTo(
                              context,
                              urlToRoute('public/browse_users/view/${jsonDecode(snapshot.data)['userid']}/zzz'));

                        },
                      );

                  }
              ),


              const SizedBox(width: 5),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // isLoading? Container(width: 0.0, height: 0.0, color: Colors.white,):


                  StreamBuilder(
                      stream: widget.chatBloc!.messagesInfoStream,
                      // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                      initialData: [],
                      builder: (BuildContext context, AsyncSnapshot snapshot) {

                        if (snapshot.hasError) {

                          _onWidgetDidBuild(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          });


                          return Text(snapshot.error.toString());
                        }
                        if (snapshot.data == null ) {

                        }
                        if (snapshot.hasData) {
                          // print('snap == ${snapshot.data}');
                          if(snapshot.data.isNotEmpty){

                            String title = jsonDecode(snapshot.data)['type'];
                            if(title == 'thread'){
                              return
                                GestureDetector(
                                  child: Text(
                                    "${jsonDecode(snapshot.data)['username']}",
                                    // "${this.viewUserStatus.display_name}",
                                    style: Theme.of(context).textTheme.subtitle2,
                                    overflow: TextOverflow.clip,
                                  ),
                                  onTap: ()async{
                                    FocusScope.of(context).unfocus();
                                    setState(() {
                                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                                    });
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute('public/browse_users/view/${jsonDecode(snapshot.data)['userid']}/zzz'));

                                  },
                                );
                            }
                          }else{

                            return
                              GestureDetector(
                                child: Text(
                                  "",
                                  // "${this.viewUserStatus.display_name}",
                                  style: Theme.of(context).textTheme.subtitle2,
                                  overflow: TextOverflow.clip,
                                ),
                                onTap: ()async{


                                },
                              );

                          }





                        }

                        return

                          GestureDetector(
                            child: Text(
                              "",
                              // "${this.viewUserStatus.display_name}",
                              style: Theme.of(context).textTheme.subtitle2,
                              overflow: TextOverflow.clip,
                            ),
                            onTap: ()async{


                            },
                          );

                      }
                  ),


                  StreamBuilder(
                      stream: widget.chatBloc!.onMessage,
                      // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                      initialData: [],
                      builder: (BuildContext context, AsyncSnapshot snapshot) {

                        if (snapshot.hasError) {

                          _onWidgetDidBuild(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          });


                          return Text(snapshot.error.toString());
                        }
                        if (snapshot.data == null ) {

                        }
                        if (snapshot.hasData) {
                          // print('snap == ${snapshot.data}');
                          if(snapshot.data.isNotEmpty){

                            String title = jsonDecode(snapshot.data)['type'];
                            if(title == 'typing' && jsonDecode(snapshot.data)['thread'] == widget._jsonMessage['thread'] ){
                              return
                                Text( "typing..." , style: Theme.of(context).textTheme.subtitle2!.apply(
                                  //     color: myGreen,
                                ),
                                );
                            }
                          }





                        }

                        return

                          widget.trans!?
                          isLoading? Container(width: 0.0, height: 0.0, color: Colors.white,)  : isOnlineDate(this.viewUserStatus.last_seen)! ?
                          Text( "Currently Online" , style: Theme.of(context).textTheme.subtitle2!.apply(
                            color: myGreen,
                          ),
                          )
                              :
                          Text( "Last seen ${readDate(this.viewUserStatus.last_seen)}" , style: Theme.of(context).textTheme.subtitle2!.apply(
                            // color: myGreen,
                          ),
                          )
                              :isOnline(widget._jsonMessage['lastseen'])!?
                          Text( "Currently Online" , style: Theme.of(context).textTheme.subtitle2!.apply(
                            // color: myGreen,
                          ),
                          )
                              :
                          Text( "Last seen ${readTimestamp(widget._jsonMessage['lastseen'])}" , style: Theme.of(context).textTheme.subtitle2!.apply(
                            // color: myGreen,
                          ),
                          );

                      }
                  ),

                ],
              ),


            ],
          ),
         actions: [
           PopupMenuButton<int>(
             padding :const EdgeInsets.all(0.0),
             //padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 12.0),
             icon: Icon(Icons.search),
             onSelected: (int value) {

               if(value == 1) {

                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (_) => SearchThread(
                         user: widget.userID,
                         chatBloc : widget.chatBloc,
                         thread: widget._jsonMessage['thread'],
                         display: widget._jsonMessage['username'],
                         userInfo: widget._jsonMessage,
                         avatar: widget._jsonMessage['avatar']
                     ),
                   ),
                 );
               }
               if(value == 2) {

                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => SearchBrowseProjectsListing(id : '', title : '', cb: widget.chatBloc!)),
                 );
               }
               if(value == 3) {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => SearchBrowseServicesListing1(id : '', title : '', cb: widget.chatBloc!)),
                 );

               }
               if(value == 4) {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => SearchBrowseProductsListing(id : '', title : '', cb: widget.chatBloc!)),
                 );
               }
               if(value == 5) {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => SearchBrowseUsersListing1(id : '', title : '', cb: widget.chatBloc!)),
                 );
               }

               if(value == 6) {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => SearchPastProjectsListing(id : '', title : '')),
                 );
               }
/*
                if(value == 7) {
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute("/public/test/listing/123"));
                }

*/




             },
             itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
               const PopupMenuItem<int>(
                 value: 1,
                 child: Text('Search This Chat'),
               ),
               const PopupMenuItem<int>(
                 value: 2,
                 child: Text('Search Projects'),
               ),
               const PopupMenuItem<int>(
                 value: 3,
                 child: Text('Search Services'),
               ),
               const PopupMenuItem<int>(
                 value: 4,
                 child: Text('Search Products'),
               ),
               const PopupMenuItem<int>(
                 value: 5,
                 child: Text('Search Users'),
               ),
               const PopupMenuItem<int>(
                 value: 6,
                 child: Text('Search Past Projects'),
               ),

               /*
                const PopupMenuItem<int>(
                  value: 7,
                  child: Text('test field'),
                ),

                 */

             ],
           ),
           PopupMenuButton<int> (
             padding :const EdgeInsets.all(0.0),
             onSelected: (int value) {

               if(value == 1) {
                 widget.chatBloc!.blacklist(widget._jsonMessage['thread']);

                 widget.chatBloc!.getIndexSpecial(1);
                 // widget.chatBloc!.getBlacklist(widget.userID, context);

                 widget.chatBloc!.setCurrentThread();
                 //widget.chatBloc!.getIndexSpecial(1);
                 // widget.chatBloc!.getFirstThread1(widget._jsonMessage['thread']);
                 setState(() {

                 });
                 Navigator.pop(context, false);
                 setState(() {

                 });
               }


             },
             itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
               const PopupMenuItem<int>(
                 value: 1,
                 child: Text('Blacklist User'),
               ),

             ],
           ),
         ],

        )
        : AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54),
          automaticallyImplyLeading: false,


          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  //  widget.chatBloc!.nextTread(0);

                  if(widget.trans!){
                    //   widget.chatBloc!.nextTread(0);
                    //  widget.chatBloc!.closeConnection();
                  //  _timer.cancel();
                  //   widget.chatBloc!.getFirstThread1(widget._jsonMessage['thread']);
                    widget.chatBloc!.getIndexSpecial(1);
                    widget.chatBloc!.setCurrentThread();
                   //  widget.chatBloc!.getIndexSpecial(1);
                    setState(() {

                    });
                   // widget.chatBloc!.getFirstThread3(widget._jsonMessage['thread']);
                    Navigator.pop(context, false);
                     setState(() {

                     });
                    /*
                       Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Projectscoid(id :  widget.userID, isChat: true)),
                            (Route<dynamic> route) => false,
                      );

                       */
                  }else{
                   // _timer.cancel();
                   //  widget.chatBloc!.getFirstThread1(widget._jsonMessage['thread']);
                    widget.chatBloc!.getIndexSpecial(1);
                    widget.chatBloc!.setCurrentThread();
                  //   widget.chatBloc!.getIndexSpecial(1);
                     setState(() {

                     });
                  //  widget.chatBloc!.getFirstThread3(widget._jsonMessage['thread']);
                    Navigator.pop(context, false);
                     setState(() {

                     });

                    /*  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => Projectscoid(id :  widget.userID, isChat: true)),
                                        (Route<dynamic> route) => false,
                                  );

                                 */
                  }

                },

                child:
                Padding(padding: const EdgeInsets.only(right: 10.0),
                  child: const Icon(Icons.arrow_back,),
                ),
              ),



              GestureDetector(
                child:    MyCircleAvatar(
                 // imgUrl: "${widget._jsonMessage['avatar']}",
                   imgUrl: "${widget._jsonMessage['avatar']?? widget.avatar ?? widget._jsonMessage['index']['avatar'] }",
                  //imgUrl: "${this.viewUserStatus.photo_url}",
                  //json['photo_url'] as String,
                  //       json['display_name'] as String,
                ),
                onTap: ()async{
                  FocusScope.of(context).unfocus();
                  setState(() {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  });
                  AppProvider.getRouter(context)!.navigateTo(
                      context,
                      urlToRoute('public/browse_users/view/${widget._jsonMessage['userid']}/zzz'));

                },
              ),


              const SizedBox(width: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  GestureDetector(
                    child: Text(
                      "${widget._jsonMessage['username'] ?? widget.display ?? widget._jsonMessage['index']['username'] }",
                      //"${this.viewUserStatus.display_name}",
                      style: Theme.of(context).textTheme.headline5,
                      overflow: TextOverflow.clip,
                    ),
                    onTap: ()async{
                      FocusScope.of(context).unfocus();
                      setState(() {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                      });
                      AppProvider.getRouter(context)!.navigateTo(
                          context,
                          urlToRoute('public/browse_users/view/${widget._jsonMessage['userid']}/zzz'));

                    },
                  ),

                  StreamBuilder(
                      stream: widget.chatBloc!.onMessage,
                      // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                      initialData: [],
                      builder: (BuildContext context, AsyncSnapshot snapshot) {

                        if (snapshot.hasError) {

                          _onWidgetDidBuild(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          });


                          return Text(snapshot.error.toString());
                        }
                        if (snapshot.data == null ) {

                        }
                        if (snapshot.hasData) {
                         // print('snap == ${snapshot.data}');
                          if(snapshot.data.isNotEmpty){

                            String title = jsonDecode(snapshot.data)['type'];
                            if(title == 'typing' && jsonDecode(snapshot.data)['thread'] == widget._jsonMessage['thread'] ){
                              return
                                Text( "typing..." , style: Theme.of(context).textTheme.subtitle2!.apply(
                                  color: myGreen,
                                ),
                                );
                            }
                          }

                        }

                        return

                          widget.trans!?
                          isLoading? Container(width: 0.0, height: 0.0, color: Colors.white,)  : isOnlineDate(this.viewUserStatus.last_seen)! ?
                            Text( "Currently Online" , style: Theme.of(context).textTheme.subtitle2!.apply(
                              color: myGreen,
                            ),
                            )
                                :
                            Text( "Last seen ${readDate(this.viewUserStatus.last_seen)}" , style: Theme.of(context).textTheme.subtitle2!.apply(
                              color: myGreen,
                            ),
                            )
                          :isOnline(widget._jsonMessage['lastseen'])!?
                          Text( "Currently Online" , style: Theme.of(context).textTheme.subtitle2!.apply(
                            color: myGreen,
                          ),
                          )
                          :
                          Text( "Last seen ${readTimestamp(widget._jsonMessage['lastseen'])}" , style: Theme.of(context).textTheme.subtitle2!.apply(
                              color: myGreen,
                            ),
                          );
                      }
                  ),
                ],
              ),
            ],
          ),

          actions: [
            PopupMenuButton<int>(
              padding :const EdgeInsets.all(0.0),
              //padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 12.0),
              icon: Icon(Icons.search),
              onSelected: (int value) {
                if(value == 1) {



                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchThread(
                          user: widget.userID,
                          chatBloc : widget.chatBloc,
                          thread: widget._jsonMessage['thread'],
                          display: widget._jsonMessage['username'],
                          userInfo: widget._jsonMessage,
                          avatar: widget._jsonMessage['avatar']
                      ),
                    ),
                  );

                }
                if(value == 2) {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchBrowseProjectsListing(id : '', title : '', cb: widget.chatBloc!)),
                  );
                }
                if(value == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchBrowseServicesListing1(id : '', title : '', cb: widget.chatBloc!)),
                  );

                }
                if(value == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchBrowseProductsListing(id : '', title : '', cb: widget.chatBloc!)),
                  );
                }
                if(value == 5) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchBrowseUsersListing1(id : '', title : '', cb: widget.chatBloc!)),
                  );
                }

                if(value == 6) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPastProjectsListing(id : '', title : '')),
                  );
                }
                /*

                                if(value == 7) {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute("/public/test/listing/123"));
                                }

                                 */




              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Search This Chat'),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text('Search Projects'),
                ),
                const PopupMenuItem<int>(
                  value: 3,
                  child: Text('Search Services'),
                ),
                const PopupMenuItem<int>(
                  value: 4,
                  child: Text('Search Products'),
                ),
                const PopupMenuItem<int>(
                  value: 5,
                  child: Text('Search Users'),
                ),
                const PopupMenuItem<int>(
                  value: 6,
                  child: Text('Search Past Projects'),
                ),

/*
                                const PopupMenuItem<int>(
                                  value: 7,
                                  child: Text('test field'),
                                ),

 */

              ],
            ),
            PopupMenuButton<int> (
              padding :const EdgeInsets.all(0.0),
              onSelected: (int value) {
                if(value == 1) {
                  widget.chatBloc!.blacklist(widget._jsonMessage['thread']);

                  widget.chatBloc!.getIndexSpecial(1);
                  // widget.chatBloc!.getBlacklist(widget.userID, context);

                  widget.chatBloc!.setCurrentThread();
                  // widget.chatBloc!.getIndexSpecial(1);
                  // widget.chatBloc!.getFirstThread1(widget._jsonMessage['thread']);
                  setState(() {

                  });
                  Navigator.pop(context, false);
                  setState(() {

                  });
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Blacklist User'),
                ),
              ],
            ),
          ],
        ),
        body:
        Stack(
            children:[
              Column(
                children: <Widget>[
                  progressCount == 0 ? Container() : Container(height: 30,),
                  progressCount == 0 ? Container() : LinearProgressIndicator(
                    backgroundColor: Colors.lightGreenAccent,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    minHeight: 25,value: progressCount,) ,
                  progressCount == 1.0? Text((progressCount * 100).toStringAsFixed(0) + "%" + " " + 'completed')  :
                  progressCount == 0? Container() :Text((progressCount * 100).toStringAsFixed(0) + "%") ,

                  Expanded(
                    flex: _flex1,
                    child: MessageList(
                        chatBloc: widget.chatBloc,
                        user: widget.user,
                        userID : widget.userID,
                        onPayloadPress: _onPayloadPress1,
                        onSelect: _onSelect,
                        page: widget.page,
                        onMediaView: _onMediaViewHandler,
                        search: widget.search,
                        itemsearch: widget.itemSearch
                    ),

                  ),
                  StreamBuilder(
                      stream: widget.chatBloc!.onMessage,
                      // stream: widget.chatBloc!.getThreads(Duration(seconds:1)),
                      initialData: [],
                      builder: (BuildContext context, AsyncSnapshot snapshot) {

                        if (snapshot.hasError) {

                          _onWidgetDidBuild(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          });


                          return Text(snapshot.error.toString());
                        }
                        if (snapshot.data == null ) {

                        }
                        if (snapshot.hasData) {
                          // print('snap == ${snapshot.data}');
                          if(snapshot.data.isNotEmpty){
                            String title = jsonDecode(snapshot.data)['type'];

                            if(title == 'typing' && jsonDecode(snapshot.data)['thread'] == widget._jsonMessage['thread'] ){
                              return
                                Container(
                                    height: 30,
                                    width:  400,
                                    child:  Padding(
                                        padding: const EdgeInsets.only(left: 25,),
                                        child: SizedBox(
                                          width: 250.0,
                                          child:    AnimatedTextKit(
                                            animatedTexts: [
                                              FadeAnimatedText('Typing.'),
                                              FadeAnimatedText('Typing..'),
                                              FadeAnimatedText('Typing...'),
                                            ],
                                            onTap: () {
                                              print("Tap Event");
                                            },
                                          ),
                                        )
                                    )


                                );
                            }
                          }





                        }

                        return Container();

                      }
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child:
                    Container(
                      height: heightTI,
                      child:
                      MessageInput(
                        chatBloc: widget.chatBloc,
                        textEditingController: _textEditingController,
                        // textEditingController: _controller,
                        fNode: _focusNode,
                        onPressed: _sendMessage,
                        onChanged: _sendTyping,
                        onAttach: _sendMAttachment,
                        onImage: getImage,
                        onVoice: _sendVoice,
                        isEmoji: isShowEG,
                        onInsertEmoji: _insertEmoji,
                        onTextChange: _textChange,

                      ),
                    ),

                  ),


/*
            Expanded(
              flex: _flex,
              child: MessageInput(
                chatBloc: widget.chatBloc,
                textEditingController: _textEditingController,
                // textEditingController: _controller,
                fNode: _focusNode,
                onPressed: _sendMessage,
                onChanged: _sendTyping,
                onAttach: _sendMAttachment,
                onImage: getImage,
                isEmoji: isShowEG,
                onInsertEmoji: _insertEmoji,
                onTextChange: _textChange,

              ),
            ),

 */
                  isShowEG ? MediaQuery.of(context).viewInsets.bottom == 0.0? Expanded(
                      flex: 8,
                      child:
                      EmojiPicker(
                        rows: 4,
                        columns: 9,
                        buttonMode: ButtonMode.MATERIAL,
                        //recommendKeywords: ["racing", "horse"],
                        numRecommended: 0,
                        onEmojiSelected: (emoji, category) {
                          // print('here${emoji.name}');
                          if(_textEditingController.value.text == '') {

                            insertText('');
                          }
                          insertText(emoji.emoji!);
                        },
                      )
                  ):
                  Container(height: 0.0, width: 0.0,):
                  Container(height: 0.0, width: 0.0,),
                ],
              ),

              isSend?
              Align(
                  alignment: isShowEG?  Alignment(0.96, - 0.17) : Alignment.bottomRight,
                  child:
                  GestureDetector(
                    onTap:(){
                      _sendMessage();
                      setState(() {
                        isSend = false;
                      });
                    } ,

                    child: Container(
                        width: 50.0 ,
                        height: 50.0 ,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        child:
                        Center(
                            child:const Icon(Icons.send_rounded, color: Colors.white,)
                        )



                    ),
                  )
              )
                  :Align(
                  alignment: isShowEG?  Alignment(0.96, - 0.17) : Alignment.bottomRight,
                  child: SlideButton(
                      label1:'1',
                      label2:'2',
                      label3:'3',
                      label4:'4',
                      widthSC: MediaQuery.of(context).size.width,
                      onSelected :(label){
                        print('label === $label');
                        if(label == '1'){

                          _sendVoice1(1);
                        }else
                        if(label == '2'){
                          _sendVoice1(2);
                        }else
                        if(label == '3'){

                          _sendVoice1(0);

                        }else{
                          if(label.contains('i')){
                            label.replaceAll('i', '');
                            _sendVoice(int.tryParse(label));
                          }else{
                            _sendVoice1(int.tryParse(label));
                          }

                        }

                      }
                  )
              )

            ]


        )
      ),
          onWillPop: _onWillPop,
    );
  }

  void insertText(String text) {
    var value = _textEditingController.value;
    var start = value.selection.baseOffset;
    var end = value.selection.extentOffset;
    if (value.selection.isValid) {
      String newText = "";
      if (value.selection.isCollapsed) {
        if (end > 0) {
          newText += value.text.substring(0, end);
        }
        newText += text;
        if (value.text.length > end) {
          newText += value.text.substring(end, value.text.length);
        }
      } else {
        newText = value.text.replaceRange(start, end, text);
      }

     setState(() {
        _textEditingController.value = value.copyWith(
            text: newText,
            selection: value.selection.copyWith(
                baseOffset: end + text.length,
                extentOffset: end + text.length));
      });
    }else{
          setState(() {
        _textEditingController.value = value.copyWith(
            text: text,
             selection: TextSelection.collapsed(offset: text.length));
      });
    }
  }

  void _textChange(String text) {
    double temp = 53;
    int temp1 = 8;
    final span = TextSpan(text: _textEditingController.value.text,
        style: TextStyle(fontSize: 14, fontFamily: 'Amazon Ember'));
    final tp = TextPainter(text: span, textDirection: TextDirection.ltr ,);
    bool isNextLine = false;
    tp.layout(
      minWidth: 20,
      maxWidth: 0.6 * MediaQuery
          .of(context)
          .size
          .width ,
    );
    List<ui.LineMetrics> lines = tp.computeLineMetrics();
    int numberOfLines = lines.length;
    if(text.length == 1){
      setState(() {
        isSend = true;
      });
    }

    if(numberOfLines > OldNumberLine) isNextLine = true;
    OldNumberLine = numberOfLines;
    if (MediaQuery
        .of(context)
        .viewInsets
        .bottom == 0.0) {
      // print('testkeyboard' + _textEditingController.value.text);
      if (isShowEG)
      {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      } else
        {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      }
    } else {
     // print('testkeyboardyes' + _textEditingController.value.text);
      if (isShowEG) {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 125;
            }
            break;
        }
      } else {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      }

      if(isNextLine){
         setState(() {

      //  _flex = temp;
        heightTI = temp;
        _flex1 = temp1;
          });
      }
    }
  }

  void _keyboardIsVisible(bool ish) {
    double temp = 53;
    int temp1 = 8;
    final span = TextSpan(text: _textEditingController.value.text,
        style: TextStyle(fontSize: 14,fontFamily: 'Amazon Ember'));
    final tp = TextPainter(text: span, textDirection: TextDirection.ltr,);
    tp.layout(
      minWidth: 20,
      maxWidth: 0.6 * MediaQuery
          .of(context)
          .size
          .width ,
    );
    List<ui.LineMetrics> lines = tp.computeLineMetrics();
    int numberOfLines = lines.length;
    if (MediaQuery.of(context).viewInsets.bottom == 0.0) {
      //print('testkeyboard' + _textEditingController.value.text);
      if (isShowEG) {
        temp1 = 8;
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      } else {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
        if(tapCount == 0){
          FocusScope.of(context).requestFocus(_focusNode);
        //  SystemChannels.textInput.invokeMethod('TextInput.hide');
        }
      }
    } else {
   //   print('testkeyboardyes' + _textEditingController.value.text);
      temp1 = 8;
      if (isShowEG) {
        temp1 = 8;
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
       // setState(() {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          // isShowEG = false;
     //   });
      } else {
        //print('no');
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }

      }
    }

    setState(() {
      progressCount = 0;
      ish ?_flex1 = temp1 : _flex1 = 6;// temp1;
      heightTI = temp;
     // _flex = temp;
    });
  //  return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  void _insertEmoji() {
    tapCount ++;
    if(!isShowEG){
      setState(() {
        FocusScope.of(context).requestFocus(_focusNode);
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      });
      isShowEG = true;
    }else{
      isShowEG = false;
      setState(() {
        SystemChannels.textInput.invokeMethod('TextInput.show');
      });
    }
   if(isShowEG){
    }else{
     if(_textEditingController.value.text == ''){
         FocusScope.of(context).requestFocus(_focusNode);
     }
   }



    if(_textEditingController.value.text == ''){

     // SystemChannels.textInput.invokeMethod('TextInput.hide');
     // FocusScope.of(context).requestFocus(_focusNode);
    }


  }

  bool isImage(String ext ){
    bool isImage = false;
    if(['.tif','.tiff','.bmp','.jpg', 'jpeg', 'gif', 'png', 'eps'].contains(p.extension(ext)) && ext.contains('https://upload.projects.co.id/upload/')){
      isImage = true;
    }
    return isImage;
  }

  bool isFile(String ext ){
    bool isFile = false;
    if( ext.contains('https://upload.projects.co.id/upload/')){
      isFile = true;
    }
    return isFile;
  }

  void _sendMessage1(String msg) async{
    // final blank = _textEditingController.text == null || _textEditingController.text.trim() == '';
    bool blank = msg?.trim()?.isEmpty ?? true;
    progressCount = 0;
    // print('hereeee');
    if (msg.isNotEmpty && !blank) {
      // print('hereeee');
      String str = msg;
      String newString = '';
      if(isFile(str) || isImage(str)){

        newString = str;
        // newString = str.replaceAllMapped(RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+'), (match) {
        //   return "<p> ${match.group(0)} </p>";});
      }else{

        newString = str.replaceAllMapped(RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+'), (match) {
          if(match.group(0)!.contains('..')) {
            return "${match.group(0)}";
          }else{
            return "<p><a href='${match.group(0)}'>${match.group(0)}</a></p>";
          }
        });
      }

      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("send", true);

      //  print(newString);
      final SendMsgModel1 message = SendMsgModel1(
          thread: '${widget._jsonMessage['thread']}',
          // sender: '${widget.userID}',
          // message:  parser.emojify(parser.unemojify(msg)),
          message:  parser.emojify(parser.unemojify(newString.replaceAll('\n', '<br>'))),
          attachment: '');
      widget.chatBloc!.sendMsg1(message);
      //  widget.chatBloc!.getFirstThread('${widget._jsonMessage['thread']}');

      att= '';

      _flex = 1;
      _flex1 = 9;
      // if(isShowEG){
      //    isShowEG = false;
      //  }
    //  setState(() {
        // SystemChannels.textInput.invokeMethod('TextInput.hide');
     //   _textEditingController.clear();
       // FocusScope.of(context).requestFocus(_focusNode);
   //   });


    }
    // widget.chatBloc!.getIndex(1);


  }

  Future<bool> checkPermissionAudio() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }


  void _sendMessage() async{
   // final blank = _textEditingController.text == null || _textEditingController.text.trim() == '';
    bool blank = _textEditingController.text?.trim()?.isEmpty ?? true;

    progressCount = 0;
    // print('hereeee');
    if (_textEditingController.text.isNotEmpty && !blank) {
     // print('hereeee');
      String str = _textEditingController.text;
      String newString = '';
      if(isFile(str) || isImage(str)){

        newString = str;
       // newString = str.replaceAllMapped(RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+'), (match) {
       //   return "<p> ${match.group(0)} </p>";});
      }else{
        newString = str.replaceAllMapped(RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+'), (match) {
          if(match.group(0)!.contains('..')) {
            return "${match.group(0)}";
          }else{
            if(match.group(0)!.toLowerCase().contains('https') ||match.group(0)!.toLowerCase().contains('http')){
              return "<p><a href='${match.group(0)}'>${match.group(0)}</a></p>";
            }else{
              return "${match.group(0)}";
            }

          }

        });

      }
     if(multiSelectedMessage.length != 0){
       newString =  multiSelectedMessage[0]['userid'] == peerid1 ? "$username1" + "<blockquote> ${parser.emojify(multiSelectedMessage[0]['message'])} </blockquote>" +  '<p>$newString</p>': "$myname1" + "<blockquote> ${parser.emojify(multiSelectedMessage[0]['message'])} </blockquote>" + '<p>$newString</p>' ;
       multiSelectedMessage = [];
     }else{

     }

        final prefs = await SharedPreferences.getInstance();
       prefs.setBool("send", true);




     //  print('Heloooooooo data ===' + newString);

      final SendMsgModel1 message = SendMsgModel1(
          thread: '${widget._jsonMessage['thread']}',
         // sender: '${widget.userID}',
         // message:  parser.emojify(parser.unemojify(_textEditingController.text)),
          message:  parser.emojify(parser.unemojify(newString.replaceAll('\n', '<br>'))),
          attachment: '');
      widget.chatBloc!.sendMsg(message);


    //  widget.chatBloc!.getFirstThread('${widget._jsonMessage['thread']}');

       att= '';

    _flex = 1;
    _flex1 = 9;
    // if(isShowEG){
   //    isShowEG = false;
   //  }
      setState(() {
       // SystemChannels.textInput.invokeMethod('TextInput.hide');
        isReply = false;
        _textEditingController.clear();
        FocusScope.of(context).requestFocus(_focusNode);
      });


    }
   // widget.chatBloc!.getIndex(1);


  }
/*
  void _sendMAttachment() {
      // open file
      //uploadfile
      //getjson
      att = 'https://upload.projects.co.id/upload/usreb2114/201755015ae88db743853.jpg';
  }
 */

  Future<DIOProvider> _init()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final DIOProvider provider = await DIOProvider(appDocDir.path);
    return provider;

  }

  void showProgress(received, total) {
    if (total != -1) {
      setState(() {
        //  _showNotification(failed? 'failed' : "Upload " + (received / total * 100).toStringAsFixed(0) + "%", 2,
        //     widget.filename);
       // progressCount = received / total ;
        progressCount = (received / total) == 1.0 ? 0 : (received / total);

      });

     // print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  void showProgress1(received, total) {
    if (total != -1) {
      //setState(() {
        //  _showNotification(failed? 'failed' : "Upload " + (received / total * 100).toStringAsFixed(0) + "%", 2,
        //     widget.filename);
        // progressCount = received / total ;
        //progressCount = (received / total) == 1.0 ? 0 : (received / total);

      //});

      // print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  void _sendMAttachment() async {
    List<String> msg = [];
    FileField? dioResultFile;
    this.provider = await _init();
    setState(() => _loadingPath = true);
    List<String?>? files;
    try {
      if (_multiPick) {
        _path = null;

        FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

         files = result!.paths!;
      } else
        {
        files = null;
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        _path = result?.files.single.path;
        String? filename;
        var filename1;
        filename = p.basename(_path!);
        filename1 = filename;

        var file = File(_path!);
        var lastmd = file.lastModifiedSync();
        var filelength = file.lengthSync();
        var fl = filelength;

        if (result!.files.single.path!.isNotEmpty) {


                bool res = await Navigator.push(
                context,
                MaterialPageRoute(
                builder: (_) => ShowSentFile(
                        //  file: ,
                          fz: filelength,
                          date:lastmd,
                          basename:filename1 ,
                          msg:msg
                          ),
                    ),
                );
                if(!res){
                AppProvider.getRouter(context!)!.pop(context!);

                 }else{
                       // print('my path ============ $_path');
                      dioResultFile = await loadFileFile(filename, _path!, showProgress);

                      if(dioResultFile!.status == '1'){

                        filename = dioResultFile!.temp;
                        //var res await getUploadFolder(filename, 'usr${widget.userID}' );
                        String? res ;

                        try {
                          res =  await provider!.getUploadFolder(filename!, 'usr${widget.userID}', filename1 ).then(( response) {
                            return response;
                          });
                        }catch(e) {
                          failed = true;
                       //   setState(() {
                         // Navigator.of(context).pop();
                            AppProvider.getRouter(context!)!.pop(context!);

                        }
                        if(res!  != ''){

                         print('ini adalah $res' );
                         // var attMessage = 'https://upload.projects.co.id/upload/usr${widget.userID}/$filename';
                         String attMessage;

                         if(msg.isNotEmpty){
                           //'<div class="chat-download"><a class="more" href="$res">$filename</a><br/>Size: ${fl.toString()}, Date: 1622120588986</div>${msg[0]}<br>'
                         //  attMessage = '<div class=\"chat-download\"><a class=\"more\" href=\"$res\">$filename</a><br/>Size: ${fl.toString()}, Date: ${lastmd.millisecondsSinceEpoch}</div>${msg[0]}<br>';
                          // attMessage = '<div class=\"chat-file\"> <div class=\"chat-file-link\"><a class=\"more\" href=\"$res\">$filename1</a></div> <div class=\"chat-file-info\">${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>${msg[0]}';
                           attMessage = "<div class='chat-file'> <div class='chat-file-link'><a class='more' href='$res'>$filename1</a></div> <div class='chat-file-info'>${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>${msg[0]}";

                           //   attMessage = "<div><a  class=\"chat-download\"  href=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filename\" x-size=\"${fl.toString()}\" x-date=\"${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\" >$filename1</a></div> ${msg[0]}<br>";

                         }else{

                          // attMessage = '<div class=\"chat-file\"> <div class=\"chat-file-link\"><a class=\"more\" href=\"$res\">$filename1</a></div> <div class=\"chat-file-info\">${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>';
                           attMessage = "<div class='chat-file'> <div class='chat-file-link'><a class='more' href='$res'>$filename1</a></div> <div class='chat-file-info'>${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>";

                           //  attMessage = '<div class=\"chat-download\"><a class=\"more\" href=\"$res\">$filename</a><br/>Size: ${fl.toString()}, Date: ${lastmd.millisecondsSinceEpoch}</div>';
                          // attMessage = "<div><a  class=\"chat-download\"  href=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filename\" x-size=\"${fl.toString()}\" x-date=\"${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\" >$filename1</a></div>";

                         }

                        // var attMessage = "<a href=\”https://upload.projects.co.id/upload/usr${widget.userID}/$filename\” class=\”download\” x-size=\”${fl.toString()}\” x-date=\”${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\” >$filename1</a>";

                          // var attMessage = 'https://upload.projects.co.id/upload/temp/$filename';

                          print('attMessage == $attMessage');

                          final SendMsgModel1 message = SendMsgModel1(
                              thread: '${widget._jsonMessage['thread']}',
                              // sender: '${widget.userID}',
                              message:  attMessage,
                              attachment: '');
                          widget.chatBloc!.sendMsg(message);





                          AppProvider.getRouter(context!)!.pop(context!);

                         // Navigator.of(context).pop();

                        }

                      }

                    }
                }
        }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    _flex = 1;
    _flex1 = 9;
    if(isShowEG){
      isShowEG = false;
    }

    setState(() {
      progressCount = 0;
      _loadingPath = false;
      _fileName = _path != null
          ? _path!.split('/').last
          : files != null ? files.toString() : '...';
    });
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();


  _setVoicePath(String v)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('voicepath', v);
  }

  Future<String> getFilePath() async {
    var now = DateTime.now();
    String formattedDate = intl1.DateFormat('yy-MM-dd-HH-mm-ss').format(now);
   // Directory storageDirectory = await getApplicationDocumentsDirectory();
   // String sdPath = '/storage/emulated/0/Download';//storageDirectory.path + "/record";

    final Directory? extDir = await getExternalStorageDirectory();
    final String dirPath = '${extDir!.path}/Record/send';
   // await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/PROJ${timestamp()}ECT.mp3';
    await _setVoicePath(filePath);
    var d = Directory(dirPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }

   // print('recordFilePath123 == $filePath');
    return filePath;
    //return sdPath + "/PROJ$formattedDate-ECT.mp3";
  }


  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Voice Note'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Send this voice note?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                yes = true;
                Navigator.of(context).pop();

              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                yes = false;
                Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }


  void _sendVoice(int? sts) async {

    List<String> msg = [];
    FileField? dioResultFile;
   // this.provider = await _init();
    setState(() => _loadingPath = true);
    List<String?>? files;

   if(sts == 0){
     //bool hasPermission = await checkPermissionAudio();
    // if (hasPermission) {
       recordFilePath = await getFilePath();

       RecordMp3.instance.start(recordFilePath, (type) {
         setState(() {});
       });
     //} else {}
     setState(() {});
   }
   else {
     bool s = RecordMp3.instance.stop();

     if (s) {
       print("Record complete");

       setState(() {});
     } else {
       print("Record tidak complete");
     }
     sleep((Duration(milliseconds: 500)));
     this.provider = await _init();
     if (RecordMp3.instance.status != RecordStatus.RECORDING) {
       // print("Record complete ${RecordMp3.instance.status.toString()}");
     }
     // await uploadAudio();

     await _showMyDialog();


     if(yes){
     msg.add(sts.toString());
     try {
       String? filename;
       var filename1;
       filename = sts.toString() + p.basename(recordFilePath);
       filename1 = filename;
       //print('recordFilePath == $recordFilePath');
       var file = File(recordFilePath);
       var lastmd = file.lastModifiedSync();
       var filelength = file.lengthSync();
       var fl = filelength;
       recordFilePath = recordFilePath.replaceAll(p.basename(recordFilePath), filename1);
       await file.rename(recordFilePath);
       dioResultFile =
       await loadFileFileMp3(filename, recordFilePath, showProgress1);

       if (dioResultFile!.status == '1') {
         print('boss4');
         filename = dioResultFile!.temp;
         //var res await getUploadFolder(filename, 'usr${widget.userID}' );
         String? res;

         try {
           res = await provider!.getUploadFolder(
               filename!, 'usr${widget.userID}', filename1).then((response) {
             return response;
           });
         } catch (e) {
           failed = true;
           //   setState(() {
           // Navigator.of(context).pop();
           AppProvider.getRouter(context!)!.pop(context!);
         }
         if (res!  != '') {
           print('ini adalah $res');
           // var attMessage = 'https://upload.projects.co.id/upload/usr${widget.userID}/$filename';
           String attMessage;


           //'<div class="chat-download"><a class="more" href="$res">$filename</a><br/>Size: ${fl.toString()}, Date: 1622120588986</div>${msg[0]}<br>'
           //  attMessage = '<div class=\"chat-download\"><a class=\"more\" href=\"$res\">$filename</a><br/>Size: ${fl.toString()}, Date: ${lastmd.millisecondsSinceEpoch}</div>${msg[0]}<br>';
           // attMessage = '<div class=\"chat-file\"> <div class=\"chat-file-link\"><a class=\"more\" href=\"$res\">$filename1</a></div> <div class=\"chat-file-info\">${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>${msg[0]}';
           attMessage =
           "<div class='chat-file'> <div class='chat-file-link'><a class='more' href='$res'>$filename1</a></div> <div class='chat-file-info'>${filesize(
               fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(
               lastmd)}</div></div>${msg[0]}";

           //   attMessage = "<div><a  class=\"chat-download\"  href=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filename\" x-size=\"${fl.toString()}\" x-date=\"${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\" >$filename1</a></div> ${msg[0]}<br>";


           // var attMessage = "<a href=\”https://upload.projects.co.id/upload/usr${widget.userID}/$filename\” class=\”download\” x-size=\”${fl.toString()}\” x-date=\”${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\” >$filename1</a>";

           // var attMessage = 'https://upload.projects.co.id/upload/temp/$filename';

           print('attMessage == $attMessage');

           final SendMsgModel1 message = SendMsgModel1(
               thread: '${widget._jsonMessage['thread']}',
               // sender: '${widget.userID}',
               message: attMessage,
               attachment: '');


           widget.chatBloc!.sendMsg(message);


           // AppProvider.getRouter(context!)!.pop(context!);

           // Navigator.of(context).pop();

         }
       }
     } on PlatformException catch (e) {
       print("Unsupported operation" + e.toString());
     }
   }



       setState(() {
         isPlayingMsg = false;
         isSending = true;
       });
       if (!mounted) return;
       _flex = 1;
       _flex1 = 9;
       if(isShowEG){
         isShowEG = false;
       }

       setState(() {
         progressCount = 0;
         _loadingPath = false;
         _fileName = _path != null
             ? _path!.split('/').last
             : files! != null ? files!.toString() : '...';
       });






   }
    /*
    List<String> msg = [];
    FileField dioResultFile;
    this.provider = await _init();
    setState(() => _loadingPath = true);
    List<String> files;
    try {
      if (_multiPick) {
        _path = null;

        FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true);

        if(result != null) {

          files = result.paths;

        }
      } else
      {
        files = null;
        FilePickerResult result = await FilePicker.platform.pickFiles();

        if(result != null) {
          _path = result.files.single.path;
        }
        var filename;
        var filename1;
        filename = p.basename(_path);
        filename1 = filename;

        var file = File(_path);
        var lastmd = file.lastModifiedSync();
        var filelength = file.lengthSync();
        var fl = filelength;

        if (result.files.single.path.isNotEmpty) {


          bool res = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ShowSentFile(
                //  file: ,
                  fz: filelength,
                  date:lastmd,
                  basename:filename1 ,
                  msg:msg
              ),
            ),
          );
          if(!res){
            AppProvider.getRouter(context!)!.pop(context!);

          }else{

            dioResultFile = await loadFileFile(filename, _path, showProgress);

            if(dioResultFile!.status == '1'){

              filename = dioResultFile!.temp;
              //var res await getUploadFolder(filename, 'usr${widget.userID}' );
              var res ;

              try {
                res =  await provider!.getUploadFolder(filename, 'usr${widget.userID}', filename1 ).then(( response) {
                  return response;
                });
              }catch(e) {
                failed = true;
                //   setState(() {
                // Navigator.of(context).pop();
                AppProvider.getRouter(context!)!.pop(context!);

              }
              if(res!  != ''){

                print('ini adalah $res' );
                // var attMessage = 'https://upload.projects.co.id/upload/usr${widget.userID}/$filename';
                var attMessage;

                if(msg.isNotEmpty){
                  //'<div class="chat-download"><a class="more" href="$res">$filename</a><br/>Size: ${fl.toString()}, Date: 1622120588986</div>${msg[0]}<br>'
                  //  attMessage = '<div class=\"chat-download\"><a class=\"more\" href=\"$res\">$filename</a><br/>Size: ${fl.toString()}, Date: ${lastmd.millisecondsSinceEpoch}</div>${msg[0]}<br>';
                  // attMessage = '<div class=\"chat-file\"> <div class=\"chat-file-link\"><a class=\"more\" href=\"$res\">$filename1</a></div> <div class=\"chat-file-info\">${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>${msg[0]}';
                  attMessage = "<div class='chat-file'> <div class='chat-file-link'><a class='more' href='$res'>$filename1</a></div> <div class='chat-file-info'>${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>${msg[0]}";

                  //   attMessage = "<div><a  class=\"chat-download\"  href=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filename\" x-size=\"${fl.toString()}\" x-date=\"${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\" >$filename1</a></div> ${msg[0]}<br>";

                }else{

                  // attMessage = '<div class=\"chat-file\"> <div class=\"chat-file-link\"><a class=\"more\" href=\"$res\">$filename1</a></div> <div class=\"chat-file-info\">${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>';
                  attMessage = "<div class='chat-file'> <div class='chat-file-link'><a class='more' href='$res'>$filename1</a></div> <div class='chat-file-info'>${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>";

                  //  attMessage = '<div class=\"chat-download\"><a class=\"more\" href=\"$res\">$filename</a><br/>Size: ${fl.toString()}, Date: ${lastmd.millisecondsSinceEpoch}</div>';
                  // attMessage = "<div><a  class=\"chat-download\"  href=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filename\" x-size=\"${fl.toString()}\" x-date=\"${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\" >$filename1</a></div>";

                }

                // var attMessage = "<a href=\”https://upload.projects.co.id/upload/usr${widget.userID}/$filename\” class=\”download\” x-size=\”${fl.toString()}\” x-date=\”${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\” >$filename1</a>";

                // var attMessage = 'https://upload.projects.co.id/upload/temp/$filename';

                print('attMessage == $attMessage');

                final SendMsgModel1 message = SendMsgModel1(
                    thread: '${widget._jsonMessage['thread']}',
                    // sender: '${widget.userID}',
                    message:  attMessage,
                    attachment: '');
                widget.chatBloc!.sendMsg(message);





                AppProvider.getRouter(context!)!.pop(context!);

                // Navigator.of(context).pop();

              }

            }

          }
        }
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    _flex = 1;
    _flex1 = 9;
    if(isShowEG){
      isShowEG = false;
    }

    setState(() {
      progressCount = 0;
      _loadingPath = false;
      _fileName = _path != null
          ? _path.split('/').last
          : files != null ? files.toString() : '...';
    });


     */
  }
  void _sendVoice1(int? sts) async {

    List<String> msg = [];
    FileField? dioResultFile;
    // this.provider = await _init();
    setState(() => _loadingPath = true);
    List<String?>? files;

    if(sts == 0){
      //bool hasPermission = await checkPermissionAudio();
      // if (hasPermission) {
      recordFilePath = await getFilePath();

      RecordMp3.instance.start(recordFilePath, (type) {
        setState(() {});
      });
      //} else {}
      setState(() {});
    } else if(sts == 1){
      //RecordMp3.instance.stop();

    }else if(sts == 2){
     // RecordMp3.instance.stop();
      return;
    }
    else {
      bool s = RecordMp3.instance.stop();

      if (s) {
        print("Record complete");

        setState(() {});
      } else {
        print("Record tidak complete");
      }
      sleep((Duration(milliseconds: 500)));
      this.provider = await _init();
      if (RecordMp3.instance.status != RecordStatus.RECORDING) {
        // print("Record complete ${RecordMp3.instance.status.toString()}");
      }
      // await uploadAudio();

    //  await _showMyDialog();


        
        msg.add(sts.toString());
        try {
          String? filename;
          var filename1;
          filename = sts.toString() + p.basename(recordFilePath);
          filename1 = filename;
          //print('recordFilePath == $recordFilePath');
          var file = File(recordFilePath);
          var lastmd = file.lastModifiedSync();
          var filelength = file.lengthSync();
          var fl = filelength;
          recordFilePath = recordFilePath.replaceAll(p.basename(recordFilePath), filename1);
          await file.rename(recordFilePath);
          dioResultFile =
          await loadFileFileMp3(filename, recordFilePath, showProgress1);

          if (dioResultFile!.status == '1') {
            print('boss4');
            filename = dioResultFile!.temp;
            //var res await getUploadFolder(filename, 'usr${widget.userID}' );
            String? res;

            try {
              res = await provider!.getUploadFolder(
                  filename!, 'usr${widget.userID}', filename1).then((response) {
                return response;
              });
            } catch (e) {
              failed = true;
              //   setState(() {
              // Navigator.of(context).pop();
              AppProvider.getRouter(context!)!.pop(context!);
            }
            if (res!  != '') {
              print('ini adalah $res');
              // var attMessage = 'https://upload.projects.co.id/upload/usr${widget.userID}/$filename';
              String attMessage;


              //'<div class="chat-download"><a class="more" href="$res">$filename</a><br/>Size: ${fl.toString()}, Date: 1622120588986</div>${msg[0]}<br>'
              //  attMessage = '<div class=\"chat-download\"><a class=\"more\" href=\"$res\">$filename</a><br/>Size: ${fl.toString()}, Date: ${lastmd.millisecondsSinceEpoch}</div>${msg[0]}<br>';
              // attMessage = '<div class=\"chat-file\"> <div class=\"chat-file-link\"><a class=\"more\" href=\"$res\">$filename1</a></div> <div class=\"chat-file-info\">${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>${msg[0]}';
              attMessage =
              "<div class='chat-file'> <div class='chat-file-link'><a class='more' href='$res'>$filename1</a></div> <div class='chat-file-info'>${filesize(
                  fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(
                  lastmd)}</div></div>${msg[0]}";

              //   attMessage = "<div><a  class=\"chat-download\"  href=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filename\" x-size=\"${fl.toString()}\" x-date=\"${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\" >$filename1</a></div> ${msg[0]}<br>";


              // var attMessage = "<a href=\”https://upload.projects.co.id/upload/usr${widget.userID}/$filename\” class=\”download\” x-size=\”${fl.toString()}\” x-date=\”${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\” >$filename1</a>";

              // var attMessage = 'https://upload.projects.co.id/upload/temp/$filename';

              print('attMessage == $attMessage');

              final SendMsgModel1 message = SendMsgModel1(
                  thread: '${widget._jsonMessage['thread']}',
                  // sender: '${widget.userID}',
                  message: attMessage,
                  attachment: '');


              widget.chatBloc!.sendMsg(message);


              // AppProvider.getRouter(context!)!.pop(context!);

              // Navigator.of(context).pop();

            }
          }
        } on PlatformException catch (e) {
          print("Unsupported operation" + e.toString());
        }


      setState(() {
        isPlayingMsg = false;
        isSending = true;
      });
      if (!mounted) return;
      _flex = 1;
      _flex1 = 9;
      if(isShowEG){
        isShowEG = false;
      }

      setState(() {
        progressCount = 0;
        _loadingPath = false;
        _fileName = _path != null
            ? _path!.split('/').last
            :  files!.toString() ;
      });






    }
    /*
    List<String> msg = [];
    FileField dioResultFile;
    this.provider = await _init();
    setState(() => _loadingPath = true);
    List<String> files;
    try {
      if (_multiPick) {
        _path = null;

        FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true);

        if(result != null) {

          files = result.paths;

        }
      } else
      {
        files = null;
        FilePickerResult result = await FilePicker.platform.pickFiles();

        if(result != null) {
          _path = result.files.single.path;
        }
        var filename;
        var filename1;
        filename = p.basename(_path);
        filename1 = filename;

        var file = File(_path);
        var lastmd = file.lastModifiedSync();
        var filelength = file.lengthSync();
        var fl = filelength;

        if (result.files.single.path.isNotEmpty) {


          bool res = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ShowSentFile(
                //  file: ,
                  fz: filelength,
                  date:lastmd,
                  basename:filename1 ,
                  msg:msg
              ),
            ),
          );
          if(!res){
            AppProvider.getRouter(context!)!.pop(context!);

          }else{

            dioResultFile = await loadFileFile(filename, _path, showProgress);

            if(dioResultFile!.status == '1'){

              filename = dioResultFile!.temp;
              //var res await getUploadFolder(filename, 'usr${widget.userID}' );
              var res ;

              try {
                res =  await provider!.getUploadFolder(filename, 'usr${widget.userID}', filename1 ).then(( response) {
                  return response;
                });
              }catch(e) {
                failed = true;
                //   setState(() {
                // Navigator.of(context).pop();
                AppProvider.getRouter(context!)!.pop(context!);

              }
              if(res!  != ''){

                print('ini adalah $res' );
                // var attMessage = 'https://upload.projects.co.id/upload/usr${widget.userID}/$filename';
                var attMessage;

                if(msg.isNotEmpty){
                  //'<div class="chat-download"><a class="more" href="$res">$filename</a><br/>Size: ${fl.toString()}, Date: 1622120588986</div>${msg[0]}<br>'
                  //  attMessage = '<div class=\"chat-download\"><a class=\"more\" href=\"$res\">$filename</a><br/>Size: ${fl.toString()}, Date: ${lastmd.millisecondsSinceEpoch}</div>${msg[0]}<br>';
                  // attMessage = '<div class=\"chat-file\"> <div class=\"chat-file-link\"><a class=\"more\" href=\"$res\">$filename1</a></div> <div class=\"chat-file-info\">${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>${msg[0]}';
                  attMessage = "<div class='chat-file'> <div class='chat-file-link'><a class='more' href='$res'>$filename1</a></div> <div class='chat-file-info'>${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>${msg[0]}";

                  //   attMessage = "<div><a  class=\"chat-download\"  href=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filename\" x-size=\"${fl.toString()}\" x-date=\"${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\" >$filename1</a></div> ${msg[0]}<br>";

                }else{

                  // attMessage = '<div class=\"chat-file\"> <div class=\"chat-file-link\"><a class=\"more\" href=\"$res\">$filename1</a></div> <div class=\"chat-file-info\">${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>';
                  attMessage = "<div class='chat-file'> <div class='chat-file-link'><a class='more' href='$res'>$filename1</a></div> <div class='chat-file-info'>${filesize(fl)}, ${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}</div></div>";

                  //  attMessage = '<div class=\"chat-download\"><a class=\"more\" href=\"$res\">$filename</a><br/>Size: ${fl.toString()}, Date: ${lastmd.millisecondsSinceEpoch}</div>';
                  // attMessage = "<div><a  class=\"chat-download\"  href=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filename\" x-size=\"${fl.toString()}\" x-date=\"${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\" >$filename1</a></div>";

                }

                // var attMessage = "<a href=\”https://upload.projects.co.id/upload/usr${widget.userID}/$filename\” class=\”download\” x-size=\”${fl.toString()}\” x-date=\”${a.DateFormat('yyyy-MM-dd hh:mm:ss').format(lastmd)}\” >$filename1</a>";

                // var attMessage = 'https://upload.projects.co.id/upload/temp/$filename';

                print('attMessage == $attMessage');

                final SendMsgModel1 message = SendMsgModel1(
                    thread: '${widget._jsonMessage['thread']}',
                    // sender: '${widget.userID}',
                    message:  attMessage,
                    attachment: '');
                widget.chatBloc!.sendMsg(message);





                AppProvider.getRouter(context!)!.pop(context!);

                // Navigator.of(context).pop();

              }

            }

          }
        }
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    _flex = 1;
    _flex1 = 9;
    if(isShowEG){
      isShowEG = false;
    }

    setState(() {
      progressCount = 0;
      _loadingPath = false;
      _fileName = _path != null
          ? _path.split('/').last
          : files != null ? files.toString() : '...';
    });


     */
  }


  Future<FileField?>loadFileFile(String? filename, String? filepath, ProgressULCallback? progress)async{

    FormData  formdata = FormData.fromMap({
      "Filename":"filename",
      "Filedata": await MultipartFile.fromFile(filepath!, filename: filename),

    });
    FileField? res ;

    try {
      res =  await provider!.uploadFile1(formdata, progress!).then(( response) {
        return response;
      });
    }catch(e) {
      failed = true;
    }


    return res;
  }

  Future<FileField?>loadFileFileMp3(String? filename, String? filepath, ProgressULCallback? progress)async{
/*
    FormData formdata = FormData.fromMap({
      "file": MultipartFile.fromBytes(
          File(filepath).readAsBytesSync(),
          filename: filename),
    });

 */



    FormData  formdata = FormData.fromMap({
      "Filename":"filename",
      "Filedata": await MultipartFile.fromFile(filepath!, filename: filename),

    });


   // print('boss3');

    FileField? res ;

    try {
      res =  await provider!.uploadFile1(formdata, progress!).then(( response) {
        return response;
      });
    }catch(e) {
     // print('boss2');
      failed = true;
    }


    return res;
  }


  Future<Photo?>loadImageFile(String? filename, String? filepath, ProgressULCallback? progress)async{
    FormData formdata = FormData.fromMap({
      "Filename":"filename",
      "Filedata": await MultipartFile.fromFile(filepath!, filename: filename),

    });
    Photo? res ;
    // String? res ;


    try {
      res =  await this.provider!.uploadImage1(formdata, progress!).then(( response) {
        return response;
      });
    }catch(e) {
      failed = true;
    }

    return res;
  }


  Future getImage() async {
    List<String> msg = [];
    this.provider = await _init();
    try {
      final pickedFile = await picker.getImage(
        source: ip.ImageSource.gallery,
      );




      if (pickedFile!.path.isNotEmpty) {


        bool result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ShowSentImage(
                image : pickedFile.path,
                msg : msg
            ),
          ),
        );
        if(!result){
        // print('messageku ${msg[0]}');
          AppProvider.getRouter(context!)!.pop(context!);


        }else{

          var _path = pickedFile.path;
          String filename;
          filename = p.basename(_path);
          var file = File(_path);
          // var lastmd = file.lastModifiedSync();
          var filelength = file.lengthSync();
          var fl = filelength;
          // filedate = lastmd.toUtc().millisecondsSinceEpoch;
          var dioResultFile = await loadImageFile(filename, _path, showProgress);
          /*
        _path = await FilePicker.getFilePath(
          type: _pickingType,
          allowedExtensions: (_extension?.isNotEmpty ?? false)
              ? _extension?.replaceAll(' ', '')?.split(',')
              : null,
        );

         */
          if(dioResultFile!.status == '1'){

            var  filename = dioResultFile!.temp;
            var  filethumbname = dioResultFile!.temp!.replaceAll('.', '-thumb.');
            print('mythumb ${dioResultFile!.temp}    ${dioResultFile!.thumb}');
            //var res await getUploadFolder(filename, 'usr${widget.userID}' );
            String? res ;

            try {
              res =  await provider!.getUploadFolder1(filename!, 'usr${widget.userID}' ).then(( response) {
                return response;
              });
            }catch(e) {
              failed = true;
              AppProvider.getRouter(context!)!.pop(context!);

              //  Navigator.of(context).pop();

            }

            try {
              res =  await provider!.getUploadFolder1(filethumbname, 'usr${widget.userID}' ).then(( response) {
                return response;
              });
            }catch(e) {
              failed = true;
              AppProvider.getRouter(context!)!.pop(context!);

              //  Navigator.of(context).pop();

            }


            if(res!  == 'OK'){
              // print('alamat === https://upload.projects.co.id/upload/usr${widget.userID}/$filename ');
              // print('alamat === https://upload.projects.co.id/upload/usr${widget.userID}/$filethumbname ');
              // var attMessage = 'https://upload.projects.co.id/upload/usr${widget.userID}/$filename';
              String attMessage;

              if(msg.isNotEmpty){
              //  attMessage = "<div><img  class=\"chat-thumbnail\"  src=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filethumbname\" /></div> ${msg[0]}<br>";
               // attMessage = "<div class=\"chat-image\"> <a href=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filename\" rel=\"lightbox\"><img class=\"chat-thumbnail\" src=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filethumbname\" /></a></div>${msg[0]}";
                attMessage = "<div class='chat-image'> <a href='https://upload.projects.co.id/upload/usr${widget.userID}/$filename' rel='lightbox'><img class='chat-thumbnail' src='https://upload.projects.co.id/upload/usr${widget.userID}/$filethumbname'></a></div>${msg[0]}";


              }else{
                attMessage = "<div class='chat-image'> <a href='https://upload.projects.co.id/upload/usr${widget.userID}/$filename' rel='lightbox'><img class='chat-thumbnail' src='https://upload.projects.co.id/upload/usr${widget.userID}/$filethumbname'></a></div>";

              //  attMessage = "<div class=\"chat-image\"> <a href=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filename\" rel=\"lightbox\"><img class=\"chat-thumbnail\" src=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filethumbname\" /></a></div>";
               // attMessage = "<div><img  class=\"chat-thumbnail\"  src=\"https://upload.projects.co.id/upload/usr${widget.userID}/$filethumbname\" /></div>";

              }
              // var attMessage = '<img  class="thumbnail"  src="https://upload.projects.co.id/upload/usr${widget.userID}/$filethumbname\" />';

              // var attMessage = 'https://upload.projects.co.id/upload/temp/$filename';

              // print('attMessage == $attMessage');

              final SendMsgModel1 message = SendMsgModel1(
                  thread: '${widget._jsonMessage['thread']}',
                  // sender: '${widget.userID}',
                  message:  attMessage,
                  attachment: '');
              widget.chatBloc!.sendMsg(message);


              AppProvider.getRouter(context!)!.pop(context!);

              //Navigator.of(context).pop();

            }

          }

        }





      }


    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    _flex = 1;
    _flex1 = 9;
    if(isShowEG){
      isShowEG = false;
    }

    setState(() {
      _loadingPath = false;

    });
/*
    setState(() {
      _image = File(pickedFile.path);
    });

 */
  }


  Future _takePic() async {
    this.provider = await _init();

      // Navigator.of(context).pop();
      try {
        WidgetsFlutterBinding.ensureInitialized();
        cameras = await availableCameras();
      } on CameraException catch (e) {
        //logError(e.code, e.description);
      }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatCamera(id : widget.userID, thread: widget._jsonMessage['thread'], chatBloc: widget.chatBloc, provider: this.provider )),
    );


  }


  void _sendTyping() {
    if(isShowEG){
     // insertText('');
      setState(() {
        isShowEG = false;
      });
    }
    if(!isSend){
      // insertText('');
      setState(() {
        isSend = true;
      });
    }

    tapCount ++;
    final SendTypingModel message = SendTypingModel(
        thread: widget._jsonMessage['thread']);
    widget.chatBloc!.sendTyp(message);
  }


  void _onSelect(dynamic message){


  //widget.chatBloc!.multiSelectedMessage;

      // selectedMessage =
      // message['time'] == selectedMessage['time'] ? null : message;

/*
        if (multiSelectedMessage.length == 1) {
          if (message['time'] == multiSelectedMessage[0]['time']) {
            multiSelectedMessage = [];
          } else {
            multiSelectedMessage.add(message);
          }
        }else if(multiSelectedMessage.length == 0){
          multiSelectedMessage.add(message);
        }else{
          var msm = multiSelectedMessage;
          bool isSelect1 = true;
          int count = 0;
          for(var item in msm){
            if(item['time'] == message['time']){
              multiSelectedMessage.removeAt(count);
              isSelect1 = false;
            }
            count ++;
          }
          if(isSelect1){

            multiSelectedMessage.add(message);
          }

        }



 */
    multiSelectedMessage = [];



    isSelect = true;
    setState(() {
      multiSelectedMessage.addAll(widget.chatBloc!.multiSelectedMessage);
      //selectMsg = message;
    });

  }

  void _onPayloadPress(dynamic button) {
    if (button is Buttons) {
      if (button.type == 'web_url')
        this._onWebUrl(button.url);
      else
        this._onPostback(button.title, button.payload);
    }
    if (button is QuickReplies) {
      this._onPostback(button.title, button.payload);
    }
  }

  void _onPayloadPress1(dynamic button) {
    if (button is Buttons) {
      if (button.type == 'web_url')
        this._onWebUrl(button.url);
      else
        this._onPostback(button.title, button.payload);
    }
    if (button is QuickReplies) {
      this._onPostback(button.title, button.payload);
    }
  }

  void _onPostback(title, payload) {
    final SendMsgModel1 message =
    SendMsgModel1(message: title, thread: '${widget._jsonMessage['thread']}');
    widget.chatBloc!.onPostBack1(message, title, payload);
  }

  void _onWebUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  void _onMediaViewHandler(String url, String blockId, String sessionId) {
    widget.chatBloc!
        .onMediaView(url: url, blockId: blockId, sessionId: sessionId);
  }
}




List<IconData> icons = [
  Icons.image,
  Icons.camera,
  Icons.file_upload,
  Icons.folder,
  Icons.gif
];
