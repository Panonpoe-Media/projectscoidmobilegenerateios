import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:projectscoid/views/Chat/models/configuration_model.dart';
import 'package:projectscoid/views/Chat/models/messages/commons/commons.dart';
import 'package:projectscoid/views/Chat/models/models.dart';
import 'package:projectscoid/views/Chat/widgets/chat/action-bar.dart';
import 'package:projectscoid/views/Chat/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'message-input.dart';
import 'message-list.dart';
//import 'package:zefyr/zefyr.dart';
import 'dart:convert';
import 'dart:io';


class ChatClientWidget extends StatefulWidget {
  final ChatBloc? chatBloc;
  final UserModel ?user;
  final ConfigurationModel? config;
  ChatClientWidget({this.chatBloc, this.user, this.config});
  @override
  ChatClientState createState() => ChatClientState();
}

class ChatClientState extends State<ChatClientWidget> {
  final TextEditingController _textEditingController =
      new TextEditingController();

  void _onFavorite(selectedMessage) {
    widget.chatBloc?.addOrRemoveFavoriteMessage(selectedMessage, true);
    widget.chatBloc?.selectMessageToggle(selectedMessage);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 0.0, width: 0.0,);
  }

  void _sendMessage() {
    if (_textEditingController.text.isNotEmpty) {
      final SendMessageModel message = SendMessageModel(
          text: _textEditingController.text, user: widget.user?.id);
      widget.chatBloc?.sendMessage(message);

      _textEditingController.clear();
    }
  }

  void _onPayloadPress(dynamic button) {
    if (button is Buttons) {
      if (button.type == 'web_url') {
        _onWebUrl(button.url);
      } else {
        _onPostback(button.title, button.payload);
      }
    }
    if (button is QuickReplies) {
      _onPostback(button.title, button.payload);
    }
  }

  void _onPostback(title, payload) {
    final SendMessageModel message =
        SendMessageModel(text: title, user: widget.user?.id);
    widget.chatBloc?.onPostBack(message, title, payload);
  }

  void _onWebUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
/*
  void _onQuickMenuSelectHandler(QuickMenuItemModel item) {
    if (item.url != null && item.url.isNotEmpty) this._onWebUrl(item.url);
    if (item.payload != null) this._onPostback(item.name, item.payload);
  }

 */

  void _onMediaViewHandler(String url, String blockId, String sessionId) {
    widget.chatBloc
        ?.onMediaView(url: url, blockId: blockId, sessionId: sessionId);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
