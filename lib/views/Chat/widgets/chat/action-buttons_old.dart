import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';

class ActionButtons extends StatefulWidget {
  final Function? onFavoriteButtonPress;
  final Function? onMenuItemSelect;
  final ChatBloc? chatBloc;
  const ActionButtons(
      {Key? key,
      this.onFavoriteButtonPress,
      this.onMenuItemSelect,
      @required this.chatBloc})
      : super(key: key);
  @override
  _ActionButtonsState createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.chatBloc?.selectedMessagesToggleStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null && snapshot.data.length > 0) {
           // return actionButtonsWidget(snapshot.data);
            return const SizedBox();
          } else {
            return const SizedBox();
           // return widget.onMenuItemSelect != null ? menu() : IgnorePointer();
          }
        });
  }
}

class MenuItems {
  static const String FAVORITES = 'Favorites';
  static const String ABOUT = 'About';
  static const String LOGOUT = 'Logout';
  static const String WEBVIEWER = 'WebViewer Test';
  static const List<String> choices = <String>[FAVORITES, LOGOUT];
}
