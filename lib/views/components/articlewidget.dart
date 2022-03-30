import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:markdown/markdown.dart' as markdown;
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/utility/widget/widget_function.dart';
//import 'package:zefyr/zefyr.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:quill_delta/quill_delta.dart';
import 'package:quill_format/quill_format.dart';
import 'package:zefyrka/zefyrka.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_emoji/flutter_emoji.dart';
//import 'package:notus/notus.dart';
//import 'package:notustohtml/notustohtml.dart';
import 'package:projectscoid/core/components/utility/tool/notustohtml.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_html/style.dart';
import 'package:projectscoid/views/components/validator.dart';
import 'package:image_picker/image_picker.dart' as im;
import 'forms_decorated_field.dart';
import 'layout.dart';
import 'layout_expanded.dart';
import 'layout_scrollable.dart';
import 'settings.dart';
import 'package:html/parser.dart';
import 'dart:io';

const double _kTagsPickerRowHeight = 42.0;
const int _kMaxTagsPickerRowCount = 6;
const double _kMaxTagsPickerHeight = _kTagsPickerRowHeight * (_kMaxTagsPickerRowCount + 2);
const double _kTagsPickerHeaderPortraitHeight = 100.0;
const double _kTagsPickerHeaderLandscapeWidth = 168.0;
const double _kTagsPickerPortraitWidth = 330.0;
const double _kTagsPickerLandscapeWidth = 344.0;
const double _kDialogActionBarHeight = 52.0;
const double _kTagsPickerLandscapeHeight = _kMaxTagsPickerHeight + _kDialogActionBarHeight;



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
    final TextStyle? dayStyle = headerTextTheme.caption?.copyWith(color: dayColor, height: 1.4);

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

class EditorDialog extends StatefulWidget {
  const EditorDialog({
    Key? key,

    this.tagscaption,
    this.value,
  }) : super(key: key);


  final String? tagscaption;
  final String? value;
  @override
  EditorDialogState createState() => EditorDialogState();
}

class EditorDialogState extends State<EditorDialog> {

  ZefyrController? _controller;
  /// Zefyr editor like any other input field requires a focus node.
  FocusNode? _focusNode;
  final converter = const NotusHtmlCodec();
  Settings? _settings;

  void _handleSettingsLoaded(Settings value) {
    setState(() {
      _settings = value;
      _loadDocument();
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {

      _tagscaption = widget.tagscaption!;
      _focusNode = FocusNode();
        oldValue = widget.value!;
      print('widget value == ${widget.value}');
      Settings.load().then(_handleSettingsLoaded);
      /*
      _loadDocument().then((document) {
        setState(() {
          _controller = ZefyrController(document);
        });
      });

       */

      //_value = _listtags.indexOf(widget.tagvalue);
    });

  }
  List<String> _listtags = [];
  String?  _tagscaption;
  String? oldValue;
  //List<String> _selectedtags = [];
  String? tag;
  int _value = 0 ;
  void _handleCancel() {
    Navigator.pop(context,oldValue);
  }
  void showKB(bool show){

  }
  void _handleOk() {
    if(_controller?.document.toPlainText() == "\n"){
     // print('hereeeeee   ${_controller.document}');
      Navigator.pop(context, '');
    }else{
      //print('hereeeeee123  ');
         // print('jadi ==== ${converter.encode(_controller.document.toDelta()).replaceAll('<br><br>', '<br>')}');
          Navigator.pop(context, converter.encode(_controller!.document!.toDelta()).replaceAll('<br><br>', ' <br>').replaceAll('<br>', ' <br>'));
    }

  }

  Future<void> _loadDocument() async {

    final Delta delta = Delta()..insert("\n");
   // return NotusDocument.fromDelta(delta);
    print('widget value == ${widget.value}');
    if(widget.value == null || widget.value == ''){
    // print('test1');
      //return NotusDocument.fromDelta(delta);
      setState(() {
        _controller = ZefyrController(NotusDocument.fromDelta(delta));
      });
    }else{
    //  print('test2');
      //print('widget value == ${widget.value}');
      //return NotusDocument.fromDelta(delta);
      var temp = widget.value;
    //  String temp1 = 'Just an ordinary man... <br><img src="https://upload.projects.co.id/upload/usr581611/202005105eb78872a38a8.jpg"><br>Wah mantap kumpul2.<br>';
     // String temp1 = 'Just an ordinary man... <br><img src="https://upload.projects.co.id/upload/usr581611/202005105eb78872a38a8.jpg"><br>Wah mantap kumpul2.<br>';
      //  String temp1 = 'Just an ordinary man... <br><img src="https://upload.projects.co.id/upload/usr581611/202005105eb78872a38a8.jpg">​<br>Wah mantap kumpul2.<br>';
      // Just an ordinary man... <img src="https://upload.projects.co.id/upload/usr581611/202005105eb78872a38a8.jpg"><br>Wah mantap kumpul2.
     // print('widget temp == ${temp.replaceAll('<br><div><br></div>', '').replaceAll('<div><br></div>', '').replaceAll('</div>', '').replaceAll('<div>', '<br>')}');
     // print('widget temp1 == $temp1');
     // return NotusDocument.fromDelta(converter.decode(temp1));
     /*
      var doc = parse(widget.value);
      var str;
        int count = 0;
        doc.children.forEach((element) {
          if(element.localName == 'img'){
            str = doc.children[count].remove().toString();
          }
          count ++;

        });
      print('ini string $str');

      */

    //  temp = 'dfdsfdsf​<br>​<br>​<br>gfhghfghgfh</br>';
      print('ini temp dari article $temp');


      setState(() {
       // _controller = ZefyrController(NotusDocument.fromDelta(converter.decode('Just an ordinary man...\u00a0<br><br>User saya iggy_budiman<br>Wah mantap kumpul2.<br>Makan2<br>')));
        //<p>Saya seorang Wiraswasta yang bergerak dibidang IT. Nantikan project-project dari saya.<br></p><p><img src="https://upload.projects.co.id/upload/usr801711/202006185eea725f062f1.jpg" alt="202006185eea725f062f1.jpg"><br></p>

        //<p>Just an ordinary man... <br><img src="https://upload.projects.co.id/upload/usr581611/202005105eb78872a38a8.jpg" alt="202005105eb78872a38a8.jpg">​<br>User saya iggy_budiman<br>Wah mantap kumpul2.<br>Makan2<br>
        // _controller = ZefyrController(NotusDocument.fromDelta(converter.decode('Just an ordinary man...<br><p><img src=\"https:\/\/upload.projects.co.id\/upload\/usr581611\/202005105eb78872a38a8.jpg\" alt=\"202005105eb78872a38a8.jpg\"><br></p>User saya iggy_budiman<br>Wah mantap kumpul2.<br>Makan2<br>')));
         _controller = ZefyrController(NotusDocument.fromDelta(converter.decode(temp!.replaceAll('<br><div><br></div>', '').replaceAll('<div><br></div>', '').replaceAll('</div>', '').replaceAll('<div>', '​<br>').replaceAll('​<br>', '<br>').replaceAll('jpg">', 'jpg"></p>').replaceAll('<img', '<p><img').replaceAll('png">', 'png"></p>'))));

      //   _controller = ZefyrController(NotusDocument.fromDelta(converter.decode(temp)));

      });

     // return NotusDocument.fromDelta(converter.decode(temp.replaceAll('<br><div><br></div>', '').replaceAll('<div><br></div>', '').replaceAll('</div>', '').replaceAll('<div>', '<br>').replaceAll('​<br>', '<br>')));
    }


  //  return NotusDocument;

  }



  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Widget picker = Container(
       // height: _kMaxTagsPickerHeight,
        child: (_controller == null)
            ? Center(child: CircularProgressIndicator()):
              ZefyrEditor(
          scrollPhysics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
         // onShow: showKB,
          // isShowEmoji: widget.isEmoji,
          autofocus: true ,
          controller: _controller!,
          focusNode: _focusNode,
         // embedBuilder: MyAppZefyrImageDelegate(),

        ),

    );
    final Widget actions = ButtonBarTheme(
      data: ButtonBarThemeData(
        alignment: MainAxisAlignment.end,
        //buttonMinWidth: 0.9 * width,
      ),
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
    final Dialog dialog = Dialog(
        child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              final Widget header = _TagsPickerHeader(
                tagcaption: _tagscaption,
                orientation: orientation,
              );
              switch (orientation) {
                case Orientation.portrait:
                  return Container(
                  //  width: _kTagsPickerPortraitWidth,
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
                  return Container(
                   // height: _kTagsPickerLandscapeHeight,
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
    /*
    final Widget body = (_controller == null)
        ? Center(child: CircularProgressIndicator())
        :


    ZefyrScaffold(

      //  child:

      // Stack(
      //   children: <Widget>[
      //    Positioned.fill(
      /*
      child : EmojiPicker(
        rows: 3,
        columns: 7,
        buttonMode: ButtonMode.MATERIAL,
        recommendKeywords: ["racing", "horse"],
        numRecommended: 10,
        onEmojiSelected: (emoji, category) {
           print(emoji);
       },
    ) ,

       */

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /*
                Text(_tagscaption),
                Divider(
                  thickness: 3.0,
                ),

           */
                Expanded(
                //  flex: 8,
                  child: picker,
                ),
                /*
                Expanded(
                  flex: 2,
                  child:  actions,
                )

                 */

        ],
      ),
      //dialog
    );

     */

    return SettingsProvider(
      settings: _settings!,
      child:
        WillPopScope(

        onWillPop:()async{
          Navigator.pop(context,oldValue);
      return false;
    },
    child:
      PageLayout(
        appBar:   AppBar(
          automaticallyImplyLeading: false,
          title:
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: _handleCancel,
                  child:
                  const Padding(padding: EdgeInsets.only(right: 6.0),
                    child: Icon(Icons.arrow_back,
                        color: Colors.white),

                  ),
                ),
                Text(widget.tagscaption!, style: const TextStyle(color: Colors.white),),
              ]
          ),

          actions: <Widget>[
            TextButton(
              child: const Text("Save", style: TextStyle(color: Colors.white),),
              onPressed: _handleOk,
             // style: CurrentTheme.PrimaryColor,

            ),



          ],
        ),
        menuBar: Material(
          color: Colors.grey.shade800,
          child: _buildMenuBar(context),
        ),
        body: (_controller == null)
            ? const Center(child: CircularProgressIndicator()) : _buildWelcomeEditor(context),
      ),
        )
    );


/*

    return Scaffold(

     appBar:
     AppBar(
                automaticallyImplyLeading: false,
                 title:
                 Row(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     GestureDetector(
                       onTap: _handleCancel,
                       child:
                       Padding(padding: EdgeInsets.only(right: 6.0),
                         child: Icon(Icons.arrow_back,
                                      color: Colors.white),

                       ),
                     ),
                     Text(widget.tagscaption, style: TextStyle(color: Colors.white),),
                   ]
                 ),

                 actions: <Widget>[
                   new FlatButton(
                     child: new Text("Save", style: TextStyle(color: Colors.white),),
                     onPressed: _handleOk,
                     color: CurrentTheme.PrimaryColor,

                   ),



                 ],
     ),

      body:
         body,
     // dialog,
    );

 */
  }

  Widget _buildMenuBar(BuildContext context) {
    final headerStyle = TextStyle(
        fontSize: 11, color: Colors.grey.shade500, fontWeight: FontWeight.bold);
    const itemStyle = TextStyle(color: Colors.white);
    return ListView(
      children: [
        ListTile(
          title: Text('BASIC EXAMPLES', style: headerStyle),
          // dense: true,
          visualDensity: VisualDensity.compact,
        ),

        ListTile(
          title: Text('LAYOUT EXAMPLES', style: headerStyle),
          // dense: true,
          visualDensity: VisualDensity.compact,
        ),
        ListTile(
          title: const Text('¶   Expandable', style: itemStyle),
          dense: true,
          visualDensity: VisualDensity.compact,
          onTap: _expanded,
        ),
        ListTile(
          title: const Text('¶   Custom scrollable', style: itemStyle),
          dense: true,
          visualDensity: VisualDensity.compact,
          onTap: _scrollable,
        ),
        ListTile(
          title: Text('FORMS AND FIELDS EXAMPLES', style: headerStyle),
          // dense: true,
          visualDensity: VisualDensity.compact,
        ),
        ListTile(
          title: const Text('¶   Decorated field', style: itemStyle),
          dense: true,
          visualDensity: VisualDensity.compact,
          onTap: _decoratedField,
        ),
      ],
    );
  }

  Widget _buildWelcomeEditor(BuildContext context) {
    return Column(
      children: [
        ZefyrToolbar.basic(controller: _controller!),
        Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        Expanded(
          child: Container(
           // color: Colors.white,
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child:

            ZefyrEditor(
              controller: _controller!,
              focusNode: _focusNode,
              autofocus: true,
              expands: true,
              // readOnly: true,
              // padding: EdgeInsets.only(left: 16, right: 16),
              onLaunchUrl: _launchUrl,
              embedBuilder:_projectsEmbedBuilder ,
            ),


          ),
        ),
      ],
    );
  }


  Widget _projectsEmbedBuilder(BuildContext context, EmbedNode node) {
    switch (node.value.type) {
      case 'image':
        String imageUrl = node.value.data['source'];
        return imageUrl.startsWith('http')
            ? Image.network(imageUrl)
            : Image.file(File(imageUrl));


      default:
        throw UnimplementedError(
            'Embeddable type "${node.value.type}" is not supported by default embed '
                'builder of QuillEditor. You must pass your own builder function to '
                'embedBuilder property of QuillEditor or QuillField widgets.');
    }
  }


  void _launchUrl(String url) async {
    final result = await canLaunch(url);
    if (result) {
      await launch(url);
    }
  }

  void _expanded() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => SettingsProvider(
          settings: _settings!,
          child: ExpandedLayout(),
        ),
      ),
    );
  }



  void _scrollable() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => SettingsProvider(
          settings: _settings!,
          child: ScrollableLayout(),
        ),
      ),
    );
  }

  void _decoratedField() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => SettingsProvider(
          settings: _settings!,
          child: DecoratedFieldDemo(),
        ),
      ),
    );
  }

}



Future<String?> showEditor({
  @required BuildContext? context,
  @required String? value,
  @required String? caption,

  // @required List<String> selectedtags,
  TransitionBuilder? builder,

}) async {

  assert(debugCheckHasMaterialLocalizations(context!));

  Widget? child = EditorDialog(
    value: value,
    tagscaption: caption,
    //selectedtags: selectedtags,
  );

  return await showDialog<String>(
    context: context!,
    builder: (BuildContext context) {
      return builder == null ? child : builder(context, child);
    },
  );
}


class MyAppZefyrImageDelegate  {
  // ...
  var storage;
  MyAppZefyrImageDelegate();

  Future<String?> pickImage(im.ImageSource source) async {
    final pic = im.ImagePicker();
    final file = pic.getImage(source: source);
    if (file == null) return null;
    // Use my storage service to upload selected file. The uploadImage method
    // returns unique ID of newly uploaded image on my server.
    final String imageId = await storage.uploadImage(file);
    return imageId;
  }
  @override
  im.ImageSource get cameraSource => im.ImageSource.camera;

  @override
  im.ImageSource get gallerySource => im.ImageSource.gallery;
  @override
  Widget buildImage(BuildContext context, String key) {
    //final file = File.fromUri(Uri.parse(key));
    /// Create standard [FileImage] provider. If [key] was an HTTP link
    /// we could use [NetworkImage] instead.
    final image = NetworkImage(key);
    return Image(image: image);
  }
}



class ArticleWidget extends StatefulWidget {
   ArticleWidget({Key? key,

   this.value, 
   this.caption, 
   this.hint, 
   this.required,
   this.getValue,
   }) : super(key: key)
   {
    contr.text = html2md.convert(value!);
   if(required!){
      caption = caption! + '*';
    }
   } 
  TextEditingController contr = TextEditingController();

  String? value;
  String? hint;
  final bool? required;
  String? caption;
  final ValueChanged<String>? getValue;

 // String

  @override
  State<StatefulWidget> createState() {
    return _ArticleWidget();
  }  
}

class _ArticleWidget extends State<ArticleWidget> {
  bool validation = true;
  bool isvalid = true;
  String?  errormessage = '';
 // TextEditingController contr;
 // _ArticleWidget({this.contr});
  @override
  initState(){
  //contr.text = 'ok';
  }

  String? validateArticle(String? _value, bool? _require) {
    String value = _value!;
    bool   require = _require!;
    String? result = '' ;
    isvalid = true;
    widget.caption;
    if(require){
      if (value.isEmpty){
        result = 'This field is required';
        isvalid= false;
      }
      if(value == '\n'){
        result = 'This field is required';
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

  void  _getvalue(String val){
    //  widget.getValue(markdown.markdownToHtml(val));
    widget.getValue!(val);
  }


  Future<void> _editValue(BuildContext context) async {
    final String? picked = await showEditor(
      context: context!,
      value: widget.value!,
      caption: widget.caption!,

    );
    print('widget value == ${widget.value}');
    //  if (picked != null && picked != widget.contr.text){

    // return picked;
   // var res = widget.idenum[widget.nameenum.indexOf(picked)];
    //var res = '33';
    // print('isi===>${res}');
    // selectitem(res);
    setState(() {
      _getvalue(picked!);
    });
    // selectitem(picked);
    // print('isi===>${picked}');
    // }
    // return widget.contr.text;
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
          Container(
          // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  alignment: Alignment.center,
                //  height: widget.filename == '' || widget.filename == null ? 140.0 : 180,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: const Color(0xFF000000), width: 1.0),
                  //color: CurrentTheme.ShadeColor,
                  ),
                  child :
                            Column(
                                        children: <Widget>[
                                          Padding(
                                              padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 10.0),
                                              child:// <Widget>[

                                              Container(
                                                // padding: const EdgeInsets.all(8.0),
                                               // width: 100,
                                                padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  border: Border.all(color: widget.value == '' ? Colors.white :  const Color(0xFF000000), width: 0.5),
                                                  //color: CurrentTheme.ShadeColor,
                                                ),
                                                //  height: 100.0,
                                                child:
                                                GestureDetector(
                                                  child: widget.value == ''?
                                                  Container(
                                                   // height: 110.0,
                                                    //width: 200,
                                                    child: Html(

                                                      data: widget.value,
                                                        style: {
                                                          "html": Style(
                                                              color: Colors.black,
                                                              fontSize: FontSize.medium,
                                                              fontWeight: FontWeight.w800
                                                          ),
                                                        }
                                                      //  bodyPadding : EdgeInsets.only(left: 20.0, right: 20.0),
                                                    ),
                                                  )
                                                      : Html(

                                                    data: widget.value,
                                                      style: {
                                                        "html": Style(
                                                            color: Colors.black,
                                                            fontSize: FontSize.medium,
                                                            fontWeight: FontWeight.w800
                                                        ),
                                                      }
                                                    //  bodyPadding : EdgeInsets.only(left: 20.0, right: 20.0),
                                                  ),
                                                  onTap: ()async{
                                                    if(widget.value == ''){

                                                        _editValue(context);
                                                        //  await _uploadFile(context);

                                                    }
                                                  },
                                                )

                                                /*
                                        child: new TextFormField(

                                          style: TextStyle(color: validation ? CurrentTheme.NormalTextColor : CurrentTheme.BackgroundColor, fontSize: 14),
                                          keyboardType: TextInputType.multiline,
                                          //you can also set this property to specify the Maximun lines the textfield is to take
                                          maxLines: 5,
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

                                          controller: contr,
                                          validator: (value) {
                                            // widget.value = value;
                                            errormessage = validateArticle(value, widget.required);
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
                                        */

                                              )

                                            // ]
                                          ),
                                          widget.value == '' ? const SizedBox(height: 0.0, width: 0.0,):
                                          Row(
                                            children: <Widget>[

                                              const Expanded( child : Padding(
                                                padding: EdgeInsets.fromLTRB(8.0, 2.0, 0.0, 6.0),
                                                child:null,
                                              ),
                                              ),
                                              Padding(

                                                padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                                                child:
                                                ButtonBarTheme(
                                                  data: const ButtonBarThemeData(
                                                    alignment: MainAxisAlignment.end,
                                                    //buttonMinWidth: 0.9 * width,
                                                  ),

                                                  child: ButtonBar(
                                                    alignment : MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      RaisedButton(
                                                        textTheme: ButtonTextTheme.normal,
                                                        color: Colors.grey,
                                                        child: const Text('Edit ', style: TextStyle(color: Colors.white)),
                                                        onPressed:   ()async {
                                                           _editValue(context);
                                                        //  await _uploadFile(context);
                                                          },
                                                      ),


                                                    ],
                                                  ),
                                                ),
                                              )

                                            ],
                                          ),
                                          Validator(
                                            value: widget.value! ,
                                            validator: (value) {
                                              errormessage = validateArticle(widget.value!, widget.required!);
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
                                        ],
                                      )
          ),

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
                height: 130.0,

                child: new TextFormField(
                  
                  style: TextStyle(color: CurrentTheme.NormalTextColor, fontSize: 20),
                    keyboardType: TextInputType.multiline,
                    //you can also set this property to specify the Maximun lines the textfield is to take
                    maxLines: 5,
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
                    errormessage = validateArticle(value, widget.required);
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

