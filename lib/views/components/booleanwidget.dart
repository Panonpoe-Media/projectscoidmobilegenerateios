import 'package:flutter/material.dart';
//import  'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';



class BooleanWidget extends StatelessWidget {
  bool? value;
  String? hint;
  final bool? required;
  String? caption;
  String? oldcaption;

  bool? switchedValue;
  final ValueChanged<bool>? getValue;


  BooleanWidget({Key? key,  this.value, this.caption, this.hint, this.required, this.getValue}) : super(key: key){
    if(required!){

      oldcaption = caption;
      caption = caption! + '*';
    }

    switchedValue = value;
  }

  void _getvalue(bool? selecteditem) {
    switchedValue = selecteditem;
    getValue!(selecteditem!);
  }

  @override
  Widget build (BuildContext context){
   // InputComponent username;
    return
      ItemListWidget(
          tooltip: 'Send message',
          onPressed: (){
          },
          lines:
          caption,
          isdivided: false,
          wgt:
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
              child:// <Widget>[
              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
               // alignment: Alignment.center,
                height: 56.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: const Color(0xFF000000), width: 0.5),
                  //color: CurrentTheme.ShadeColor,
                ),
                child: SwitchListTile(
                  title:  new Text(switchedValue!? 'Yes' : 'No', style: TextStyle(fontSize: 14)),
                  activeColor: Colors.green[600],
                  value: switchedValue!,
                  onChanged: _getvalue,
                  //  (bool value) {
                  // setState(() {
                  //   switchValue = value;
                  // });
                  //},
                ),
              )

            // ]
          )


      );
       /*
      new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: new Text(caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
            ),
            new Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 6.0),
                child:// <Widget>[
                new Container(
                  // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 6.0),
                  alignment: Alignment.center,
                  height: 46.0,
                  decoration: new BoxDecoration(
                    color: CurrentTheme.ShadeColor ,
                  ),
                  child: new SwitchListTile(
                    title:  new Text(switchedValue? 'Yes' : 'No', style: TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20)),
                    activeColor: Colors.green[600],
                    value: switchedValue,
                    onChanged: _getvalue,
                      //  (bool value) {
                     // setState(() {
                     //   switchValue = value;
                     // });
                    //},
                  ),
                )

              // ]
            )
          ]

      );

        */
  }


}

