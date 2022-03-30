import 'package:flutter/material.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/models/selection.dart';



const double _kTagsPickerRowHeight = 42.0;
const int _kMaxTagsPickerRowCount = 6;
const double _kMaxTagsPickerHeight = _kTagsPickerRowHeight * (_kMaxTagsPickerRowCount + 2);
const double _kTagsPickerHeaderPortraitHeight = 100.0;
const double _kTagsPickerHeaderLandscapeWidth = 168.0;
const double _kTagsPickerPortraitWidth = 330.0;
const double _kTagsPickerLandscapeWidth = 344.0;
const double _kDialogActionBarHeight = 52.0;
const double _kTagsPickerLandscapeHeight = _kMaxTagsPickerHeight + _kDialogActionBarHeight;



Future<String?> showSearchSelectDialog({
  @required BuildContext? context,
  @required List<Selection?>? initialitems,
  @required String? caption,
  Selection? initvalue,
  // @required List<String> selectedtags,
  TransitionBuilder? builder,

}) async {
  assert(initialitems != null);
  assert(debugCheckHasMaterialLocalizations(context!));

  Widget child = SearchSelectDialog(
    listtags: initialitems!,
    tagscaption: caption!,
    tagvalue: initvalue!,
    //selectedtags: selectedtags,
  );

  return await showDialog<String?>(
    context: context!,
    builder: (BuildContext? context) {
      return builder == null ? child : builder(context!, child);
    },
  );
}

class SearchSelectDialog extends StatefulWidget {
  const SearchSelectDialog({
    Key? key,
    this.listtags,
    this.tagscaption,
    this.tagvalue,
  }) : super(key: key);

  final List<Selection?>? listtags;
  final String? tagscaption;
  final Selection? tagvalue;
  @override
  SearchSelectDialogState createState() => SearchSelectDialogState();
}

class SearchSelectDialogState extends State<SearchSelectDialog> {
  @override
  void initState() {
    super.initState();
    setState(() {
      _listtags!.addAll(widget.listtags!);
      _tagscaption = widget.tagscaption!;
      _value = _listtags!.indexOf(widget.tagvalue);
    });

  }
  List<Selection?>? _listtags = [];
  String?  _tagscaption;
  //List<String> _selectedtags = [];
  String? tag;
  int? _value = 0 ;
  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleOk() {
    print('debug url == ${_listtags![_value!]?.url}');
    Navigator.pop(context, tag);
    if(_listtags![_value!]!.url!.contains('&order=')){
    if(_listtags![_value!]!.url!.contains('/user/my_projects/show_bids')){


        AppProvider.getRouter(context)?.navigateTo(context, urlToRouteSp(_listtags![_value!]!.url!));

      }else{
      AppProvider.getRouter(context)?.navigateTo(context, urlToRoute(_listtags![_value!]!.url!));
    }

    }else{
      AppProvider.getRouter(context)?.navigateTo(context, urlToRoute(_listtags![_value!]!.url!));
    }


  }

  Widget _buildPicker() {
    return (
        ListView.builder(
            itemCount: _listtags!.length,
            itemBuilder: (BuildContext context, int index) {
              final tagName = _listtags![index]?.text;
              return RadioListTile(
                value: index,
                groupValue: _value,
                onChanged:(value){
                  setState(() {
                    _value = value as int?;
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
    final Widget actions = ButtonTheme(
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
              assert(orientation != null);
              final Widget header = _TagsPickerHeader(
                tagcaption: _tagscaption!,
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
              //return null;
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
    final TextStyle dayStyle = headerTextTheme.subtitle1!.copyWith(color: dayColor, height: 1.4);

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
