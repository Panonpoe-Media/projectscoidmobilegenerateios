
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
class _InputDropdown extends StatelessWidget {
  const _InputDropdown({
    Key? key,
    this.child,
    this.labelText,
    this.valueText,
    this.valueStyle,
    this.onPressed }) : super(key: key);

  final String? labelText;
  final String? valueText;
  final TextStyle? valueStyle;
  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: InkWell(
          onTap: onPressed,
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: labelText,
              border: InputBorder.none,
            ),
            baseStyle: valueStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(valueText!, style: valueStyle),
                Icon(Icons.arrow_drop_down,
                    color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade700 : Colors.white70
                ),
              ],
            ),
          ),
        )
    ) ;
  }
}

class DateTimeWidget extends StatelessWidget {
  DateTimeWidget({
    this.value,
    this.caption,
    this.hint,
    this.required,
    this.getValue, }
  ){
    if(required!){
      caption = caption!  + '*';
    }
    if(value == null){
      this.selectedDate = DateTime.parse('2014-12-31 00:00:00');
    }else{
      this.selectedDate = value;
    }
    selectedTime = TimeOfDay(hour: selectedDate!.hour, minute: selectedDate!.minute);

  }
  DateTime? value;
  String? caption;
  String? hint;
  final bool? required;
  DateTime? selectedDate;
  TimeOfDay?selectedTime;
  final ValueChanged<DateTime>? getValue;

  DateTime mergeDateTime(DateTime dt, TimeOfDay td){
    //td.
    return DateTime(dt.year, dt.month, dt.day, td.hour, td.minute);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2101)
    );
    if (picked != null && picked != selectedDate){
      DateTime  dt = mergeDateTime(picked, selectedTime!);
      getValue!(dt);
    }

  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime!
    );
    if (picked != null && picked != selectedTime)
      {
        DateTime  dt = mergeDateTime(selectedDate!, picked);
        getValue!(dt);
      }
  }

  @override
  Widget build (BuildContext context){
    final TextStyle valueStyle = TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20);//Theme.of(context).textTheme.subtitle;
    //InputComponent password;
    return
      ItemListWidget(
          tooltip: 'Send message',
          onPressed: (){
          },
          lines:
          caption,
          isdivided: false,
          wgt:
          Row(
              children: <Widget>[
                  Expanded(
                        child:
                             Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                            child:// <Widget>[

                            Container(
                              // padding: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              alignment: Alignment.center,
                              height: 56.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(color: const Color(0xFF000000), width: 0.5),
                                //color: CurrentTheme.ShadeColor,
                              ),
                              child : _InputDropdown(
                                // labelText: labelText,
                                valueText: DateFormat('dd/MM/yyyy').format(selectedDate!),
                                valueStyle: valueStyle,
                                onPressed: () { _selectDate(context); },
                              ),
                            )
                        )
                   ),

                  Expanded(
                      child:
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 2.0),
                          child:// <Widget>[

                          Container(
                            // padding: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            alignment: Alignment.center,
                            height: 56.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(color: CurrentTheme.ShadeColor),
                              //color: CurrentTheme.ShadeColor,
                            ),
                            child : _InputDropdown(
                              //  labelText: labelText1,
                              valueText: selectedTime!.format(context),
                              valueStyle: valueStyle,
                              onPressed: () { _selectTime(context); },
                            ),
                          )
                      )
                  ),
                ]
          ),

      );

    /*
      Column(
        children : <Widget> [
          Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      child:
                      new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 6.0, 2.0),
                              child: new Text(caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
                            ),
                            new Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 0.0),
                                child:// <Widget>[

                                new Container(
                                  // padding: const EdgeInsets.all(8.0),
                                  padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 0.0),
                                  alignment: Alignment.center,
                                  height: 45.0,
                                  decoration: new BoxDecoration(
                                    color: CurrentTheme.ShadeColor,
                                  ),
                                  child :   _InputDropdown(
                                   // labelText: labelText,
                                    valueText: DateFormat('dd/MM/yyyy').format(selectedDate),
                                    valueStyle: valueStyle,
                                    onPressed: () { _selectDate(context); },
                                    ),
                                 // ),
                                ),

                            ),
                          ]

                      )
                  ),
                ),
                Expanded(
                    child: Container(
                        child:
                        new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.fromLTRB(4.0, 14.0, 8.0, 2.0),
                                child: new Text(' ', style: TextStyle(color: Colors.grey[700], fontSize: 14),),
                              ),
                              new Padding(
                                  padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 0.0),
                                  child:// <Widget>[

                                  new Container(
                                    // padding: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 0.0),
                                    alignment: Alignment.center,
                                    height: 45.0,
                                    decoration: new BoxDecoration(
                                      color: CurrentTheme.ShadeColor ,
                                    ),
                                    child: _InputDropdown(
                                        //  labelText: labelText1,
                                          valueText: selectedTime.format(context),
                                          valueStyle: valueStyle,
                                          onPressed: () { _selectTime(context); },
                                          ),
                                      //    ),
                                  )

                              )

                            ]
                        )

                    )
                )
              ]
          )
        ]
    );

     */


  }
}


