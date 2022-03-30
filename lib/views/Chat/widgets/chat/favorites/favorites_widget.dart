import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:projectscoid/views/Chat/models/user_model.dart';
import 'package:projectscoid/views/Chat/widgets/chat/action-bar.dart';
import 'package:projectscoid/views/Chat/widgets/commons/empty_warning_widget.dart';
import 'package:projectscoid/views/Chat/widgets/widgets.dart';

class FavoriteWidgets extends StatefulWidget {
  final ChatBloc bloc;
  final UserModel user;
  final Function? onPayloadPress;
  FavoriteWidgets(this.bloc, this.user, {this.onPayloadPress});

  @override
  _FavoriteWidgetsState createState() => _FavoriteWidgetsState();
}

class _FavoriteWidgetsState extends State<FavoriteWidgets> {
  @override
  void initState() {
    super.initState();
    this.widget.bloc.getFavoriteMessages(this.widget.user);
  }

  void _onUnfavorite(selectedMessage) {
    widget.bloc.addOrRemoveFavoriteMessage(selectedMessage, false);
    widget.bloc.selectMessageToggle(selectedMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(height: 0.0, width: 0.0,);
  }
}
