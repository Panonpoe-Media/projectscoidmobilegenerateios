import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';

class HandphoneWidget extends StatefulWidget {
   HandphoneWidget({
    Key? key,
   this.value, 
   this.caption, 
   this.hint, 
   this.required,
   this.getValue,
   }) : super(key: key)
   {
    contr!.text = value!;
   if(required!){
      caption = caption! + '*';
    }
   } 
  TextEditingController? contr = new TextEditingController();
  String? value;
  String? hint;
  final bool? required;
  String? caption;
  final ValueChanged<String?>? getValue;

 // String

  @override
  State<StatefulWidget> createState() {
    return _HandphoneWidget();
  }  
}

class _HandphoneWidget extends State<HandphoneWidget> {
  bool validation = true;
  bool isvalid = true;
  String?  errormessage = '';
 // TextEditingController contr;
 // _HandphoneWidget({this.contr});
 // @override
//  initState(){

  //contr.text = 'ok';
//  }

  String? validateHandphone(String? _value,bool? _require) {
    String value = _value!;
    bool   require = _require!;
    String? result = '' ;
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result = 'This field is required';
        isvalid= false;
      }
    } else{
      if (value.isEmpty){
        result = null;
        isvalid = true;
      }      
    }
    final RegExp nameExp = RegExp(r'^[+0][0-9]+$');
    if (!nameExp.hasMatch(value)){
      result = 'This field can only have digits 0-9';
      isvalid = false;
    }
    if (value.length < 6){
      result = 'This field must have at least 6 digit.';
      isvalid = false;
    } 
   
    return result;
  }

  void  _getvalue(String? val){
      widget.getValue!(val);
  }

  @override
  Widget build (BuildContext context){
   // InputComponent Handphone;
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
                  keyboardType: TextInputType.phone,
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
                  validator: (value) {
                    // widget.value = value;
                    errormessage = validateHandphone(value, widget.required);
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

                child: new TextFormField(
                  
                  style: TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20),

                  decoration: new InputDecoration(
                    hintText: widget.hint,
                   // hintStyle: TextStyle(color: Colors.grey[500]),
                    hintStyle: TextStyle(color: CurrentTheme.BackgroundColor),
                  //  errorStyle: 
                  //  errorBorder: UnderlineInputBorder(),
                    border: InputBorder.none,
                  ),
                  
                  controller: contr,                
                  validator: (value) {
                   // widget.value = value;
                    errormessage = validateHandphone(value, widget.required);
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
                
                decoration: new BoxDecoration(
                  //color: Colors.lightBlue[100],
                  color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
                ),

              )

           // ]
           )
        ]

      );

     */
  }


}

