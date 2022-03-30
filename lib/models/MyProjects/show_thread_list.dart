
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/app/root.dart';
import 'package:projectscoid/db/db.dart';
import 'show_thread_list_base.dart';
import 'show_thread_list_item.dart';
import 'show_thread_list_item_base.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart' as cp;
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/core/components/utility/tool/reply-input.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/views/components/index.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:projectscoid/views/Chat/models/chat_model.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:projectscoid/views/Chat/models/messages/commons/commons.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/views/Chat/models/models.dart';
import 'package:projectscoid/views/Chat/widgets/emoji_picker.dart';
import 'dart:io';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:ui' as ui;
import 'package:projectscoid/models/file_fields.dart';
import 'package:path/path.dart' as p;
import 'package:projectscoid/views/components/uploadprovider.dart';

import 'package:projectscoid/models/photo.dart';
import 'package:dio/dio.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:camera/camera.dart' ;

//import 'package:flutter_icons/flutter_icons.dart';
import 'package:image/image.dart' as img;
import 'dart:async';
import 'package:flutter_html/style.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:image_downloader/image_downloader.dart';
import 'package:filesize/filesize.dart';
import '../button.dart';
import 'package:projectscoid/core/components/utility/widget/SearchSelectDialog.dart';
import 'package:projectscoid/views/MyProjects/my_projects_action.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:projectscoid/core/components/utility/widget/ListThread.dart';


/** AUTOGENERATE OFF **/


//List<CameraDescription> cameras = [];
class ThreadCamera extends StatefulWidget {
  final DIOProvider? provider;
  final ValueChanged<FileField?>? onAddPic;
  ThreadCamera({Key? key,  this.provider,  this.onAddPic}) : super(key: key);
  @override
  _ThreadCameraState createState() {
    return _ThreadCameraState();
  }
}

class _ThreadCameraState extends State<ThreadCamera>
    with WidgetsBindingObserver {
  CameraController? controller;
  // MyProfileController my_profile;
  String? imagePath;
  bool failed = false;
  int progressCount = 0;
  // var model;
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    _initCamera();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }


  Future<void> _initCamera() async {
    //  cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.low);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (controller == null || !controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (controller != null) {
        onNewCameraSelected(controller!.description);
      }
    }
  }


  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (controller != null) {
      if (!controller!.value.isInitialized) {
        return Container();
      }
    } else {
      return const Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(),
        ),
      );
    }


    if (!controller!.value.isInitialized) {
      return Container();
    }

    //fetchData(my_profile);
    return Scaffold(
      // key: _scaffoldKey,
      extendBody: true,
      body:
      Stack(
        children: <Widget>[
          _cameraPreviewWidget(size) ,
          Align(
            alignment: Alignment(0.9, -0.9),
            child:IconButton(
              iconSize: 40.0,
              color: Colors.white,
              icon: Icon(
                Icons.camera,
                color: Colors.white,
              ),
              onPressed: () {
                _onCameraSwitch();
              },
            ),
          ),

          Positioned.fill(
            top: size.height - 180,
            left: 0.0,
            right: 0.0,
            child:
            _buildBottomNavigationBar(context),
          )

        ],
      ),

    );

  }



  Widget _buildBottomNavigationBar(BuildContext  context) {
    return Container(
      color: Colors.transparent,
      height: 100.0,
      width: double.infinity,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column( children: <Widget>[
            IconButton(
              iconSize: 80.0 ,
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.circle,

                // size: 80.0,
                color:Colors.white,
              ),
              onPressed: () {
                onTakePictureButtonPressed(context);
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child : Text('Tap untuk mengambil gambar', style: TextStyle(color: Colors.white   ),),
            )

          ],
          )

        ],
      ),
    );
  }


  Future<void> _onCameraSwitch() async {
    final CameraDescription cameraDescription =
    (controller!.description == cameras[0]) ? cameras[1] : cameras[0];
    if (controller != null) {
      await controller!.dispose();
    }

    controller = CameraController(
      cameraDescription,
      ResolutionPreset.low,
    );

    // If the controller is updated then update the UI.
    controller!.addListener(() {
      if (mounted) setState(() {});
      if (controller!.value.hasError) {
        showInSnackBar('Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }


  }


  Future<FileSystemEntity?> getLastImage() async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/media';
    final myDir = Directory(dirPath);
    List<FileSystemEntity> _images;
    _images = myDir.listSync(recursive: true, followLinks: false);
    _images.sort((a, b) {
      return b.path.compareTo(a.path);
    });
    // var lastFile = _images[0];
    /* var extension = path.extension(lastFile.path);
    if (extension == '.jpeg') {
      return lastFile;
    } else {
      String thumb = await Thumbnails.getThumbnail(
          videoFile: lastFile.path, imageType: ThumbFormat.PNG, quality: 30);
      return File(thumb);
    }
    */

  }
  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget(Size size) {
    final _size = size;
    return ClipRect(
      child: Container(
        child: Transform.scale(
          scale: controller!.value.aspectRatio / _size.aspectRatio,
          child: Center(
            child: AspectRatio(
              aspectRatio: controller!.value.aspectRatio,
              child: CameraPreview(controller!),
            ),
          ),
        ),
      ),
    );
  }

  /// Toggle recording audio

  /// Display the thumbnail of the captured image or video.


  /// Display a row of toggle to select the camera (or a message if no camera is available).


  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.low,
    );

    // If the controller is updated then update the UI.
    controller!.addListener(() {
      if (mounted) setState(() {});
      if (controller!.value.hasError) {
        showInSnackBar('Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }


  Future<Photo?>loadImageFile(String filename, String filepath, ProgressULCallback progress)async{
    FormData formdata = FormData.fromMap({
      "Filename":"filename",
      "Filedata": await MultipartFile.fromFile(filepath, filename: filename),

    });
    Photo? res ;
    // String res ;


    try {
      res =  await widget.provider!.uploadImage1(formdata, progress).then(( response) {
        return response;
      });
    }catch(e) {
      failed = true;
    }

    return res;
  }

  void showProgress(received, total) {
    if (total != -1) {
      setState(() {
        //  _showNotification(failed? 'failed' : "Upload " + (received / total * 100).toStringAsFixed(0) + "%", 2,
        //     widget.filename);
        progressCount = received / total ;

      });

      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  void onTakePictureButtonPressed(BuildContext context) async{
    takePicture().then((XFile? filePath) async{
      if (mounted) {
        setState(() {
          imagePath = filePath?.path!;
        });
        if (filePath != null){
          //  this.provider = await _init();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditThreadPic(filePath: imagePath, provider: widget.provider , onAddPhoto: widget.onAddPic )),
          );

        }
        //showInSnackBar('Picture saved to $filePath');
      }
    });
  }




  Future<XFile?> takePicture() async {
    if (!controller!.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory? extDir = await getExternalStorageDirectory();
    final String? dirPath = '${extDir!.path}/Pictures/my_profile';
    await Directory(dirPath!).create(recursive: true);
    final String? filePath = '$dirPath/${timestamp()}.jpg';

    if (controller!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await controller!.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  //  return filePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}


class EditThreadPic extends StatefulWidget{
  // final ViewModelMyProfileRev model;
  DIOProvider? provider;
  final String? filePath;
 // final VoidCallback? onAddPhoto;
  final ValueChanged<FileField?>? onAddPhoto;
  EditThreadPic({Key? key,  this.filePath, this.provider, this.onAddPhoto}): super (key : key);

  @override
  EditThreadPicState createState(){
    return  EditThreadPicState();
  }

}

class EditThreadPicState extends State<EditThreadPic>{
  //MyProfileController my_profile;
  double progressCount = 0;
  bool progresscircular = false;
  bool validation = true;
  bool isvalid = true;
  Photo? dioResultImage;
  String errormessage = 'Upload your Image.';
  bool failed = false;

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // key: _scaffoldKey,
      extendBody: true,
      body:
      Stack(
        children: <Widget>[
          _profilePreview(size, widget.filePath!, context) ,
          Align(
            alignment: Alignment(-0.9, -0.9),
            child:
            IconButton(
              iconSize: 40.0,
              color: Colors.white,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          progresscircular?  Center(
              child:CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                    Colors.green),)): Container(width: 0.0, height: 0.0,),
          Positioned.fill(
            top: size.height - 180,
            left: 0.0,
            right: 0.0,
            child:
            _buildBottomNavigationBar(context,widget.filePath!),
          )

        ],
      ),

    );
  }

  Widget _profilePreview(Size size, String image, BuildContext context) {
    final _size = size;
    // print('image == $image');

    return PhotoView(
      imageProvider: FileImage(
        File(image)
        ,
      ),
      // Contained = the smallest possible size to fit one dimension of the screen
      minScale: PhotoViewComputedScale.contained * 1.3,
      // minScale: PhotoViewComputedScale.covered  ,
      // Covered = the smallest possible size to fit the whole screen
      maxScale: PhotoViewComputedScale.covered * 2.7,
      enableRotation: true,
      // Set the background color to the "classic white"
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
      loadingBuilder: (context, event) => Center(
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
    );
  }
  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<File?> fixExifRotation(String imagePath) async {
    final originalFile = File(imagePath);
    List<int> imageBytes = await originalFile.readAsBytes();

    var originalImage = img.decodeImage(imageBytes);
    img.Image? originalImg;
    originalImg = img.copyResize(originalImage!, height: 320, width : 320);
    // Here you can select whether you'd like to save it as png
    // or jpg with some compression
    // I choose jpg with 100% quality
    final fixedFile =
    await originalFile.writeAsBytes(img.encodeJpg(originalImg));

    return fixedFile;
  }

  void showProgress(received, total) {
    if (total != -1) {
      setState(() {
        //  _showNotification(failed? 'failed' : "Upload " + (received / total * 100).toStringAsFixed(0) + "%", 2,
        //     widget.filename);
        progressCount = received / total ;

      });

      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  Widget _buildBottomNavigationBar(BuildContext  context, String ft) {
    //  MyProfileController my_profile;
    //  String sendPath = Env.value.baseUrl + '/user/my_profile/edit_profile/' + widget.model.user_id +'/';
    // var formData ;
    var postMyProfileResult;
    Photo foto1;
    Photo foto2;
    return Container(
      color: Colors.transparent,
      height: 300.0,
      width: double.infinity,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding : EdgeInsets.only(right: 10),
            child : Text('Tambahkan Photo ini', style : TextStyle(color : Colors.white)),
          ),

          IconButton(
            iconSize: 60.0 ,
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.send,

              // size: 80.0,
              color:Colors.white,
            ),
            onPressed: ()async{
              setState(() {
                progresscircular = true;
              });
              final Directory? extDir = await getExternalStorageDirectory();
              final String? dirPath = '${extDir!.path}/Pictures/my_profile';
              await Directory(dirPath!).create(recursive: true);
              final String? filePath = '$dirPath/${timestamp()}.jpg';
              await File(ft).copy(filePath!);
              await fixExifRotation(filePath!);

              if (filePath.isNotEmpty) {
                var _path = filePath;
                var filename;
                filename = p.basename(_path);
                var file = File(_path);
                 var lastmd = file.lastModifiedSync();
                var filelength = file.lengthSync();
                var fl = filelength;
                int filedate = lastmd.toUtc().millisecondsSinceEpoch;
                var dioResultFile = await loadImageFile(filename, _path, showProgress);
                var val = new FileField(dioResultFile.status, dioResultFile.name,filelength,0,0, dioResultFile.temp, '', '',filedate.toString(), );

                //var res await getUploadFolder(filename, 'usr${widget.userID}' );


                widget.onAddPhoto!(val);
                AppProvider.getRouter(context)!.pop(context);
                AppProvider.getRouter(context)!.pop(context);
                AppProvider.getRouter(context)!.pop(context);
                /*
        _path = await FilePicker.getFilePath(
          type: _pickingType,
          allowedExtensions: (_extension?.isNotEmpty ?? false)
              ? _extension?.replaceAll(' ', '')?.split(',')
              : null,
        );

         */


              }

            },
          ),

        ],
      ),
    );
  }


  void _showToast(BuildContext context, String info) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(info),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }



  Future<Photo>loadImageFile(String filename, String filepath, ProgressCallback onProgress )async{
    FormData formdata = FormData.fromMap({
      "Filename":"filename",
      "Filedata": await MultipartFile.fromFile(filepath, filename: filename),

    });
    Photo res ;
    // String res ;
    res =  await widget.provider!.uploadImage2(formdata, onProgress).then(( response) {
      return response;
    });
    return res;
  }

// void uploadimage (Photo value){
//   widget.getValue(value);
// }


//"user[address]": "${widget.model.address }"
}



class ShowThreadListingModel extends ShowThreadListingBase{
  Map<String, dynamic> json;
  ShowThreadListingModel(Map<String, dynamic> this.json):super(json);


  bool isImage(String ext ){
    bool isImage = false;
    if(['.tif','.tiff','.bmp','.jpg', 'jpeg', 'gif', 'png', 'eps'].contains(p.extension(ext)) ){
      isImage = true;
    }
    return isImage;
  }

  //@override

 // Widget viewItem1 (ItemShowThreadModel item, ItemShowThreadModel item1, String search,BuildContext context, bool account, String id , bool isMax, int max, int index) {
  Widget viewItem2 (ItemShowThreadModel item, ItemShowThreadModel item1, String search,BuildContext context, bool account, String id , bool isMax, int max, int index, VoidCallback? onSelect, List<int> selectedItemsIndex, List<String> selectedItems) {
    bool isDifDate = false;
    var formatter = new cp.DateFormat('dd MMMM yyyy');
    var formatter1 = new cp.DateFormat('HH : mm');
    bool darkMode = false;
    bool isSameUser = false;
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    final date1 = item1.item.post_date;
    final date2 = item.item.post_date;
    final difference = date2.difference(date1).inDays;
    if(difference != 0){
      isDifDate = true;
    }else{
      if(cp.DateFormat('EEEE').format(date1) != cp.DateFormat('EEEE').format(date2)){
        isDifDate = true;
      };
    }

    if(item.item.user_user_name ==  item1.item.user_user_name){
      isSameUser = true;
    }
    if (item.item.user_user_name == 'System'){
      //center
      return Center(
          child:

          Padding(
              padding: EdgeInsets.only(left: 30, right: 30.0, top: 5.0),
              child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      max  == index ? Container(
                        //width: 250,
                          height: 32,
                          color: Colors.transparent,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey[700],
                                    border: Border.all(
                                      color: Colors.grey[500]!,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        15))
                                ),
                                child:
                                Padding(
                                    padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                    child: Center(
                                      child: Text('${formatter.format(
                                          item1.item.post_date)}', style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                    )
                                ),


                              )
                            ],
                          )


                        //child:
                      )
                          : Container(width: 0.0, height: 0.0,),
                      ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                          message: item.item.message, userType: 2, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                      /*
                      Bubble(
                        margin: BubbleEdges.only(top: 5) ,
                        nip: BubbleNip.no,
                        color:darkMode? Colors.black12 : Colors.orange[100],
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[

                            item.item.message.contains('<')|| item.item.message.contains('://') ?
                            HtmlWidget(item.item.message, textStyle: TextStyle(fontSize: 15),
                              onTapUrl: (url) async{
                                if(url.contains('projects.co.id')){


                                  if(url.contains(new RegExp(r'[0-9]'))){
                                    if(url.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url+ '/' ));
                                    }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                    }

                                  }else{
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
                                  }


                                }else
                                {

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }


                                }


                              },
                              onTapImage:(src) =>  Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ShowItemScreenshots1(image:'$src')),),
                            ):
                            Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(formatter1.format(item.item.post_date), style: TextStyle( fontSize: 10)),
                                ],
                              ),
                          ]
                        )
                      ),

                       */
                      isDifDate ?
                      Container(
                        //width: 250,
                          height: 50,
                          color: Colors.transparent,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey[700],
                                    border: Border.all(
                                      color: Colors.grey[500]!,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                child:
                                Padding(
                                    padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                    child:  Center(
                                      child: Text('${formatter.format(item1.item.post_date)}', style: TextStyle(color: Colors.white, fontSize: 12)),
                                    )
                                ),


                              )
                            ],
                          )


                        //child:
                      )
                          : Container(width: 0.0, height: 0.0,),
                      isMax ? index == max ? Container(width: 0.0, height: 90,) : Container(width: 0.0, height: 0.0,) : Container(width: 0.0, height: 0.0,),

                      index == 0?  Container(width: 0.0, height: 150,) : Container(width: 0.0, height: 0.0,),
                    ],
                  )
          )
      );

    }else{


        if(id.split('*')[2] == 'l'){


          if(id.split('*')[0].toLowerCase() == item.item.user_user_name.toLowerCase()){
            return Padding(
                padding: EdgeInsets.only(left: 10, top: 10.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    max  == index ? Container(
                      //width: 250,
                        height: 32,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                  child: Center(
                                    child: Text('${formatter.format(
                                        item1.item.post_date)}', style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                        message: item.item.message, userType: isSameUser? 4 : 1, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                    /*
                    Bubble(
                        margin: BubbleEdges.only(top: 5) ,
                        nip: BubbleNip.leftTop,
                        color:darkMode? Colors.black : Colors.white,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            item.item.message.contains('<')|| item.item.message.contains('://') ?
                            HtmlWidget(item.item.message, textStyle: TextStyle(fontSize: 15),
                              onTapUrl: (url) async{
                                if(url.contains('projects.co.id')){


                                  if(url.contains(new RegExp(r'[0-9]'))){
                                    if(url.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url+ '/' ));
                                    }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                    }

                                  }else{
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
                                  }


                                }else
                                {

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }


                                }


                              },
                              onTapImage:(src) =>  Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ShowItemScreenshots1(image:'$src')),),
                            ):
                            Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(formatter1.format(item.item.post_date), style: TextStyle( fontSize: 10)),
                              ],
                            ),
                          ],

                        )

                    ),

                     */
                    isDifDate ?
                    Container(
                      //width: 250,
                        height: 50,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                  child:  Center(
                                    child: Text('${formatter.format(item1.item.post_date)}', style: TextStyle(color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    item.item.attachments == null ? Container(height: 0.0, width: 0.0,) : isImage(item.item.attachments_url) ?
                    Html(data: '<img src=${item.item.attachments_url} >',
                      style: {

                        "html": Style(
                            alignment: Alignment.topLeft,
                            //padding: EdgeInsets.only(top:30),
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w400
                        ),
                      },
                      onImageTap:(src, _, __, ___){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowImage2(image:'$src')));
                      },

                    )
                        : Bubble(
                      margin: BubbleEdges.only(top: 5),
                      nip: BubbleNip.leftTop,
                      color: darkMode ? Colors.black : Colors.white,
                      child:
                      GestureDetector(
                        child:

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child:Row(

                              children: [
                                Icon(Icons.file_download),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${item.item.attachments_name}'),
                                    Text('${filesize(item.item.attachments[0].size)}'),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),


                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ShowThreadFile(file:item.item.attachments_url, fz:filesize(item.item.attachments[0].size),basename: item.item.attachments_name,)));

                        },
                      ),

                    ),
                    isMax ? index == max ? Container(width: 0.0, height: 90,) : Container(width: 0.0, height: 0.0,) : Container(width: 0.0, height: 0.0,),
                    index == 0?  Container(width: 0.0, height: 150,) : Container(width: 0.0, height: 0.0,),
                  ],
                )
            );
          }else{
            return Padding(
                padding: EdgeInsets.only(right: 10, top: 10.0, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    max  == index ? Container(
                      //width: 250,
                        height: 32,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                  child: Center(
                                    child: Text('${formatter.format(
                                        item1.item.post_date)}', style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    /*
                    Bubble(
                        margin: BubbleEdges.only(top: 5) ,
                        color: darkMode? Colors.black45:Color.fromARGB(255, 225, 255, 199),
                        nip: BubbleNip.rightTop,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            item.item.message.contains('<')|| item.item.message.contains('://') ?
                            HtmlWidget(item.item.message, textStyle: TextStyle(fontSize: 15),
                              onTapUrl: (url) async{
                                if(url.contains('projects.co.id')){


                                  if(url.contains(new RegExp(r'[0-9]'))){
                                    if(url.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url+ '/' ));
                                    }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                    }

                                  }else{
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
                                  }


                                }else
                                {

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }


                                }


                              },
                              onTapImage:(src) =>  Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ShowItemScreenshots1(image:'$src')),),
                            ):
                            Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(formatter1.format(item.item.post_date), style: TextStyle( fontSize: 10)),
                              ],
                            ),

                          ],

                        )
                    ),

                     */
                    ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                        message: item.item.message, userType: isSameUser? 5 : 3, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                    isDifDate ?
                    Container(
                      //width: 250,
                        height: 50,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                  child:  Center(
                                    child: Text('${formatter.format(item1.item.post_date)}', style: TextStyle(color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    item.item.attachments == null ? Container(height: 0.0, width: 0.0,) : isImage(item.item.attachments_url) ?
                    Html(data: '<img src=${item.item.attachments_url} >',
                      style: {

                        "html": Style(
                            alignment: Alignment.topLeft,
                            //padding: EdgeInsets.only(top:30),
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w400
                        ),
                      },
                      onImageTap:(src, _, __, ___){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowImage2(image:'$src')));
                      },

                    )



                        :  Bubble(
                      margin: BubbleEdges.only(top: 5),
                      color:darkMode? Colors.black45:Color.fromARGB(255, 225, 255, 199),
                      nip: BubbleNip.rightTop,
                      child:
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:Row(

                            children: [
                              Icon(Icons.file_download),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${item.item.attachments_name}'),
                                  Text('${filesize(item.item.attachments[0].size)}'),
                                ],
                              ),

                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ShowThreadFile(file:item.item.attachments_url,fz:filesize(item.item.attachments[0].size), basename: item.item.attachments_name,)));

                        },
                      ),
                    ),
                    isMax ? index == max ? Container(width: 0.0, height: 90,) : Container(width: 0.0, height: 0.0,) : Container(width: 0.0, height: 0.0,),
                    index == 0?  Container(width: 0.0, height: 150,) : Container(width: 0.0, height: 0.0,),
                  ],
                )
            );
          }


        }else{
          //left

          if(id.split('*')[0].toLowerCase() == item.item.user_user_name.toLowerCase()){
            return Padding(
                padding: EdgeInsets.only(left: 10, top: 10.0,right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    max  == index ? Container(
                      //width: 250,
                        height: 50,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                  child: Center(
                                    child: Text('${formatter.format(
                                        item1.item.post_date)}', style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    /*
                    Bubble(
                        margin: BubbleEdges.only(top: 5) ,
                        nip: BubbleNip.leftTop,
                        color:darkMode? Colors.black : Colors.white,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            item.item.message.contains('<')|| item.item.message.contains('://') ?
                            HtmlWidget(item.item.message, textStyle: TextStyle(fontSize: 15),
                              onTapUrl: (url) async{
                                if(url.contains('projects.co.id')){


                                  if(url.contains(new RegExp(r'[0-9]'))){
                                    if(url.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url+ '/' ));
                                    }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                    }

                                  }else{
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
                                  }


                                }else
                                {

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }


                                }


                              },
                              onTapImage:(src) =>  Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ShowItemScreenshots1(image:'$src')),),
                            ):
                            Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(formatter1.format(item.item.post_date), style: TextStyle( fontSize: 10)),
                              ],
                            )
                          ],

                        )
                    ),

                     */
                    ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                        message: item.item.message, userType: isSameUser? 4 : 1, idx : index, darkMode: darkMode,  postdate: item.item.post_date),

                    isDifDate ?
                    Container(
                      //width: 250,
                        height: 50,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                  child:  Center(
                                    child: Text('${formatter.format(item1.item.post_date)}', style: TextStyle(color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    item.item.attachments == null ? Container(height: 0.0, width: 0.0,) : isImage(item.item.attachments_url) ?
                    Html(data: '<img src=${item.item.attachments_url} >',
                      style: {

                        "html": Style(
                            alignment: Alignment.topLeft,
                            //padding: EdgeInsets.only(top:30),
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w400
                        ),
                      },
                      onImageTap:(src, _, __, ___){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowImage2(image:'$src')));
                      },

                    )
                        :  Bubble(
                      margin: BubbleEdges.only(top: 5),
                      nip: BubbleNip.leftTop,
                      color: darkMode ? Colors.black : Colors.white,
                      child:
                      GestureDetector(
                        child:

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child:Row(

                              children: [
                                Icon(Icons.file_download),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${item.item.attachments_name}'),
                                    Text('${filesize(item.item.attachments[0].size)}'),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),


                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ShowThreadFile(file:item.item.attachments_url,fz:filesize(item.item.attachments[0].size), basename: item.item.attachments_name,)));

                        },
                      ),

                    ),
                    isMax ? index == max ? Container(width: 0.0, height: 90,) : Container(width: 0.0, height: 0.0,) : Container(width: 0.0, height: 0.0,),
                    index == 0?  Container(width: 0.0, height: 150,) : Container(width: 0.0, height: 0.0,),
                  ],
                )
            );
          }else{
            return Padding(
                padding: EdgeInsets.only(right: 10, top: 10.0,left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    max  == index ? Container(
                      //width: 250,
                        height: 32,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                  child: Center(
                                    child: Text('${formatter.format(
                                        item1.item.post_date)}', style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    ListThread(onSelect: onSelect, selectedItemsIndex: selectedItemsIndex, selectedItems: selectedItems,
                        message: item.item.message, userType: isSameUser? 5 : 3, idx : index, darkMode: darkMode,  postdate: item.item.post_date),
                    /*
                    Bubble(
                        margin: BubbleEdges.only(top: 5) ,
                        color: darkMode? Colors.black45:Color.fromARGB(255, 225, 255, 199),
                        nip: BubbleNip.rightTop,
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            item.item.message.contains('<')|| item.item.message.contains('://') ?
                            HtmlWidget(item.item.message, textStyle: TextStyle(fontSize: 15),
                              onTapUrl: (url) async{
                                if(url.contains('projects.co.id')){


                                  if(url.contains(new RegExp(r'[0-9]'))){
                                    if(url.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url+ '/' ));
                                    }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                          context,
                                          urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                    }

                                  }else{
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
                                  }


                                }else
                                {

                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }


                                }


                              },
                              onTapImage:(src) =>  Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ShowItemScreenshots1(image:'$src')),),
                            ):
                            Text(item.item.message, style: TextStyle(fontSize:14, color: Colors.black) ,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(formatter1.format(item.item.post_date), style: TextStyle( fontSize: 10)),
                              ],
                            )
                          ],

                        )
                    ),

                     */
                    isDifDate ?
                    Container(
                      //width: 250,
                        height: 50,
                        color: Colors.transparent,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border: Border.all(
                                    color: Colors.grey[500]!,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child:
                              Padding(
                                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                                  child:  Center(
                                    child: Text('${formatter.format(item1.item.post_date)}', style: TextStyle(color: Colors.white, fontSize: 12)),
                                  )
                              ),


                            )
                          ],
                        )


                      //child:
                    )
                        : Container(width: 0.0, height: 0.0,),
                    item.item.attachments == null ? Container(height: 0.0, width: 0.0,) : isImage(item.item.attachments_url) ?
                    Html(data: '<img src=${item.item.attachments_url} >',
                      style: {

                        "html": Style(
                            alignment: Alignment.topLeft,
                            //padding: EdgeInsets.only(top:30),
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w400
                        ),
                      },
                      onImageTap:(src, _, __, ___){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowImage2(image:'$src')));
                      },

                    )
                        :

                    Bubble(
                      margin: BubbleEdges.only(top: 5),
                      color:darkMode? Colors.black45:Color.fromARGB(255, 225, 255, 199),
                      nip: BubbleNip.rightTop,
                      child:
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:Row(

                            children: [
                              Icon(Icons.file_download),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${item.item.attachments_name}'),
                                  Text('${filesize(item.item.attachments[0].size)}'),
                                ],
                              ),

                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ShowThreadFile(file:item.item.attachments_url, fz:filesize(item.item.attachments[0].size),basename: item.item.attachments_name,)));

                        },
                      ),
                    ),
                    /*
                    FileViewAtt(
                      ctx : context,
                      value: item.item.attachments_name,
                      value1: item.item.attachments_url,
                      caption: 'Attachments',
                    ),

                     */


                    isMax ? index == max ? Container(width: 0.0, height: 90,) : Container(width: 0.0, height: 0.0,) : Container(width: 0.0, height: 0.0,),
                    index == 0?  Container(width: 0.0, height: 150,) : Container(width: 0.0, height: 0.0,),
                  ],
                )
            );
          }

        }




    }




  //  return Container(width: 100,height: 100,color: Colors.black,);
  }


  Widget	 ButtonsX1(BuildContext context, bool visible, String id, bool isShowEG, ChatBloc cb){
    final mediaQueryData = MediaQuery.of(context);




    return(


					SpeedDial(

              childMargin :  EdgeInsets.symmetric(horizontal: 5, vertical: isShowEG?mediaQueryData.size.height/2.2 : 10),
							animatedIcon: AnimatedIcons.menu_close,
							animatedIconTheme: IconThemeData(size: 22.0),
							// this is ignored if animatedIcon is non null
							// child: Icon(Icons.add),
							visible: visible,
							// If true user is forced to close dial manually
							// by tapping main button and overlay is not rendered.
							closeManually: false,
							curve: Curves.bounceIn,
							overlayColor: Colors.black,
							overlayOpacity: 0.5,
							onOpen: () => print('OPENING DIAL'),
							onClose: () => print('DIAL CLOSED'),
							tooltip: 'Speed Dial',
							heroTag: 'speed-dial-hero-tag',
							backgroundColor: CurrentTheme.MainAccentColor,
							foregroundColor: Colors.white,
							elevation: 8.0,
							shape: CircleBorder(),
							children:listButton12(context, id, cb)
					)





    );
  }

  Widget	 Buttons2(BuildContext context, bool visible, String id, ChatBloc cb){
    final mediaQueryData = MediaQuery.of(context);




    return(


        SpeedDial(

            childMargin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 22.0),
            // this is ignored if animatedIcon is non null
            // child: Icon(Icons.add),
            visible: visible,
            // If true user is forced to close dial manually
            // by tapping main button and overlay is not rendered.
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: CurrentTheme.MainAccentColor,
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: CircleBorder(),
            children:listButton12(context, id, cb)
        )





    );
  }

 // @override
  List<SpeedDialChild>	 listButton12(BuildContext context, String id,ChatBloc cb){
    final List<SpeedDialChild> buttonChildren = <SpeedDialChild>[
    ];
    for(var i = 0; i < tools.buttons.length; i++)
    {
      if(tools.buttons[i].url == 'javascript:gotoNewReply();'){
        tools.buttons[i].url = '${Env.value!.baseUrl!}/user/my_projects/show_thread_new_reply/$id/buat-artikel-1-saja';
      }
      buttonChildren.add(ListButtonShowThreadWidget1(tools.buttons[i],context, cb));
    }
    return(
        buttonChildren
    );
  }


  SpeedDialChild ListButtonShowThreadWidget1(Button button, BuildContext context,ChatBloc cb ){

    if(button.type == 'custom_filter'){
      return (
          SpeedDialChild(
            child: Icon(Icons.save),
            backgroundColor: Colors.red,
            label: button.text,
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
            onTap: ()=>{ showSearchSelectDialog(context: context,
                caption:button.text,
                initialitems: button.selections,
                initvalue: button.selections![0])
              //AppProvider.getRouter(context)!.navigateTo(context,
            },
          )

      );
    } else
    if(button.url!.contains('show_bids')){
      return (
          SpeedDialChild(
            child: Icon(Icons.save),
            backgroundColor: Colors.red,
            label: button.text,
            labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
            onTap: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowBidsMyProjects(id : '${urlToRoute(button.url!).split('\/')[4]}', title : '${button.text}', cb: cb),)
                  );
            },
          )

      );
    }

    else{
      return(	SpeedDialChild(
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
          label: button.text,
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
          onTap: ()=>
          {AppProvider.getRouter(context)!.navigateTo(context, urlToRoute(button.url!)) }
      ));
    }

  }




}



class ShowImage2 extends StatefulWidget {
  final String? image;

  ShowImage2({this.image});

  @override
  ShowImage2State createState() => ShowImage2State();
}


class ShowImage2State extends State<ShowImage2> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File? _imageFile;
  int _progress = 0;
  //final String image1;
  List<File> _mulitpleFiles = [];
 // ShowImage2State({this.image1});
  @override
  void initState() {
    super.initState();
/*
    ImageDownloader.callback(onProgressUpdate: (String imageId, int progress) {
      setState(() {
        _progress = progress;
      });
    });

 */
  }
  //String image;
//  ShowImage({this.image});
  File file(String filename) {
    // Directory dir = await getApplicationDocumentsDirectory();
    String pathName = p.join('/storage/emulated/0/Download', filename);
    return File(pathName);
  }

  @override
  Widget build(BuildContext context) {
    File file1 = new File("${widget.image}");
    String basename = p.basename(file1.path);
    var myFile = file(basename);
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        /*
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              _downloadImage(
                  this.image1,
                  destination: AndroidDestinationType.directoryDownloads

              );
            },
            child: _progress == 0? Text('Download'): Text('Progress: $_progress %'),

          ),
        ],

         */
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: Text(
            'View',
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
      PhotoView(
        imageProvider:  NetworkToFileImage(

            url: widget.image,
            file: myFile),
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

    );

  }
  /*
  Future<void> _downloadImage(String url, {AndroidDestinationType destination, bool whenError = false, String outputMimeType}) async {
    String fileName;
    String path;
    int size;
    String mimeType;
    try {
      String imageId;

      if (whenError) {
        imageId = await ImageDownloader.downloadImage(url, outputMimeType: outputMimeType).catchError((error) {
          if (error is PlatformException) {
            var path = "";
            if (error.code == "404") {
              print("Not Found Error.");
            } else if (error.code == "unsupported_file") {
              print("UnSupported FIle Error.");
              path = error.details["unsupported_file_path"];
            }
            setState(() {
              _message = error.toString();
              _path = path;
            });
          }

          print(error);
        }).timeout(Duration(seconds: 10), onTimeout: () {
          print("timeout");
          return;
        });
      } else {
        if (destination == null) {
          imageId = await ImageDownloader.downloadImage(
            url,
            outputMimeType: outputMimeType,
          );
        } else {
          imageId = await ImageDownloader.downloadImage(
            url,
            destination: destination,
            outputMimeType: outputMimeType,
          );
        }
      }

      if (imageId == null) {
        return;
      }
      fileName = await ImageDownloader.findName(imageId);
      path = await ImageDownloader.findPath(imageId);
      size = await ImageDownloader.findByteSize(imageId);
      mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      setState(() {
        _message = error.message;
      });
      return;
    }

    if (!mounted) return;

    setState(() {
      var location = Platform.isAndroid ? "Directory" : "Photo Library";
      _message = 'Saved as "$fileName" in $location.\n';
      _size = 'size:     $size';
      _mimeType = 'mimeType: $mimeType';
      _path = path;

      if (!_mimeType.contains("video")) {
        _imageFile = File(path);
      }
      return;
    });
  }

   */
}




class ShowThreadFile extends StatefulWidget {
  final String? file;
  final String? fz;
  final String? basename;

  ShowThreadFile({this.file, this.fz, this.basename});

  @override
  ShowThreadFileState createState() => ShowThreadFileState();
}


class ShowThreadFileState extends State<ShowThreadFile> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File? _fileFile;
  int _progress = 0;
 // final String file1;
  List<File> _mulitpleFiles = [];
  //ShowThreadFileState({this.file1});
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
              fz: widget.fz,
              value: widget.basename,
              value1: widget.file,
              caption: 'Sample',
            )
        )


    );

  }

}





  

