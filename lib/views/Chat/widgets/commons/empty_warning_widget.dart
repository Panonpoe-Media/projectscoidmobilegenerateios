import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../pages/styles.dart';

class EmptyWarningWidget extends StatelessWidget {
  final IconData icon;
  final String message;
  EmptyWarningWidget(this.icon, {this.message = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Icon(
            this.icon,
            color: Styles.emptyMessagesColor,
            size: 250.00,
          ),
          Text(
            this.message,
            style: TextStyle(color: Styles.emptyMessagesColor, fontSize: 25.0),
          )
        ],
      ),
    ));
  }
}
