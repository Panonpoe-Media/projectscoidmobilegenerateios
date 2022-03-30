import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
class ItemListWidget extends StatelessWidget {
  const ItemListWidget({ Key? key, this.icon, this.lines, this.lines1 = '',this.tooltip, this.onPressed, this.wgt, this.isdivided = true , this.isDark = false })
      :
        super(key: key);

  final IconData? icon;
  final String? lines;
  final String? lines1;
  final String? tooltip;
  final VoidCallback? onPressed;
  final Widget? wgt;
  final bool? isdivided;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child:
        Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        lines1 == ''? Text(lines!.toUpperCase(), style: const TextStyle(fontSize: 12, color: CurrentTheme.DisableTextColor)):

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(lines!.toUpperCase(), style: const TextStyle(fontSize: 12, color: CurrentTheme.DisableTextColor)),
                            Text(lines1!, style: const TextStyle(fontSize: 12, color: CurrentTheme.ErrorColor)),
                          ],
                        ),

                        wgt!,

                      ],
                    ),
                  ),
                  (icon != null) ?
                  SizedBox(
                    width: 35.0,
                    child: IconButton(
                      icon: Icon(icon),
                      color: isDark! ? Colors.white : Colors.black26,
                      onPressed: onPressed,
                    ),
                  ) :
                  Container(width: 0.0, height: 0.0,),
                ],
              ),
               isdivided! ? const Divider(
               // color: Color(0xFFDBDBDB),
                   color: CurrentTheme.DisableTextColor,
              ) : const SizedBox(width: 0.0, height: 0.0,),
            ]
        ),

      ),
    );
  }
}