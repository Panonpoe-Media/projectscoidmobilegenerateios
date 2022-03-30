import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionBarButton extends StatelessWidget {
  final Icon? icon;
  final Function? onPressed;

  const ActionBarButton({Key? key, this.icon, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: icon!, onPressed: () {  },);
  }
}
