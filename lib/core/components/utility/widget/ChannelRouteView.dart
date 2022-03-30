

import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/views/components/validator.dart';




class _ChipsTile extends StatelessWidget {
  const _ChipsTile({
    Key? key,
    this.children,
  }) : super(key: key);


  final List<Widget>? children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[

    ];
    if (children!.isNotEmpty) {
      cardChildren.add(Wrap(
          children: children!.map<Widget>((Widget chip) {
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: chip,
            );
          }).toList()));
    } else {
      final TextStyle textStyle = Theme.of(context).textTheme.caption!.copyWith(fontStyle: FontStyle.italic);
      cardChildren.add(
          Semantics(
            container: true,
            child: Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
              padding: const EdgeInsets.all(1.0),
              child: Text('None', style: textStyle),
            ),
          ));
    }

    return Card(
        semanticContainer: false,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: cardChildren,
        )
    );
  }
}



class ChannelRouteTagsWidget extends StatefulWidget {
  List<int>? value;

  List<Widget>? chips;
  String? hint;
  String? hint1;
  final bool? required;
  String? caption;
  String? oldcaption;
  List<int>? tempValue = [];
  String? checkval;
  List<int>? idroutetags = [];
  List<String>? nameroutetags = [];
  List<String>? routetagsname = [];
  List<String>? urlroutetags  = [];
  final ValueChanged<String>? getValue;



  ChannelRouteTagsWidget({Key? key,  this.value,  this.caption, this.hint, this.required, this.idroutetags, this.nameroutetags,  this.urlroutetags, this.getValue}) : super(key: key){

    if(required!){
      oldcaption = caption;
      caption = caption! + '*';
    }



    for (var  tag in value!) {
      routetagsname!.add(nameroutetags![idroutetags!.indexOf(tag)]);
    }
    if(value!.isEmpty){
      tempValue = [];
      checkval ='';
    }else{
      tempValue!.addAll(value!);
      checkval ='1';
    }


  }


  @override
  State<StatefulWidget> createState(){
    return new _ChannelRouteTagsWidgetState();
  }

}

class _ChannelRouteTagsWidgetState extends State<ChannelRouteTagsWidget> {

  final Set<String> temp = <String>{};
  bool validation = true;
  bool isvalid = true;
  String link = '';
  String errormessage = 'Error.';
  @override
  void initState() {
    // TODO: implement

    super.initState();
  }


  String validateChannelRouteTags(_value, _require) {
    List<int> value = _value;
    bool   require = _require;
    String result = '' ;
    isvalid = true;
    if(require){
      if (value.isEmpty){
        result = 'No List selected';
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




  static Color _nameToColor(String name) {
    assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }

  static String _capitalize(String name) {
    assert(name != null && name.isNotEmpty);
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }

  void _removeTemp(String name) {
    setState(() {
      temp.remove(name);
    });

  }
  void selectitem (String value){

  //  widget.urlroutetags[widget.nameroutetags.indexOf(value)];
   // widget.getValue(widget.idroutetags[widget.nameroutetags.indexOf(value)] );
    widget!.getValue!(widget.urlroutetags![widget.nameroutetags!.indexOf(value)]);
  }

  Future<void> _selectRouteTags(BuildContext context) async {
    List<String> tempRouteTags = [];

  }

  @override
  Widget build (BuildContext context){
    temp.clear();
    temp.addAll(widget!.routetagsname!);

    widget..chips = temp.map<Widget>((String name) {
      return InputChip(
        key: ValueKey<String>(name),
        backgroundColor: _nameToColor(name),
        label: Text(_capitalize(name)),
        onPressed: () {
          setState(() {
           // _removeTemp(name);
          });
          selectitem(name);
        },
      );
    }).toList();

    // InputComponent password;
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children :
        <Widget> [

          new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 1.0),
              child: _ChipsTile( children: widget.chips)
          ),


        ]
    );


  }
}