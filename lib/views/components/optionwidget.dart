import 'dart:core';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import 'package:projectscoid/models/option_fields.dart';
//import 'package:projectscoid/models/image_fields.dart';
import 'package:projectscoid/models/photo.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:projectscoid/views/components/validator.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/views/components/moneywidget.dart';
import 'package:projectscoid/views/components/displaynamewidget.dart';



class OptionWidget extends StatefulWidget {
  List<OptionField?>? value;
  String? hint;
  final bool? required;
  String? caption;
  List<OptionField?>? optiondata = []  ;

  final ValueChanged<List<OptionField?>?>? getValue;
  OptionWidget({Key? key,  this.value, this.caption, this.hint, this.required, this.getValue}) : super(key: key) {
    //Optionname = '';
    // if(contr[2]==)
    if (value != null) {
      if (value!.isEmpty) {
        value = [OptionField('', 0.toString())];

      }
      // if(value.isNotEmpty){
      optiondata?.addAll(value!);

      // }
    }else{
      value = [OptionField('', 0.toString())];
      optiondata!.addAll(value!);
    }
  }
  @override
  State<StatefulWidget> createState() {
    return _OptionStateWidget();
  }

}

class _OptionStateWidget extends State<OptionWidget>{
//  List<OptionField> Optionproperty = []  ;
  bool isvalid = true;
  String errormessage = '';
  bool validation = true;
  String? Optionname;
  bool failed = false;
  int fl = 0;
  String link = '';
//  _OptionStateWidget(widget.optiondata!);

  @override
  initState() {
    super.initState();
  //  print('widget.optiondata! ${widget.optiondata![0].description}');
    //  widget.optiondata!.add(widget.optiondata!1);
    // if ((widget.value !=  null) && (widget.Optionname != '')) {
    //link = widget.Optionname;
    //  }else {
    //   link= '';

    //  setState(() {
    // validation(false);
    //   });
    //  }
  }
  String validateOption(_value, _require) {
    String value = _value;
    bool   require =  _require;
    String result = '' ;
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result = 'No Option selected';
        isvalid= false;
      }
    } else{
      if (value.isEmpty){
        result = '';
        isvalid = true;
      }
    }

    return result;
  }

  List<Widget> _getOptions(){
    List<Widget> OptionsTextFields = [];
    if(widget.optiondata != null){
      for(int i=0; i< widget.optiondata!.length; i++){
        OptionsTextFields.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Expanded(child: OptionValFields(i, widget.optiondata!)),
                  SizedBox(width: 16,),
                  // we need add button at last Options row
                  _addRemoveButton(i == widget.optiondata!.length-1, i),
                ],
              ),
            )
        );
      }
    }

    return OptionsTextFields;
  }
  void  _getvalue(var val){
    widget.getValue!(val);
  }
  /// add / remove button
  Widget _addRemoveButton(bool add, int index){
    return InkWell(
      onTap: (){
        if(add){
          // add text-fields at the top of all Options textfields

          widget.optiondata!.add(OptionField('',0.toString()));
           setState((){

           });
          // _getvalue(widget.optiondata!);
        }
        else {
          widget.optiondata!.removeAt(index);
          // _getvalue(widget.optiondata!);
        }
       // setState((){

       // });
      //  _getvalue(widget.optiondata!);
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon((add) ? Icons.add : Icons.remove, color: Colors.white,),
      ),
    );
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
            child:
            Container(
              // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                alignment: Alignment.center,
                // height: widget.Optionname == '' || widget.Optionname == null ? 140.0 : 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: const Color(0xFF000000), width: 1.0),
                  //color: CurrentTheme.ShadeColor,
                ),
                child :
                Column(
                    children: <Widget>[
                      Validator(
                        value: widget.value == [] || widget.value == null  ? '' : 'widget.value[0].description' ,
                        validator: (value) {
                          errormessage = validateOption( widget.value == [] || widget.value == null ? '' : widget.value![0]!.description, widget.required);
                          if (isvalid) {
                            setState(() {
                              validation = true;
                              _getvalue(widget.optiondata!);
                            });
                            return null;
                          } else {
                            setState(() {
                              validation = false;
                              _getvalue(widget.optiondata!);
                            });
                            return '';
                          }
                        },
                      ),
                      // Expanded( child :
                      Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
                          child: Column(

                            children: <Widget>[
                              ..._getOptions(),
                            ],
                          )


                      ),
                    ]

                )
            )
        ),


      );


  }
}

class OptionValFields extends StatefulWidget {
  final int? index;
  List<OptionField?>? optionproperty;
  OptionValFields(this.index, this.optionproperty);
  @override
  _OptionValFieldsState createState() => _OptionValFieldsState();
}

class _OptionValFieldsState extends State<OptionValFields> {
  // TextEditingController _nameController;
  String? value = '';
  double? value1 = 0 ;
  OptionField? v ;

   TextEditingController? _nameController;

  @override
  void initState() {
    super.initState();

    //  value = widget.optionproperty[widget.index].description ?? '';
  //  print('widget.index== ${widget.index.toString()}');
     _nameController = TextEditingController();
    // _nameController1 = TextEditingController();

  }

  @override
  void dispose() {
    _nameController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    v = widget.optionproperty![widget.index!];
    if(v != null){

      value1 = double.tryParse(widget.optionproperty![widget.index!]!.price! == ''? '0.0' : widget.optionproperty![widget.index!]!.price!)!;
      value = widget.optionproperty![widget.index!]!.description!;
    //  print('value == $value and ${widget.index.toString()}');
    }else{
      value = '';
      value1 = 0;
    }
    _nameController!.text = value!;


    return
      Column(
        children: <Widget>[
          /*
          DisplayNameWidget(
            value: value,
            caption: 'description',
            hint: 'Enter your option',
            required: false,
            getValue: (String val){
              //   value = val;
             setState(() {
                widget.optionproperty[widget.index].description = val;
              });
            } ,

          ),

           */

          ItemListWidget(
              tooltip: 'Send message',
              onPressed: (){
              },
              lines:
              'description',
              lines1:
              '',
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

                      style: TextStyle(color:  CurrentTheme.NormalTextColor, fontSize: 14),

                      decoration: InputDecoration(
                        hintText: 'Enter your option',
                        // hintStyle: TextStyle(color: Colors.grey[500]),
                        hintStyle: TextStyle(color:  CurrentTheme.ShadeColor),
                        //  errorStyle:
                        errorBorder: UnderlineInputBorder(),
                        filled: true,
                        fillColor:  CurrentTheme.BackgroundColor,
                        // focusedErrorBorder: errorBorder,
                        border: OutlineInputBorder(),
                      ),

                      controller: _nameController,
                      onChanged: (v) {
                       // setState(() {
                          widget.optionproperty![widget.index!]!.description = v;
                      //  });
                      },
                        validator: (v){
                        //  if(v.trim().isEmpty) return 'Please enter something';
                          return null;
                          },

                    ),


                  )

                // ]
              )


          ),
          MoneyWidget(
            value: value1,
            caption: 'price',
            hint: 'option price',
            required: false,
            getValue: (double? val){
              setState(() {
                widget.optionproperty![widget.index!]!.price = val.toString();
              });
            },
            min: '0',
            max: '100000000000',
          ),


        ],
      );



  }
}
