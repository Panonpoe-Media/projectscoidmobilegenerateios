import 'package:flutter/material.dart';
import 'package:string_mask/string_mask.dart';
import 'package:string_mask/src/mask_pattern.dart';
//import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';

class RangeWidget extends StatefulWidget {
  RangeWidget({Key? key,
    this.value,
    this.valuemin,
    this.valuemax,
    this.caption,
    this.hint,
    this.required,
    this.getValue,
    this.getValue1,
    this.getValue2,
    this.min,
    this.max,
  }) : super(key: key)
  {
    valuemin ??= 0;
    valuemax ??= 0;
    value ??= '0';
    contr?.text = valuemin.toString().replaceAll('.0', '');
    contr1?.text = valuemax.toString().replaceAll('.0', '');
    lengthText = contr?.text.length;
    lengthText1 = contr1?.text.length;
    contr?.selection = TextSelection.collapsed(offset: lengthText!);
    contr1?.selection = TextSelection.collapsed(offset: lengthText1!);
    if(required!){
      caption = caption! + '*';
    }
  }

  TextEditingController? contr = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: ',');
  TextEditingController? contr1 = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: ',');
  String? value;
  double? valuemin;
  double? valuemax;
  String? hint;
  final bool? required;
  String? caption;
  int? lengthText;
  int? lengthText1;
  final ValueChanged<String?>? getValue;
  final ValueChanged<double?>? getValue1;
  final ValueChanged<double?>? getValue2;
  final String? min;
  final String? max;

  // String

  @override
  State<StatefulWidget> createState() {
    return _RangeWidget();
  }
}

class _RangeWidget extends State<RangeWidget> {
  bool validation = true;
  bool isvalid = true;
  String  errormessage = '';
 // TextEditingController contr;
 // TextEditingController contr1;
  var val;
  var val1;
 // _RangeWidget({this.contr, this.contr1});

  @override
  initState(){
    super.initState();
     val = widget.valuemin;
     val1 = widget.valuemax;
    //contr.text = 'ok';
  }
  String validateMoney(_value, _value1,  _require, _min, _max) {
    var maskOptions = MaskOptions()
      ..reverse = true;
    var formatter = StringMask('#,##0', options: maskOptions);
    String value = _value;
    String value1 = _value1;
    double? val;
    double? val1;
    bool   require = _require;
    String? pattern =
        r'^(?:0|[1-9][0-9]*)\,[0-9]+$';
   // String min = _min;
    String min = '50000';
    String max = _max;
    double? minvalue, maxvalue;
    String result = '' ;
    String tempVal = value.replaceAll(',', '');
    isvalid = true;
    val = double.tryParse(value.replaceAll(',', ''));
    val ??= 0;
    val1 = double.tryParse(value1.replaceAll(',', ''));
    val1 ??= 0;
    minvalue = double.tryParse(min);
    minvalue ??= 0;
    maxvalue = double.tryParse(max);
    minvalue = 50000.0;
    maxvalue ??= 100000000000.0;

    if(require){
      if (value.isEmpty || val == 0){
        result = 'This field is required';
        isvalid = false;
      }
    } else{
      if (value.isEmpty) {
        result = '';
      }
      isvalid = true;
    }

    final RegExp nameExp = RegExp(pattern);

  /*  if (!nameExp.Match(value)){
      result =  'This field can only have digits 0-9';
      isvalid = false;
    }

   */

    if(minvalue > val){
      result = 'The value must be higher than ' + formatter.apply(min);
      isvalid = false;
    }
    if(maxvalue < val){
      result = 'The value must be lower than ' + formatter.apply(max);
      isvalid = false;
    }
    if(minvalue > val1){
      result = 'The value must be higher than ' + formatter.apply(min);
      isvalid = false;
    }
    if(maxvalue < val1){
      result = 'The value must be lower than ' + formatter.apply(max);
      isvalid = false;
    }

    if(val >= val1){
      result = 'The maximum value must be bigger.';
      isvalid = false;
    }

    // isvalid = true;
    return result;
  }


  void  _getvalue(String?val){
    widget.getValue!(val);
  }
  void  _getvalue1(double? val){
    widget.getValue1!(val);
  }
  void  _getvalue2(double? val){
    widget.getValue2!(val);
  }

  @override
  Widget build (BuildContext context){
    final size =MediaQuery.of(context).size;
    final width =size.width;

    // InputComponent username;
    return
      ItemListWidget(
          tooltip: 'Send message',
          onPressed: (){
          },
          lines:
          widget.caption,
          lines1:
          errormessage,
          isdivided: false,
          wgt:
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
              child:// <Widget>[

              Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                alignment: Alignment.center,
                height: 45.0,
                 /* decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: const Color(0xFF000000), width: 0.5),
                    //color: CurrentTheme.ShadeColor,
                  ),

                  */
                child:
                   Row(
                     children: <Widget>[
                       SizedBox(
                         width: width * 0.43,
                         child:
                         TextFormField(
                           keyboardType: const TextInputType.numberWithOptions(),
                           style: TextStyle(color: validation ? CurrentTheme.NormalTextColor : CurrentTheme.BackgroundColor, fontSize: 14),

                           decoration: InputDecoration(

                               hintText: widget.hint,
                               // hintStyle: TextStyle(color: Colors.grey[500]),
                               hintStyle: TextStyle(color: validation ? CurrentTheme.ShadeColor : CurrentTheme.BackgroundColor),
                               //  errorStyle:
                               errorBorder: const UnderlineInputBorder(),
                               filled: true,
                               fillColor: validation ? CurrentTheme.BackgroundColor : CurrentTheme.ErrorColor,
                               // focusedErrorBorder: errorBorder,
                               border: const OutlineInputBorder(),
                               prefixText: 'Rp.',
                               prefixStyle: const TextStyle(color: CurrentTheme.NormalTextColor),
                               suffixText: 'IDR',
                               suffixStyle: const TextStyle(color: Colors.green)
                           ),

                           controller: widget.contr,
                           onChanged: (String value){
                             _getvalue1(double.tryParse(widget.contr!.text.replaceAll(',', '')));
                              val = double.tryParse(widget.contr!.text.replaceAll(',', ''));
                            // _getvalue(val.toString()+';'+val1.toString());
                           },
                             /*
                           validator: (value) {
                             widget.valuemin = double.tryParse(value.replaceAll(',', ''));
                             val = widget.valuemin;
                             errormessage = validateMoney( value.toString(), widget.required, widget.min, widget.max);
                             if (isvalid) {
                               setState(() {
                                 validation = true;
                                 // widget.value = value;
                                 _getvalue(val.toString()+';'+val1.toString());
                                 _getvalue1(val);
                               });
                               return null;
                             } else {
                               setState(() {
                                 validation = false;
                                 // widget.value = value;
                                 _getvalue(val.toString()+';'+val1.toString());
                                 _getvalue1(val);
                               });
                               return null;
                             }
                           },
                           */

                         ),

                       ),

                       const Text(' - ', style: TextStyle(fontSize: 26),),

                        SizedBox(
                          width: width * 0.43,
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(),
                            style: TextStyle(color: validation ? CurrentTheme.NormalTextColor : CurrentTheme.BackgroundColor, fontSize: 14),

                            decoration: InputDecoration(
                                hintText: widget.hint,
                                // hintStyle: TextStyle(color: Colors.grey[500]),
                                hintStyle: TextStyle(color: validation ? CurrentTheme.ShadeColor : CurrentTheme.BackgroundColor),
                                //  errorStyle:
                                errorBorder: const UnderlineInputBorder(),
                                filled: true,
                                fillColor: validation ? CurrentTheme.BackgroundColor : CurrentTheme.ErrorColor,
                                // focusedErrorBorder: errorBorder,
                                border: const OutlineInputBorder(),
                                prefixText: 'Rp.',
                                prefixStyle: const TextStyle(color: CurrentTheme.NormalTextColor),
                                suffixText: 'IDR',
                                suffixStyle: const TextStyle(color: Colors.green)
                            ),

                            controller: widget.contr1,
                            onChanged: (String value){
                              _getvalue2(double.tryParse(widget.contr1!.text.replaceAll(',', '')));
                              val1 = double.tryParse(widget.contr!.text.replaceAll(',', ''));
                              //_getvalue(val.toString()+';'+val1.toString());
                            },
                            validator: (value) {
                              widget.valuemax = double.tryParse(value!.replaceAll(',', ''));
                              val1 = widget.valuemax;
                              errormessage = validateMoney(  val.toString(), value.toString(), widget.required, widget.min, widget.max);
                              if (isvalid) {
                               // _getvalue(widget.value);
                                setState(() {
                                  validation = true;
                                  // widget.value = value;
                                  _getvalue2(val1);
                                // _getvalue(val.toString()+';'+val1.toString());

                                });
                                setState(() {
                                  validation = true;
                                   _getvalue((val.toString()+';'+val1.toString()).replaceAll('.0', ''));

                                });
                                return null;
                              } else {
                                setState(() {
                                  validation = false;
                                  // widget.value = value;
                                  _getvalue2(val1);

                                });
                                setState(() {
                                  validation = false;
                                  _getvalue((val.toString()+';'+val1.toString()).replaceAll('.0', ''));

                                });
                                return null;
                              }
                            },

                          ),
                        ),





                     ],
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
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(widget.caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
                    new Text(errormessage, style: TextStyle(color: CurrentTheme.ErrorColor, fontSize: 14), textAlign: TextAlign.right),


                ],)

           ),
          new Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
            child:// <Widget>[

              new Container(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
                alignment: Alignment.center,
                height: 50.0,
                decoration: new BoxDecoration(
                  //color: Colors.lightBlue[100],
                  color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
                ),
                child: new TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20),

                  decoration: new InputDecoration(

                    hintText: widget.hint,
                   // hintStyle: TextStyle(color: Colors.grey[500]),
                    hintStyle: TextStyle(color: CurrentTheme.BackgroundColor),
                  //  errorStyle:
                  //  errorBorder: UnderlineInputBorder(),
                    border: InputBorder.none,
                      prefixText: 'Rp.',
                      suffixText: 'IDR',
                      suffixStyle: TextStyle(color: Colors.green)
                  ),

                  controller: widget.contr,
                  onChanged: (String val)=>{
                                           _getvalue(double.tryParse(widget.contr.text.replaceAll(',', '')))
                                          },
                  validator: (value) {
                    widget.value = double.tryParse(value.replaceAll(',', ''));
                    var val = widget.value;
                    errormessage = validateMoney( value.toString(), widget.required, widget.min, widget.max);
                    if (isvalid) {
                       setState(() {
                          validation = true;
                         // widget.value = value;
                          _getvalue(val);
                       });
                       return null;
                    } else {
                       setState(() {
                          validation = false;
                         // widget.value = value;
                          _getvalue(val);
                       });
                       return null;
                    }
                  },

                ),



              )

           // ]
           )
        ]

      );

     */
  }


}

