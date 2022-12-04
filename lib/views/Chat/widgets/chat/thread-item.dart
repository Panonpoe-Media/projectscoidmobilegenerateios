import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:intl/intl.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'messages_types/messages_types.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/views/Chat/models/models.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:path/path.dart';
import 'package:html/parser.dart' show parse;
import 'package:path/path.dart' as p;

class ThreadItem extends StatefulWidget {
  final dynamic message;
  final int? index;
  final String? userID;
   ChatBloc? chatBloc;
   final List<dynamic>? allData;
    String search;
  ThreadItem(
      {Key? key, @required this.message,@required this.index, @required this.userID, @required this.chatBloc, @required this.allData, this.search = ''
      }) : super(key: key);

  get _jsonMessage =>
      (this.message is String) ? jsonDecode(this.message) : this.message;

  @override
  _ThreadItemItemState createState() => _ThreadItemItemState();
}

class _ThreadItemItemState extends State<ThreadItem> {
  var parser = EmojiParser();
  int unread = 0;
  bool darkMode = false;
  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('mm');
    var format1 = DateFormat('dd/MM/yy');
    var format2 = DateFormat('HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
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
      timeValue = (diff.inHours / (24 * 365)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';
   // if (diff.inHours < 1) {
      timeAgo =  timeAgo + ' ago';
      if(timeValue == 1 && timeUnit == 'day'){
        timeAgo = 'Yesterday';
      }else{
        if(timeUnit == 'hour' || timeUnit == 'minute' ){
          timeAgo = format2.format(date.toUtc()) ;

        }else{
          timeAgo = format1.format(date) ;
        }
      }




      return timeAgo;

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
    var format = DateFormat('mm');
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
    if( ext.contains('https://upload.projects.co.id/upload/')|| ext.contains('https://cdn.projects.co.id/upload/')){
      if(ext.contains('[')){
        isFile = false;
      }else{
        var document = parse(ext);
        var data = document.getElementsByClassName('download');
        if((data != null) && (data.isNotEmpty)){
          isFile = true;
        }else{
          var data = document.getElementsByClassName('chat-download');
          if((data != null) && (data.isNotEmpty)) {
            isFile = true;
          }
        }


      }
    }
    if(p.extension(ext) != '' && ext.contains(':') && ext.contains('-')&& ext.contains(',') &&  ext.contains('B')){
      isFile = true;
     // p.extension(ext) == '.'? isFile = false: ext.contains('..')? isFile = false: isFile = true;

    }

    return isFile;
  }

  bool isImage(String ext ){
    bool isImage = false;
    if(['.tif','.tiff','.bmp','.jpg', '.jpeg', '.gif', '.png', '.eps'].contains(p.extension(ext)) && ext.contains('https://upload.projects.co.id/upload/')) {
      if (ext.contains('[')) {
        isImage = false;
      } else {
        isImage = true;
      }
    }else {
      if (ext.contains('<img') && ext.contains('thumbnail')) {
        isImage = true;
      }
    }
    if(ext.isNotEmpty){
      if(ext[0]==' '){
        isImage = true;
        if(ext.contains(':') && ext.contains('-')  && ext.contains(',') && ext.contains('.') &&  ext.contains('B') ){
          isImage = false;
        }
      }
    }

    if(ext == ''){
      isImage = true;
    }

    return isImage;
  }

  transformMilliSeconds(int milliseconds) {
    print('milliseconds == $milliseconds');
    if(milliseconds == null) return null;
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

    return "$hoursStr$minutesStr.$secondsStr";
  }


  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    //double cWidth = MediaQuery.of(context).size.width * 0.64;
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    unread = widget._jsonMessage['unread'];
    final _extension = extension(widget._jsonMessage['lastmessage'].toString());
    if(_extension != ''){
    //  print('ini aku ${widget._jsonMessage['lastmessage'].toString()}');
    }else{
     // print('itu kamu ${widget._jsonMessage['lastmessage'].toString()}');
    }

    return


              Column(
          children: <Widget>[
           widget.index == 0? Container(height: 0): const Divider(
              thickness: 1,
              height:5,
            ),
            ListTile(
              isThreeLine: false,
              contentPadding: const EdgeInsets.fromLTRB(2, 0, 2, 5),
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
                widget.chatBloc.sendMsg(message);

                 */
                setState(() {
                  unread = 0;
                });
              bool result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                        user: widget.message,
                        userID : widget.userID!,
                        chatBloc : widget.chatBloc!
                    ),
                  ),
                );
              if(!result){

               // print('aku mulai 123');
                widget.chatBloc?.getFirstThread1(widget._jsonMessage['thread']);
              //  widget.chatBloc.getIndexSpecial(1);
                widget.chatBloc!.getx();
                setState(() {

                });
              }else{
                print('belum ketemu');
                Navigator.pop(context, true);

               // setState(() {
                  //widget.chatBloc?.getFirstThread1(widget._jsonMessage['thread']);
               // });
              }
              },
              /*
            => Navigator.push(
              context,
              /* MaterialPageRoute(
                        builder: (_) => ChatScreen(
                        user: buddy,
                      ),
                    ),

                    */
              MaterialPageRoute(
                  builder: (_) => ProjectsChatClient(user:
                  {
                    "sId": "111",
                    "id": "11",
                    "email": "ya",
                    "firstName": "irvan",
                    "lastName": "her",
                    "birthDate": "ya",
                    "imageUrl": "",
                    "fullName": "irvan her",
                    "age": 21,
                    "gender": "male"
                  }
                    ,options:
                    {
                      "urlApi": "https://develop.carespace.ai/api/admin",
                      "botName": "Amanda",
                      "avatarImage": "assets/images/profile-amanda.jpg",
                      "wsUrl": "wss://develop.carespace.ai/api/bot/web"
                    }
                    ,)
              ),
            ),
            */

              leading: Container(
                width: 72,
                height: 72,
               /* decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        offset: Offset(0, 5),
                        blurRadius: 10)
                  ],
                ), */
                child: Stack(
                  children: <Widget>[
                    /*
                    Positioned.fill(
                      child:

/*
                      CircleAvatar(
                       // radius: 100,
                        minRadius: 70,
                        maxRadius: 70,
                        // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                        backgroundImage: NetworkImage(widget._jsonMessage['avatar']),
                      ),

 */




                      Container(
                       // width: 15,
                       // height: 15,
                        decoration: ShapeDecoration(
                          shadows:[
                            BoxShadow(color: Colors.grey, offset: Offset(1.0, 1.0)),
                          ],

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: BorderSide(
                                width: 2,
                                color: Colors.white
                            ),
                          ),


                          image: DecorationImage(
                            image: NetworkImage(widget._jsonMessage['avatar']),
                            fit: BoxFit.contain,

                          ),
                        ),
                      )
                    ),

                     */
                    Container(
                       width: 62,
                       height: 70,
                      decoration: ShapeDecoration(
                        shadows:const [
                          BoxShadow(color: Colors.grey, offset: Offset(0.4, 0.4)),
                        ],

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                          side: const BorderSide(
                              width: 2,
                              color: Colors.white
                          ),
                        ),


                        image: DecorationImage(
                          image: NetworkImage(widget._jsonMessage['avatar']),
                          fit: BoxFit.fill,

                        ),
                      ),
                    ),

                    isOnline(widget._jsonMessage['lastseen'])
                        ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                    )
                        : Container(),


                  ],
                ),
              ),

             /*
              title: Text(
                '${widget._jsonMessage['display']}',
                maxLines: 2,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),

               */
              subtitle:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${widget._jsonMessage['username']}',
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      //   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                      style: TextStyle(fontSize: 15,color: darkMode?Colors.white : Colors.black, fontWeight: FontWeight.bold),
                    ),
                    /*
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Expanded(
                        child:

                      ),
                      /*
                      Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 5),
                        child:   Text("${readTimestamp(widget._jsonMessage['lasttime'])}",
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 11, color: darkMode?Colors.white :Colors.grey, fontWeight: FontWeight.w100))
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
                            isImage(widget._jsonMessage['lastmessage'].toString())?
                            Text(
                              '📷 image ${widget._jsonMessage['lastmessage'].toString()}\n',
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              //   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                              style: widget.userID != widget._jsonMessage['userid']? TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold) : TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic),
                            )
                            :
                            isFile(widget._jsonMessage['lastmessage'].toString())?
                            widget._jsonMessage['lastmessage'].toString().contains('ECT.mp3') ?
                            /*
                            Text(
                              '\u{1F399} Vooice note',
                             // '🎙 ${transformMilliSeconds(int.tryParse(widget._jsonMessage['lastmessage'].toString().split('ECT.mp3')[1]))} \n',
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              //   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                              style: widget.userID != widget._jsonMessage['userid']? TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold) : TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic),
                            )

                             */
                            /*
                            RichText(
                              text: TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent

                                //   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                style: widget.userID != widget._jsonMessage['userid']? TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold) : TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.normal),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: String.fromCharCode(0xe3e1), //<-- charCode
                                      style: TextStyle(
                                      fontFamily: 'MaterialIcons', //<-- fontFamily
                                      fontSize: 17.0,
                                      color: Colors.green,
                                      ),
                                  ),
                                 // TextSpan(text: '🎤 ', style: TextStyle(color: Colors.green,  fontSize:14, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)),
                                  TextSpan(text: ' ${transformMilliSeconds(int.tryParse(widget._jsonMessage['lastmessage'].toString().split('PROJ')[0]))?? 'Voice Note'} \n'),
                                ],
                              ),
                            )

                             */
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.mic, color: Colors.green, size: 18,),
                                Text(' ${transformMilliSeconds(int.tryParse(widget._jsonMessage['lastmessage'].toString().split('PROJ')[0])!)?? 'Voice Note'} \n',
                                  style: widget.userID != widget._jsonMessage['userid']? TextStyle(color: darkMode?Colors.white : Colors.black87,  fontWeight: FontWeight.bold) : TextStyle(color: darkMode?Colors.white : Colors.black87),
                                ),
                              ],
                            )

                            :
                            Text(
                              '📎 attachment ${widget._jsonMessage['lastmessage'].toString()}\n',
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              //   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                              style: widget.userID != widget._jsonMessage['userid']? TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold) : TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic),
                            )
                            :  widget.userID != widget._jsonMessage['userid']? Text(
                              //(widget._jsonMessage['lastmessage'].substring(widget._jsonMessage['lastmessage'].length - 5) == '  ✓✓ ')
                              '${parser.emojify(widget._jsonMessage['lastmessage'])}\n',
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              //textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                              style:  TextStyle(color: darkMode?Colors.white : Colors.black87),
                            ) : Text(
                              //(widget._jsonMessage['lastmessage'].substring(widget._jsonMessage['lastmessage'].length - 5) == '  ✓✓ ')
                              '${parser.emojify(widget._jsonMessage['lastmessage'])}\n',
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              //textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                              style:  TextStyle(color: darkMode?Colors.white : Colors.black87),
                            )
                          )
                        ]
                    ),

                ]
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
                child:
                Column(
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
                         Padding(
                           padding: const EdgeInsets.only(right: 5, top: 4),
                           child:   Text(readTimestamp(widget._jsonMessage['lasttime']),
                                style: TextStyle(fontSize: 13, color: darkMode?Colors.white :Colors.grey, fontWeight: FontWeight.w100))

                            )
                          ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    unread > 0
                        ? Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.amber[600],
                        shape: BoxShape.circle,
                      ),
                      child:  Text(
                        widget._jsonMessage['unread'].toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                        : const SizedBox(
                      height: 25,
                      width: 25,
                    ),


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



class SearchThreadItem extends StatefulWidget {
  final dynamic message;
  final dynamic message1;
  final int? index;
  final String? userID;
  ChatBloc? chatBloc;
  final List<dynamic>? allData;
  String? search;
  SearchThreadItem(
      {Key? key, @required this.message,@required this.message1,@required this.index, @required this.userID, @required this.chatBloc, @required this.allData, this.search
      }) : super(key: key);

  get _jsonMessage =>
      (message is String) ? jsonDecode(message) : message;
  get _jsonMessage1 =>
      (message1 is String) ? jsonDecode(message1) : message1;

  @override
  _SearchThreadItemItemState createState() => _SearchThreadItemItemState();
}





class _SearchThreadItemItemState extends State<SearchThreadItem> {
  var parser = EmojiParser();

  bool darkMode = false;
  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('mm');
    var format1 = DateFormat('dd/MM/yy');
    var format2 = DateFormat('HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
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
      timeValue = (diff.inHours / (24 * 365)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';
    // if (diff.inHours < 1) {
    timeAgo =  timeAgo + ' ago';
    if(timeValue == 1 && timeUnit == 'day'){
      timeAgo = 'Yesterday';
    }else{
      if(timeUnit == 'hour' || timeUnit == 'minute' ){
        timeAgo = format2.format(date.toUtc()) ;

      }else{
        timeAgo = format1.format(date) ;
      }
    }




    return timeAgo;

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

  String readTimestamp1(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
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
      timeAgo = DateFormat('hh:mm').format(date);
    }else{
      if(timeValue > 1){
        timeAgo = DateFormat('dd/MM/yyyy').format(date);
      }
    }

    return timeAgo;

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

  bool isMsg(String keyword, String str){
    int length = keyword.length;
    if(keyword == ''){
      return false;
    }else{
      int idx = str.toLowerCase().indexOf(keyword.toLowerCase());
      if(idx > -1){

        return true;
      }else{
        return false;
      }
    }
  }

  bool isBeforeMsg(dynamic msg1, dynamic msg2, String? search){
   if (!isMsg(search!, msg1['message'] ) ){
     if(isMsg(search!, msg2['message'] )){
       print('here');
       return true;
     }else{
       print('here1');
       return false;
     }

   }else{
     print('here2');
     return false;
   }
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
  bool isOnline(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('mm');
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
    if( ext.contains('https://upload.projects.co.id/upload/')|| ext.contains('https://cdn.projects.co.id/upload/')){
      if(ext.contains('[')){
        isFile = false;
      }else{
        var document = parse(ext);
        var data = document.getElementsByClassName('download');
        if((data != null) && (data.isNotEmpty)){
          isFile = true;
        }else{
          var data = document.getElementsByClassName('chat-download');
          if((data != null) && (data.isNotEmpty)) {
            isFile = true;
          }
        }


      }
    }
    if(p.extension(ext) != ''){
      p.extension(ext) == '.'? isFile = false: ext.contains('..')? isFile = false: isFile = true;

    }

    return isFile;
  }


  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    double cWidth = MediaQuery.of(context).size.width * 0.64;
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;





    return widget._jsonMessage['index']['blocked'] == 0?
        isBeforeMsg(widget._jsonMessage, widget._jsonMessage1, widget.search!)?
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              widget.index == 0? Container(height: 0): Divider(
                thickness: 1,
                height:5,
              ),
              ListTile(
                isThreeLine: true,
                contentPadding: EdgeInsets.only(left: 2, right: 10, top: 5, bottom: 5),                //enabled: false,
                onLongPress: () {},
                //onTap: () => Navigator.of(context).pushNamed('chat'),
                onTap: () async{
                  bool result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                          user: widget.message,
                          userID : widget.userID,
                          chatBloc : widget.chatBloc,
                          page: widget._jsonMessage['page'],
                          search: widget.search
                      ),
                    ),
                  );
                  if(!result){
                    widget.chatBloc!.getx();
                    setState(() {

                    });
                  }else{
                    print('belum ketemu 1');
                  }
                },

                leading: SizedBox(
                  width: 72,
                  height: 72,
                  /* decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        offset: Offset(0, 5),
                        blurRadius: 10)
                  ],
                ), */
                  child: Stack(
                    children: <Widget>[

                      Positioned.fill(
                        child: CircleAvatar(
                          // radius: 100,
                          minRadius: 70,
                          maxRadius: 70,
                          // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                          backgroundImage: NetworkImage(widget._jsonMessage['index']['avatar']),
                        ),
                      ),



                      isOnline(widget._jsonMessage['time'])
                          ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      )
                          : Container(),


                    ],
                  ),
                ),

                subtitle:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget>[
                            Expanded(
                              child:
                              Text(
                                '${widget._jsonMessage['index']['username']}',
                                // '${widget._jsonMessage['userid']}',
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                //   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                style: TextStyle(fontSize: 15,color: darkMode?Colors.white : Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ),
                            /*
                      Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 5),
                        child:   Text("${readTimestamp(widget._jsonMessage['lasttime'])}",
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 11, color: darkMode?Colors.white :Colors.grey, fontWeight: FontWeight.w100))
                      ),

                       */
                          ]
                      ),
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
                                  //   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                  style: widget.userID != widget._jsonMessage['userid']? TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold) : TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic),
                                )
                                    :  widget.userID != widget._jsonMessage['userid']? Text(
                                  //(widget._jsonMessage['lastmessage'].substring(widget._jsonMessage['lastmessage'].length - 5) == '  ✓✓ ')
                                  '${parser.emojify(widget._jsonMessage['message'])}\n',
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  //textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                  style:  TextStyle(color: darkMode?Colors.white : Colors.black87),
                                ) : Text(
                                  //(widget._jsonMessage['lastmessage'].substring(widget._jsonMessage['lastmessage'].length - 5) == '  ✓✓ ')
                                  '${parser.emojify(widget._jsonMessage['message'])}\n',
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  //textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                  style:  TextStyle(color: darkMode?Colors.white : Colors.black87),
                                )
                            )
                          ]
                      ),

                    ]
                ),


                trailing: Column(
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


                          Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child:      Text(readTimestamp(widget._jsonMessage['time']),
                                  style: TextStyle(fontSize: 13, color: darkMode?Colors.white :Colors.grey, fontWeight: FontWeight.w100))

                          )

                       ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),

                    widget._jsonMessage['rcvstatus'] == 0 ?
                    const SizedBox(height: 5,
                      width: 5,) :
                    widget._jsonMessage['rcvstatus'] == 1 ?
                    Padding(
                        padding : const EdgeInsets.only(top: 5, right: 8),
                        child:     Container(
                            height: 12,
                            width: 18,
                            decoration:
                            BoxDecoration(
                              color: darkMode? Colors.black54:Colors.white,
                              image: const DecorationImage( image: ExactAssetImage('assets/img/tickgrey.png'),
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
                              color: darkMode? Colors.black54:Colors.white,
                              image: const DecorationImage( image: ExactAssetImage('assets/img/doubletickgrey.png'),
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
                              color: darkMode? Colors.black54:Colors.white,
                              image: const DecorationImage( image: ExactAssetImage('assets/img/doubletickgreen.png'),
                                fit: BoxFit.contain,),
                            )
                        )
                    ): Container(height: 0,
                      width: 5,),
                    widget._jsonMessage['index']['unread'] > 0
                        ? Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.amber[600],
                        shape: BoxShape.circle,
                      ),
                      child:  Text(
                        widget._jsonMessage['index']['unread'].toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                        : const SizedBox(
                      height: 5,
                      width: 5,
                    ),
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
                          style: TextStyle(color: Colors.white),
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

              const Divider(
                thickness : 1,
                height:3,
              ),
              const SizedBox(height: 5,),
              const Padding(
                   padding: EdgeInsets.only(left: 10.0),
                   child:
                    Text('Pesan', style: TextStyle(fontSize: 15)),
              ),
              const SizedBox(height: 8,),

            ]
        )
            : isMsg(widget.search!, widget._jsonMessage['message'])?
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                          widget.index == 0?

                          const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 15, bottom: 5),
                            child:
                                  Text('Pesan', style: TextStyle(fontSize: 15)),
                            )
                            : const Divider(
                            thickness: 1,
                            height:1,
                          ),
                          ListTile(
                            isThreeLine: true,
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
                            widget.chatBloc.sendMsg(message);

                             */
                              bool result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                      user: widget.message,
                                      userID : widget.userID,
                                      chatBloc : widget.chatBloc,
                                      page: widget._jsonMessage['page'],
                                      search: widget.search,
                                      itemSearch: widget._jsonMessage['message'],

                                  ),
                                ),
                              );
                              if(!result){
                                widget.chatBloc!.getx();
                                setState(() {

                                });
                              }else{
                                print('belum ketemu 12');
                              }
                            },
                            /*
                        => Navigator.push(
                          context,
                          /* MaterialPageRoute(
                                    builder: (_) => ChatScreen(
                                    user: buddy,
                                  ),
                                ),

                                */
                          MaterialPageRoute(
                              builder: (_) => ProjectsChatClient(user:
                              {
                                "sId": "111",
                                "id": "11",
                                "email": "ya",
                                "firstName": "irvan",
                                "lastName": "her",
                                "birthDate": "ya",
                                "imageUrl": "",
                                "fullName": "irvan her",
                                "age": 21,
                                "gender": "male"
                              }
                                ,options:
                                {
                                  "urlApi": "https://develop.carespace.ai/api/admin",
                                  "botName": "Amanda",
                                  "avatarImage": "assets/images/profile-amanda.jpg",
                                  "wsUrl": "wss://develop.carespace.ai/api/bot/web"
                                }
                                ,)
                          ),
                        ),
                        */
                            /*
                        leading: Container(
                          width: 72,
                          height: 72,
                          /* decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.3),
                                    offset: Offset(0, 5),
                                    blurRadius: 10)
                              ],
                            ), */
                          child: Stack(
                            children: <Widget>[
                              /*
                                    Positioned.fill(
                                      child: CircleAvatar(
                                        // radius: 100,
                                        minRadius: 70,
                                        maxRadius: 70,
                                        // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                                        backgroundImage: NetworkImage(widget._jsonMessage['avatar']),
                                      ),
                                    ),

                                     */

                              isOnline(widget._jsonMessage['time'])
                                  ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                                  : Container(),


                            ],
                          ),
                        ),

                         */


                            title:
                              Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child:
                                        Text(
                                        '${widget._jsonMessage['index']['username']}',
                                        maxLines: 2,
                                        textAlign: TextAlign.justify,
                                        overflow: TextOverflow.ellipsis,
                                        textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                        style: TextStyle(fontSize: 17, color: darkMode?Colors.white : Colors.black54),
                                      ),
                              ),


                            subtitle:
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

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
                                                //   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                                style: widget.userID != widget._jsonMessage['userid']? TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold) : TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic),
                                              )
                                                  :  widget.userID != widget._jsonMessage['userid']? HtmlWidget(
                                                //(widget._jsonMessage['lastmessage'].substring(widget._jsonMessage['lastmessage'].length - 5) == '  ✓✓ ')
                                                ' ${widget._jsonMessage['index']['username']} : ${parser.emojify(addTag(widget.search!, widget._jsonMessage['message']))}\n',

                                                //textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                                textStyle:  TextStyle(color: darkMode?Colors.white : Colors.black87),
                                              ) :  HtmlWidget(
                                                //(widget._jsonMessage['lastmessage'].substring(widget._jsonMessage['lastmessage'].length - 5) == '  ✓✓ ')
                                                'Anda : ${parser.emojify(addTag(widget.search!, widget._jsonMessage['message']))}\n',
                                                // maxLines: 2,
                                                // textAlign: TextAlign.left,
                                                // overflow: TextOverflow.ellipsis,
                                                //textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                                textStyle:  TextStyle(color: darkMode?Colors.white : Colors.black87),
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

                                        Text(readTimestamp1(widget._jsonMessage['time']),
                                            style: TextStyle(fontSize: 13, color: darkMode?Colors.white :Colors.grey, fontWeight: FontWeight.w100))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),


                                  widget._jsonMessage['rcvstatus'] == 0 ?
                                  const SizedBox(height: 5,
                                    width: 5,) :
                                  widget._jsonMessage['rcvstatus'] == 1 ?
                                  Padding(
                                      padding : const EdgeInsets.only(top: 5, right: 8),
                                      child:     Container(
                                          height: 12,
                                          width: 18,
                                          decoration:
                                          BoxDecoration(
                                            color: darkMode? Colors.black54:Colors.white,
                                            image: const DecorationImage( image: ExactAssetImage('assets/img/tickgrey.png'),
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
                                            color: darkMode? Colors.black54:Colors.white,
                                            image: const DecorationImage( image: ExactAssetImage('assets/img/doubletickgrey.png'),
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
                                            color: darkMode? Colors.black54:Colors.white,
                                            image: const DecorationImage( image: ExactAssetImage('assets/img/doubletickgreen.png'),
                                              fit: BoxFit.contain,),
                                          )
                                      )
                                  ): Container(height: 5,
                                    width: 5,),
                                  widget._jsonMessage['index']['unread'] > 0
                                      ? Container(
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.amber[600],
                                      shape: BoxShape.circle,
                                    ),
                                    child:  Text(
                                      widget._jsonMessage['index']['unread'].toString(),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  )
                                      : const SizedBox(
                                    height: 5,
                                    width: 5,
                                  ),


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
                                        style: TextStyle(color: Colors.white),
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
                    )
             : Column(
              children: <Widget>[
                widget.index == 0? Container(height: 0): const Divider(
                  thickness: 1,
                  height:5,
                ),
                ListTile(
                  isThreeLine: false,
                  contentPadding: const EdgeInsets.only(left: 2, right: 10,top: 5, bottom: 5),                  //enabled: false,
                  onLongPress: () {},
                  //onTap: () => Navigator.of(context).pushNamed('chat'),
                  onTap: () async{
                    bool result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
                            user: widget.message,
                            userID : widget.userID,
                            chatBloc : widget.chatBloc,
                            page: widget._jsonMessage['page'],
                            search: widget.search,
                            itemSearch: widget._jsonMessage['message']
                        ),
                      ),
                    );
                    if(!result){
                      widget.chatBloc!.getx();
                      setState(() {

                      });
                    }else{
                      print('belum ketemu 123');
                    }
                  },

                  leading: Container(
                    width: 72,
                    height: 72,
                    /* decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        offset: Offset(0, 5),
                        blurRadius: 10)
                  ],
                ), */
                    child: Stack(
                      children: <Widget>[

                        Positioned.fill(
                          child: CircleAvatar(
                            // radius: 100,
                            minRadius: 70,
                            maxRadius: 70,
                            // backgroundImage: AssetImage(widget._jsonMessage['avatar']),
                            backgroundImage: NetworkImage(widget._jsonMessage['index']['avatar']),
                          ),
                        ),



                        isOnline(widget._jsonMessage['index']['lastseen'])
                            ? Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        )
                            : Container(),


                      ],
                    ),
                  ),

                  subtitle:
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget>[
                              Expanded(
                                child:
                                Text(
                                  '${widget._jsonMessage['index']['username']}',
                                 // '${widget._jsonMessage['userid']}',
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  //   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                  style: TextStyle(fontSize: 15,color: darkMode?Colors.white : Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ),
                              /*
                      Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 5),
                        child:   Text("${readTimestamp(widget._jsonMessage['lasttime'])}",
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 11, color: darkMode?Colors.white :Colors.grey, fontWeight: FontWeight.w100))
                      ),

                       */
                            ]
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget>[
                              Expanded(
                                  child:
                                  isFile(widget._jsonMessage['index']['lastmessage'].toString())?
                                  Text(
                                    '📎 attachment \n',
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    //   textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                    style: widget.userID != widget._jsonMessage['userid']? TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold) : TextStyle(color: darkMode?Colors.white : Colors.black87, fontStyle: FontStyle.italic),
                                  )
                                      :  widget.userID != widget._jsonMessage['userid']? Text(
                                    //(widget._jsonMessage['lastmessage'].substring(widget._jsonMessage['lastmessage'].length - 5) == '  ✓✓ ')
                                    '${parser.emojify(widget._jsonMessage['index']['lastmessage'])}\n',
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    //textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                    style:  TextStyle(color: darkMode?Colors.white : Colors.black87),
                                  ) : Text(
                                    //(widget._jsonMessage['lastmessage'].substring(widget._jsonMessage['lastmessage'].length - 5) == '  ✓✓ ')
                                    '${parser.emojify(widget._jsonMessage['index']['lastmessage'])}\n',
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    //textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: true),
                                    style:  TextStyle(color: darkMode?Colors.white : Colors.black87),
                                  )
                              )
                            ]
                        ),

                      ]
                  ),


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


                              Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child:       Text(readTimestamp(widget._jsonMessage['index']['lasttime']),
                                      style: TextStyle(fontSize: 13, color: darkMode?Colors.white :Colors.grey, fontWeight: FontWeight.w100))
                              )


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
                                  color: darkMode? Colors.black54:Colors.white,
                                  image: const DecorationImage( image: ExactAssetImage('assets/img/tickgrey.png'),
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
                                  color: darkMode? Colors.black54:Colors.white,
                                  image: const DecorationImage( image: ExactAssetImage('assets/img/doubletickgrey.png'),
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
                                  color: darkMode? Colors.black54:Colors.white,
                                  image: const DecorationImage( image: ExactAssetImage('assets/img/doubletickgreen.png'),
                                    fit: BoxFit.contain,),
                                )
                            )
                        ): Container(height: 5,
                          width: 5,),
                        widget._jsonMessage['index']['unread'] > 0
                            ? Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.amber[600],
                            shape: BoxShape.circle,
                          ),
                          child:  Text(
                            widget._jsonMessage['index']['unread'].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                            : const SizedBox(
                          height: 5,
                          width: 5,
                        ),

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
                            style: TextStyle(color: Colors.white),
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
          )
        : Container();
  }

  Color getBackgroundColor(dynamic selectedMessage) {
    if (selectedMessage != null && selectedMessage == widget._jsonMessage) {
      return const Color.fromRGBO(189, 208, 235, 0.8);
    } else {
      return Colors.transparent;
    }
  }
}



class ThreadSearchScreen extends StatefulWidget {

  final String? user;
  ChatBloc? chatBloc;
  final List<dynamic>? listThread;
  ThreadSearchScreen({Key? key, @required this.user, @required this.chatBloc, this.listThread})
      : super(key: key);

  @override
  _ThreadSearchScreenState createState() => _ThreadSearchScreenState();
}

class _ThreadSearchScreenState extends State<ThreadSearchScreen> {
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
  @override
  void initState() {

    super.initState();
    // widget.chatBloc.closeConnection();
    //  widget.chatBloc = ChatBloc();
    //   widget.chatBloc.lg(widget.user);
   // _currentIndex = 1;
    _scrollController = ScrollController();
   // listt.addAll(widget.listThread);

   // listt.removeAt(0);
    //print('death chat');
    //widget.chatBloc.thread.clear();
    //  print('id ${widget.chatBloc.id}');
    // message = widget.chatBloc.thread;
    // widget.chatBloc.wsSetHandlers();


    // widget.chatBloc.getIndex(1);


  }



  void _onScroll()async {
    final maxScroll = _scrollController?.position.maxScrollExtent;
    final currentScroll = _scrollController?.position.pixels;


  }


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

  void _onSubmitted(String value) {
  if(value.length >= 3){
    searchText = value;
    setState(() {
      widget.chatBloc?.searchIndex(value);


    });
  }else{
    searchText = value;

  }

  }

  Widget buildSearchBar(String tiltle) {
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
              icon: Icon(Icons.clear),
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
    _scrollController?.addListener(_onScroll);
    // print('helooooo');

    return

      Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white,),
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
               stream: widget.chatBloc?.searchThreadStream,
               builder: (BuildContext context, AsyncSnapshot snapshot) {

                 if (snapshot.hasError) return Text(snapshot.error.toString());
                 if (snapshot.data == null) {
                   //   _recoveryHistoryMessages();
                   return
                     const SizedBox(height: 0.0, width: 0.0);
                 }
                 if (snapshot.hasData) {
                  // return(Text('haloo2'));


                   if (snapshot.data is List && snapshot.data.length == 0) {
                     // return
                     // Container(height: 0.0, width: 0.0);
                     return
                       const SizedBox(height: 0.0, width: 0.0);
                   }

                   return
                     ListView.builder(
                       controller: _scrollController,
                       itemCount: snapshot.data != null ? snapshot.data.length : 0,
                       shrinkWrap: true,
                       itemBuilder: (context, index) => SearchThreadItem(
                         chatBloc: widget.chatBloc,
                         index: index,
                         userID:  widget.user,
                         message:  snapshot.data[index],
                         message1: index + 1 == snapshot.data.length ? snapshot.data[index]:snapshot.data[index + 1],
                         allData: snapshot.data,
                         search: searchText,



                       ),
                     );
                   //widget.chatBloc.readSignal(widget._jsonMessage['thread']);
                   // _scrollDown();
                 }
                 if (snapshot.data is List && snapshot.data.length == 0) {
                   return
                     const SizedBox(height: 0.0, width: 0.0);
                  // return(Text('haloo2'));
                 }
                 //return(Text('haloo3'));

                 return
                   ListView.builder(
                     controller: _scrollController,
                     itemCount: snapshot.data != null ? listt.length : 0,
                     shrinkWrap: true,
                     itemBuilder: (context, index) => SearchThreadItem(
                       chatBloc: widget.chatBloc,
                       index: index,
                       userID:  widget.user,
                       message:  snapshot.data[index],
                       message1: index == snapshot.data.length - 1? snapshot.data[index]: snapshot.data[index + 1],
                       allData: snapshot.data,
                       search: searchText,



                     ),
                   );


               },
             )








      );




  }






}




class UnblockScreen extends StatefulWidget {

  final String? user;
  ChatBloc? chatBloc;
  final List<dynamic>? listThread;
  UnblockScreen({Key? key, @required this.user, @required this.chatBloc, this.listThread})
      : super(key: key);

  @override
  _UnblockScreenState createState() => _UnblockScreenState();
}

class _UnblockScreenState extends State<UnblockScreen> {
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
  @override
  void initState() {

    super.initState();
    // widget.chatBloc.closeConnection();
    //  widget.chatBloc = ChatBloc();
    //   widget.chatBloc.lg(widget.user);
    // _currentIndex = 1;
    _scrollController = ScrollController();
    listt.addAll(widget.listThread!);

    listt.removeAt(0);
    //print('death chat');
    //widget.chatBloc.thread.clear();
    //  print('id ${widget.chatBloc.id}');
    // message = widget.chatBloc.thread;
    // widget.chatBloc.wsSetHandlers();


    // widget.chatBloc.getIndex(1);


  }



  void _onScroll()async {
    final maxScroll = _scrollController?.position.maxScrollExtent;
    final currentScroll = _scrollController?.position.pixels;


  }


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }

  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  Widget buildSearchBar(String tiltle) {
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
          style:
          const TextStyle(fontSize: 14.0, height: 0.2, color: Colors.black),
          onChanged: (String value) {
            _onChanged(value);
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
    _scrollController?.addListener(_onScroll);
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
            title: const Text('Unblock'),
          ),
          body:

          // return Container(width: 0.0, height: 0.0);

          StreamBuilder<dynamic>(
            stream: widget.chatBloc?.blacklistStream ,
            // stream: widget.chatBloc.getThreads(Duration(seconds:1)),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

              //  print('horeeee');
              if (snapshot.hasError) {

                _onWidgetDidBuild(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                });


                return Text(snapshot.error.toString());
              }
              if (snapshot.data == null) {
                // print('reporttt1');
                //_recoveryHistoryMessages();
                //log.severe('getHistory Fail!');
                return const Text('No blacklist.');
              }
              //if (snapshot.hasData) {
              // _scrollDown();
              // }
              if (snapshot.data is List && snapshot.data.length == 0) {
                return
                  const Center(
                    child :Text('No  blacklist.')
                  );


              }
              return ListView.builder(
                controller: _scrollController,
                itemCount: snapshot.data != null ? snapshot.data.length : 0,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                GestureDetector(
                  onTap:(){
                       widget.chatBloc?.cancelBlacklist!(snapshot.data[index]['userid'], context);
                  },
                  child:    Center(
                      child:
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(snapshot.data[index]['username'], style: const TextStyle(fontSize: 15))
                      )

                  )
                )

              );

            },


          ),

        /*
          ListView.builder(
            controller: _scrollController,
            itemCount: listt != null ? listt.length : 0,
            shrinkWrap: true,
            itemBuilder: (context, index) => ThreadItem(
              chatBloc: widget.chatBloc,
              index: index,
              userID:  widget.user,
              message:  listt[index],
              allData: listt,
              search:   searchText  ,


            ),
          )

         */






      );




  }






}