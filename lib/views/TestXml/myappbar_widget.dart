//Created from xml
import 'package:flutter/material.dart';

Widget buildMyappbarWidget({
  Key? key,
  @required String? title,
}) {
  return Container(
      key: key,
      height: 56.0,
      child: Row(children: [
        IconButton(icon: Icon(Icons.menu), onPressed: null),
        Text(title!, style: TextStyle(color: Colors.red, fontSize: 16.0)),
      ]));
}
