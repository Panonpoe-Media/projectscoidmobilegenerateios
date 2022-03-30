
import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';

class ItemListString extends StatelessWidget {
  const ItemListString({ Key? key, this.icon, this.lines, this.tooltip, this.onPressed, this.isdivided = true, this.isoneline = false, this.isDark = false })
      :
        super(key: key);

  final IconData? icon;
  final List<String>? lines;
  final String? tooltip;
  final VoidCallback? onPressed;
  final bool? isdivided;
  final bool? isoneline;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
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
                    child:

                    isoneline!?
                    Padding(
                          padding : const EdgeInsets.only( bottom: 4.0),
                          child :Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                               Text(lines!.first , style: TextStyle(fontSize: 17, color: isDark! ? Colors.white : Colors.black87 )),

                              Padding(
                                padding : const EdgeInsets.only(top: 1.0),
                                child :Text('  '+ lines!.last),
                              )
                            ],
                          )
                    )

                        :

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       // ...lines.sublist(0, lines.length - 1).map<Widget>((String line) => ),

                        Text(lines!.first.toUpperCase(), style: const TextStyle(fontSize: 12, color: CurrentTheme.DisableTextColor)),
                        Padding(
                          padding : const EdgeInsets.only(top: 6.0),
                          child :Text(lines!.last, style: TextStyle(fontSize: 17, color: isDark! ? Colors.white : Colors.black87 ) ),
                        )

                      ],
                    ),
                  ),
                   (icon != null) ?
                    SizedBox(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(icon),
                        color:  isDark! ? Colors.white : Colors.black87,
                        onPressed: onPressed,
                      ),
                    ) :
                    const SizedBox(width: 0.0, height: 0.0,),
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