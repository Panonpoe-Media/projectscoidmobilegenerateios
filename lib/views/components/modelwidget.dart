import 'package:flutter/material.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/app/Env.dart';

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
    return InkWell(
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
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(valueText!, style: valueStyle),
            ),

            Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade700 : Colors.white70
            ),
          ],
        ),
      ),
    );
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
        dayColor = CurrentTheme.NormalTextColor ;
        break;
      case Brightness.dark:
        dayColor =  CurrentTheme.BackgroundColor;
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
      width: width,
      height: height,
      padding: padding,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: mainAxisAlignment!,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[dayButton],
      ),
    );
  }
}

class _ModelDialog extends StatefulWidget {
  const _ModelDialog({
    Key? key,
    this.listtags,
    this.tagscaption,
    this.tagvalue,
  }) : super(key: key);

  final List<String?>? listtags;
  final String? tagscaption;
  final String? tagvalue;
  @override
  _ModelDialogState createState() => _ModelDialogState();
}

class _ModelDialogState extends State<_ModelDialog> {
  @override
  void initState() {
    super.initState();
    setState(() {
      _listtags!.addAll(widget.listtags!);
      _tagscaption = widget.tagscaption;
      _value = _listtags!.indexOf(widget.tagvalue); 
    });

  }
  List<String?>? _listtags = [];
  String?  _tagscaption;
  //List<String> _selectedtags = [];
  String? tag;
  int? _value = 0 ;
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
                  return RadioListTile(
                        value: index,
                        groupValue: _value,
                        onChanged:(int? value){
                          setState(() {
                             _value = value;
                             tag = tagName;
                          });
                        },
                        activeColor: Colors.green,
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Text(tagName!),
                       // subtitle: Text('sub title'),
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
      data: ButtonBarThemeData(
        alignment: MainAxisAlignment.end,
        //buttonMinWidth: 0.9 * width,
      ),
      child: ButtonBar(
        children: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: _handleCancel,
          ),
          TextButton(
            child: Text('OK'),
            onPressed: _handleOk,
          ),
        ],
      ),
    );
    final Dialog dialog = Dialog(
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          assert(orientation != null);
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


Future<String?> showModel({
  @required BuildContext? context,
  @required List<String?>? initialitems,
  @required String? caption,
  String? initvalue,
 // @required List<String> selectedtags,
  TransitionBuilder? builder,

}) async {
  assert(initialitems != null);
  assert(debugCheckHasMaterialLocalizations(context!));

  Widget? child = _ModelDialog(
    listtags: initialitems,
    tagscaption: caption,
    tagvalue: initvalue,
    //selectedtags: selectedtags,
  );

  return await showDialog<String>(
    context: context!,
    builder: (BuildContext? context) {
      return builder == null ? child! : builder(context!, child!);
    },
  );
}


class ModelWidget extends StatefulWidget {

 ModelWidget({ this.value,this.caption, this.hint, this.required, this.idenum, this.nameenum, this.getValue}){
    oldcaption = caption!;
    if(required!){
      caption = caption! + '*';
    }
   // _idenum.clear();

 if( idenum!.contains(value!)){
   enumname = nameenum![idenum!.indexOf(value)];

 }else{
 if(!idenum!.contains(0)){
   enumname = '';
 }else{
   enumname = nameenum![idenum!.indexOf(0)];
 }

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
    return _ModelWidgetState();
  }
}


class _ModelWidgetState extends State<ModelWidget> {
  @override
 //  TextEditingController contr;
 //  _ModelWidgetState(this.contr);
  initState(){
         //   print('value ==== ${widget.value}');
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
    final String? picked = await showModel(
        context: context,
        initialitems: widget.nameenum,
        caption: widget.oldcaption,
        initvalue: widget.enumname,
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
   final TextStyle valueStyle = const TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 14);
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
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 6.0, 2.0),
                              child:Text(widget.caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
                             // Text(widget.caption, style: TextStyle(color: Colors.grey[700], fontSize: 14),),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 0.0),
                              child:// <Widget>[

                              Container(
                                // padding: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 0.0),
                                alignment: Alignment.center,
                                height: 45.0,
                                decoration: BoxDecoration(
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


class Local{
  int id;
  List<int> listId;
  List<String> listStr;
  List<int> listId1;
  List<String> listStr1;
  List<int> listId2;
  List<String> listStr2;
  List<int> listId3;
  List<String> listStr3;
  Local(
      this.id,
      this.listId,
      this.listStr,
      this.listId1,
      this.listStr1,
      this.listId2,
      this.listStr2,
      this.listId3,
      this.listStr3,
      );
}


class ModelLocalWidget extends StatefulWidget {

  ModelLocalWidget({ this.value,this.caption, this.hint, this.required, this.idenum, this.nameenum, this.idLocalType, this.getValue}){
    this.oldcaption = caption!;
    if(this.required!){
      this.caption = this.caption! + '*';
    }
    // _idenum.clear();

    if( idenum!.contains(value!)){
      enumname = nameenum![idenum!.indexOf(value!)];

    }else{

      //enumname = nameenum[idenum.indexOf(0)];
      if(idenum!.isEmpty ){
        enumname = 'None';
      }else{
        enumname = 'Select Kelurahan';
      }

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
  int? idLocalType;
  ValueChanged<Local?>? getValue;

  @override
  State<StatefulWidget> createState(){
    return _ModelLocalWidgetState();
  }
}


class _ModelLocalWidgetState extends State<ModelLocalWidget> {
  @override
  //  TextEditingController contr;
  //  _ModelWidgetState(this.contr);
  initState(){
    //   print('value ==== ${widget.value}');
    setState(() {
      //contr.text = widget._nameenum[widget._idenum.indexOf(widget.value)];
      //  widget.selection.clear();
      //  widget.selection.addAll(widget._nameenum);

    });

    super.initState();
  }
  void selectitem(Local? selecteditem) {
    widget.getValue!(selecteditem!);
  }
  Future<void> _selectitem(BuildContext context) async {
    final String? picked = await showModel(
      context: context,
      initialitems: widget.nameenum,
      caption: widget.oldcaption,
      initvalue: widget.enumname,
    );

    Local lcl;
    //  if (picked != null && picked != widget.contr.text){

    // return picked;
    var res = widget.idenum![widget.nameenum!.indexOf(picked)];



    //var res = '33';
    // print('isi===>${res}');
    // selectitem(res);
    List<int> iddata = [];
    List<String> namedata = [];
    List<int> iddata1 = [];
    List<String> namedata1 = [];
    List<int> iddata2 = [];
    List<String> namedata2 = [];
    List<int> iddata3 = [];
    List<String> namedata3 = [];
    SubModelController ctr;
    SubModelController ctr1;
    SubModelController ctr2;
    SubModelController ctr3;
    String url = '';
    switch(widget.idLocalType){
      case 0 :
        {
           if((res == 104)) {
             url = '/user/my_profile/json?model=country_id&id=';


             String sendPath = Env.value!.baseUrl! +
                 url + res.toString();
             ctr = SubModelController(
                 AppProvider.getApplication(context),
                 sendPath,
                 null);

             var prov = await ctr.getData();
             int count = 0;
             for (var item in prov['rows']) {
               iddata.add(int.parse(prov['rows'][count]['id']));
               count ++;
             }
             count = 0;
             for (var item in prov['rows']) {
               namedata.add(prov['rows'][count]['name'] as String);
               count ++;
             }

             url = '/user/my_profile/json?model=provinsi_id&id=';


             sendPath = Env.value!.baseUrl! +
                 url + iddata[1].toString();
             ctr1 = SubModelController(
                 AppProvider.getApplication(context),
                 sendPath,
                 null);

             var prov1 = await ctr1.getData();
             int count1 = 0;
             for (var item in prov1['rows']) {
               iddata1.add(int.parse(prov1['rows'][count1]['id']));
               count1 ++;
             }
             count1 = 0;
             for (var item in prov1['rows']) {
               namedata1.add(prov1['rows'][count1]['name'] as String);
               count1 ++;
             }
             url = '/user/my_profile/json?model=kabupaten_id&id=';

             sendPath = Env.value!.baseUrl! +
                 url + iddata1[1].toString();
             ctr2 = SubModelController(
                 AppProvider.getApplication(context),
                 sendPath,
                 null);

             var prov2 = await ctr2.getData();
             int count2 = 0;
             for (var item in prov2['rows']) {
               iddata2.add(int.parse(prov2['rows'][count2]['id']));
               count2 ++;
             }
             count2 = 0;
             for (var item in prov2['rows']) {
               namedata2.add(prov2['rows'][count2]['name'] as String);
               count2 ++;
             }


             url = '/user/my_profile/json?model=kecamatan_id&id=';
             sendPath = Env.value!.baseUrl! +
                 url + iddata2[1].toString();
             ctr3 = SubModelController(
                 AppProvider.getApplication(context),
                 sendPath,
                 null);

             var prov3 = await ctr3.getData();
             int count3 = 0;
             for (var item in prov3['rows']) {
               iddata3.add(int.parse(prov3['rows'][count3]['id']));
               count ++;
             }
             count3 = 0;
             for (var item in prov3['rows']) {
               namedata3.add(prov3['rows'][count3]['name'] as String);
               count1 ++;
             }
           }
        }
      break;
      case 1 :{

        url = '/user/my_profile/json?model=provinsi_id&id=';

        String sendPath = Env.value!.baseUrl! +
            url + res.toString();
        ctr = SubModelController(
            AppProvider.getApplication(context),
            sendPath,
            null);

        var prov = await ctr.getData();
        int count = 0;
        for (var item in prov['rows']) {
          iddata.add(int.parse(prov['rows'][count]['id']));
          count ++;
        }
        count = 0;
        for (var item in prov['rows']) {
          namedata.add(prov['rows'][count]['name'] as String);
          count ++;
        }


        url = '/user/my_profile/json?model=kabupaten_id&id=';

        sendPath = Env.value!.baseUrl! +
            url + iddata[1].toString();
        ctr1 = SubModelController(
            AppProvider.getApplication(context),
            sendPath,
            null);

        var prov1 = await ctr1.getData();
        int count1 = 0;
        for (var item in prov1['rows']) {
          iddata1.add(int.parse(prov1['rows'][count1]['id']));
          count1 ++;
        }
        count1 = 0;
        for (var item in prov1['rows']) {
          namedata1.add(prov1['rows'][count1]['name'] as String);
          count1 ++;
        }

        url = '/user/my_profile/json?model=kecamatan_id&id=';
        sendPath = Env.value!.baseUrl! +
            url + iddata1[1].toString();
        ctr2 = SubModelController(
            AppProvider.getApplication(context),
            sendPath,
            null);

        var prov2 = await ctr2.getData();
        int count2 = 0;
        for (var item in prov2['rows']) {
          iddata2.add(int.parse(prov2['rows'][count2]['id']));
          count2 ++;
        }
        count2 = 0;
        for (var item in prov2['rows']) {
          namedata2.add(prov2['rows'][count2]['name'] as String);
          count2 ++;
        }

      }
      break;
      case 2 :{
        url = '/user/my_profile/json?model=kabupaten_id&id=';

        String sendPath = Env.value!.baseUrl! +
            url + res.toString();
        ctr = SubModelController(
            AppProvider.getApplication(context),
            sendPath,
            null);

        var prov = await ctr.getData();
        int count = 0;
        for (var item in prov['rows']) {
          iddata.add(int.parse(prov['rows'][count]['id']));
          count ++;
        }
        count = 0;
        for (var item in prov['rows']) {
          namedata.add(prov['rows'][count]['name'] as String);
          count ++;
        }




        url = '/user/my_profile/json?model=kecamatan_id&id=';
        sendPath = Env.value!.baseUrl! +
            url + iddata[1].toString();
        ctr1 = SubModelController(
            AppProvider.getApplication(context),
            sendPath,
            null);

        var prov1 = await ctr1.getData();
        int count1 = 0;
        for (var item in prov1['rows']) {
          iddata1.add(int.parse(prov1['rows'][count1]['id']));
          count1 ++;
        }
        count1 = 0;
        for (var item in prov1['rows']) {
          namedata1.add(prov1['rows'][count1]['name'] as String);
          count1 ++;
        }
      }
      break;
      case 3 :{
        url = '/user/my_profile/json?model=kecamatan_id&id=';
        String sendPath = Env.value!.baseUrl! +
            url + res.toString();
        ctr = SubModelController(
            AppProvider.getApplication(context),
            sendPath,
            null);

        var prov = await ctr.getData();
        int count = 0;
        for (var item in prov['rows']) {
          iddata.add(int.parse(prov['rows'][count]['id']));
          count ++;
        }
        int count1 = 0;
        for (var item in prov['rows']) {
          namedata.add(prov['rows'][count1]['name'] as String);
          count1 ++;
        }
      }
      break;
      default :{
        url = '/user/my_profile/json?model=country_id&id=';
      }
      break;
    }








    (((widget.idLocalType == 0) && (res != 104))|| (widget.idLocalType == 4) )? lcl = Local(res!,[], [] ,[], [],[], [],[], []) : lcl = Local(res!,iddata, namedata ,iddata1, namedata1 ,iddata2, namedata2 ,iddata3, namedata3) ;

    setState(() {

      selectitem(lcl);
    });
    // selectitem(picked);
    // print('isi===>${picked}');
    // }
    // return widget.contr.text;
  }


  @override
  Widget build (BuildContext context){
    final TextStyle valueStyle = TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 14);
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
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 6.0, 2.0),
                              child:Text(widget.caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
                             // Text(widget.caption, style: TextStyle(color: Colors.grey[700], fontSize: 14),),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 0.0),
                              child:// <Widget>[

                              Container(
                                // padding: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.fromLTRB(8.0, 2.0, 6.0, 0.0),
                                alignment: Alignment.center,
                                height: 45.0,
                                decoration: BoxDecoration(
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