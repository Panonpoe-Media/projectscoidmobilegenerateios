import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';


class PasswordWidget extends StatefulWidget {
   PasswordWidget({Key? key,
   this.value,
   this.value1,
   this.caption, 
   this.hint, 
   this.required,
   this.getValue,
   this.getValue1,
   }) : super(key: key)
   {
    contr?.text = value!;
    lengthText = contr?.text.length;
    contr?.selection = TextSelection.collapsed(offset: lengthText!);
    contr1?.text = value1!;
    lengthText = contr1?.text.length;
    contr1?.selection = TextSelection.collapsed(offset: lengthText!);
    compare = contr1?.text!;
    if(required!){
      caption = caption! + '*';
    }
    hint1 = '';
    //contr1.text = this.value;
   } 
  TextEditingController? contr = TextEditingController();
  TextEditingController? contr1 = TextEditingController();
  String? compare='' ;
  int?  lengthText;
  String? value;
  String? value1;
  String? hint;
  String? hint1;
  final bool? required;
  String? caption;
  final ValueChanged<String?>? getValue;
  final ValueChanged<String?>? getValue1;

@override
State<StatefulWidget> createState(){
   return _PasswordWidgetState();
}
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool isvalid = true;
  bool validation = true;
  String  errormessage = '';
  String compare='' ;
  bool _isObscure = true;

    @override
  initState(){
    super.initState(); 
  //contr.text = 'ok';
  }
 
  String validatePassword(_value, _require, _compare) {
    String value = _value;
    bool   require = _require;
    String compare = _compare;
    String result = '';
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result =  'Please enter Password.';
        isvalid = false;
      }
    } else{
      if (value.isEmpty)
      {
         result = '';
         isvalid = true;
      }     
    }
    final RegExp nameExp = RegExp(r'^[A-Za-z0-9) ]+$');
    if (!nameExp.hasMatch(value)){
          result = 'Please enter only alphabetnumerical characters.';
          isvalid = false;
    }      
    if (_value != compare ){
         result = 'Password does not match.';
         isvalid = false;
    }   
    if (value.length < 6){
          result = 'This field must have at least 6 characters.';
          isvalid = false;
    }
    if(value == '')
      
    if(!RegExp(r'[A-Z]').hasMatch(value)|| !RegExp(r'[a-z]').hasMatch(value)|| !RegExp(r'[0-9]').hasMatch(value)){
      result = 'This field at least one (A-Z),(a-z) & (0-9).';
      isvalid = false;
    }   
    return result;
  }

    void  _getvalue(String? val){
      widget.getValue!(val);
  }
  void  _getvalue1(String? val){
    widget.getValue1!(val);
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


            Row(
                children: <Widget>[

                  Expanded(

                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                              child:// <Widget>[

                              Container(
                                // padding: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                alignment: Alignment.center,
                                height: 44.0,

                                child: TextFormField(
                                  style: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 14),

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
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: widget.contr,
                                  onChanged: (String val){
                                    _getvalue(widget.contr?.text);
                                  },
                                  obscureText: _isObscure,
                                  validator: (value) {
                                    errormessage = validatePassword(value, widget.required, widget.contr1?.text);

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

                          )
                        ]

                    ),
                  ),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                                child:// <Widget>[

                                Container(
                                  // padding: const EdgeInsets.all(8.0),
                                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                  alignment: Alignment.center,
                                  height: 44.0,

                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.black, fontSize: 14),
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
                                    controller: widget.contr1,
                                    onChanged: (String val){
                                      _getvalue1(widget.contr1?.text);
                                    },
                                    obscureText: true,

                                  ),
                                )

                            )

                          ]
                      )
                  )
                ]
            )




      );
     /*
      new Column(
        children : <Widget> [
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
                    Row(
                    children: <Widget>[

                          Expanded(
                            
                          child: Container(
                                child:
                                new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      new Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 6.0),
                                          child:// <Widget>[

                                          new Container(
                                            // padding: const EdgeInsets.all(8.0),
                                            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 6.0),
                                            alignment: Alignment.center,
                                            height: 44.0,
                                            decoration: new BoxDecoration(
                                              //color: Colors.lightBlue[100],
                                              color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
                                            ),
                                            child: new TextFormField(
                                              style: TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20),
                                              decoration: new InputDecoration(
                                                hintText: widget.hint,
                                                hintStyle: TextStyle(color: CurrentTheme.BackgroundColor),
                                                border: InputBorder.none,
                                              ),
                                              controller: widget.contr,
                                              onChanged: (String val)=>{
                                                _getvalue(widget.contr.text)
                                              },
                                              obscureText: true,
                                              validator: (value) {
                                                      errormessage = validatePassword(value, widget.required, widget.contr1.text);
                                                    
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

                                      )
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
                                      padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 6.0),
                                      child:// <Widget>[

                                          new Container(
                                          // padding: const EdgeInsets.all(8.0),
                                          padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 6.0),
                                          alignment: Alignment.center,
                                          height: 44.0,
                                          decoration: new BoxDecoration(
                                           color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
                                          ),
                                          child: new TextFormField(
                                                style: TextStyle(color: Colors.black, fontSize: 20),
                                                decoration: new InputDecoration(
                                                hintText: widget.hint1,
                                                hintStyle: TextStyle(color: Colors.white),
                                                border: InputBorder.none,
                                                ),
                                                controller: widget.contr1,
                                                onChanged: (String val)=>{
                                                  _getvalue1(widget.contr1.text)
                                                },
                                                obscureText: true,

                                                ),
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




class PasswordWidgetEx extends StatefulWidget {
  PasswordWidgetEx({Key? key,
    this.value,
    this.value1,
    this.caption,
    this.hint,
    this.required,
    this.getValue,
    this.getValue1,
  }) : super(key: key)
  {
    contr?.text = value!;
    lengthText = contr?.text.length;
    contr?.selection = TextSelection.collapsed(offset: lengthText!);
    contr1?.text = value1!;
    lengthText = contr1?.text.length;
    contr1?.selection = TextSelection.collapsed(offset: lengthText!);
    compare = contr1?.text;
    if(required!){
      caption = caption! + '*';
    }
    hint1 = '';
    //contr1.text = this.value;
  }
  TextEditingController? contr = TextEditingController();
  TextEditingController? contr1 = TextEditingController();
  String? compare='' ;
  int?  lengthText;
  String? value;
  String? value1;
  String? hint;
  String? hint1;
  final bool? required;
  String? caption;
  final ValueChanged<String?>? getValue;
  final ValueChanged<String?>? getValue1;

  @override
  State<StatefulWidget> createState(){
    return _PasswordWidgetStateEx();
  }
}

class _PasswordWidgetStateEx extends State<PasswordWidgetEx> {
  bool isvalid = true;
  bool validation = true;
  String  errormessage = '';
  String compare='' ;
  bool _isObscure = true;

  @override
  initState(){
    super.initState();
    //contr.text = 'ok';
  }

  String validatePassword(_value, _require, _compare) {
    String value = _value;
    bool   require = _require;
    String compare = _compare;
    String result = '';
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result =  'Please enter Password.';
        isvalid = false;
      }
    } else{
      if (value.isEmpty)
      {
        result = '';
        isvalid = true;
      }
    }

    /*
    final RegExp nameExp = RegExp(r'^[A-Za-z0-9) ]+$');
    if (!nameExp.hasMatch(value)){
      result = 'Please enter only alphabetnumerical characters.';
      isvalid = false;
    }

     */
    if (_value != compare ){
      result = 'Password does not match.';
      isvalid = false;
    }
    if (value.length < 6){
      result = 'This field must have at least 6 characters.';
      isvalid = false;
    }
    if(value == '')

      if(!RegExp(r'[A-Z]').hasMatch(value)|| !RegExp(r'[a-z]').hasMatch(value)|| !RegExp(r'[0-9]').hasMatch(value)){
        result = 'This field at least one (A-Z),(a-z) & (0-9).';
        isvalid = false;
      }
    return result;
  }

  void  _getvalue(String? val){
    widget.getValue!(val);
  }
  void  _getvalue1(String? val){
    widget.getValue1!(val);
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


          Row(
              children: <Widget>[

                Expanded(

                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                            child:// <Widget>[

                            Container(
                              // padding: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              alignment: Alignment.center,
                              height: 44.0,

                              child: TextFormField(
                                style: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 14),

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
                                onChanged: (String val){
                                  _getvalue(widget.contr?.text);
                                  _getvalue1(widget.contr?.text);
                                },
                                obscureText: _isObscure,
                                validator: (value) {
                                  errormessage = validatePassword(value, widget.required, value);

                                  if (isvalid) {
                                    setState(() {
                                      validation = true;
                                      // widget.value = value;
                                      _getvalue(value);
                                      _getvalue1(value);
                                    });
                                    return null;
                                  } else {
                                    setState(() {
                                      validation = false;
                                      // widget.value = value;
                                      _getvalue(value);
                                      _getvalue1(value);
                                    });
                                    return null;
                                  }
                                },

                              ),

                            )

                        )
                      ]

                  ),
                ),
                /*
                Expanded(
                    child: Container(
                        child:
                        new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Padding(
                                  padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                                  child:// <Widget>[

                                  new Container(
                                    // padding: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                    alignment: Alignment.center,
                                    height: 44.0,

                                    child: new TextFormField(
                                      style: TextStyle(color: Colors.black, fontSize: 14),
                                      decoration: new InputDecoration(
                                        hintText: widget.hint,
                                        // hintStyle: TextStyle(color: Colors.grey[500]),
                                        hintStyle: TextStyle(color: validation ? CurrentTheme.ShadeColor : CurrentTheme.BackgroundColor),
                                        //  errorStyle:
                                        errorBorder: UnderlineInputBorder(),
                                        filled: true,
                                        fillColor: validation ? CurrentTheme.BackgroundColor : CurrentTheme.ErrorColor,
                                        // focusedErrorBorder: errorBorder,
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: widget.contr1,
                                      onChanged: (String val){
                                        _getvalue1(widget.contr1.text);
                                      },
                                      obscureText: true,

                                    ),
                                  )

                              )

                            ]
                        )

                    )
                )

                 */
              ]
          )




      );
    /*
      new Column(
        children : <Widget> [
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
                    Row(
                    children: <Widget>[

                          Expanded(

                          child: Container(
                                child:
                                new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      new Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 6.0),
                                          child:// <Widget>[

                                          new Container(
                                            // padding: const EdgeInsets.all(8.0),
                                            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 6.0),
                                            alignment: Alignment.center,
                                            height: 44.0,
                                            decoration: new BoxDecoration(
                                              //color: Colors.lightBlue[100],
                                              color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
                                            ),
                                            child: new TextFormField(
                                              style: TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20),
                                              decoration: new InputDecoration(
                                                hintText: widget.hint,
                                                hintStyle: TextStyle(color: CurrentTheme.BackgroundColor),
                                                border: InputBorder.none,
                                              ),
                                              controller: widget.contr,
                                              onChanged: (String val)=>{
                                                _getvalue(widget.contr.text)
                                              },
                                              obscureText: true,
                                              validator: (value) {
                                                      errormessage = validatePassword(value, widget.required, widget.contr1.text);

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

                                      )
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
                                      padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 6.0),
                                      child:// <Widget>[

                                          new Container(
                                          // padding: const EdgeInsets.all(8.0),
                                          padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 6.0),
                                          alignment: Alignment.center,
                                          height: 44.0,
                                          decoration: new BoxDecoration(
                                           color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
                                          ),
                                          child: new TextFormField(
                                                style: TextStyle(color: Colors.black, fontSize: 20),
                                                decoration: new InputDecoration(
                                                hintText: widget.hint1,
                                                hintStyle: TextStyle(color: Colors.white),
                                                border: InputBorder.none,
                                                ),
                                                controller: widget.contr1,
                                                onChanged: (String val)=>{
                                                  _getvalue1(widget.contr1.text)
                                                },
                                                obscureText: true,

                                                ),
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


class PasswordWidgetEx1 extends StatefulWidget {
  PasswordWidgetEx1({Key? key,
    this.value,
    this.value1,
    this.caption,
    this.hint,
    this.required,
    this.getValue,
    this.getValue1,
  }) : super(key: key)
  {
    contr?.text = value!;
    lengthText = contr?.text.length;
    contr?.selection = TextSelection.collapsed(offset: lengthText!);
    contr1?.text = value1!;
    lengthText = contr1?.text.length;
    contr1?.selection = TextSelection.collapsed(offset: lengthText!);
    compare = contr1?.text;
    if(required!){
      caption = caption! + '*';
    }
    hint1 = '';
    //contr1.text = this.value;
  }
  TextEditingController? contr = new TextEditingController();
  TextEditingController? contr1 = new TextEditingController();
  String? compare='' ;
  int?  lengthText;
  String? value;
  String? value1;
  String? hint;
  String? hint1;
  final bool? required;
  String? caption;
  final ValueChanged<String?>? getValue;
  final ValueChanged<String?>? getValue1;

  @override
  State<StatefulWidget> createState(){
    return new _PasswordWidgetStateEx1();
  }
}

class _PasswordWidgetStateEx1 extends State<PasswordWidgetEx1> {
  bool isvalid = true;
  bool validation = true;
  String  errormessage = '';
  String compare='' ;
  bool _isObscure = true;
  bool _isObscure1 = true;

  @override
  initState(){
    super.initState();
    //contr.text = 'ok';
  }

  String validatePassword(_value, _require, _compare) {
    String value = _value;
    bool   require = _require;
    String compare = _compare;
    String result = '';
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result =  'Please enter Password.';
        isvalid = false;
      }
    } else{
      if (value.isEmpty)
      {
        result = '';
        isvalid = true;
      }
    }
    /*
    final RegExp nameExp = RegExp(r'^[A-Za-z0-9) ]+$');
    if (!nameExp.hasMatch(value)){
      result = 'Please enter only alphabetnumerical characters.';
      isvalid = false;
    }

     */
    if (_value != compare ){
      result = 'Password does not match.';
      isvalid = false;
    }
    if (value.length < 6){
      result = 'This field must have at least 6 characters.';
      isvalid = false;
    }
    if(value == '')

      if(!RegExp(r'[A-Z]').hasMatch(value)|| !RegExp(r'[a-z]').hasMatch(value)|| !RegExp(r'[0-9]').hasMatch(value)){
        result = 'This field at least one (A-Z),(a-z) & (0-9).';
        isvalid = false;
      }
    return result;
  }

  void  _getvalue(String? val){
    widget.getValue!(val);
  }
  void  _getvalue1(String? val){
    widget.getValue1!(val);
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


          Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Container(
                  // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  alignment: Alignment.center,
                  height: 44.0,

                  child: TextFormField(
                    style: const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 14),

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
                    onChanged: (String val){
                      _getvalue(widget.contr?.text);
                    },
                    obscureText: _isObscure,
                    validator: (value) {
                      errormessage = validatePassword(value, widget.required, widget.contr1?.text);

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

                ),
                const SizedBox(height: 5,),
                const Text('CONFIRM PASSWORD*', style: TextStyle(fontSize: 12, color: CurrentTheme.DisableTextColor)),
                Container(
                  // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  alignment: Alignment.center,
                  height: 44.0,

                  child: TextFormField(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                              _isObscure1 ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure1 = !_isObscure1;
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
                      border: OutlineInputBorder(),
                    ),
                    controller: widget.contr1,
                    onChanged: (String val){
                      _getvalue1(widget.contr1?.text);
                    },
                    obscureText: _isObscure1,

                  ),
                ),
                /*
                Expanded(

                  child: Container(
                      child:
                      new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            new Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                                child:// <Widget>[

                                new Container(
                                  // padding: const EdgeInsets.all(8.0),
                                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                  alignment: Alignment.center,
                                  height: 44.0,

                                  child: new TextFormField(
                                    style: TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 14),

                                    decoration: new InputDecoration(
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
                                      errorBorder: UnderlineInputBorder(),
                                      filled: true,
                                      fillColor: validation ? CurrentTheme.BackgroundColor : CurrentTheme.ErrorColor,
                                      // focusedErrorBorder: errorBorder,
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: widget.contr,
                                    onChanged: (String val){
                                      _getvalue(widget.contr.text);
                                    },
                                    obscureText: _isObscure,
                                    validator: (value) {
                                      errormessage = validatePassword(value, widget.required, widget.contr1.text);

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

                            )
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
                              Text('CONFIRM PASSWORD*', style: TextStyle(fontSize: 12, color: CurrentTheme.DisableTextColor)),
                              new Padding(
                                  padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                                  child:// <Widget>[

                                  new Container(
                                    // padding: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                    alignment: Alignment.center,
                                    height: 44.0,

                                    child: new TextFormField(
                                      style: TextStyle(color: Colors.black, fontSize: 14),
                                      decoration: new InputDecoration(
                                        hintText: widget.hint,
                                        // hintStyle: TextStyle(color: Colors.grey[500]),
                                        hintStyle: TextStyle(color: validation ? CurrentTheme.ShadeColor : CurrentTheme.BackgroundColor),
                                        //  errorStyle:
                                        errorBorder: UnderlineInputBorder(),
                                        filled: true,
                                        fillColor: validation ? CurrentTheme.BackgroundColor : CurrentTheme.ErrorColor,
                                        // focusedErrorBorder: errorBorder,
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: widget.contr1,
                                      onChanged: (String val){
                                        _getvalue1(widget.contr1.text);
                                      },
                                      obscureText: true,

                                    ),
                                  )

                              )

                            ]
                        )

                    )
                )

                 */
              ]
          )




      );
    /*
      new Column(
        children : <Widget> [
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
                    Row(
                    children: <Widget>[

                          Expanded(

                          child: Container(
                                child:
                                new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      new Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 6.0),
                                          child:// <Widget>[

                                          new Container(
                                            // padding: const EdgeInsets.all(8.0),
                                            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 6.0),
                                            alignment: Alignment.center,
                                            height: 44.0,
                                            decoration: new BoxDecoration(
                                              //color: Colors.lightBlue[100],
                                              color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
                                            ),
                                            child: new TextFormField(
                                              style: TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20),
                                              decoration: new InputDecoration(
                                                hintText: widget.hint,
                                                hintStyle: TextStyle(color: CurrentTheme.BackgroundColor),
                                                border: InputBorder.none,
                                              ),
                                              controller: widget.contr,
                                              onChanged: (String val)=>{
                                                _getvalue(widget.contr.text)
                                              },
                                              obscureText: true,
                                              validator: (value) {
                                                      errormessage = validatePassword(value, widget.required, widget.contr1.text);

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

                                      )
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
                                      padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 6.0),
                                      child:// <Widget>[

                                          new Container(
                                          // padding: const EdgeInsets.all(8.0),
                                          padding: const EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 6.0),
                                          alignment: Alignment.center,
                                          height: 44.0,
                                          decoration: new BoxDecoration(
                                           color: validation ? CurrentTheme.ShadeColor : CurrentTheme.ErrorColor,
                                          ),
                                          child: new TextFormField(
                                                style: TextStyle(color: Colors.black, fontSize: 20),
                                                decoration: new InputDecoration(
                                                hintText: widget.hint1,
                                                hintStyle: TextStyle(color: Colors.white),
                                                border: InputBorder.none,
                                                ),
                                                controller: widget.contr1,
                                                onChanged: (String val)=>{
                                                  _getvalue1(widget.contr1.text)
                                                },
                                                obscureText: true,

                                                ),
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