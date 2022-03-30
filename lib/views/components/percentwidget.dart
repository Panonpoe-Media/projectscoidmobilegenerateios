import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';

class PercentWidget extends StatelessWidget {
  TextEditingController? contr = TextEditingController();
  int? value;
  String? hint;
  final bool? required;
  String? caption;
  final String? min;
  final String? max;
  double? value1 = 0.0;
  //final ValueChanged<double> changeSlider;
  final ValueChanged<int?>? getValue;


  PercentWidget({Key? key,  this.value,this.caption, this.hint, this.required,
                   this.min,  this.max,  this.getValue}) : super(key: key){
    if(required!){
      caption = caption! + '*';
    }
    final newvalue = value?.toDouble();
    if(newvalue != null){
      
      value1 = newvalue;
    }

  }

  void changedSlider(double? changedslider) {
    getValue!(changedslider?.round());
  }

  void changedPercent(String changedpercent) {
    double? newValue = double.tryParse(changedpercent);
    double? min1 = double.tryParse(min!);
    double? max1 = double.tryParse(max!);
    if (newValue != null && newValue != value1) {
     // if(newValue.clamp(0, 100))
         if ((newValue >= min1!) && (newValue <= max1! ))
           {getValue!(int.parse(changedpercent));
           } else {getValue!(null);}
         ;
       // value = newValue.clamp(0, 100);

    }

  }


  @override
  Widget build (BuildContext context){
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
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                    child:// <Widget>[

                    Container(
                      // padding: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                      alignment: Alignment.center,
                      height: 46.0,
                      decoration: const BoxDecoration(
                        color: CurrentTheme.ShadeColor ,
                      ),
                      child:Row(
                        children: <Widget>[
                          Expanded(
                            child: Slider(
                              value: value1!,
                              min: double.parse(min!),
                              max: double.parse(max!),
                              onChanged: changedSlider,
                            ),
                          ),
                          Semantics(
                            label: 'Editable numerical value',
                            child: SizedBox(
                              width: 30,
                              height: 48,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: hint,
                                  hintStyle: const TextStyle(color: CurrentTheme.ShadeColor),
                                  border: InputBorder.none,
                                ),
                                onSubmitted:changedPercent,
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(
                                  text: value1?.toStringAsFixed(0),
                                ),
                              ),
                            ),
                          ),
                          Semantics( child: const Text('%'),
                          )
                        ],
                      ),
                    )

                  // ]
                )
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
                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                child:// <Widget>[

                new Container(
                  // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                  alignment: Alignment.center,
                  height: 46.0,
                  decoration: new BoxDecoration(
                    color: CurrentTheme.ShadeColor ,
                  ),
                  child:Row(
                        children: <Widget>[
                          Expanded(
                            child: Slider(
                              value: value1,
                              min: double.parse(this.min),
                              max: double.parse(this.max),
                              onChanged: changedSlider,
                            ),
                          ),
                          Semantics(
                            label: 'Editable numerical value',
                            child: Container(
                              width: 30,
                              height: 48,
                              child: TextField(
                                decoration: new InputDecoration(
                                  hintText: hint,
                                  hintStyle: TextStyle(color: CurrentTheme.ShadeColor),
                                  border: InputBorder.none,
                                ),
                                onSubmitted:changedPercent,
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(
                                  text: value1.toStringAsFixed(0),
                                ),
                              ),
                            ),
                          ),
                          Semantics( child: Text('%'),
                          )
                        ],
                      ),
                    )

              // ]
            )
          ]

      );

 */
  }


}