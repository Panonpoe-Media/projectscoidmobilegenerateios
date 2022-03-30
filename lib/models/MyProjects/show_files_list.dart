
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'dart:convert';
import 'dart:io';
import 'package:filesize/filesize.dart';
import '../image_fields.dart';
import '../file_fields.dart';
import '../option_fields.dart';
import '../meta.dart';
import '../item_button.dart';
import '../button.dart';
import '../selection.dart';
import 'show_files_list_item.dart';
import 'show_files_list_item_base.dart';
import '../photo.dart';
import '../paging.dart';
import 'package:path/path.dart' as p;
import 'package:photo_view/photo_view.dart';
import 'show_files_list_base.dart';
/** AUTOGENERATE OFF **/

class ShowFilesListingModel extends ShowFilesListingBase{
  Map<String, dynamic> json;
  ShowFilesListingModel(Map<String, dynamic> this.json):super(json);

  @override
  Widget viewItem (ItemShowFilesModel item,String? search, bool? account, String? id) {
    ShapeBorder? shape;
    double height = 0;
    double totalHeight = 0;
    totalHeight = totalHeight + 2 ;
    totalHeight = totalHeight + 2 ;
    totalHeight = totalHeight + 2 ;
    totalHeight = totalHeight + 15 ;
    totalHeight = totalHeight + 2 ;
    height = totalHeight * 50;
    return Visibility (
        visible: (search == '' || allModelWords(jsonEncode(item.item.toJson())).contains(search!)),
        child:  ItemShowFilesCard1(destination :item, search : search, shape : shape, height: height)
    );


  }



}




class ItemShowFilesCard1 extends StatelessWidget {
  ItemShowFilesCard1({ Key? key, @required this.destination, this.search, this.shape, this.height})
      : assert(destination != null),
        super(key: key);
  // This height will allow for all the Card's content to fit comfortably within the card.
  final double? height;
  final ItemShowFilesModel? destination;
  final String? search;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
        child:
        Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            //  shadowColor: CurrentTheme.ListColor,
            child: ItemShowFilesContent1(destination: destination),

        ),

      ),
    );
  }
}


class ItemShowFilesContent1 extends StatelessWidget {
  const ItemShowFilesContent1({ Key? key, @required this.destination })
      : assert(destination != null),
        super(key: key);

  final ItemShowFilesModel? destination;
  bool isImage(String ext ){
    bool isImage = false;
    if(['.tif','.tiff','.bmp','.jpg', '.jpeg', '.gif', '.png', '.eps'].contains(p.extension(ext))){
      if(ext.contains('[')){
        isImage = false;
      }else{
        isImage = true;

      }

    }
    return isImage;
  }
  bool isFile(String ext ){
    bool isFile = false;
    if( ext.contains('https://upload.projects.co.id/upload/')){
      if(ext.contains('[')){
        isFile = false;
      }else{
        isFile = true;

      }
    }
    return isFile;
  }

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('dd/MM/yyyy hh:mm:ss');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000 );
    // DateTime.
    // var diff = now.difference(date);
    var time = '';

    time = format.format(date.toUtc());

    return time;
  }

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline1!.copyWith( fontSize: 15, fontWeight: FontWeight.w500);
    final TextStyle? descriptionStyle = theme.textTheme.headline5;
    final List<Widget> children = <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 10.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle!,
          child: Row(
            children: <Widget>[
              // three line description
              //  Text(
              //    'Published . ',
              //    style: descriptionStyle.copyWith( fontSize: 13),
              //  ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(DateFormat('dd/MM/yyyy hh:mm:ss').format(destination!.item.post_date) + ' WIB',
                  style: descriptionStyle.copyWith( fontSize: 13),
                ),
              ),

              new Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      PopupMenuButton<int>(
                        icon: Icon(Icons.info),
                        onSelected: (int value) {

                        },
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                          PopupMenuItem<int>(
                            value: 1,
                            child: Text('Add by ${destination!.item.user_str}'),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Html(data:destination!.item.message),
                          ),


                        ],
                      ),
                    ]
                ),
                //settingsRow,
              ),
            ],
          ),
           )
       ),
            isImage(destination!.item.attachments[0].remote)?
            Html(data: '<img src=https://upload.projects.co.id/upload/${destination!.item.attachments[0].dir}/${destination!.item.attachments[0].remote} >',
              style: {
                "html": Style(
                    alignment: Alignment.topLeft,
                    fontSize: FontSize.small,
                    fontWeight: FontWeight.w400
                ),
              },
              onImageTap:(src, _, __, ___){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowImageFL(image:'$src',file:destination!.item.attachments_url,fz:filesize(destination!.item.attachments[0].size), basename: destination!.item.attachments_name,)));
              },

            )
                :
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: GestureDetector(
                child:   Container(
                  width: width * 3/4,
                  height: 70,

                  decoration: new ShapeDecoration(
                    color:Colors.red[50],
                    shadows:[
                      BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
                    ],

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                          width: 1,
                          color: Colors.white
                      ),
                    ),

                  ),
                  child:

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('File: ', style: TextStyle(fontSize: 10),),
                        Text('${destination!.item.attachments_name}', style: TextStyle(color: Colors.red, fontSize: 12),),
                        Text('(${filesize(destination!.item.attachments[0].size)}, ${readTimestamp(destination!.item.attachments[0].created)} WIB)', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),

                ),

                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowFileFL(file:destination!.item.attachments_url,fz:filesize(destination!.item.attachments[0].size), basename: destination!.item.attachments_name,)));

                },
              ),
            ),

            SizedBox(
              height: 20,
            )





      // Description and share/explore buttons.

    ];
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}


class ShowFileFL extends StatefulWidget {
  final String? file;
  final String? fz;
  final String? basename;

  ShowFileFL({this.file, this.fz, this.basename});

  @override
  ShowFileFLState createState() => ShowFileFLState();
}


class ShowFileFLState extends State<ShowFileFL> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File? _fileFile;
  int _progress = 0;
 // final String file1;
  List<File> _mulitpleFiles = [];
  //ShowFileFLState({this.file1});
  @override
  void initState() {
    super.initState();


  }
  //String file;
//  ShowImage({this.file});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0.0,

          title: Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: Text(
              'Download File',
              style: TextStyle(
                  fontFamily: "Gotik",
                  fontSize: 20.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        //resizeToAvoidBottomPadding: false,
        body:
        Center(
            child:  FileViewAttFix(
              st: this,
              getValue: (int? val){
                print('progress === $val');
                setState(() {
                  //progress = val;

                });
              },
              ctx : context,
              value: widget.basename,
              value1: widget.file,
              fz: widget.fz,
              caption: 'Sample',
            )
        )


    );

  }

}


class ShowImageFL extends StatefulWidget {
  final String? image;
  final String? file;
  final String? fz;
  final String? basename;

  ShowImageFL({this.image, this.file, this.fz, this.basename});

  @override
  ShowImageFLState createState() => ShowImageFLState();
}


class ShowImageFLState extends State<ShowImageFL> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File? _fileFile;
  int _progress = 0;
 // final String file1;
  List<File> _mulitpleFiles = [];
  ScrollController? controller;
 // ShowImageFLState({this.file1});
  @override
  void initState() {
    super.initState();
    controller = ScrollController();


  }
  //String file;
//  ShowImage({this.file});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0.0,

          title: Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: Text(
              'Download Image',
              style: TextStyle(
                  fontFamily: "Gotik",
                  fontSize: 20.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        //resizeToAvoidBottomPadding: false,
        body:
    SingleChildScrollView(
    controller: controller,
    physics: const AlwaysScrollableScrollPhysics(),
    reverse: false,

    child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 5),
                child:Text('Dowload Image ${widget.basename}:', style: TextStyle(
                    fontFamily: "Gotik",
                    fontSize: 15.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700),),
              ),
              Center(
                  child:  FileViewAttFix(
                    st: this,
                    getValue: (int? val){
                      print('progress === $val');
                      setState(() {
                        //progress = val;

                      });
                    },
                    ctx : context,
                    value: widget.basename,
                    value1: widget.file,
                    fz: widget.fz,
                    caption: 'Sample',
                  )
              ),
              SizedBox(
                height: 20,
              ),

             Container(
               height: mediaQueryData.size.height,
               width: mediaQueryData.size.width,
               child: PhotoView(
                 imageProvider: NetworkImage(
                   widget.image!
                   ,
                 ),
                 basePosition: Alignment.topLeft,
                 // Contained = the smallest possible size to fit one dimension of the screen
                 minScale: PhotoViewComputedScale.contained * 0.8,
                 // Covered = the smallest possible size to fit the whole screen
                 maxScale: PhotoViewComputedScale.covered * 2.7,
                 enableRotation: true,
                 // Set the background color to the "classic white"
                 backgroundDecoration: BoxDecoration(
                   color: Theme.of(context).canvasColor,
                 ),  loadingBuilder: (context, event) => Center(
                 child: Container(
                   width: 20.0,
                   height: 20.0,
                   child: CircularProgressIndicator(
                     value: event == null
                         ? 0
                         : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                   ),
                 ),
               ),
               ),
             ),




            ],
          )
    ),



    );

  }

}


  

