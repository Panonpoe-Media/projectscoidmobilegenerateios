
import 'package:flutter/material.dart';

class LinkViewWidget extends StatelessWidget {
  const LinkViewWidget({ Key? key, this.icon, this.lines, this.tooltip, this.onPressed })
      :
        super(key: key);

  final IconData? icon;
  final String? lines;
  final String? tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    TextStyle readTextStyle = const TextStyle(
      color: Colors.blue,
      fontSize: 18.0,
    );

    final ThemeData themeData = Theme.of(context);
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        child :InkWell(
                          onTap:onPressed,
                          child: Text(lines!,
                            textAlign: TextAlign.end, style: readTextStyle,
                          ),
                        )
                    )
                  ]
              )
            ]
        ),

      ),
    );
  }
}