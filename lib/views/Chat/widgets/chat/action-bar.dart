import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat//blocs/blocs.dart';
import 'package:projectscoid/views/Chat//widgets/widgets.dart';

class ActionBar extends StatelessWidget {
  final ChatBloc? bloc;
  final List<ActionBarButton?>? actions;

  const ActionBar({Key? key, this.bloc, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc!.selectedMessagesToggleStream!,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Widget _widget = const IgnorePointer();
          if (snapshot.hasData) {
            _widget = AppBar(
              actions: handledActionButtons(snapshot.data),
            );
          }
          return _widget;
        });
  }

  List<Widget> handledActionButtons(selectedMessage) {
    List<Widget> newActions = [];
    actions?.forEach((action) {
      newActions.add(IconButton(
        icon: action!.icon!,
        onPressed: () {
          action.onPressed!(selectedMessage);
        },
      ));
    });
    return newActions;
  }
}
