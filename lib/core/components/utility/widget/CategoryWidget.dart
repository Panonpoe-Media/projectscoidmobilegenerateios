
import 'package:flutter/material.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({ Key? key, this.title, this.subtitle, this.children , this.isDark = false}) : super(key: key);

  final String? title;
  final String? subtitle;
  final bool? isDark;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: themeData.dividerColor))
      ),
      child:
      DefaultTextStyle(
        style: Theme.of(context).textTheme.subtitle2!,
        child: 
        SafeArea(
          top: false,
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  //width: 72.0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title!, style: TextStyle(fontSize: 20, color: isDark! ? Colors.white : Colors.black87 ),),
                        subtitle == ''? Container(height: 0.0, width: 0.0,): Text(subtitle!, style: TextStyle(fontSize: 14, color: isDark! ? Colors.white : Colors.black87  )),
                      ]
                  )
              ),
              Column(children: children!),
            ],
          ),
        ),
      ),
    );
  }
}