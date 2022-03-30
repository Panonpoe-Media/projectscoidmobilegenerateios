import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/models/models.dart';
import 'package:projectscoid/views/Chat/widgets/chat/messages_types/messages_types.dart';
import 'package:projectscoid/views/Chat/widgets/widgets.dart';
import 'dart:convert';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart';
//import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/foundation.dart';

import 'package:projectscoid/core/components/helpers/action_helpers.dart';

class ReceivedMessageWidget extends StatefulWidget {
  final Map? message;
  final Function? onPayloadPress;
  final Function? onMediaView;
  final dynamic user;
  final String? search;
  Duration? duration;
  Duration? position;
  AudioPlayer? audioPlayer;
  //PlayerState playerState;
  List<int?>? play;
  List<int?>? pause;
  int? idx;
  String? avatar;
  bool? equal;
  ReceivedMessageWidget(
      {Key? key, this.message, this.onPayloadPress, this.onMediaView, this.user, this.search = '',  this.duration, this.position,
        this.audioPlayer,// this.playerState,
        this.play, this.pause, this.idx, this.avatar, this.equal})
      : super(key: key);

  get jsonMessage =>
      (user is String) ? jsonDecode(user) : user;

  @override
  _ReceivedMessageWidgetState createState() => _ReceivedMessageWidgetState();
}

class _ReceivedMessageWidgetState extends State<ReceivedMessageWidget> {
  bool isHide = false;
  bool darkMode = false;
  String get _messageType {

    // print('ayo kena..........');

    if ((widget.message!.containsKey('cmd'))&&( widget.message!['cmd'] == 'typing')&&(widget.message!['sender'] == widget.jsonMessage['userid'])) {
      setState(() {
        isHide = true;
      });

      return 'typing';
    }
    if ((widget.message!.containsKey('cmd'))&&( widget.message!['cmd'] == 'typing')&&(widget.message!['sender'] != widget.jsonMessage['userid'])) {
      return 'anothertyping';
    }
    if (widget.message!.containsKey('message')){
      // print('ayo kena..........');
      return 'message';
    }
    if (widget.message!.containsKey('attachment') &&
        widget.message!['attachment'] != null) {
      if (widget.message!['attachment']['type'] == 'image') return 'image';
      if (widget.message!['attachment']['kind'] == 'blocks-videos')
        return 'video';
      if (widget.message!['attachment']['type'] == 'template') {
        return widget.message!['attachment']['payload']['template_type'];
      }
    }

    if (widget.message!.containsKey('text') &&
        widget.message!.containsKey('quick_replies')) return 'quickResponse';
    if (widget.message!.containsKey('text') &&
        !widget.message!.containsKey('quick_replies'))
      return 'text';

    else {
      throw Exception('Unknown Message Type: ${widget.message}');
    }
  }

  Widget messageWidget(bool dm) {
    final key = GlobalKey();
    switch (_messageType) {
      case 'typing':
        return TypingMessageWidget(key: key, message: widget.message);
      case 'anothertyping':
        return const SizedBox(height: 0.0, width: 0.0,);
      case 'message':
        return TextMessageWidget(key: key, message: widget.message, darkmode: dm, search: widget.search!, duration: widget.duration,
          position: widget.position,
          audioPlayer: widget.audioPlayer,
         // playerState: widget.playerState,
          play: widget.play,
          pause: widget.pause,
          idx: widget.idx,
          avatar: widget.avatar,
          equal: widget.equal
          );
      case 'text':
        return TextMessageWidget(key: key, message: this.widget.message, darkmode: dm,search: widget.search, duration: widget.duration,
          position: widget.position,
          audioPlayer: widget.audioPlayer,
         // playerState: widget.playerState,
            play: widget.play,
            pause: widget.pause,
            idx: widget.idx,
            avatar: widget.avatar,
            equal: widget.equal
            );
      case 'card':
        return Text('Card Message');
      case 'list':
        return ListMessageWidget(
          key: key,
          message: this.widget.message,
          onPayloadPress: widget.onPayloadPress,
        );
      case 'quickResponse':
        return QuickReplyMessageWidget(
          key: key,
          message: this.widget.message,
          onPayloadPress: widget.onPayloadPress,
        );
      case 'gallery':
        return Text('Gallery Message');
      case 'video':
        return VideoMessageWidget(
            key: key,
            message: this.widget.message,
            onMediaView: widget.onMediaView,
            onPayloadPress: widget.onPayloadPress);
      case 'image':
        return ImageMessageWidget(key: key, message: this.widget.message);
      case 'button':
        return ButtonMessageWidget(
          key: key,
          message: this.widget.message,
          onPayloadPress: widget.onPayloadPress,
        );
      case 'generic':
        return GenericMessageWidget(
          key: key,
          message: this.widget.message,
          onPayloadPress: widget.onPayloadPress,
        );
      default:
        return IgnorePointer();
    }
  }

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.8;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    return isHide? Container(height: 0.0, width: 0.0,):
    _messageType == 'message'?
    messageWidget(darkMode)

        :Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(16.0),
            width: cWidth,
            child: messageWidget(darkMode)),

        Container(
          height: 50.0,
          width: 50.0,
          child: new CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.red,
            radius: 100.0,
          ),
          /*
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 3.0,
              ),
              shape: BoxShape.circle,
              image: new DecorationImage(
                image: new AssetImage(ConfigurationModel().avatarImage,
                    package: 'flutter_chatapp'),
                fit: BoxFit.cover,
              )),
    */
        ),
      ],
    );
  }
}
