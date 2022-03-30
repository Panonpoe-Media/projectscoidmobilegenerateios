import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';

import 'messages_types/messages_types.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
//import 'package:projectscoid/views/Chat/models/models.dart';
//import 'package:intl/intl.dart';
import 'package:projectscoid/views/Chat/widgets/widgets.dart';
import 'package:mime/mime.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart';
//import 'package:audioplayer/audioplayer.dart';

class MessageItem extends StatefulWidget {
  final dynamic message;
  final dynamic message1;
  final int? idx;
  final bool? isMax;
  final int? idMax;
  final Function? onPayloadPress;
  final Function? onMediaView;
  final Function? onSelect;
  final ChatBloc? chatBloc;
  final dynamic user;
  final String? userid;
  final String? search;
  Duration? duration;
  Duration? position;
  AudioPlayer? audioPlayer;
  //PlayerState playerState;
  List<int?>? play;
  List<int?>? pause;
  String? myAvatar;
  String? avatar;
  MessageItem(
      {Key? key, @required this.message,
        @required this.message1,
        @required this.idx,
        @required this.isMax,
        @required this.idMax,
        @required this.onPayloadPress,
        this.onSelect,
        this.onMediaView,
        @required this.chatBloc, @required this.user, @required this.userid, this.search = '',
        this.duration, this.position, this.audioPlayer, //this.playerState,
        this.play, this.pause
        , this.myAvatar, this.avatar}) : super(key: key);

  get _jsonMessage =>
      (message is String) ? jsonDecode(message) : message;
  get _jsonMessage1 =>
      (message1 is String) ? jsonDecode(message1) : message1;

  get jsonMessage =>
      (user is String) ? jsonDecode(user) : user;

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  bool darkMode = false;

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('dd MMMM yyyy');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';
    var day =  DateFormat('EE').format(date);

    time = '  $day, ${format.format(date)}';
    return time;
  }



  bool isSentMessage() => (widget.message['userid'] == widget.userid);
  bool isRightMessage() => (widget.message['userid'] != widget._jsonMessage['userid']);
  bool isSentImage()=>(widget.message['receiver'] == widget.jsonMessage['userid'])&& widget.message['attachment'] != '' && lookupMimeType(widget.message['attachment'], headerBytes: [0xFF, 0xD8]) != 'image';
  bool isHide() => (widget.message.containsKey('cmd'))&&( widget.message['cmd'] == 'typing')&&(widget.message['sender'] != widget.jsonMessage['userid']);
  bool isTyping() =>(widget._jsonMessage['message'] == 'typing');

  bool isNewDate(){

    int diff = 0;
    if((widget._jsonMessage['type'] != 'typing')){
      //  print('sampai ${widget._jsonMessage['time']}');
      // print('sampai ${widget._jsonMessage['message']}');
      // print('sampai ${widget._jsonMessage1['time']}');
      // print('sampai ${widget._jsonMessage1['message']}');
      var date = DateTime.fromMillisecondsSinceEpoch(widget._jsonMessage['time'] * 1000);
      var date1 = DateTime.fromMillisecondsSinceEpoch(widget._jsonMessage1['time'] * 1000);
      diff = date.difference(date1).inDays;

    }
    // if(widget.idx == 0) diff =1;
    //   print('difffffffff = $diff');
    if(diff > 0) {
      return true;
    } else {
      return false;
    }
  }
  bool firstList(){
    if(widget.idx == 0) return true;
    else return false;
  }
  Alignment get _messageAlignment =>
      isSentMessage() ? Alignment.topRight : Alignment.topLeft ;

  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    //print('userid ==   ${widget.userid}  vs  msg userid ${widget._jsonMessage['userid']}');
    bool equal = widget._jsonMessage['userid'] == widget._jsonMessage1['userid'];
    return StreamBuilder(
        stream: widget.chatBloc?.selectedMessagesToggleStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // widget.onSelect(snapshot.data??[]);
          return
            GestureDetector(
              child: isNewDate()?
              isHide()?const SizedBox(height: 0, width: 0,)
                  :
              firstList()?
              Column(
                children:<Widget> [
                  Stack(

                      children: <Widget>[
                        //  Divider(thickness: 2.0, height: 30,),
                        isTyping()?
                        Container()
                            :Container(height: 50, color: Colors.white,
                          child: Center(
                            child:  Container(
                              height: 28,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: darkMode? Colors.white: CurrentTheme.PrimaryLightColor,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(15))
                              ),
                              child:
                              Padding(
                                  padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                                  child:  Center(
                                    child:  Text(readTimestamp(widget._jsonMessage['time']), style: const TextStyle(fontSize: 12, color: Colors.black),),

                                    /*
                                                                                snapshot == null ? Text('') : Text('${formatter.format(DateTime.fromMillisecondsSinceEpoch(int.parse(snapshot.data[value]['time']) * 1000))}', style: TextStyle(color: Colors.black45, fontSize: 12)),


                                                                                 */
                                  )
                              ),


                            ),
                          ),),


                      ]
                  ),
                  /*
                 Container(
                   child: Bubble(

                     margin: BubbleEdges.only(top: 10,left: 16, right: 16),
                     color: Colors.white,
                     nip: BubbleNip.no,
                     child: Text(readTimestamp(widget._jsonMessage['time'])),
                   ),
                 ),


                  */
                  Container(
                    decoration:
                    BoxDecoration(color: getBackgroundColor(snapshot.data)),
                    child:
                    //  Text(widget._jsonMessage1['message']),
                    /*
                   Align(
                       alignment: _messageAlignment,
                       child:
                       !isRightMessage()? Container(height: 0.0, width: 0.0,): isSentMessage()
                           ?
                       isSentImage()? ImageMessageWidget(message: widget._jsonMessage,) :
                       SentMessageWidget(message: widget._jsonMessage)
                           : isHide()? Container(height: 0.0, width: 0.0,):ReceivedMessageWidget(
                         user: widget.user,
                         message: widget._jsonMessage,
                         onPayloadPress: widget.onPayloadPress,
                         onMediaView: widget.onMediaView,
                       )
                   ),

                 */

                    Align(
                        alignment: _messageAlignment,
                        child:


                        isSentMessage()?
                        SentMessageWidget(message: widget._jsonMessage, search: widget.search!,duration: widget.duration!,
                          position: widget.position!,
                          audioPlayer: widget.audioPlayer!,
                         // playerState: widget.playerState,
                          play: widget.play!,
                          pause: widget.pause!,
                          idx: widget.idx!,
                          avatar: widget.myAvatar!,
                          equal: equal,


                          ):
                        isTyping()? SizedBox(width: 0.0, height: 0.0,) :
                        ReceivedMessageWidget(
                          user: widget.user,
                          message: widget._jsonMessage,
                          onPayloadPress: widget.onPayloadPress,
                          onMediaView: widget.onMediaView,
                          search: widget.search,
                          duration: widget.duration,
                          position: widget.position,
                          audioPlayer: widget.audioPlayer,
                         // playerState: widget.playerState,
                          play: widget.play,
                          pause: widget.pause,
                          idx: widget.idx,
                          avatar: widget.avatar,
                          equal: equal,

                        )
                      //Text('ok'),


                    ),


                  ),
                ],
              )

                  :Column(
                children:<Widget> [
                  Stack(

                      children: <Widget>[
                        isTyping()?
                        Container()
                            :
                        Container(height: 50,
                          child: Center(
                            child:  Container(
                              height: 28,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: darkMode? Colors.white: CurrentTheme.PrimaryLightColor,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(15))
                              ),
                              child:
                              Padding(
                                  padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                                  child:  Center(
                                    child:  Text(readTimestamp(widget._jsonMessage['time']), style: const TextStyle(fontSize: 12, color: Colors.black),),

                                    /*
                                                                                snapshot == null ? Text('') : Text('${formatter.format(DateTime.fromMillisecondsSinceEpoch(int.parse(snapshot.data[value]['time']) * 1000))}', style: TextStyle(color: Colors.black45, fontSize: 12)),


                                                                                 */
                                  )
                              ),


                            ),
                          ),),


                      ]
                  ),
                  Container(
                    decoration:
                    BoxDecoration(color: getBackgroundColor(snapshot.data)),
                    child:
                    // Text(widget._jsonMessage1['message']),
                    /*
                 ReceivedMessageWidget(
                                          user: widget.user,
                                          message: widget._jsonMessage,
                                          onPayloadPress: widget.onPayloadPress,

                                          onMediaView: widget.onMediaView,
                                    ),

                  */

                    Align(
                      alignment: _messageAlignment,
                      child:



                      isSentMessage()?
                      SentMessageWidget(message: widget._jsonMessage, search: widget.search,duration: widget.duration,
                        position: widget.position,
                        audioPlayer: widget.audioPlayer,
                       // playerState: widget.playerState,
                        play: widget.play, pause: widget.pause,
                        idx: widget.idx,avatar: widget.myAvatar,equal: equal,):
                      isTyping()? Container(width: 0.0, height: 0.0,) :
                      ReceivedMessageWidget(
                        user: widget.user,
                        message: widget._jsonMessage,
                        onPayloadPress: widget.onPayloadPress,
                        onMediaView: widget.onMediaView,
                        search: widget.search,
                        duration: widget.duration,
                        position: widget.position,
                        audioPlayer: widget.audioPlayer,
                       // playerState: widget.playerState,
                          play: widget.play,
                        pause: widget.pause,
                        idx: widget.idx,
                        avatar: widget.avatar,
                        equal: equal,
                      ),


                    ),
                  ),

                  /*

                Container(
                  child: Bubble(

                          margin: BubbleEdges.only(top: 10,left: 16, right: 16),
                          color: Colors.white,
                          nip: BubbleNip.no,
                          child: Text(readTimestamp(widget._jsonMessage['time'])),
                  ),
                )

                 */

                ],
              )


                  :Container(

                  decoration:
                  BoxDecoration(color: getBackgroundColor(snapshot.data)),
                  child:
                  // Text(widget._jsonMessage1['message']),
                  widget.idx == widget.idMax ?
                  Column(
                    children: [
                      Container(height: 50,color: Colors.white),
                      Align(
                        alignment: _messageAlignment,
                        child:
                        isSentMessage()?
                        SentMessageWidget(message: widget._jsonMessage, search: widget.search,duration: widget.duration,
                          position: widget.position,
                          audioPlayer: widget.audioPlayer,
                         // playerState: widget.playerState,
                          play: widget.play, pause: widget.pause,
                          idx: widget.idx,avatar: widget.myAvatar,equal: equal,):
                        isTyping()? const SizedBox(width: 0.0, height: 0.0,) :
                        ReceivedMessageWidget(
                          user: widget.user,
                          message: widget._jsonMessage,
                          onPayloadPress: widget.onPayloadPress,
                          onMediaView: widget.onMediaView,
                          search: widget.search,
                          duration: widget.duration,
                          position: widget.position,
                          audioPlayer: widget.audioPlayer,
                        //  playerState: widget.playerState,
                            play: widget.play,
                          pause: widget.pause,
                          idx: widget.idx,
                          avatar: widget.avatar,
                          equal: equal,
                        ),
                      )
                    ],
                  )
                      :
                  Align(
                    alignment: _messageAlignment,
                    child:

                    isSentMessage()?
                    SentMessageWidget(message: widget._jsonMessage, search: widget.search,duration: widget.duration,
                      position: widget.position,
                      audioPlayer: widget.audioPlayer,
                     // playerState: widget.playerState,
                      play: widget.play, pause: widget.pause,
                      idx: widget.idx,avatar: widget.myAvatar, equal: equal,):
                    isTyping()? const SizedBox(width: 0.0, height: 0.0,) :
                    ReceivedMessageWidget(
                      user: widget.user,
                      message: widget._jsonMessage,
                      onPayloadPress: widget.onPayloadPress,
                      onMediaView: widget.onMediaView,
                      search: widget.search,duration: widget.duration,
                      position: widget.position,
                      audioPlayer: widget.audioPlayer,
                    //  playerState: widget.playerState,
                        play: widget.play,
                      pause: widget.pause,
                      idx: widget.idx,
                      avatar: widget.avatar,
                      equal: equal,
                    ),
                  )

              ),

              onLongPress: () async{
                //widget.chatBloc.selectMessageToggle(widget._jsonMessage);
                // var data  = snapshot.data ?? [];
                // data.add(widget._jsonMessage);
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("send", false);

                widget.chatBloc?.multiSelectMessageToggle(widget._jsonMessage);
                widget.onSelect!(widget._jsonMessage);


              },
              onTap: () async{
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("send", false);

                //widget.chatBloc.selectMessageToggle(widget._jsonMessage);
                // var data  = snapshot.data ?? [];
                // data.add(widget._jsonMessage);

                if(widget.chatBloc!.multiSelectedMessage!.length! >= 1){
                  widget.chatBloc?.multiSelectMessageToggle(widget._jsonMessage);
                  widget.onSelect!(widget._jsonMessage);
                }



              },
            );
        });
  }


  Color getBackgroundColor(List<dynamic?>? multiSelectedMessage) {

    if(multiSelectedMessage != null){

      if(multiSelectedMessage.length == 1){
        if(widget._jsonMessage == multiSelectedMessage[0]){
          return const Color.fromRGBO(189, 208, 235, 0.8);
        }else{
          return Colors.transparent;

        }
      }else{
        var msm = multiSelectedMessage;
        bool isSelect = false;
        int count = 0;
        for(var item in msm){
          if(item == widget._jsonMessage){
            isSelect = true;
          }
          count ++;
        }
        if(isSelect){

          return const Color.fromRGBO(189, 208, 235, 0.8);
        }else{
          return Colors.transparent;
        }

      }
    }else{
      return Colors.transparent;
    }


  }

/*
  Color getBackgroundColor(dynamic selectedMessage) {
    if (selectedMessage != null && selectedMessage == widget._jsonMessage) {

      return Color.fromRGBO(189, 208, 235, 0.8);
    } else {
      return Colors.transparent;
    }
  }

   */


}
