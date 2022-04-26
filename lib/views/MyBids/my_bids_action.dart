import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter/rendering.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:intl/intl.dart' as inter;
import 'package:getwidget/getwidget.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:photo_view/photo_view.dart';
import 'package:intl/intl.dart'as intl1;
import 'package:filesize/filesize.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
import 'package:projectscoid/views/Chat/widgets/emoji_picker.dart';
import 'package:projectscoid/core/components/utility/tool/reply-input.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:ui' as ui;
import 'package:projectscoid/models/file_fields.dart';
import 'package:path/path.dart' as p;
import 'package:projectscoid/models/photo.dart';
import 'package:dio/dio.dart';
import 'package:camera/camera.dart' ;
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
import 'package:html/parser.dart' show parse;
import 'package:projectscoid/models/MyProjects/show_conversation_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_conversation_list_item_base.dart';
import 'package:projectscoid/models/MyProjects/show_thread_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_thread_list_item_base.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ShowConversationMyBids extends StatefulWidget {
  final String? id ;
  final String? title;
  final String? id1;
  final ChatBloc? cb;
  static const String PATH = '/user/my_bids/show_conversation/:id/:title/:id1';
  ShowConversationMyBids({Key? key, this.id, this.title, this.id1, this.cb}) : super(key: key);
  @override
  ShowConversationMyBidsState1 createState() => ShowConversationMyBidsState1();
}

class  ShowConversationMyBidsState1 extends State<ShowConversationMyBids> with TickerProviderStateMixin<ShowConversationMyBids>, RestorationMixin{
  String? title = 'Show Conversation'; 
  bool _dialVisible = true;
  bool search = true;
  String? getPath = Env.value!.baseUrl! + '/user/my_bids/show_conversation/';
  
   final scrollController = ScrollController();
  
  MyBidsController? show_conversation;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String? searchText = '';
  bool account = true;
  int titleindex = 0;
  String? tempheader = '';
   double initscroll = 0.0;
  AccountController? accountController;
	final ValueNotifier<int> firstSelectIndex = ValueNotifier<int>(0);
	   final TextEditingController _textEditingController =
	     TextEditingController();
	  FocusNode? _focusNode;
	  bool isShowEG = false;
	  bool _loadingPath = false;
	  String? _path;
	  bool account1 = false;
	  bool _multiPick = false;
	  bool isShowKB = false;
	 // bool isShowEG = false;
	  bool loadAtt = false;
	  bool removeAtt = false;
	  DIOProvider? provider;
	  double progressCount = 0;
	  bool failed = false;
	  int tapCount = 0;
	  double heightTI = 53;
	  int OldNumberLine = 1;
	  final picker = ImagePicker();
	  int _flex = 1;
	  int _flex1 = 9;
	  String? fileName = '';
	  FileField? val;
	  var parser = EmojiParser();
	  SubModelController? st;
	  String? tempNotify = '';
    bool _permissionReady = false;
	var sc ;
   ShowConversationListingModel? show_conversationLM;
    bool sendCheck = false;
    String? sendMsgTemp = '';
   PermissionStatus _permissionStatus = PermissionStatus.denied;

     // ChatBloc? _chatBloc;
      var data;
      List<Map> listAccount = [];
	
	    late RewardedAd _rewardedAd;
	  // TODO: Add _isRewardedAdReady
	  bool _isRewardedAdReady = false;
		void _loadRewardedAd() {
		RewardedAd.load(
		  adUnitId: AdHelper.rewardedAdUnitId,
		  request: AdRequest(),
		  rewardedAdLoadCallback: RewardedAdLoadCallback(
			onAdLoaded: (ad) {
			  _rewardedAd = ad;

			  ad.fullScreenContentCallback = FullScreenContentCallback(
				onAdDismissedFullScreenContent: (ad) {

				  setState(() {
					_isRewardedAdReady = false;
				  });
				 // _loadRewardedAd();
				},
			  );

			  setState(() {
				_isRewardedAdReady = true;

			  });
			},
			onAdFailedToLoad: (err) {
			  print('Failed to load a rewarded ad: ${err.message}');
			  setState(() {
				_isRewardedAdReady = false;
			  });
			},
		  ),
		);
	  }
	int firstIndex = 0;
	var _keys = {};
   List<int> _selectedItemsIndex = [];
   List<String> _selectedItems = [];
   bool isMultiSelected = false;

  ShowConversationMyBidsState1() {
   scrollController!.addListener(_onScroll);
   // scrollController!.addListener(_onScroll);
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'ShowConversation';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'ShowConversation');
  }

  


 @override
  void initState() {
    super.initState();
	_loadRewardedAd();
     _checkPermission().then((hasGranted) {
      setState(() {
        _permissionReady = hasGranted;
      });
    });
	//_chatBloc =    ChatBloc();
    _focusNode = FocusNode();
  }


  void _onSelect(){

    // _selectedItemsIndex = [];
    // _selectedItems = [];

    
    setState(() {
      isMultiSelected = true;
      //selectMsg = message;
    });

  }
  
  Future<bool> _checkPermission() async {
   
    var prm = Permission.values
        .where((permission) {
      if (Platform.isIOS) {
        return permission != Permission.unknown &&
            permission != Permission.sms &&
            permission != Permission.storage &&
            permission != Permission.ignoreBatteryOptimizations &&
            permission != Permission.microphone &&
            permission != Permission.accessMediaLocation &&
            permission != Permission.activityRecognition &&
            permission != Permission.manageExternalStorage &&
            permission != Permission.systemAlertWindow &&
            permission != Permission.requestInstallPackages &&
            permission != Permission.accessNotificationPolicy &&
            permission != Permission.bluetoothScan &&
            permission != Permission.bluetoothAdvertise &&
            permission != Permission.bluetoothConnect;
      } else {

        return permission == Permission.storage ;
        //||
        // permission == Permission.manageExternalStorage;
      }
    }).toList();//.map((permission)async{ await _requestPermission(permission);});
    // prm.forEach((element)async{ return await _requestPermission(element);

    // });

    return await _requestPermission(prm);



  }
  
  Future<bool> _requestPermission(List<Permission> permission) async {

    //final status = await permission.request();
    var status;
    for(var obj in permission){
      status = await obj.request();
    }
    //  print('haloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo');
    // setState(() {
    // print(status);
    _permissionStatus = status;
    // print(_permissionStatus);
    if(_permissionStatus.isGranted){return true;}else{
      return false;
    }
    // });

  }


  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
       getPath = Env.value!.baseUrl! + '/user/my_bids/show_conversation/'+widget.id! +'/'+ widget.title!+'/'+ widget.id1!.split('*')[0]+'?page=%d';
      if(widget.title!.contains('filter')|| widget.title!.contains('search')|| widget.title!.contains('order'))
	  {
	      search = true;
	  }
      if(widget.title!.contains('filter')){
      var ids = widget.title!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/user/my_bids/show_conversation/'+widget.id! +'/'+ widget.title! +'/'+ widget.id1!.split('*')[0]+'?page=%d' + ids ;
    }
	if(widget.title!.contains('search')){
      var ids = widget.title!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/user/my_bids/show_conversation/'+widget.id! +'/'+ widget.title!+'?page=%d&' + ids ;
    }
	 if(widget.title!.contains('&order')){
     var ids = widget.title!;
     int ind = ids.indexOf('&');
     ids = ids.substring(ind, ids.length);
     int ind1 = widget.title!.indexOf('%28page');
     String? ttl = widget.title!.substring(0, ind1);
     getPath = Env.value!.baseUrl! + '/user/my_bids/show_conversation/'+widget.id! +'/'+ ttl+'?page=%d' + ids ;
	}
	
	
    show_conversation =  MyBidsController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
	show_conversation!.listMyBidsShowConversation();
    show_conversation!.listingShowConversation!.add(ShowConversationMyBidsList());
	accountController =    AccountController(AppProvider.getApplication(context),
	AppAction.view   );
	
	
	if(!account1){
    final future = accountController!.getAccount();
    future.then((val){

      listAccount.addAll(val);
      if(listAccount.length == 0){
        account1 = false;
      }else{

       // print('list count :  ${listAccount[0]['user_hash']}');
       // _chatBloc.lg(listAccount[0]['user_hash']);
        setState(() {
          account1 = true;
        });

      }
    });
    }
	
	
	///////////
	   titleindex = 1;
	   tempheader = widget.id1!;
	
  Future<bool>  _onWillPop()async{
     isMultiSelected = false;
     if(isShowEG){
       setState(() {
         isShowEG = false;
       });

       return false;
     }else{
	 Navigator.pop(context, false);
	// Navigator.pop(context, false);
      return true;
	 }
 

   }
      return
        WillPopScope(
       child: Scaffold(
	   backgroundColor: darkMode? Colors.black : Colors.white,
        appBar:
					 isMultiSelected ?	AppBar(
							automaticallyImplyLeading: false,
							iconTheme: IconThemeData(
									 color: Colors.white, //change your color here
								 ),
							leading: null,

							actions: <Widget>[
							Padding(
										padding: EdgeInsets.only(right: 5.0),
										child: GestureDetector(
										  onTap: () {

											isMultiSelected = false;
											// widget.chatBloc.selectMessageToggle(selectMsg);

											FocusScope.of(context).requestFocus(_focusNode);
											String dataMsg = '';
											print('multiSelectedMessage.length == ${_selectedItems.length.toString()}');
											 if(_selectedItems.length == 1){
											  dataMsg = parser.emojify(_selectedItems[0].replaceAll('<p>', '').replaceAll('</p>', '').replaceAll('<br>', ""));
											}else{
											  for(var item in _selectedItems){
												dataMsg =   dataMsg +  parser.emojify(item.replaceAll('<p>', '').replaceAll('</p>', '').replaceAll('<br>', ""))   + "\n";

											  //  print(dataMsg);
											  }
											}


											// print(dataMsg);


											_selectedItems = [];
											setState(() {
											  // _textEditingController.text = parser.emojify(selectMsg['message']);

											  Clipboard.setData(   ClipboardData(text: dataMsg ));


											  //  Clipboard.setData(   ClipboardData(text: parser.emojify(selectMsg['message'])));

											});
										  },
										  child: Icon(
											Icons.copy,
											size: 26.0,
										  ),
										)
									),
								IconButton(

										tooltip: 'Search',
										icon: const Icon(Icons.search),
										onPressed: () async {
											if (!selected) {
												setState(() {
													selected = true;
												});
											} else {
												setState(() {
													selected = false;
												});
											}
										}
								),
								 
									
								
							],
							title: selected? buildSearchBar(title!)
											:
										 Row (
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
											     IconButton(
												icon:    Icon(Icons.arrow_back, color: CurrentTheme.BackgroundColor,),
												onPressed: (){
												  setState(() {
													isMultiSelected = false;
												  });
												 // Navigator.pop(context, false);
												  /*
																						Navigator.pushAndRemoveUntil(
																						context,
																						MaterialPageRoute(builder: (context) => Projectscoid(id : '${listAccount[0]['user_hash']}')),
																								(Route<dynamic> route) => false,
																					);
																					*/

												},
											  ),
											 
											],
										  ),

							//Text(title!)  ,
						):
						AppBar(
							automaticallyImplyLeading: false,
							iconTheme: IconThemeData(
									 color: Colors.white, //change your color here
								 ),
							leading: null,

							actions: <Widget>[
								IconButton(

										tooltip: 'Search',
										icon: const Icon(Icons.search),
										onPressed: () async {
											if (!selected) {
												setState(() {
													selected = true;
												});
											} else {
												setState(() {
													selected = false;
												});
											}
										}
								),
								 
									
								
							],
							title: selected? buildSearchBar(title!)
											:
										Row (
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												   IconButton(
													icon:    Icon(Icons.arrow_back, color: CurrentTheme.BackgroundColor,),
													onPressed: (){
													Navigator.pop(context, false);
													/*
															Navigator.pushAndRemoveUntil(
															context,
															MaterialPageRoute(builder: (context) => Projectscoid(id : '${listAccount[0]['user_hash']}')),
																	(Route<dynamic> route) => false,
														);
														*/
														
													},
												),
                        tempheader!.split('*')[2 + titleindex].indexOf('1234') == 0 || tempheader!.split('*')[2 + titleindex] == '' ?
                        Container(height: 0.0, width: 0.0) :
												Container(
													padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0 , 0.0),
													child:  ClipRRect(
														borderRadius: BorderRadius.circular(100),
														child: Image.network(
																tempheader!.split('*')[2 + titleindex].indexOf('gravatar') == -1 ? Env.value!.imageUrl!+ '/upload/' + tempheader!.split('*')[2+ titleindex].replaceAll('ccc', '\/') :
																'https:\/\/www.gravatar.com\/avatar\/' + tempheader!.split('*')[2+ titleindex].replaceAll('ccc', '\/').replaceAll('gravatar', '') + '?s=115&d=monsterid' ,
															fit: BoxFit.fill,
															height: 48.0,
															width: 48.0,
														),
													),
												),
												Container(
													padding: const EdgeInsets.fromLTRB(0.0, 10.0, 2.0 , 0.0),
													child:
													Column(
															crossAxisAlignment:  CrossAxisAlignment.start,
															children: [
																Text(
																	 tempheader!.split('*')[2 + titleindex].indexOf('1234') == 0  || tempheader!.split('*')[2 + titleindex] == ''? 'Owner': tempheader!.split('*')[0 + titleindex],
																	style: TextStyle(
																			fontFamily: "Gotik",
																			fontSize: 13.0,
																			color: Colors.white,
																			fontWeight: FontWeight.w700),
																),
																tempheader!.split('*')[0 + titleindex] == ''?
																Text(
																	'',
																	style: TextStyle(
																			fontFamily: "Gotik",
																			fontSize: 12.0,
																			color: Colors.white,
																			fontWeight: FontWeight.w700),
																):
                                double.tryParse(tempheader!.split('*')[1 + titleindex])! == null?
																Container(height: 0.0, width: 0.0,)		:
																GFRating(
																value: double.tryParse(tempheader!.split('*')[1 + titleindex])!/2 -0.01,
																allowHalfRating: true,
																borderColor: Colors.white,
																color: Colors.white,
																size: 14,
																onChanged: (double rating) {  },
																),


															]),
												),
											],
										),

							//Text(title!)  ,
						),
           body: account1 == false ? Container()
		   :Column(
                  children: <Widget>[
                      progressCount == 0 ? Container() : Container(height: 30,),
                    progressCount == 0 ? Container() : LinearProgressIndicator(
                      backgroundColor: Colors.lightGreenAccent,
                      valueColor:    AlwaysStoppedAnimation<Color>(Colors.green),
                      minHeight: 25,value: progressCount,) ,
                    progressCount == 1.0? Text((progressCount * 100).toStringAsFixed(0) + "%" + " " + 'completed')  :
                    progressCount == 0? Container() :Text((progressCount * 100).toStringAsFixed(0) + "%") ,
                  
                          Expanded(
                          flex:  _flex1 ,
                          child:
                          _permissionReady? sendCheck?
                          buildListingBar3():
                          buildListingBar1(listAccount[0]['user_hash']):

                          //Container()

                          Center(
							  child:CircularProgressIndicator(
								valueColor:    AlwaysStoppedAnimation<Color>(
									Colors.green),
							  ))
                        ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:
                      Container(
                        height: heightTI,
                        child:
                        ReplyInput(
                          textEditingController: _textEditingController,
                          // textEditingController: _controller,
                          fNode: _focusNode,
                          onPressed: _sendMessage,
                          onChanged: _firstClick,
                          onAttach: _sendMAttachment,
                          onPic: _takePic,
                          onImage: getImage,
                          isEmoji: isShowEG,
                          onInsertEmoji: _insertEmoji,
                          onTextChange: _textChange,

                        ),
                      ),

                    ),
                    loadAtt? FileView(

                      value: fileName,
                      value1: '',
                      caption: 'Attachment',
                    ) : Container(),
                    isShowEG ? MediaQuery.of(context).viewInsets.bottom == 0.0? Expanded(
                        flex: 8,
                        child:
                        EmojiPicker(
                          rows: 4,
                          columns: 9,
                          buttonMode: ButtonMode.MATERIAL,
                          //recommendKeywords: ["racing", "horse"],
                          numRecommended: 0,
                          onEmojiSelected: (emoji, category) {
                            // print('here${emoji.name}');
                            if(_textEditingController.value.text == '') {

                              insertText('');
                            }
                            insertText(emoji.emoji!);
                          },
                        )
                    )
                        : Container(height: 0.0, width: 0.0,)
                        : Container(height: 0.0, width: 0.0,),

                  ]
                )
         ),  
		onWillPop: _onWillPop,
        );
  }

 
  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }
     Future<DIOProvider> _init()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final DIOProvider provider = await DIOProvider(appDocDir.path!);
    progressCount = 0;
    failed = false;
    return provider;
  }

  Map<String, dynamic> convertFormDataAction(var data, String? message){
    String? action =   'NewReply';
    bool isEdit = action.contains(   RegExp(r'edit', caseSensitive: false));
    String? attachments = '';
    String? attachments_last = '';
    if(isEdit && data != null){
      attachments_last = '[{"name":"${ data.name}","size":${ data.size.toString()},"created":${ data.created.toString()},"modified":${ data.modified.toString()},"temp":"${ data.temp}","remote":"","dir":"${ data.dir}"}]';

    }
    if (data!= null) {
      if (data.temp != '') {
        attachments = '[{"name":"${data.name}","size":${data.size},"created":${data.date},"modified":${data.date},"temp":"${data.temp}","remote":"${data.remote}","dir":"${data.dir}"}]';

      }
    }

    String? tgr =   'new_reply';
    var formData = {"post[_trigger_]":"$tgr"};
    formData.addAll({"post[message]": "${message }"});
    formData.addAll({"post[attachments]": '$attachments'});
    formData.addAll({"post[attachments_lastval]": '$attachments_last'});

    return( formData);
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

  Future<FileField?>loadFileFile(String? filename, String  filepath, ProgressULCallback progress)async{

    FormData  formdata = FormData.fromMap({
      "Filename":"filename",
      "Filedata": await MultipartFile.fromFile(filepath, filename: filename),

    });
    FileField? res ;

    try {
      res =  await provider!.uploadFile1(formdata, progress).then(( response) {
        return response;
      });
    }catch(e) {
      failed = true;
    }


    return res;
  }

  void _sendMAttachment() async {
    FileField? dioResultFile;
    provider = await _init();
    setState(() => _loadingPath = true);
    List<String?>? files;
    try {
      if (_multiPick) {
        _path = null;

        FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

        if(result != null) {

          files = result.paths;

        }
      } else
      {
        files = null;
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        if(result != null) {
          _path = result.files!.single.path;
        }
        var filename;
        filename = p.basename(_path!);
        var filename1 = filename;
        var file = File(_path!);
        var lastmd = file.lastModifiedSync();
        var filelength = file.lengthSync();
        var fl = filelength;
        int  filedate = lastmd.toUtc().millisecondsSinceEpoch;
		
		
		
		 if (result!.files!.single.path!.isNotEmpty) {


                bool res = await Navigator.push(
                context,
                MaterialPageRoute(
                builder: (_) => ShowSentFileShowConversationMyBids(
                        //  file: ,
                          fz: filelength,
                          date:lastmd,
                          basename:filename1 ,
                          ),
                    ),
                );
                if(!res){
                AppProvider.getRouter(context)!.pop(context);

                 }else{
		
		
		
		
		
        dioResultFile = await loadFileFile(filename, _path!, showProgress);

       // filename =
        /*
        _path = await FilePicker.getFilePath(
          type: _pickingType,
          allowedExtensions: (_extension?.isNotEmpty ?? false)
              ? _extension?.replaceAll(' ', '')?!.split(',')
              : null,
        );

         */

          if(dioResultFile!.status == '1'){
            loadAtt = true;
            fileName = dioResultFile!.temp;
            val =    FileField(dioResultFile!.status, dioResultFile!.name,filelength,0,0, dioResultFile!.temp, '', '',filedate.toString(), );

            //var res await getUploadFolder(filename, 'usr${widget.userID}' );

            AppProvider.getRouter(context)!.pop(context);

          }
       

         }
        }
	  }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;

    if(isShowEG){
      isShowEG = false;
    }

    setState(() {
      _loadingPath = false;
      // = _path != null
      //    ? _path!.split('/').last
      //    : files != null ? files.toString() : '...';
    });
  }

  Future _takePic() async {
    provider = await _init();

    // Navigator.of(context).pop();
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThreadCamera( provider: provider, onAddPic: _addPic )),
    );


  }
  
  void _addPic(FileField? value) {

   // = value;

   fileName = value!.name;
   setState(() {
     val =    FileField(value!.status, value!.name,value!.size,0,0, value!.temp, '', '',value!.date, );
     loadAtt = true;
   });
  }

  void _firstClick() {
    if(isShowEG){
      // insertText('');
     setState(() {
        isShowEG = false;
      });
    }
   // SystemChannels.textInput.invokeMethod('TextInput.show');
    tapCount ++;

  }


  void _insertEmoji() {
    tapCount ++;
    if(!isShowEG){
      setState(() {
        FocusScope.of(context).requestFocus(_focusNode);
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        isShowEG = true;
      });

    }else{

      setState(() {
        isShowEG = false;
        FocusScope.of(context).requestFocus(_focusNode);
        SystemChannels.textInput.invokeMethod('TextInput.show');
      });
    }
    if(isShowEG){
    }else{
      if(_textEditingController.value.text == ''){
        FocusScope.of(context).requestFocus(_focusNode);
      }
    }



    if(_textEditingController.value.text == ''){

      // SystemChannels.textInput.invokeMethod('TextInput.hide');
      // FocusScope.of(context).requestFocus(_focusNode);
    }


  }


  void _textChange(String text) {
    double temp = 53;
    int temp1 = 8;
    final span = TextSpan(text: _textEditingController.value.text,
        style: TextStyle(fontSize: 14, fontFamily: 'Amazon Ember'));
    final tp = TextPainter(text: span, textDirection: TextDirection.ltr ,);
    bool isNextLine = false;
    tp.layout(
      minWidth: 20,
      maxWidth: 0.6 * MediaQuery
          .of(context)
          .size
          .width ,
    );
    List<ui.LineMetrics> lines = tp.computeLineMetrics();
    int numberOfLines = lines.length;
    if(numberOfLines > OldNumberLine) isNextLine = true;
    OldNumberLine = numberOfLines;
    if (MediaQuery
        .of(context)
        .viewInsets
        .bottom == 0.0) {
      // print('testkeyboard' + _textEditingController.value.text);
      if (isShowEG)
      {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      } else
      {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      }
    } else {
      // print('testkeyboardyes' + _textEditingController.value.text);
      if (isShowEG) {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 125;
            }
            break;
        }
      } else {
        switch (numberOfLines) {
          case 1:
            {
              temp = 53;
            }
            break;
          case 2:
            {
              temp = 75;
            }
            break;
          case 3:
            {
              temp = 95;
            }
            break;
          case 4:
            {
              temp = 115;
            }
            break;

          default :
            {
              temp = 115;
            }
            break;
        }
      }

      if(isNextLine){
        setState(() {
          //  _flex = temp;
          heightTI = temp;

        });
      }
    }
  }

  void insertText(String text) {
    var value = _textEditingController.value;
    var start = value.selection.baseOffset;
    var end = value.selection.extentOffset;
    if (value.selection.isValid) {
      String? newText = "";
      if (value.selection.isCollapsed) {
        if (end > 0) {
          newText += value.text.substring(0, end);
        }
        newText += text;
        if (value.text.length > end) {
          newText += value.text.substring(end, value.text.length);
        }
      } else {
        newText = value.text.replaceRange(start, end, text);
      }

      setState(() {
        _textEditingController.value = value.copyWith(
            text: newText,
            selection: value.selection.copyWith(
                baseOffset: end + text.length,
                extentOffset: end + text.length));
      });
    }else{
      setState(() {
        _textEditingController.value = value.copyWith(
            text: text,
            selection: TextSelection.collapsed(offset: text.length));
      });
    }
  }

  Future<Photo?>loadImageFile(String filename, String  filepath, ProgressULCallback progress)async{
    FormData formdata = FormData.fromMap({
      "Filename":"filename",
      "Filedata": await MultipartFile.fromFile(filepath, filename: filename),

    });
    Photo? res ;
    // String? res ;


    try {
      res =  await provider!.uploadImage1(formdata, progress).then(( response) {
        return response;
      });
    }catch(e) {
      failed = true;
    }

    return res;
  }

  Future getImage() async {
    provider = await _init();
    try {
      final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
      );

      if (pickedFile!.path!.isNotEmpty) {
	  
	  bool result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ShowSentImageShowConversationMyBids(
                image : pickedFile.path
            ),
          ),
        );
        if(!result){
          AppProvider.getRouter(context)!.pop(context);

        }else{
	  
        var _path = pickedFile.path;
        var filename;
        filename = p.basename(_path!);
        var file = File(_path!);
        var lastmd = file.lastModifiedSync();
        var filelength = file.lengthSync();
        var fl = filelength;
        int filedate = lastmd.toUtc().millisecondsSinceEpoch;
        var dioResultFile = await loadImageFile(filename, _path!, showProgress);
        if(dioResultFile!.status == '1'){
          loadAtt = true;
          fileName = dioResultFile!.temp;
          val =    FileField(dioResultFile!.status, dioResultFile!.name,filelength,0,0, dioResultFile!.temp, '', '',filedate.toString(), );

          //var res await getUploadFolder(filename, 'usr${widget.userID}' );

          AppProvider.getRouter(context)!.pop(context);

        }

        /*
        _path = await FilePicker.getFilePath(
          type: _pickingType,
          allowedExtensions: (_extension?.isNotEmpty ?? false)
              ? _extension?.replaceAll(' ', '')?!.split(',')
              : null,
        );

         */
       }
      }


    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;

    if(isShowEG){
      isShowEG = false;
    }

    setState(() {
      _loadingPath = false;

    });
/*
    setState(() {
      _image = File(pickedFile.path!);
    });

 */
  }
  
  
void _sendMessage()async{
    if(_isRewardedAdReady){
   
     _rewardedAd?.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
       // Reward the user for watching an ad.
     });
     }
    String? sendPath = Env.value!.baseUrl! + '/user/my_bids/show_conversation_new_reply/${widget.id!}/buat-artikel-1-saja/${tempheader!.split('*')[0]}/annncncncncnc';
    // final blank = _textEditingController.text == null || _textEditingController.text.trim() == '';
    var postShowThreadResult;
    progressCount = 0;
    bool blank = _textEditingController.text?.trim()?.isEmpty ?? true;
    // print('hereeee');
    if (_textEditingController.text.isNotEmpty && !blank) {
      // print('hereeee');
      String? str = _textEditingController.text;
      String? newString = str.replaceAllMapped(RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+'), (match) {
        return "<a href='${match.group(0)}'>${match.group(0)}</a>";

      });

     // val;

      //parser.emojify(parser.unemojify(newString));


        //Map<String, dynamic> res = model.toJson();
        //print('json result == $res');
        var formData = await convertFormDataAction(val, parser.emojify(parser.unemojify(newString)));
		  if(sc != null){
          setState(() {
            sendMsgTemp = newString;
            // SystemChannels.textInput.invokeMethod('TextInput.hide');
            sendCheck = true;

          });
        }
        st =     SubModelController(AppProvider.getApplication(context),
            sendPath,
            formData);
        final future = st!.sendData();
        future.then((value) {
          setState(() {
            postShowThreadResult = value;
          });
        }).catchError((Error) {
		 show_conversation!.listingShowConversation!.add(ShowConversationMyBidsListingRefresh());
          setState(() {

            sendCheck = false;
          });
         // AppProvider.getRouter(context)!.pop(context);
        });
     // print(newString);
      loadAtt = false;

      val = null;

     // setState(() {
        // SystemChannels.textInput.invokeMethod('TextInput.hide');
        _textEditingController.clear();
        FocusScope.of(context).requestFocus(_focusNode);
     // });
      // show_conversation!.listingShowConversation!.add(ShowConversationMyBidsListingRefresh());
    }else{
	   if(val != null){
	      String? str = _textEditingController.text;
      String? newString = str.replaceAllMapped(RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+'), (match) {
        return "<a href='${match.group(0)}'>${match.group(0)}</a>";

      });

     // val;

      //parser.emojify(parser.unemojify(newString));


        //Map<String, dynamic> res = model.toJson();
        //print('json result == $res');
        var formData = await convertFormDataAction(val, parser.emojify(parser.unemojify(newString)));
		  if(sc != null){
          setState(() {
            sendMsgTemp = newString;
            // SystemChannels.textInput.invokeMethod('TextInput.hide');
            sendCheck = true;

          });
        }
        st =     SubModelController(AppProvider.getApplication(context),
            sendPath,
            formData);
        final future = st!.sendData();
        future.then((value) {
          setState(() {
            postShowThreadResult = value;
          });
        }).catchError((Error) {
		   show_conversation!.listingShowConversation!.add(ShowConversationMyBidsListingRefresh());
          setState(() {

            sendCheck = false;
          });
         // AppProvider.getRouter(context)!.pop(context);
        });
     // print(newString);
      loadAtt = false;

      val = null;

     // setState(() {
        // SystemChannels.textInput.invokeMethod('TextInput.hide');
        _textEditingController.clear();
        FocusScope.of(context).requestFocus(_focusNode);
     // });
	  //show_conversation!.listingShowConversation!.add(ShowConversationMyBidsListingRefresh());

	   }
	}

  }
	 
	 
  
  
  Widget buildSearchBar(String tiltle){
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
            style:    TextStyle(
                fontSize: 14.0,
                height: 0.2,
                color: Colors.black
            ),
          onChanged: (String value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

           // hasFloatingPlaceholder: false,
            suffixIcon:
            IconButton(
              icon:Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ) ,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) , gapPadding: 20.0),
          ),
        )
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  
 Widget buildListingBar1(String id){
    var cb;
   if(widget.cb == null){
         cb  = AppProvider.getApplication(context).chat;
     }else{
       cb  = widget.cb;
     }

    return StreamBuilder(
        stream: cb.onMessageST,
        builder: (BuildContext context, AsyncSnapshot snapshot)
    {
      if (snapshot.hasError) return Text(snapshot.error.toString());
      if (snapshot.data == null) {
       // _chatBloc.lg(id);
       // print('ole 2');
        return buildListingBar2();
        //return Text('ole 2' );
      }

      if(tempNotify == jsonDecode(snapshot.data)['message']) {
        return buildListingBar2();

      }
      // print('ole 1');

      tempNotify = jsonDecode(snapshot.data)['message'];
      return buildListingBar(snapshot.data);
      //return Text('ole 1 ${jsonDecode(snapshot.data)['message']}' );
     }
    );     

  } 
  
  

    		var listViewKey = RectGetter.createGlobalKey();

   // @override
     Widget  buildListingBar2(){ 
  		var formatter =    inter.DateFormat('dd MMMM yyyy');
		  listViewKey = RectGetter.createGlobalKey();
		List<int> getVisible() {
			/// First, get the rect of ListView, and then traver the _keys
			/// get rect of each item by keys in _keys, and if this rect in the range of ListView's rect,
			/// add the index into result list.
			var rect = RectGetter.getRectFromKey(listViewKey);
			var _items = <int>[];
			 _keys.forEach((index, key) {
        var itemRect = RectGetter.getRectFromKey(key);
        if (itemRect != null && !(itemRect.top + rect!.height > rect.bottom || itemRect.bottom + rect!.height < rect.top)) _items.add(index);
      });
      if(_items.isEmpty){
        firstSelectIndex.value = 0 + 0;
      }else{
        firstSelectIndex.value = _items[0] + 0;
      }
			return _items;
		}
		

  
    return BlocBuilder<ShowConversationMyBidsListing, ShowConversationMyBidsState>(
      bloc: show_conversation!.listingShowConversation,

      builder: (BuildContext context, state) {
        if (state is ShowConversationMyBidsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
		 /*
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
		  */
		   if(sc != null){
            print('ini sc ==== ${sc.length.toString()}');

            buildListingBar4();


          }else{
           // return Container();
            return    Center(
                child:CircularProgressIndicator(
                  valueColor:    AlwaysStoppedAnimation<Color>(
                      Colors.green),
                ));
          }
        }
        if (state is ShowConversationMyBidsListingError) {
		  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is ShowConversationMyBidsListingLoaded) {
          if (state.show_conversation!.items.items.isEmpty) {
		  if (state.show_conversation!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
					floatingActionButton: state.show_conversation!.Buttons12(context, _dialVisible, widget.id!, tempheader!.split('*')[0], 'my_bids'.contains('my_bids'),widget.cb!)
					
              );
			  }
          }
			if (state.show_conversation!.tools.buttons.length == 0){ 
			  sc = [];
			  show_conversationLM =  state.show_conversation;
              sc.addAll(state.show_conversation!.items.items.reversed);
			   
				  return
		  Scaffold(
                    body:
					///////////////////
					NotificationListener<ScrollUpdateNotification>(
														onNotification: (notification) {
															getVisible();
															return true;
														},
															 child:
																	RefreshIndicator(
																		child:
																		Stack(
																			children: <Widget>[
																										RectGetter(
																											key: listViewKey,
																											//child:
																											//  Column(
																											//		children: <Widget>[
																											//	Expanded(
																													child:   ListView.builder(
																                                                              physics: const AlwaysScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
																															  reverse: true,
																															  shrinkWrap: true,
																															itemBuilder: (BuildContext context, int index) {
																																_keys[index] = RectGetter.createGlobalKey();

																																return index >= state.show_conversation!.items.items.length?
																																          state.show_conversation!.tools.paging.current_page == 1?
                                                                                                                                           Container(height: 0.0, width: 0.0,):
																																		  UserShowConversationMyBidsBottomLoader()
																																		:
																																index == 0 ?
																																RectGetter(
																																		key: _keys[index],
																																		child:
																																		state.show_conversation!.viewItem2 (sc[index] , sc[index] , searchText! ,context, account, widget.id1!,  state.hasReachedMax!, state.show_conversation!.items.items.length, index, _onSelect, _selectedItemsIndex, _selectedItems)
																																		
																																		
																																)	:
																																RectGetter(
																																		key: _keys[index],
																																		child:
																																		state.show_conversation!.viewItem2 (sc[index] , sc[index-1] , searchText! ,context,  account, widget.id1!, state.hasReachedMax!, state.show_conversation!.items.items.length-1, index, _onSelect, _selectedItemsIndex, _selectedItems)
																																);
																															},
																															itemCount: state.hasReachedMax!
																																	? state.show_conversation!.items.items.length
																																	: state.show_conversation!.items.items.length + 1,
																															controller: scrollController,
																														),
																											//	),
																													//	Container(height: 80, color: Colors.white,)
																												//	],
																											//	)

																										),

																				ValueListenableBuilder(
																					builder: (BuildContext context, int value, Widget? child) {
                                                                                        return
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
																																	child: Text('${formatter.format(sc[value].item.post_date)}', style: TextStyle(color: Colors.white, fontSize: 12)),
																																)
																														),


																												)
																											],
																										)


																									//child:
																								);
																					},
																					valueListenable: firstSelectIndex,
																				),
																			]
																		),
																		onRefresh: _onRefresh,
																	),
					     		),
					
							
                   
			 );				
			}
			  sc = [];
			   show_conversationLM =  state.show_conversation;
			 sc.addAll(state.show_conversation!.items.items.reversed);
			
          return
		  Scaffold(
                    body:
					///////////////////
					NotificationListener<ScrollUpdateNotification>(
														onNotification: (notification) {
															getVisible();
															return true;
														},
															 child:
																	RefreshIndicator(
																		child:
																		Stack(
																			children: <Widget>[
																										RectGetter(
																											key: listViewKey,
																											//child:
																											//  Column(
																											//		children: <Widget>[
																											//	Expanded(
																													child:   ListView.builder(
																                                                              physics: const AlwaysScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
																															  reverse: true,
																															  shrinkWrap: true,
																															itemBuilder: (BuildContext context, int index) {
																																_keys[index] = RectGetter.createGlobalKey();

																																return index >= state.show_conversation!.items.items.length?
																																          state.show_conversation!.tools.paging.current_page == 1?
                                                                                                                                           Container(height: 0.0, width: 0.0,):
																																		  UserShowConversationMyBidsBottomLoader()
																																		:
																																index == 0 ?
																																RectGetter(
																																		key: _keys[index],
																																		child:
																																		state.show_conversation!.viewItem2 (sc[index] , sc[index] , searchText! ,context, account, widget.id1!,  state.hasReachedMax!, state.show_conversation!.items.items.length, index, _onSelect, _selectedItemsIndex, _selectedItems)
																																		
																																		
																																)	:
																																RectGetter(
																																		key: _keys[index],
																																		child:
																																		state.show_conversation!.viewItem2 (sc[index] , sc[index-1] , searchText! ,context,  account, widget.id1!, state.hasReachedMax!, state.show_conversation!.items.items.length-1, index, _onSelect, _selectedItemsIndex, _selectedItems)
																																);
																															},
																															itemCount: state.hasReachedMax!
																																	? state.show_conversation!.items.items.length
																																	: state.show_conversation!.items.items.length + 1,
																															controller: scrollController,
																														),
																											//	),
																													//	Container(height: 80, color: Colors.white,)
																												//	],
																											//	)

																										),

																				ValueListenableBuilder(
																					builder: (BuildContext context, int value, Widget? child) {
                                                                                        return
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
																																	child: Text('${formatter.format(sc[value].item.post_date)}', style: TextStyle(color: Colors.white, fontSize: 12)),
																																)
																														),


																												)
																											],
																										)


																									//child:
																								);
																					},
																					valueListenable: firstSelectIndex,
																				),
																			]
																		),
																		onRefresh: _onRefresh,
																	),
					     		),
					 floatingActionButton: state.show_conversation!.ButtonsXX1(context, _dialVisible, widget.id!,isShowEG, tempheader!.split('*')[0], 'my_bids'.contains('my_bids'), widget.cb!)
                    
							
                   
			 );
        }
		
		
		 if(sc != null){
          print('ini sc ==== ${sc.length.toString()}');

          return buildListingBar4();


        }else{
          return    Center(
              child:CircularProgressIndicator(
                valueColor:    AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
      },
    );
  }
  
   Widget  buildListingBar3(){
    ItemShowConversationModel itm;
    var formatter =    inter.DateFormat('dd MMMM yyyy');
    listViewKey = RectGetter.createGlobalKey();
    List<int> getVisible() {
      /// First, get the rect of ListView, and then traver the _keys
      /// get rect of each item by keys in _keys, and if this rect in the range of ListView's rect,
      /// add the index into result list.
      var rect = RectGetter.getRectFromKey(listViewKey);
      var _items = <int>[];
      _keys.forEach((index, key) {
        var itemRect = RectGetter.getRectFromKey(key);
        if (itemRect != null && !(itemRect.top + rect!.height > rect.bottom || itemRect.bottom + rect!.height < rect.top)) _items.add(index);
      });
      if(_items.isEmpty){
        firstSelectIndex.value = 0 + 0;
      }else{
        firstSelectIndex.value = _items[0] + 0;
      }
      return _items;
    }
    var it =    ItemShowConversation(null,null,DateTime.now(),sendMsgTemp,null,null,null,null,null,null,null,null,null,null,null,null, null, null,null);
    var  js = it.toJson();
    js['user_user_name'] = '12345678';
    itm =     ItemShowConversationModel(js);
    if(
     sc.length == show_conversationLM!.items.items.length
    ){
      sc.insert(0, itm);
    }




    return
      Scaffold(
        body:
        ///////////////////
        NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            getVisible();
            return true;
          },
          child:
          RefreshIndicator(
            child:
            Stack(
                children: <Widget>[
                  RectGetter(
                    key: listViewKey,
                    //child:
                    //  Column(
                    //		children: <Widget>[
                    //	Expanded(
                    child:   ListView.builder(
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      reverse: true,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        _keys[index] = RectGetter.createGlobalKey();

                        return index >= show_conversationLM!.items.items.length + 1?
                        show_conversationLM!.tools.paging.total_pages == show_conversationLM!.tools.paging.current_page?
                        Container(height: 0.0, width: 0.0,):
                        UserShowConversationMyBidsBottomLoader()
                            :
                        index == 0 ?
                        RectGetter(
                            key: _keys[index],
                            child:
							show_conversationLM!.viewItem2(sc[index] , sc[index] , searchText! ,context,  account, widget.id1!, false, show_conversationLM!.items.items.length-1, index, _onSelect, _selectedItemsIndex, _selectedItems)

                        )	:
                        RectGetter(
                            key: _keys[index],
                            child:
							show_conversationLM!.viewItem2(sc[index] , sc[index-1] , searchText! ,context,  account, widget.id1!, false, show_conversationLM!.items.items.length-1, index, _onSelect, _selectedItemsIndex, _selectedItems)
                        );
                      },
                      itemCount:
                           show_conversationLM!.items.items.length + 1
                          ,
                      controller: scrollController,
                    ),
                    //	),
                    //	Container(height: 80, color: Colors.white,)
                    //	],
                    //	)

                  ),

                  ValueListenableBuilder(
                    builder: (BuildContext context, int value, Widget? child) {
                      return
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
                                        child: Text('${formatter.format(sc[value].item.post_date)}', style: TextStyle(color: Colors.white, fontSize: 12)),
                                      )
                                  ),


                                )
                              ],
                            )


                          //child:
                        );
                    },
                    valueListenable: firstSelectIndex,
                  ),
                ]
            ),
            onRefresh: _onRefresh,
          ),
        ),



      );
  }
  
  
  
   Widget  buildListingBar4(){
    ItemShowConversationModel itm;
    var formatter =    inter.DateFormat('dd MMMM yyyy');
    listViewKey = RectGetter.createGlobalKey();
    List<int> getVisible() {
      /// First, get the rect of ListView, and then traver the _keys
      /// get rect of each item by keys in _keys, and if this rect in the range of ListView's rect,
      /// add the index into result list.
      var rect = RectGetter.getRectFromKey(listViewKey);
      var _items = <int>[];
      _keys.forEach((index, key) {
        var itemRect = RectGetter.getRectFromKey(key);
        if (itemRect != null && !(itemRect.top + rect!.height > rect.bottom || itemRect.bottom + rect!.height < rect.top)) _items.add(index);
      });
      if(_items.isEmpty){
        firstSelectIndex.value = 0 + 0;
      }else{
        firstSelectIndex.value = _items[0] + 0;
      }
      return _items;
    }
	/*
    var it =    ItemShowConversation(null,null,DateTime.now(),sendMsgTemp,null,null,null,null,null,null,null,null,null,null,null,null, null, null,null);
    var  js = it.toJson();
    js['user_user_name'] = '12345678';
    itm =     ItemShowConversationModel(js);
    if(
     sc.length == show_conversationLM!.items.items.length
    ){
      sc.insert(0, itm);
    }
	*/




    return
      Scaffold(
        body:
        ///////////////////
        NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            getVisible();
            return true;
          },
          child:
          RefreshIndicator(
            child:
            Stack(
                children: <Widget>[
                  RectGetter(
                    key: listViewKey,
                    //child:
                    //  Column(
                    //		children: <Widget>[
                    //	Expanded(
                    child:   ListView.builder(
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      reverse: true,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        _keys[index] = RectGetter.createGlobalKey();

                        return index >= show_conversationLM!.items.items.length ?
                        show_conversationLM!.tools.paging.total_pages == show_conversationLM!.tools.paging.current_page?
                        Container(height: 0.0, width: 0.0,):
                        UserShowConversationMyBidsBottomLoader()
                            :
                        index == 0 ?
                        RectGetter(
                            key: _keys[index],
                            child:
							show_conversationLM!.viewItem2(sc[index] , sc[index] , searchText! ,context,  account, widget.id1!, false, show_conversationLM!.items.items.length-1, index, _onSelect, _selectedItemsIndex, _selectedItems)

                        )	:
                        RectGetter(
                            key: _keys[index],
                            child:
							show_conversationLM!.viewItem2(sc[index] , sc[index-1] , searchText! ,context,  account, widget.id1!, false, show_conversationLM!.items.items.length-1, index, _onSelect, _selectedItemsIndex, _selectedItems)
                        );
                      },
                      itemCount:
                           show_conversationLM!.items.items.length 
                          ,
                      controller: scrollController,
                    ),
                    //	),
                    //	Container(height: 80, color: Colors.white,)
                    //	],
                    //	)

                  ),

                  ValueListenableBuilder(
                    builder: (BuildContext context, int value, Widget? child) {
                      return
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
                                        child: Text('${formatter.format(sc[value].item.post_date)}', style: TextStyle(color: Colors.white, fontSize: 12)),
                                      )
                                  ),


                                )
                              ],
                            )


                          //child:
                        );
                    },
                    valueListenable: firstSelectIndex,
                  ),
                ]
            ),
            onRefresh: _onRefresh,
          ),
        ),



      );
  }
  
  
  
   Widget  buildListingBar(var data1){
  		var formatter =    inter.DateFormat('dd MMMM yyyy');
		var listViewKey = RectGetter.createGlobalKey();
		List<int> getVisible() {
			/// First, get the rect of ListView, and then traver the _keys
			/// get rect of each item by keys in _keys, and if this rect in the range of ListView's rect,
			/// add the index into result list.
			var rect = RectGetter.getRectFromKey(listViewKey);
			var _items = <int>[];
			  _keys.forEach((index, key) {
					var itemRect = RectGetter.getRectFromKey(key);
					if (itemRect != null && !(itemRect.top + rect!.height > rect.bottom || itemRect.bottom + rect!.height < rect.top)) _items.add(index);
				  });
			//firstSelectIndex.value = _items[0] + 0;
			firstSelectIndex.value =  0;
			return _items;
		}
		
	  if(data1 != null){
      show_conversation!.listingShowConversation!.add(ShowConversationMyBidsListingRefresh());
      data1 = null;

    }
  
    return BlocBuilder<ShowConversationMyBidsListing, ShowConversationMyBidsState>(
      //cubit: show_conversation!.listingShowConversation,

      builder: (BuildContext context, state) {
        if (state is ShowConversationMyBidsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is ShowConversationMyBidsListingError) {
		  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is ShowConversationMyBidsListingLoaded) {
          if (state.show_conversation!.items.items.isEmpty) {
		  if (state.show_conversation!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
				   
					
					floatingActionButton: state.show_conversation!.Buttons12(context, _dialVisible, widget.id!, tempheader!.split('*')[0], 'my_bids'.contains('my_bids'), widget.cb!)
					
              );
			  }
          }
			if (state.show_conversation!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.show_conversation!.items.items.length?  
									  state.show_conversation!.tools.paging.total_pages == state.show_conversation!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  
									  UserShowConversationMyBidsBottomLoader()
									  : state.show_conversation!.viewItem (state.show_conversation!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.show_conversation!.items.items.length
									: state.show_conversation!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							)
				);					
			}
			var sc = [];
              sc.addAll(state.show_conversation!.items.items.reversed);
          return
		  Scaffold(
                    body:
					///////////////////
					NotificationListener<ScrollUpdateNotification>(
														onNotification: (notification) {
															getVisible();
															return true;
														},
															 child:
																	RefreshIndicator(
																		child:
																		Stack(
																			children: <Widget>[
																										RectGetter(
																											key: listViewKey,
																											//child:
																											//  Column(
																											//		children: <Widget>[
																											//	Expanded(
																													child:   ListView.builder(
																                                                              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
																															  reverse: true,
																															  shrinkWrap: true,
																															itemBuilder: (BuildContext context, int index) {
																																_keys[index] = RectGetter.createGlobalKey();

																																return index >= state.show_conversation!.items.items.length?
																																          state.show_conversation!.tools.paging.total_pages == state.show_conversation!.tools.paging.current_page?
                                                                                                                                           Container(height: 0.0, width: 0.0,):
																																		  UserShowConversationMyBidsBottomLoader()
																																		:
																																index == 0 ?
																																RectGetter(
																																		key: _keys[index],
																																		child:
																																		state.show_conversation!.viewItem2 (sc[index] , sc[index] , searchText! ,context, account, widget.id1!,  state.hasReachedMax!, state.show_conversation!.items.items.length, index, _onSelect, _selectedItemsIndex, _selectedItems)
																																		
																																		
																																)	:
																																RectGetter(
																																		key: _keys[index],
																																		child:
																																		state.show_conversation!.viewItem2 (sc[index] , sc[index-1] , searchText! ,context,  account, widget.id1!, state.hasReachedMax!, state.show_conversation!.items.items.length-1, index, _onSelect, _selectedItemsIndex, _selectedItems)
																																);
																															},
																															itemCount: state.hasReachedMax!
																																	? state.show_conversation!.items.items.length
																																	: state.show_conversation!.items.items.length + 1,
																															controller: scrollController,
																														),
																											//	),
																													//	Container(height: 80, color: Colors.white,)
																												//	],
																											//	)

																										),

																				ValueListenableBuilder(
																					builder: (BuildContext context, int value, Widget? child) {
                                                                                        return
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
																																	child: Text('${formatter.format(sc[value].item.post_date)}', style: TextStyle(color: Colors.white, fontSize: 12)),
																																)
																														),


																												)
																											],
																										)


																									//child:
																								);
																					},
																					valueListenable: firstSelectIndex,
																				),
																			]
																		),
																		onRefresh: _onRefresh,
																	),
					     		),
					 floatingActionButton: state.show_conversation!.ButtonsXX1(context, _dialVisible, widget.id!,isShowEG, tempheader!.split('*')[0], 'my_bids'.contains('my_bids'),widget.cb!)
                    
							
                   
			 );
        }
		
		 if(sc != null){
          print('ini sc ==== ${sc.length.toString()}');

          return buildListingBar3();


        }else{
          return    Center(
              child:CircularProgressIndicator(
                valueColor:    AlwaysStoppedAnimation<Color>(
                    Colors.green),
              ));
        }
      },
    );
  }

  @override
  void dispose() {
    show_conversation!.listingShowConversation!.dispose();
	_rewardedAd?.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =    Completer<Null>();
    show_conversation!.listingShowConversation!.add(ShowConversationMyBidsListingRefresh());

    Timer timer =    Timer(   Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll()async{
    final maxScroll = scrollController!.position.maxScrollExtent;
    double currentScroll = scrollController!.position.pixels;
	
    cs.value = currentScroll;
    if (maxScroll - currentScroll <= scrollThreshold) {
      show_conversation!.listingShowConversation!.add(ShowConversationMyBidsList());
    }

  }

}

class  UserShowConversationMyBidsBottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}


//////////////////
  
  
  class ShowSentImageShowConversationMyBids extends StatefulWidget {
  final String? image;

  ShowSentImageShowConversationMyBids({this.image});

  @override
  ShowSentImageShowConversationMyBidsState createState() => ShowSentImageShowConversationMyBidsState();
}


class ShowSentImageShowConversationMyBidsState extends State<ShowSentImageShowConversationMyBids> {
  String? _message = "";
  String? _path = "";
  String? _size = "";
  String? _mimeType = "";
  File? _imageFile;
  int _progress = 0;
  //final String? image1;
  List<File> _mulitpleFiles = [];
  ShowSentImageShowConversationMyBidsState();
  @override
  void initState() {
    super.initState();


  }
  //String image;
//  ShowImage({this.image});

  @override
  Widget build(BuildContext context) {
    print('my image == ${widget.image}');
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pop(context, false);
            },
            child:
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:  Text('X' , style: TextStyle(fontSize: 20, color : Colors.redAccent),),
            ),



          ),
          SizedBox(width: 30),

          GestureDetector(
            onTap: (){
              Navigator.pop(context, true);
            },
            child:
            Padding(
             padding: EdgeInsets.symmetric(vertical: 10),
             child: Text('OK',  style: TextStyle(fontSize: 20),),
             ),



          ),
          SizedBox(width: 20),
        ],
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
        imageProvider: FileImage(
          File(widget.image!)
        ),
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

}



class ShowSentFileShowConversationMyBids extends StatefulWidget {

  final  int? fz;
  final DateTime? date;
  final String? basename;

  ShowSentFileShowConversationMyBids({ this.fz, this.date, this.basename});

  @override
  ShowSentFileShowConversationMyBidsState createState() => ShowSentFileShowConversationMyBidsState();
}


class ShowSentFileShowConversationMyBidsState extends State<ShowSentFileShowConversationMyBids> {
  String? _message = "";
  String? _path = "";
  String? _size = "";
  String? _mimeType = "";
  File? _fileFile;
  int _progress = 0;
  //final String? file1;
  var dateformat = intl1.DateFormat('dd/MM/yyyy  hh:mm:ss');
  List<File> _mulitpleFiles = [];
  ShowSentFileShowConversationMyBidsState();
  @override
  void initState() {
    super.initState();


  }
  //String file;
//  ShowImage({this.file});

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
   //print('wf ==== ${widget.file}');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0.0,

          title: Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: Text(
              'Sent File',
              style: TextStyle(
                  fontFamily: "Gotik",
                  fontSize: 20.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pop(context, false);
              },
              child:
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:  Text('X' , style: TextStyle(fontSize: 20, color : Colors.redAccent),),
              ),



            ),
            SizedBox(width: 30),

            GestureDetector(
              onTap: (){
                Navigator.pop(context, true);
              },
              child:
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('OK',  style: TextStyle(fontSize: 20),),
              ),



            ),
            SizedBox(width: 20),
          ],
        ),
        //resizeToAvoidBottomPadding: false,
        body:
            Center(
              child: GestureDetector(
                  child:   Container(
                    width: width * 3/4,
                    height: 70,

                    decoration:    ShapeDecoration(
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
                          Text('Attachment: ', style: TextStyle(fontSize: 10),),
                          Text('${widget.basename}', style: TextStyle(color: Colors.red, fontSize: 12),),
                          widget.fz == null? Container() : Text('(${filesize(widget.fz)}, ${dateformat.format(widget.date!)} WIB)', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),

                  ),

                  onTap: (){

                  }

              )
            )



    );

  }

}


//////////////////


class CancelBidMyBids extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_bids/cancel_bid/:id/:title';
  CancelBidMyBids({Key? key, this.id, this.title}) : super(key: key);

  @override
  CancelBidMyBidsState createState() => CancelBidMyBidsState();
}

class CancelBidMyBidsState extends State<CancelBidMyBids> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_bids/cancel_bid/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_bids/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_bids/cancel_bid/%s/%s';

  MyBidsController? cancel_bid;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelCancelBid;
  var model;
  var formData;
  var postCancelBidResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Cancel Bid';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'CancelBid';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(MyBidsController? cancel_bid , BuildContext context)async {
    if (this.model == null) {
       final future = cancel_bid!.getCancelBidMyBids('');
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          try{
		  this.model = value;
		    try{
            errmsg = value;
			  }catch(e){

			  }
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		 
		  if(this.model.model.meta == null){
            isError = true;
			  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          }
		  isError = false;
        }).catchError((Error){
		   isError = true;
		 
		    if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
			/*
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Unauthorized  :'+ sprintf('Cancel Bid', [widget.id!,widget.title!])),
               backgroundColor: Colors.red,
             ),
           );
         });
		 */
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  // setState(() {
              // isLoading = false;
           // });
		  }
		});
      }
    }
   Future<bool>  _onWillPop() async{
		return await showDialog(
			context: context,
			builder: (context) =>
					AlertDialog(
						title: Text('Kembali',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
						content: Text('Apakah Anda ingin meninggalkan halaman ini?'),
						actions: <Widget>[
							FlatButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('CancelBid')){
										cancel_bid!.deleteAllCancelBidMyBids(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('CancelBid')){
										cancel_bid!.deleteAllCancelBidMyBids(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('CancelBid')){
										cancel_bid!.deleteAllCancelBidMyBids(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('CancelBid')){
										cancel_bid!.deleteAllCancelBidMyBids(this.model.model.model.user_id);
										}else{
										cancel_bid!.deleteAllCancelBidMyBids('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							FlatButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 FlatButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('CancelBid')){
													cancel_bid!.saveCancelBidMyBids(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('CancelBid')){
													cancel_bid!.saveCancelBidMyBids(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('CancelBid')){
													cancel_bid!.saveCancelBidMyBids(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('CancelBid')){
													cancel_bid!.saveCancelBidMyBids(this.model,this.model.model.model.user_id);
													}else{
													cancel_bid!.saveCancelBidMyBids(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('CancelBid')){
													cancel_bid!.saveCancelBidMyBids(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('CancelBid')){
													cancel_bid!.saveCancelBidMyBids(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('CancelBid')){
													cancel_bid!.saveCancelBidMyBids(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('CancelBid')){
													cancel_bid!.saveCancelBidMyBids(this.model,this.model.model.model.user_id);
													}else{
													cancel_bid!.saveCancelBidMyBids(this.model,'');
													}
											  }
											  
								  }

									  Navigator.pop(context); Navigator.pop(context);

								},
								child: Text('Ya & Simpan Data'),
							  ),
						],
					),
		) ??
				false;
	}
  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    cancel_bid =    MyBidsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(cancel_bid, context);
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                appBar: 
                  AppBar(
                            automaticallyImplyLeading: false,
                            title:
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: _onWillPop,
                                  child:
                                  Padding(padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.arrow_back,
                                                  color: Colors.white),

                                  ),
                                ),
                                Text('Cancel Bid', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ),


                      body:isLoading? 
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // )
                          Center( 
                      child:CircularProgressIndicator(
                      valueColor:    AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      )):isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
                                    ),
                                  
                        ]
                              
                              )

                          )
                      )
                        :Form(
                          key: formKey,
                          
                    child:    this.model.injectAction(context, _dialVisible, formKey, controller,cancel_bid, postCancelBidResult, this, sendPath, widget.id!, widget.title!, isLoading)
                      ),
                  
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////

