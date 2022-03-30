import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';

class LoginPasswordWidget extends StatefulWidget {
  LoginPasswordWidget({
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
      //this.caption = this.caption + '*';
    }

  }
  TextEditingController? contr = TextEditingController();


  String? value;
  String? hint;

  final bool? required;
  String? caption;
  final ValueChanged<String?>? getValue;

  @override
  State<StatefulWidget> createState(){
    return _LoginPasswordWidgetState();
  }
}

class _LoginPasswordWidgetState extends State<LoginPasswordWidget> {
  bool isvalid = true;
  bool validation = true;
  String?  errormessage = '';
  bool _isObscure = true;

  @override
  initState(){
    super.initState();
    //contr.text = 'ok';
  }

  String validatePassword(_value, _require) {
    String value = _value;
    bool   require = _require;
    String result = '';
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result =  'Please enter Password.';
        isvalid = false;
      }
      final RegExp nameExp = RegExp(r'^[A-Za-z0-9) ]+$');
      if (!nameExp.hasMatch(value)){
        result = 'Please enter only alphabetnumerical characters.';
        isvalid = false;
      }

      if (value.length < 6){
        result = 'This field must have at least 6 characters.';
        isvalid = false;
      }

      if(!RegExp(r'[A-Z]').hasMatch(value)|| !RegExp(r'[a-z]').hasMatch(value)|| !RegExp(r'[0-9]').hasMatch(value)){
        result = 'Field must have at least 1 (A-Z),(a-z) and (0-9).';
        isvalid = false;
      }
    } else{
     // if (value.isEmpty)
     // {
        result = '';
        isvalid = true;
     // }

    }

    return result;
  }

  void  _getvalue(String val){
    widget.getValue!(val);
  }

  @override
  Widget build (BuildContext context){
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

                style: TextStyle(color: validation ? CurrentTheme.NormalTextColor : CurrentTheme.BackgroundColor, fontSize: 14),

                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }
                  ),
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
                obscureText: _isObscure,
                validator: (value) {
                  // widget.value = value;
                  errormessage = validatePassword(value, widget.required,);
                  if (isvalid) {
                    setState(() {
                      validation = true;
                      // widget.value = value;
                      _getvalue(value!);
                    });
                    return null;
                  } else {
                    setState(() {
                      validation = false;
                      // widget.value = value;
                      _getvalue(value!);
                    });
                    return null;
                  }
                },

              ),


            )

          // ]
        )



      );




  }
}