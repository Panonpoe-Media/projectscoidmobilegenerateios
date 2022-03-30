import 'package:flutter/material.dart';
import 'package:string_mask/string_mask.dart';
import 'package:string_mask/src/mask_pattern.dart';
//import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';

class NumberWidget extends StatefulWidget {
   NumberWidget({Key? key,
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
    contr?.text = value.toString();
	lengthText = contr?.text.length;
    contr?.selection = TextSelection.collapsed(offset: lengthText!);
   if(required!){
      this.caption = caption! + '*';
    }
   }
   TextEditingController? contr = new TextEditingController();
  int? value;
  String? hint;
  final bool? required;
  String? caption;
  int? lengthText;
  final ValueChanged<int?>? getValue;
  final String? min;
  final String? max;

 // String

  @override
  State<StatefulWidget> createState() {
    return _NumberWidget();
  }  
}

class _NumberWidget extends State<NumberWidget> {
  bool validation = true;
  bool isvalid = true;
  String  errormessage = '';
 // TextEditingController contr;
 // _NumberWidget({this.contr});
  @override
  initState(){
  //contr.text = 'ok';
  }
  String validateNumber(_value, _require, _min, _max) {
    var maskOptions = MaskOptions()
      ..reverse = true;
    var formatter = StringMask('#.##0', options: maskOptions);
    String? value = _value;
    int? val;
    bool   require = _require;
    String? pattern =
        r'^[-+]?[0-9]*$';
    String min = _min;
    String max = _max;
    int? minvalue, maxvalue;
    String result = '' ;
    isvalid = true;
    val = int.tryParse(value!);
    val ??= 0;
    minvalue = int.tryParse(min);
    minvalue ??= 0;
    maxvalue = int.tryParse(max);
    maxvalue ??= 10000000;

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
    if (!nameExp.hasMatch(value)){
      result =  'This field can only have digits 0-9';
      isvalid = false;
    }
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


  void  _getvalue(String? val){
      widget.getValue!(int.tryParse(val!));
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
                  keyboardType: TextInputType.number,
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
                  ),

                  controller: widget.contr,
                  onChanged: (String val){
                    _getvalue(widget.contr?.text);
                  },
                  validator: (value) {
                    // widget.value = value;

                    errormessage = validateNumber( value, widget.required, widget.min, widget.max);
                    if (isvalid) {
                      setState(() {
                        validation = true;
                        // widget.value = value;
                        _getvalue(value);
                      });
                      return null;
                    } else {
                      setState(() {
                        validation = false;
                        // widget.value = value;
                        _getvalue(value);
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
                  ),
                  
                  controller: widget.contr,  
                  onChanged: (String val)=>{
                                           _getvalue(widget.contr.text)
                                          },				  
                  validator: (value) {
                   // widget.value = value;

                    errormessage = validateNumber( value, widget.required, widget.min, widget.max);
                    if (isvalid) {
                       setState(() {
                          validation = true;
                         // widget.value = value;
                          _getvalue(value);
                       });
                       return null;
                    } else {
                       setState(() {
                          validation = false;
                         // widget.value = value;
                          _getvalue(value);
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

