import 'package:flutter/material.dart';
import 'package:string_mask/string_mask.dart';
import 'package:string_mask/src/mask_pattern.dart';
//import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';

class MoneyWidget extends StatefulWidget {
   MoneyWidget({
    Key? key,
   this.value, 
   this.caption, 
   this.hint, 
   this.required,
   this.getValue,
   this.min,
   this.max,
   }) : super(key: key)
   {
    value ??= 0;
    contr?.text = value.toString().replaceAll('.0', '');
	lengthText = contr?.text.length;
    contr?.selection = TextSelection.collapsed(offset: lengthText!);
   if(required!){
      caption = caption! + '*';
    }
   }

  TextEditingController? contr = MoneyMaskedTextController(precision: 0, decimalSeparator: '', thousandSeparator: ',');
  double? value;
  String? hint;
  final bool? required;
  String? caption;
  int? lengthText;
  final ValueChanged<double?>? getValue;
  final String? min;
  final String? max;

 // String

  @override
  State<StatefulWidget> createState() {
    return _MoneyWidget();
  }  
}

class _MoneyWidget extends State<MoneyWidget> {
  bool validation = true;
  bool isvalid = true;
  String?  errormessage = '';
 // TextEditingController contr;
 // _MoneyWidget({this.contr});
  @override
  initState(){
  //contr.text = 'ok';
  }
  String validateMoney(_value, _require, _min, _max) {
    var maskOptions = new MaskOptions()
      ..reverse = true;
    var formatter = new StringMask('#,##0', options: maskOptions);
    String value = _value;
    double? val;
    bool   require = _require;
    String? pattern =
        r'^(?:0|[1-9][0-9]*)\,[0-9]+$';
    String min = _min;
    String max = _max;
    double? minvalue, maxvalue;
    String result = '' ;
    String tempVal = value.replaceAll(',', '');
    isvalid = true;
    val = double.tryParse(value!.replaceAll(',', ''));
    if(val == null){
      val = 0;
    }
    minvalue = double.tryParse(min);
    minvalue ??= 0;
    maxvalue = double.tryParse(max);
    maxvalue ??= 100000000000;

    if(require){
      if (value.isEmpty ){
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

   // if (!nameExp.hasMatch(value)){
   //   result =  'This field can only have digits 0-9';
   //   isvalid = false;
  //  }

    if(minvalue > val){
      result = 'The value must be higher than ' + formatter.apply(min);
      isvalid = false;
    }
    if(maxvalue < val){
      result = 'The value must be lower than ' + formatter.apply(max);
      isvalid = false;
    }
    
   // isvalid = true;
    return result;
  }


  void  _getvalue(double? val){
      widget.getValue!(val);
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

                  controller: widget.contr,
                  onChanged: (String val){
                    _getvalue(double.tryParse(widget.contr!.text.replaceAll(',', '')));
                  },
                  validator: (value) {
                    widget.value = double.tryParse(value!.replaceAll(',', ''));
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

