import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';

const double _kTagsPickerRowHeight = 42.0;
const int _kMaxTagsPickerRowCount = 6; 
const double _kMaxTagsPickerHeight = _kTagsPickerRowHeight * (_kMaxTagsPickerRowCount + 2);
const double _kTagsPickerHeaderPortraitHeight = 100.0;
const double _kTagsPickerHeaderLandscapeWidth = 168.0;
const double _kTagsPickerPortraitWidth = 330.0;
const double _kTagsPickerLandscapeWidth = 344.0;
const double _kDialogActionBarHeight = 52.0;
const double _kTagsPickerLandscapeHeight = _kMaxTagsPickerHeight + _kDialogActionBarHeight;


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
    return  Padding(
        padding: EdgeInsets.only(left: 10.0),
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

class _TagsPickerHeader extends StatelessWidget {
  const _TagsPickerHeader({
    Key? key,
    @required this.tagcaption,
    @required this.orientation,
  }) : assert(tagcaption != null),
       super(key: key);

  final String? tagcaption;

  final Orientation? orientation;


  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme headerTextTheme = themeData.primaryTextTheme;
    Color dayColor;
        switch (themeData.primaryColorBrightness) {
      case Brightness.light:
        dayColor = CurrentTheme.NormalTextColor;
        break;
      case Brightness.dark:
        dayColor =  CurrentTheme.BackgroundColor ;
        break;
    }
    final TextStyle dayStyle = headerTextTheme.caption!.copyWith(color: dayColor, height: 1.4);

    Color backgroundColor;
    switch (themeData.brightness) {
      case Brightness.light:
        backgroundColor = themeData.primaryColor;
        break;
      case Brightness.dark:
        backgroundColor = themeData.backgroundColor;
        break;
    }

    double? width;
    double? height;
    EdgeInsets? padding;
    MainAxisAlignment? mainAxisAlignment;
    switch (orientation) {
      case Orientation.portrait:
        height = _kTagsPickerHeaderPortraitHeight;
        padding = const EdgeInsets.symmetric(horizontal: 16.0);
        mainAxisAlignment = MainAxisAlignment.center;
        break;
      case Orientation.landscape:
        width = _kTagsPickerHeaderLandscapeWidth;
        padding = const EdgeInsets.all(8.0);
        mainAxisAlignment = MainAxisAlignment.start;
        break;
    }



    final Widget dayButton = IgnorePointer(
      ignoringSemantics: false,
      child: Text(tagcaption!, style: dayStyle) ,
    );

    return Container(
      width: width!,
      height: height!,
      padding: padding!,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: mainAxisAlignment!,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[dayButton],
      ),
    );
  }
}

class _EnumDialog extends StatefulWidget {
  const _EnumDialog({
    Key? key,
    this.listtags,
    this.tagscaption,
    this.tagvalue,
  }) : super(key: key);

  final List<String?>? listtags;
  final String? tagscaption;
  final String? tagvalue;
  @override
  _EnumDialogState createState() => _EnumDialogState();
}

class _EnumDialogState extends State<_EnumDialog> {
  @override
  void initState() {
    super.initState();
    setState(() {
      _listtags!.addAll(widget.listtags!);
      _tagscaption = widget.tagscaption;
      _value = _listtags!.indexOf(widget.tagvalue!);
    });

  }
  List<String?>? _listtags = [];
  String?  _tagscaption;
  //List<String> _selectedtags = [];
  String? tag;
  int _value = 0 ;
  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleOk() {
    Navigator.pop(context, tag);
  }
  
  Widget _buildPicker() {
      return (
        ListView.builder(
                itemCount: _listtags!.length,
                itemBuilder: (BuildContext context, int index) {
                  final tagName = _listtags![index];
                  return RadioListTile<int?>(
                        value: index,
                        groupValue: _value,
                        onChanged:(int? value){
                          setState(() {
                             _value = value!;
                             tag = tagName;
                          });
                        },
                        activeColor: Colors.green,
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Text(tagName!),
                       // subtitle: new Text('sub title'),
                      );
                }
                )
     );   
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Widget picker = Flexible(
      child: SizedBox(
        height: _kMaxTagsPickerHeight,
        child: _buildPicker(),
      ),
    );
    final Widget actions = ButtonBarTheme(
      data: const ButtonBarThemeData(
        alignment: MainAxisAlignment.end,
        //buttonMinWidth: 0.9 * width,
      ),
      child: ButtonBar(
        children: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: _handleCancel,
          ),
          FlatButton(
            child: const Text('OK'),
            onPressed: _handleOk,
          ),
        ],
      ),
    );
    final Dialog dialog = Dialog(
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
         final Widget header = _TagsPickerHeader(
            tagcaption: _tagscaption,
            orientation: orientation,
          ); 
          switch (orientation) {
            case Orientation.portrait:
              return SizedBox(
                width: _kTagsPickerPortraitWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    header,
                    Container(
                      color: theme.dialogBackgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          picker,
                          actions,
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case Orientation.landscape:
              return SizedBox(
                height: _kTagsPickerLandscapeHeight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                   // header,
                    Flexible(
                      child: Container(
                        width: _kTagsPickerLandscapeWidth,
                        color: theme.dialogBackgroundColor,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[picker, actions],
                        ),
                      ),
                    ),
                  ],
                ),
              );
          }
        //  return null;
        }
      )
     
    );
   

    return Theme(
      data: theme.copyWith(
        dialogBackgroundColor: Colors.transparent,
      ),
      child: dialog,
    );
  }
}


Future<String?> showEnum({
  @required BuildContext? context,
  @required List<String?>? initialitems,
  @required String? caption,
  String? initvalue,
 // @required List<String> selectedtags,
  TransitionBuilder? builder,

}) async {
  assert(initialitems != null);
  assert(debugCheckHasMaterialLocalizations(context!));

  Widget child = _EnumDialog(
    listtags: initialitems,
    tagscaption: caption,
    tagvalue: initvalue,
    //selectedtags: selectedtags,
  );

  return await showDialog<String>(
    context: context!,
    builder: (BuildContext? context) {
      return builder == null ? child : builder(context!, child);
    },
  );
}
class EnumWidget extends StatefulWidget {

 EnumWidget({ this.value,this.caption, this.hint, this.required, this.idenum, this.nameenum, this.getValue}){
    this.oldcaption = caption;
    if(required!){
      caption = caption! + '*';
    }
   if (value == 0){
     enumname = nameenum![0];
     value = idenum![0];
   }else {
     enumname = nameenum![idenum!.indexOf(value!)];
   }
    //items = getDropDownMenuItems();
  }
  int? value;
  String? enumname;
  String? hint;
  List<String?>? selection = [];
  final bool? required;
  List<int?>? idenum = [];
  List<String?>? nameenum = [];
  String? caption;
  String? oldcaption;
  ValueChanged<int?>? getValue;





 @override
  State<StatefulWidget> createState(){
    return _EnumWidgetState();
  }
}



class _EnumWidgetState extends State<EnumWidget> {
  @override
 //  TextEditingController contr;
 //  _EnumWidgetState(this.contr);
  initState(){
          //  print('value ==== ${widget.value}');
    setState(() {  
      //contr.text = widget._nameenum[widget._idenum.indexOf(widget.value)]; 
     //  widget.selection.clear();
     //  widget.selection.addAll(widget._nameenum);
       
    });

    super.initState();
  }
  void selectitem(int? selecteditem) {
    widget.getValue!(selecteditem!);
  }
  Future<void> _selectitem(BuildContext context) async {
    final String? picked = await showEnum(
        context: context!,
        initialitems: widget.nameenum ,
        caption: widget.oldcaption!,
        initvalue: widget.enumname!,
    );
  //  if (picked != null && picked != widget.contr.text){
      
     // return picked;
        var res = widget.idenum![widget.nameenum!.indexOf(picked)];
        //var res = '33';
       // print('isi===>${res}');
       // selectitem(res);
        setState(() {
          selectitem(res);
        });
     // selectitem(picked);
      // print('isi===>${picked}');
   // }
   // return widget.contr.text;
  }


 @override
  Widget build (BuildContext context){    
    const TextStyle valueStyle = TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 14);
    return
      ItemListWidget(
          tooltip: 'Send message',
          onPressed: (){
          },
          lines:
          widget.caption,
          isdivided: false,
          wgt:
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
                  valueText: widget.enumname,
                  valueStyle: valueStyle,
                  onPressed: (){
                    _selectitem(context);
                  },
                ),
              )
          )


      );
    /*

      Column(
        children : <Widget> [
               // Expanded(
                 Container(
                      child:
                      new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 6.0, 2.0),
                              child:new Text(widget.caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
                             // new Text(widget.caption, style: TextStyle(color: Colors.grey[700], fontSize: 14),),
                            ),
                            new Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                              child:// <Widget>[

                              new Container(
                                // padding: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 0.0),
                                alignment: Alignment.center,
                                height: 45.0,
                                decoration: new BoxDecoration(
                                  color: CurrentTheme.ShadeColor ,
                                ),
                                child : 
                                    _InputDropdown(
                                      valueText: widget.enumname,
                                      valueStyle: valueStyle,
                                      onPressed: (){ 
                                            _selectitem(context);                                                                                     
                                          },
                                    ),
                              ),

                            ),
                          ]

                      )
                  ),
               
              ]
          );

     */
       // ]
   // )


  }


}