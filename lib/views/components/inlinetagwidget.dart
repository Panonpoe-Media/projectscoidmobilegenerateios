import 'package:flutter/material.dart';
import 'package:projectscoid/views/components/validator.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
import 'package:flutter/services.dart';
//import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
const double _kTagsPickerRowHeight = 42.0;
const int _kMaxTagsPickerRowCount = 6; 
const double _kMaxTagsPickerHeight = _kTagsPickerRowHeight * (_kMaxTagsPickerRowCount + 2);

const double _kTagsPickerHeaderPortraitHeight = 100.0;
const double _kTagsPickerHeaderLandscapeWidth = 168.0;
//const Duration _kMonthScrollDuration = Duration(milliseconds: 200);


const double _kTagsPickerPortraitWidth = 330.0;
const double _kTagsPickerLandscapeWidth = 344.0;

const double _kDialogActionBarHeight = 52.0;
const double _kTagsPickerLandscapeHeight = _kMaxTagsPickerHeight + _kDialogActionBarHeight;



class _ChipsTile extends StatelessWidget {
  const _ChipsTile({
    Key? key,
    this.label,
    this.children,
  }) : super(key: key);

  final String? label;
  final List<Widget?>? children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[
      Container(
        padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
        alignment: Alignment.center,
        child: Text(label!, textAlign: TextAlign.start),
      ),
    ];
    if (children!.isNotEmpty) {
      cardChildren.add(Wrap(
        children: children!.map<Widget>((Widget? chip) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
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
            padding: const EdgeInsets.all(8.0),
            child: Text('None', style: textStyle),
          ),
        ));
    }

    return Column(
        mainAxisSize: MainAxisSize.min,
        children: cardChildren,

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





class _TagsPickerHeader1 extends StatelessWidget {
  const _TagsPickerHeader1({
    Key? key,
    @required this.tagcaption,
  }) : assert(tagcaption != null),
        super(key: key);

  final String? tagcaption;



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

    double width;
    double height;
    EdgeInsets padding;
    MainAxisAlignment mainAxisAlignment;
    width = _kTagsPickerPortraitWidth + 300;
    height = _kTagsPickerHeaderPortraitHeight - 50;
    padding = const EdgeInsets.symmetric(horizontal: 16.0);
    mainAxisAlignment = MainAxisAlignment.center;


    final Widget dayButton = IgnorePointer(
      ignoringSemantics: false,
      child: Text(this.tagcaption!, style: dayStyle) ,
    );

    return Container(
      width: width,
      height: height,
      padding: padding,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[dayButton],
      ),
    );
  }
}


class _TagsDialog extends StatefulWidget {
  const _TagsDialog({
    Key? key,
    this.listtags,
    this.tagscaption,
    this.listvalue,
  }) : super(key: key);

  final List<String?>? listtags;
  final String? tagscaption;
  final List<int?>? listvalue;
  @override
  _TagsDialogState createState() => _TagsDialogState();
}

class _TagsDialogState extends State<_TagsDialog> {
  var concatenate =    StringBuffer();


   String? loremIpsum;

     // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  List<int?>? selectedItems = [];
  List<int?>? temp = [];
  final List<DropdownMenuItem?>? items = [];

  bool ok = false;
  ScrollController?  controller;
  @override
  void initState() {
    controller = ScrollController();

    // widget.listtags.forEach((item){
   //   concatenate.write(item + '  ');
   // });
   // loremIpsum = concatenate.toString();
    String wordPair = "";
   // loremIpsum
     //   .toLowerCase()
       // .replaceAll(",", "")
       // .replaceAll(".", "")
      //  .split("  ")
       for (var word in widget.listtags!) {
      items!.add(DropdownMenuItem(
        child: Text(word!),
        value: word,
      ));

    }
    super.initState();
   // temp.addAll(selectedItemsDone);

    _listtags = widget.listtags!;
    _tagscaption = widget.tagscaption!;
  }
  List<String?>? _listtags;
  String?  _tagscaption;
  List<String?>? _selectedtags = [];
  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleOk() {
  //  ok?
        if(temp != []){
          Navigator.pop(context, temp);
        }else{
          Navigator.pop(context, widget.listvalue);
    }


   // Navigator.pop(context,temp );
  }


  Widget _buildPicker() {
      return (
        ListView.builder(
                itemCount: _listtags!.length,
                itemBuilder: (BuildContext context, int index) {
                  final tagName = _listtags![index];
                  return CheckboxListTile(
                      title: Text(tagName!),
                      value: _selectedtags!.contains(tagName),
                      onChanged: (bool? value) {
                        if (value!) {
                          if (!_selectedtags!.contains(tagName)) {
                            setState(() {
                              _selectedtags!.add(tagName);
                            });
                          }
                        } else {
                          if (_selectedtags!.contains(tagName)) {
                            setState(() {
                              _selectedtags!.removeWhere(
                                  (String? city) => city == tagName!);
                            });
                          }
                        }
                      });
                }
                )
     );   
  }

  @override
  Widget build(BuildContext context) {
    selectedItems!.addAll(widget.listvalue!);
    final ThemeData theme = Theme.of(context);
    final Widget picker = Flexible(
      child: Container(
        //height: _kMaxTagsPickerHeight,
        child: _buildPicker(),
      ),
    );
    final Widget actions = ButtonTheme(
      child: ButtonBar(
        children: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: _handleCancel,
          ),

          FlatButton(
            child: Text('OK'),
            onPressed: _handleOk,
          ),


        ],
      ),
    );
    final Widget header = _TagsPickerHeader1(
      tagcaption: _tagscaption,
     // orientation: orientation,
    );


    final Dialog dialog = Dialog(
      child: SizedBox(
        width: _kTagsPickerPortraitWidth + 300,
        child: Column(
         // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end ,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            header,
            Container(
              height: 350,
              width: _kTagsPickerPortraitWidth + 300,
              color: theme.dialogBackgroundColor,
              child:
              SingleChildScrollView(
                controller: controller,
                physics: const AlwaysScrollableScrollPhysics(),
                reverse: false,
                child:
                Container(
                  color: theme.dialogBackgroundColor,
                  child:
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      //
                      /*
                      SearchableDropdown.multiple(
                        items: items,
                        selectedItems: selectedItems,
                        hint: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Pilih $_tagscaption"),
                        ),
                        searchHint: "Pilih $_tagscaption",
                        onChanged: (value) {
                         // selectedItems.clear();
                          setState(() {
                            selectedItems = value;
                           // selectedItems.addAll([1,2]);
                          });
                        },
                        displayItem: (item, selected) {
                          return (Row(children: [
                            selected
                                ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                                : Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 7),
                            Expanded(
                              child: item,
                            ),
                          ]));
                        },
                        selectedValueWidgetFn: (item) {
                          return (Center(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Colors.brown,
                                      width: 0.5,
                                    ),
                                  ),
                                  margin: EdgeInsets.all(12),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(item.toString()),
                                  ))));
                        },

                        doneButton: (selectedItemsDone, doneContext) {
                          return (RaisedButton(
                              onPressed: () {

                                ok = true;

                               // Navigator.pop(doneContext, selectedItemsDone);
                                selectedItems.clear();


                                selectedItems.addAll(selectedItemsDone);
                                temp.addAll(selectedItemsDone);
                                Navigator.pop(doneContext);
                                Navigator.pop(doneContext,temp );
                                setState(() {

                                });
                              },
                              child: Text("Add")));
                        },
                        closeButton: null,
                        style: TextStyle(fontStyle: FontStyle.italic),
                        searchFn: (String keyword, items) {
                          List<int> ret = List<int>();
                          if (keyword != null && items != null && keyword.isNotEmpty) {
                            keyword.split(" ").forEach((k) {
                              int i = 0;
                              items.forEach((item) {
                                if (k.isNotEmpty &&
                                    (item.value
                                        .toString()
                                        .toLowerCase()
                                        .contains(k.toLowerCase()))) {
                                  ret.add(i);
                                }
                                i++;
                              });
                            });
                          }
                          if (keyword.isEmpty) {
                            ret = Iterable<int>.generate(items.length).toList();
                          }
                          return (ret);
                        },
                        clearIcon: Icon(Icons.clear_all),
                        icon: Icon(Icons.arrow_drop_down_circle),
                        label: "",
                        underline: Container(
                          height: 1.0,
                          decoration: BoxDecoration(
                              border:
                              Border(bottom: BorderSide(color: CurrentTheme.PrimaryColor, width: 3.0))),
                        ),
                        iconDisabledColor: Colors.brown,
                        iconEnabledColor: Colors.indigo,
                        isExpanded: false,
                      ),

                       */

                      DropdownSearch<String?>.multiSelection(
                        showSelectedItems: true,
                        showSearchBox: true,
                        compareFn: (i, s) => i == s ,
                        dropdownSearchDecoration:  InputDecoration(
                          labelText: "Pilih $_tagscaption",
                          contentPadding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                          border: const OutlineInputBorder(),
                        ),
                        //onFind: (filter) => getData(filter),
                        items: _listtags,
                        onChanged: (data) {
                          temp = [];
                          for (var dt in data) {
                           int index = _listtags!.indexWhere((element)=>
                              element == dt);
                            if(index != -1){
                              temp?.add(index);
                            }
                          }

                         // print(data);
                        },
                        dropDownButton:
                        ElevatedButton(
                          child: const Text('Add'),
                          onPressed: () {
                            ok = true;

                            // Navigator.pop(doneContext, selectedItemsDone);
                            selectedItems = [];
                            // temp.addAll(iterable);
                            Navigator.pop(context,temp );
                            setState(() {

                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrangeAccent,
                              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                              textStyle:
                              const TextStyle(fontSize: 9, color: Colors.white),
                         ),
                        ),
                        /*
                        RaisedButton(
                          textTheme: ButtonTextTheme.normal,
                          color: Colors.grey,
                          child: const Text('Add', style: TextStyle(color: Colors.white)),
                          onPressed:   () {
                            ok = true;

                            // Navigator.pop(doneContext, selectedItemsDone);
                            selectedItems = [];
                            // temp.addAll(iterable);
                            Navigator.pop(context,temp );
                            setState(() {

                            });
                            },
                        ),

                         */
                        /*
                        RaisedButton(
                              onPressed: () {

                                ok = true;

                                // Navigator.pop(doneContext, selectedItemsDone);
                                selectedItems = [];
                               // temp.addAll(iterable);
                                Navigator.pop(context,temp );
                                setState(() {

                                });
                              },
                              child: const Text("Add", style: TextStyle(color: Colors.black54),)),

                         */

                        // dropdownBuilder: _customDropDownExample,
                        //popupItemBuilder: _customPopupItemBuilderExample2,
                        showFavoriteItems: false,
                       // favoriteItemsAlignment: MainAxisAlignment.start,
                       // favoriteItems: (items) {
                       //   return items.where((e) => e.name.contains("Mrs")).toList();
                      //  },
                        /*
                        favoriteItemBuilder: (context, item, isSelected) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[100]),
                            child: Row(
                              children: [
                                Text(
                                  "${item.name}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.indigo),
                                ),
                                const Padding(padding: EdgeInsets.only(left: 8)),
                                isSelected
                                    ? const Icon(Icons.check_box_outlined)
                                    : Container(),
                              ],
                            ),
                          );
                        },

                         */
                      ),
                      Divider(),


                      // picker,
                     // actions,
                    ],
                  ),
                ),
              ),
            ),
        Container(
          height: 90,
          color: theme.dialogBackgroundColor,
          child:
            actions,
        )
          ],
        ),
      )
      /*
      OrientationBuilder(
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
                    height: 500,
                    child:
                    SingleChildScrollView(
                      controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                      reverse: false,
                      child:
                      Container(
                        color: theme.dialogBackgroundColor,
                        child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //
                            SearchableDropdown.multiple(
                              items: items,
                              selectedItems: selectedItems,
                              hint: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Pilih $_tagscaption"),
                              ),
                              searchHint: "Pilih $_tagscaption",
                              onChanged: (value) {
                                setState(() {
                                  selectedItems = value;
                                });
                              },
                              displayItem: (item, selected) {
                                return (Row(children: [
                                  selected
                                      ? Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                      : Icon(
                                    Icons.check_box_outline_blank,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 7),
                                  Expanded(
                                    child: item,
                                  ),
                                ]));
                              },
                              selectedValueWidgetFn: (item) {
                                return (Center(
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          side: BorderSide(
                                            color: Colors.brown,
                                            width: 0.5,
                                          ),
                                        ),
                                        margin: EdgeInsets.all(12),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(item.toString()),
                                        ))));
                              },

                              doneButton: (selectedItemsDone, doneContext) {
                                return (RaisedButton(
                                    onPressed: () {


                                      Navigator.pop(doneContext);
                                      Navigator.pop(doneContext, selectedItemsDone);
                                      //  setState(() {
                                      //    temp.addAll(selectedItemsDone);
                                      // });
                                    },
                                    child: Text("Add")));
                              },
                              closeButton: null,
                              style: TextStyle(fontStyle: FontStyle.italic),
                              searchFn: (String keyword, items) {
                                List<int> ret = List<int>();
                                if (keyword != null && items != null && keyword.isNotEmpty) {
                                  keyword.split(" ").forEach((k) {
                                    int i = 0;
                                    items.forEach((item) {
                                      if (k.isNotEmpty &&
                                          (item.value
                                              .toString()
                                              .toLowerCase()
                                              .contains(k.toLowerCase()))) {
                                        ret.add(i);
                                      }
                                      i++;
                                    });
                                  });
                                }
                                if (keyword.isEmpty) {
                                  ret = Iterable<int>.generate(items.length).toList();
                                }
                                return (ret);
                              },
                              clearIcon: Icon(Icons.clear_all),
                              icon: Icon(Icons.arrow_drop_down_circle),
                              label: "",
                              underline: Container(
                                height: 1.0,
                                decoration: BoxDecoration(
                                    border:
                                    Border(bottom: BorderSide(color: CurrentTheme.PrimaryColor, width: 3.0))),
                              ),
                              iconDisabledColor: Colors.brown,
                              iconEnabledColor: Colors.indigo,
                              isExpanded: false,
                            ),
                            // picker,
                            actions,
                          ],
                        ),
                      ),
                    ),
                  ),

                  ],
                ),
              );
            case Orientation.landscape:
              return SizedBox(
                height: _kTagsPickerLandscapeHeight + 214,
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
          return null;
        }
      )

       */
     
    );
   

    return Theme(
      data: theme.copyWith(
        dialogBackgroundColor: Colors.transparent,
      ),
      child: dialog,
    );



  }
}

Future<List<int?>?> showTags({
  @required BuildContext? context,
  @required List<String?>? listtags,
  @required String? caption,
  @required List<int?>?listvalue,
 // @required List<String> selectedtags,
  TransitionBuilder? builder,

}) async {
  assert(listtags != null);
  assert(debugCheckHasMaterialLocalizations(context!));

  Widget child = _TagsDialog(
    listtags: listtags,
    tagscaption: caption,
    listvalue: listvalue,
    //selectedtags: selectedtags,
  );

  return await showDialog<List<int?>>(
    context: context!,
    builder: (BuildContext context) {
      return builder == null ? child : builder(context, child);
    },
  );
}

class InlineTagsWidget extends StatefulWidget {
  List<int?>? value;

  List<Widget?>? chips;
  String? hint;
  String? hint1;
  final bool? required;
  String? caption;
  String? oldcaption;
  List<int?>? tempValue = [];
  String? checkval;
  List<int?>? idtags = [];
  List<String?>? nametags = [];
  List<String?>? tagsname = [];
  final ValueChanged<int?>? removeValue;
  final ValueChanged<List<int?>?>? getValue;



  InlineTagsWidget({ this.value,  this.caption, this.hint, this.required, this.idtags, this.nametags, this.removeValue, this.getValue}){

    if(required!){
      oldcaption = caption;
      caption = caption! + '*';
    }


    oldcaption = caption;

      if(value!.isEmpty){
        tempValue = [];
        checkval ='';
      }else{
        for (var  tag in value!) {
          tagsname?.add(nametags![idtags!.indexOf(tag!)]);
        }
        tempValue!.addAll(value!);
        checkval ='1';
      }

   
  }


  @override
  State<StatefulWidget> createState(){
    return _InlineTagsWidgetState();
  }

}

class _InlineTagsWidgetState extends State<InlineTagsWidget> {
 
  late Set<String?> temp = <String>{};
  bool validation = true;
  bool isvalid = true;
  String link = '';
  String? errormessage = '';
 @override
  void initState() {
    // TODO: implement 
   
    super.initState();
  }


  String? validateInlineTags( List<int?>? _value,bool? _require) {
    List<int?>? value = _value;
    bool?   require = _require;
    String? result = '' ;
    isvalid = true;
    if(require!){
      if (value!.isEmpty){
        result = 'No List selected';
        isvalid= false;
      }
    } else{
      if (value!.isEmpty){
        result = null;
        isvalid = true;
      }
    }

    return result;
  }


  void additem (List<int?>? value){
    widget.getValue!(value!);
  }

    static Color _nameToColor(String name) {
    assert(name.length > 1);
  //  final int hash = name.hashCode & 0xffff;
  //  final double hue = (360.0 * hash / (1 << 15)) % 360.0;
  //  return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
    return CurrentTheme.BackgroundColor;
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
  void removeitem (String? value){
      if(!widget!.nametags!.contains(value!)){
                      widget.nametags!.add(value);
                     widget.nametags!.sort((a, b) {
                          return a!.toLowerCase().compareTo(b!.toLowerCase());
                        });
        }

        widget.removeValue!(widget.idtags![widget.nametags!.indexOf(value!)] );
  }

  Future<void> _selectTags(BuildContext context) async {
    List<String?>? temptags = [];
    List<int?>? val = [];
   //  setState(() {
      temptags.addAll(widget.nametags!);
  //  });
    widget.value?.forEach((element) {
      val.add(widget.idtags?.indexOf(element));
    });

    for (var tag in temptags) {
          if(widget!.tagsname!.contains(tag!)){
            widget.tagsname!.removeAt(widget.tagsname!.indexOf(tag));
          }
    }

    final List<int?>? tags = await showTags(
        context: context,
        listtags: widget.nametags,
        caption: widget.oldcaption,
        listvalue: val,
    );
   int? totaltag = widget.tagsname!.length + tags!.length;
   List<int?>? temp = [];
   //print('tag====${tags}');
   if (totaltag < 11){
      // this.contr1.addAll(tags);
     for(var tag in tags){
     //  temp.add(tag) ;
       temp.add(widget.idtags![tag!]) ;
/*
       if(widget.value.contains(widget.idtags[tag])){
         temp.add(widget.idtags[tag]) ;
       }else{
         temp.add(widget.idtags[tag]) ;
       }

 */

     //   temp.add(widget.idtags[widget.nametags.indexOf(tag)]) ;
      }
     // widget.value.addAll(temp);
      setState(() {     
        additem (temp);
      });
       
    } 
  }  

  @override
  Widget build (BuildContext context){
     temp.clear();
   // temp.addAll(widget!.tagsname!);
   // temp.addAll(widget!.tagsname!);
     temp = {...widget!.tagsname!};
     widget.chips = temp.map<Widget>((String? name) {
      return Chip(
        key: ValueKey<String?>(name!),
        shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
       // backgroundColor: _nameToColor(name),
        label: Text(_capitalize(name)),
        onDeleted: () { 
          setState(() {
            _removeTemp(name);
          });
            removeitem(name);
        },
      );
    }).toList();
 
   // InputComponent password;
    return
      ItemListWidget(
        tooltip: 'Send message',
        onPressed: (){
        },
        lines:
        widget.caption,
        lines1:
        errormessage??'',
        isdivided: false,
        wgt:
        Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
        child:  Container(
          // padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            alignment: Alignment.center,
            //  height: widget.filename == '' || widget.filename == null ? 150.0 : 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: const Color(0xFF000000), width: 0.5),
              //color: CurrentTheme.ShadeColor,
            ),
            child :
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children :

                <Widget> [

                  Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                      child: _ChipsTile(label: 'Maksimal '+ widget.oldcaption! + ' yang bisa dipilih adalah 10 '+ widget.oldcaption! + '.', children: widget.chips)
                  ),
                  Validator(
                    value: widget.checkval! ,
                    validator: (value) {
                      errormessage = validateInlineTags(widget.tempValue, widget.required);
                      if (isvalid) {
                        setState(() {
                          validation = true;
                        });
                        return null;
                      } else {
                        setState(() {
                          validation = false;
                        });
                        return '';
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                    child:
                    ButtonTheme(
                      child: ButtonBar(
                        alignment : MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton(
                            textTheme: ButtonTextTheme.normal,
                            color: Colors.grey,
                            child: Text('Pilih ${widget.oldcaption}', style: TextStyle(color: Colors.white)),
                            onPressed:   () { _selectTags(context); },
                          ),

                        ],
                      ),
                    ),
                  ),

                ]
            )
        ),

        ),



      );

    /*
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : 
        
         <Widget> [
           new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14.0, 8.0, 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(widget.caption, style: TextStyle(color: CurrentTheme.DisableTextColor, fontSize: 18),),
                  validation? Text(''): new Text(errormessage, style: TextStyle(color: CurrentTheme.ErrorColor, fontSize: 14), textAlign: TextAlign.right),
                ],)
           ),

           new Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),          
            child: _ChipsTile(label: 'Maksimal '+ widget.oldcaption + ' yang bisa dipilih adalah 10 '+ widget.oldcaption + '.', children: widget.chips)
           ),
           Validator(
             value: widget.checkval ,
             validator: (value) {
               errormessage = validateInlineTags(widget.tempValue, widget.required);
               if (isvalid) {
                 setState(() {
                   validation = true;
                 });
                 return null;
               } else {
                 setState(() {
                   validation = false;
                 });
                 return '';
               }
             },
           ),
           new Padding(
            padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0), 
            child: 
                ButtonTheme(
                  child: ButtonBar(
                    alignment : MainAxisAlignment.end,
                     children: <Widget>[
                      RaisedButton(
                            textTheme: ButtonTextTheme.normal,
                            color: CurrentTheme.ShadeColor,
                            child: Text('Pilih ${widget.oldcaption}', style: TextStyle(color: Colors.white)),
                            onPressed:   () { _selectTags(context); },
                            ),

                      ],
                    ),
                ),
           ),
 
         ] 
    );

     */


  }
}