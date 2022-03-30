import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:projectscoid/views/Chat/models/messages/messages.dart';
import 'package:projectscoid/views/Chat/widgets/commons/empty_warning_widget.dart';
import 'message-list-item.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
//import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
//import 'package:audioplayer/audioplayer.dart';

import 'package:flutter/foundation.dart';




class MessageList extends StatefulWidget {
  final Function? onPayloadPress;
  final Function? onMediaView;
  final Function? onSelect;
  final dynamic user;
  final String? userID;
  ChatBloc? chatBloc;
  final String? search;
  final int? page;
  final String? itemsearch;

  MessageList(
      {Key? key,
      this.onPayloadPress,
      this.onMediaView,
      this.onSelect,
       this.userID,
      this.user,
      @required this.chatBloc, this.page = 0, this.search = '', this.itemsearch =''})
      : super(key: key);
  get _jsonMessage =>
      (user is String) ? jsonDecode(user) : user;
  @override
  _MessageListState createState() => _MessageListState();
}



class _MessageListState extends State<MessageList>  with WidgetsBindingObserver {
 //ScrollController _scrollController;
  final scrollDirection = Axis.vertical;
  late Timer _timer;
  late AutoScrollController _scrollController;
  double initscroll = 0.0;
  bool darkMode = false;
  bool show = false;
  int? nextoldMsg = -1;
  final scrollThreshold = 200.0;
  String searchTemp = '';
  int firstsearch = 0;
  bool _permissionReady = false;
  bool _permissionReady1 = false;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  final ValueNotifier<int> firstSelectIndex = ValueNotifier<int>(0);
  int firstIndex = 0;
  final _keys = {};
  List<int> listMsg = [];
  List<int> listPause = [];
  int? index;

  @override
  void initState() {
    super.initState();
  //  widget.chatBloc.deleteMsg();
   // widget.chatBloc.nextTread(0);
    //getChatThread
    //getChatThreadSP( int nx, String thread)
    if(widget.page == 0){
      widget.chatBloc?.getFirstThreadSp('${widget._jsonMessage['thread']}');
    }else{
      widget.chatBloc?.getChatThreadSP(widget.page!, '${widget._jsonMessage['thread']}', widget.itemsearch! );
    }
    searchTemp = widget.search!;
    _scrollController = AutoScrollController(
       // viewportBoundaryGetter: () =>
       //     Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection,
      suggestedRowHeight: 80
    );
    WidgetsBinding.instance?.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _checkPermission().then((hasGranted) {
      setState(() {
        _permissionReady = hasGranted;
      });
    });

    checkPermissionAudio();
    initAudioPlayer();
    fectdata();

   // _scrollController = ScrollController(keepScrollOffset: true);
    /*
    final prefs = SharedPreferences.getInstance();
    prefs.then((val){
      initscroll = val.getDouble("position");
      if(initscroll != 0.0 || initscroll != null ){
        _scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
        _scrollController.addListener(_onScroll);
      } else {
        _scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
        _scrollController.addListener(_onScroll);
      }

    });


     */




  }



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      audioPlayer.stop();
    }
  }


  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
       listMsg.clear();
       listPause.clear();
      //_positionSubscription.cancel();
     // _audioPlayerState1Subscription.cancel();
      audioPlayer.stop();

    super.dispose();
  }


   Duration? duration;
   Duration? position;
  late AudioPlayer audioPlayer;
  late String localFilePath;
  String myAvatar = '';




  /*

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;
  get isStop => playerState == PlayerState.stopped;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

   */

  bool isMuted = false;

  late StreamSubscription _positionSubscription;
  late StreamSubscription _audioPlayerState1Subscription;


  void initAudioPlayer() {

    audioPlayer = AudioPlayer();
    /*
    _positionSubscription = audioPlayer.onAudioPositionChanged
        .listen((p) => setState(() => position = p));
    _audioPlayerState1Subscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
          if (s == AudioPlayerState.PLAYING) {
            setState(() => duration = audioPlayer.duration);
          } else if (s == AudioPlayerState.STOPPED) {
            onComplete();
            setState(() {
              position = duration;

            });
          }
        }, onError: (msg) {
          setState(() {
            playerState = PlayerState.stopped;
            duration = Duration(seconds: 0);
            position = Duration(seconds: 0);
          });
        });

     */
  }

  Future<String?> _getAvaPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('myavatar')){
      return prefs.getString('myavatar');
    }else{return '';}


  }


  Future<void> fectdata()async{
    final future = _getAvaPrefs();
    future.then((value){
      setState(() {
        print('my valuuueee === $value');
        myAvatar = value!;
      });
    });

  }

  /*

  void onComplete() {
    listMsg.clear();
    listPause.clear();
    position = Duration(seconds: 0);
    setState(() {
      playerState = PlayerState.stopped;
      duration = Duration(seconds: 0);
      position = Duration(seconds: 0);
    });
  }

   */

  Future<bool> checkPermissionAudio() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<bool> _checkPermission() async {
    /*
    if (widget.platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;

     */

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

        return permission == Permission.storage  || permission == Permission.microphone ;
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


  void _scrollDown() {
    Timer(Duration(microseconds: 300), () {
     // if (_scrollController.hasClients &&
        //  _scrollController.position.viewportDimension <
        //     _scrollController.position.maxScrollExtent)
        _scrollController.animateTo(0.0,
            curve: Curves.linear, duration: Duration(milliseconds: 100));
    });
  }

  void _recoveryHistoryMessages() {
    //widget.chatBloc.getHistory(widget.user);
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
   // browse_projects.listing.add(BrowseProjectsListingRefresh());
    final maxScroll = _scrollController.position.maxScrollExtent;
    final minScroll = _scrollController.position.minScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    var pc = widget.chatBloc?.pagecountOffset;
    var max = widget.chatBloc?.max;
   // var temp = nextoldMsg;
    nextoldMsg  = widget.chatBloc?.messageOffset!;

   // hide = true;
    //print('haiiiii');
   // GetOldMsgModel oldMsg = new  GetOldMsgModel(userid: widget.user['userid'],thread: widget.user['thread'], offset: nextoldMsg.toString());
  //  widget.chatBloc.getOldMessage(oldMsg);
   // print('nextoldMsg === ${nextoldMsg.toString()}');
    if(pc != 999){
      if (pc! > max! && (widget.search != '')) {
       // print('$max nextoldMsg4 $pc=== ${nextoldMsg.toString()}');
        widget.chatBloc?.getChatThread(
            max + 1, '${widget._jsonMessage['thread']}');
      }
    }



/*
    if(pc == max){
      widget.chatBloc.getFirstThreadSp('${widget._jsonMessage['thread']}');
      //widget.chatBloc.getChatThread(nextoldMsg - 1 , '${widget._jsonMessage['thread']}');
    }

 */

    Timer timer = Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }


  void _onScroll()async{
    final maxScroll = _scrollController.position.maxScrollExtent;
    final minScroll = _scrollController.position.minScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    var pc = widget.chatBloc?.pagecountOffset;
    var max = widget.chatBloc?.max;

    //  final prefs = await SharedPreferences.getInstance();
    // prefs.setDouble("position", _scrollController.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
    nextoldMsg = widget.chatBloc?.messageOffset;
    // print('haiiiii');
    // GetOldMsgModel oldMsg = new  GetOldMsgModel(userid: widget.user['userid'],thread: widget.user['thread'], offset: nextoldMsg.toString());
    //  widget.chatBloc.getOldMessage(oldMsg);
   // print('nextoldMsg123 === ${nextoldMsg.toString()}');
    // final prefs = await SharedPreferences.getInstance();
    // prefs.setDouble("position", _scrollController.position.pixels);

    //  if(widget.page != 0) {

    // }

    if (nextoldMsg! > 1){

      widget.chatBloc?.getChatThread(
          nextoldMsg! - 1, '${widget._jsonMessage['thread']}');
      /*
      setState(() {
        show = true;
      });

       */
    }
   // hide = false;




  }

   // print('currentScroll == ${currentScroll.toString()}');

    if(!show && (currentScroll < 30.0 && currentScroll >= 1.0)){
      setState(() {
        show = true;
      });
    }

    if(!show && (currentScroll < 60.0 && currentScroll > 50.0)){
      setState(() {
        show = true;
      });
    }

    if(!show && (currentScroll < 80.0 && currentScroll > 70.0)){
      setState(() {
        show = true;
      });
    }
/*
    if(show && (currentScroll > 1.0 && currentScroll < 2.0)){
      setState(() {
        show = false;
      });
    }

 */

    if(currentScroll <  1.0 && currentScroll >=  0.0 ) {

      _timer?.cancel();
      await EasyLoading.dismiss();
     // print('EasyLoading dismiss');
      setState(() {
        show = false;
      });
    }



/*
    if (pc > max && (widget.search != '')) {
      widget.chatBloc.getChatThread(
          max + 1, '${widget._jsonMessage['thread']}');
    }

 */
    /*
    if(pc != 999){
      if (pc > max && (widget.search != '')) {
        print('$max nextoldMsg4 $pc=== ${nextoldMsg.toString()}');
        widget.chatBloc.getChatThread(
            max + 1, '${widget._jsonMessage['thread']}');
      }
    }

     */

   /*
    if (_scrollController.offset >= 30.0 && _scrollController.offset < 100.0) {

      setState(() {
        hide = false;
      });
    }

    */



   /*
    if (_scrollController.offset <= minScroll) {
      setState(() {
        show = false;
      });
    }

    */
    searchTemp = '';
/*
    if( currentScroll < 300.0){
      hide = true;

    }else{
     // hide = false;
    }

 */



    /*
      if(maxScroll == currentScroll){
        print('nextoldMsg+++ === ${nextoldMsg.toString()}');


      }else{

      }

     */

  //  }
  }


  void _onLoading()async {
  /*
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    //  final prefs = await SharedPreferences.getInstance();
    // prefs.setDouble("position", _scrollController.position.pixels);
    //  if (maxScroll - currentScroll <= scrollThreshold) {
    nextoldMsg = widget.chatBloc.messageOffset;
    // print('haiiiii');
    // GetOldMsgModel oldMsg = new  GetOldMsgModel(userid: widget.user['userid'],thread: widget.user['thread'], offset: nextoldMsg.toString());
    //  widget.chatBloc.getOldMessage(oldMsg);
    print('nextoldMsg123 === ${nextoldMsg.toString()}');
    widget.chatBloc.getChatThread(
        nextoldMsg - 1, '${widget._jsonMessage['thread']}');
    //  }

   */
  }

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('dd MMMM yyyy');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';
    var day =  DateFormat('EE').format(date);

    time = '  $day, ${format.format(date)}';
    return time;
  }


  //RefreshController _refreshController =
 // RefreshController(initialRefresh: false);
  var listViewKey = RectGetter.createGlobalKey();

  int getIndex(List<dynamic> data,String key){
    int idx = 0;
    int count = 0 ;

    for (var element in data) {
      if(element['message'] == key){
        idx = count;
      }
      count ++;
    }

    return idx;
  }

  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    var isSend;
    final prefs = SharedPreferences.getInstance();
    prefs.then((val) {
      isSend = val.getBool("send");
      if(isSend != null){

        if(isSend){
          listViewKey = RectGetter.createGlobalKey();
        }
      }
    });


      /*
    final prefs = SharedPreferences.getInstance();
    prefs.then((val){
      initscroll = val.getDouble("position");
      if(initscroll != 0.0 || initscroll != null ){
        _scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
        _scrollController.addListener(_onScroll);
      } else {
        _scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
        _scrollController.addListener(_onScroll);
      }
    });

     */
    _scrollController.addListener(_onScroll);

    var formatter = new DateFormat('dd MMMM yyyy');

    List<int> getVisible() {
      /// First, get the rect of ListView, and then traver the _keys
      /// get rect of each item by keys in _keys, and if this rect in the range of ListView's rect,
      /// add the index into result list.
      var rect = RectGetter.getRectFromKey(listViewKey);
      var _items = <int>[];
      _keys.forEach((index, key) {
        var itemRect = RectGetter.getRectFromKey(key);
        if(isSend != null){
          if(rect == null){
          //  print('menderita');
            if (itemRect != null ) _items.add(index);
          }else{
           // print('recttttttttttt');
            if (itemRect != null && !(itemRect.top + rect.height > rect.bottom || itemRect.bottom + rect.height < rect.top)) _items.add(index);
          }
        }else{
         // print('recttttttttttt123');
          if (itemRect != null ) _items.add(index);
        }

      });
      if(_items.isEmpty){
        firstSelectIndex.value = 0;
      }else{
        firstSelectIndex.value = _items[0] + 0;
      }

      return _items;
    }





    return    _permissionReady ?  StreamBuilder(
      stream: widget.chatBloc?.messagesListStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){

        if (snapshot.hasError) return Text(snapshot.error.toString());
        if (snapshot.data == null) {
       //   _recoveryHistoryMessages();
         // print('datatest1');
          return
            const Center(
                child:CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.green),
                ));

        }
        if (snapshot.hasData) {
          //widget.chatBloc.readSignal(widget._jsonMessage['thread']);
          //_scrollDown();

        //  print('datatest2');

        }

        if ((snapshot.data is List) && (snapshot.data.length == 0)) {

         // print('datatest3');
          if(widget._jsonMessage['lastmessage']==''){
            return
              Container(height: 0.0, width: 0.0);
          }else{
           // widget.chatBloc.lg(widget.userID);
           // widget.chatBloc.getFirstThread('${widget._jsonMessage['thread']}');
            return   Container(height: 0.0, width: 0.0);

          }



/*
          return   EmptyWarningWidget(
            Icons.chat_bubble,
            message: 'Please say "hi"',
          );


 */

        }
        if ((snapshot.data is List) && (snapshot.data.length == 1)) {
          if(snapshot.data[0]['userid'] == 'wssclose'){
            widget.chatBloc?.lg(widget.userID);
            widget.chatBloc?.getFirstThread('${widget._jsonMessage['thread']}');
            return(
            Container(
              color: Colors.white,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!"),
              ),
            )
            );

          }
        }

        if(firstsearch == 0) {
          if (searchTemp != '') {
            _scrollController.scrollToIndex(
                widget.chatBloc!.searchIdx);
            firstsearch ++;
          }
        }

        //print('datatest4 ${widget._jsonMessage['avatar']}');
        return
          myAvatar == ''? Container()
          :
          searchTemp == '' ?
          Scrollbar(

              child:
                      NotificationListener<ScrollUpdateNotification>(
                              onNotification: (notification) {
                              getVisible();

                              return true;
                            },
                              child:
                                  //  RefreshIndicator(


                                                //    child:


                                            Stack(

                                                children: <Widget>[
                                                  RectGetter(
                                                      key: listViewKey,
                                                      //child:
                                                      //  Column(
                                                      //		children: <Widget>[
                                                      //	Expanded(
                                                      // child:
                                                      //  SmartRefresher(
                                                      //   enablePullDown: false,
                                                      //  enablePullUp: true,
                                                      child:RefreshIndicator(
                                                        child:

                                                        ListView.builder(
                                                          // physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

                                                          reverse: true,
                                                          shrinkWrap: false,

                                                          // shrinkWrap: true,
                                                          itemBuilder: (context, index) {
                                                            _keys[index] =
                                                                RectGetter
                                                                    .createGlobalKey();
                                                            return
                                                              RectGetter(
                                                                key: _keys[index],
                                                                child:
                                                                MessageItem(

                                                                    user: widget.user,
                                                                    userid : widget.userID,
                                                                    chatBloc: widget.chatBloc,
                                                                    message: snapshot.data[index],
                                                                    message1: index == snapshot.data.length - 1 ? snapshot.data[index]
                                                                        : snapshot.data[index + 1],
                                                                    idx: index,
                                                                    idMax: snapshot.data.length - 1,
                                                                    isMax: index == snapshot.data.length - 1
                                                                        ? true
                                                                        : false,
                                                                    onPayloadPress: widget
                                                                        .onPayloadPress,
                                                                    onSelect: widget.onSelect,
                                                                    onMediaView: widget .onMediaView,
                                                                    search: widget.search,
                                                                    duration: duration,
                                                                    position: position,
                                                                    audioPlayer: audioPlayer,
                                                                   // playerState: playerState,
                                                                    play: listMsg,
                                                                    pause: listPause,
                                                                    myAvatar: myAvatar,
                                                                    avatar: widget._jsonMessage['avatar'],
                                                                ),

                                                              );

                                                          },

                                                          controller: _scrollController,
                                                          itemCount: snapshot.data != null ? snapshot.data.length : 0,

                                                        ),
                                                        onRefresh: _onRefresh,

                                                      )
                                                    //  controller: _refreshController,

                                                    //  onLoading: _onLoading,
                                                    //  ),

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
                                                                snapshot.data == null ?
                                                                Container(height: 0.0, width: 0.0,)

                                                                    :
                                                                Container(
                                                                  height: 28,
                                                                  width: 180,
                                                                  decoration: BoxDecoration(
                                                                      color: darkMode? Colors.white: CurrentTheme.PrimaryLightColor,
                                                                      border: Border.all(
                                                                        color: Colors.white,
                                                                      ),
                                                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                                                  ),
                                                                  child:
                                                                  Padding(
                                                                      padding: const EdgeInsets.only(left: 2.0, right:2.0),
                                                                      child:  Center(
                                                                        child:  snapshot.data == null ? const Text('') :
                                                                        snapshot.data.length - 1 < value ? const Text('') :

                                                                        Text(readTimestamp(snapshot.data[value]['time']), style: const TextStyle(color: Colors.black, fontSize: 12)),

                                                                        /*
                                                                                snapshot == null ? Text('') : Text('${formatter.format(DateTime.fromMillisecondsSinceEpoch(int.parse(snapshot.data[value]['time']) * 1000))}', style: TextStyle(color: Colors.black45, fontSize: 12)),


                                                                                 */
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

                                                  show ?  Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: GestureDetector(
                                                        child: Container(
                                                          height: 40,
                                                          width: 26,
                                                          margin: const EdgeInsets.only(right:5, bottom: 12),
                                                          padding: EdgeInsets.zero,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(80),
                                                              color: Colors.black26,
                                                              border: Border.all(width: 1, color: Colors.white)),
                                                          child:
                                                          const Padding(
                                                            padding: EdgeInsets.only(left: 6, top: 9),
                                                            child: FaIcon(FontAwesomeIcons.angleDoubleDown, size: 20, color: Colors.white,),
                                                          ),

                                                        ),
                                                        onTap: ()async {
                                                          // if(_scrollController.positions.isNotEmpty){
                                                          // await _scrollController.scrollToIndex( snapshot.data.length - 1,
                                                          //    preferPosition: AutoScrollPosition.begin);

                                                          _scrollController
                                                              .animateTo(
                                                            0.0,
                                                            curve: Curves.fastOutSlowIn,
                                                            duration: const Duration(
                                                                milliseconds: 200),
                                                          );

                                                          _timer?.cancel();
                                                          await EasyLoading.show(
                                                            status: 'loading...',
                                                            maskType: EasyLoadingMaskType.clear,
                                                          );
                                                        //  print('EasyLoading show');

                                                          setState(() {
                                                            show = false;
                                                          });
                                                        }
                                                      // }
                                                    ),
                                                  ) : Container() ,
                                                ]
                                            ),





/*
                                                         new ListView.builder(
                                                           physics: const AlwaysScrollableScrollPhysics(),

                                                         // shrinkWrap: true,
                                                          itemBuilder: (context, index) { return  MessageItem(
                                                            user: widget.user,
                                                            chatBloc: widget.chatBloc,
                                                            message: snapshot.data[index],
                                                            message1: index == snapshot.data.length - 1 ? snapshot.data[index] : snapshot.data[index + 1],
                                                            idx: index,
                                                            isMax: index == snapshot.data.length - 1 ? true : false ,
                                                            onPayloadPress: widget.onPayloadPress,
                                                            onMediaView: widget.onMediaView,
                                                          );},
                                                           controller: _scrollController,
                                                           itemCount: snapshot.data != null ? snapshot.data.length : 0,
                                                        ),

 */
                                                 //   onRefresh: _onRefresh,

                            //   )
                        )
        )
          : Scrollbar(

              child:
              NotificationListener<ScrollUpdateNotification>(
                onNotification: (notification) {
                  getVisible();
                  return true;
                },
                child:
                //  RefreshIndicator(


                //    child:
                Stack(

                    children: <Widget>[
                      RectGetter(
                          key: listViewKey,
                          //child:
                          //  Column(
                          //		children: <Widget>[
                          //	Expanded(
                          // child:
                          //  SmartRefresher(
                          //   enablePullDown: false,
                          //  enablePullUp: true,
                          child:RefreshIndicator(
                            child:

                            ListView.builder(
                              // physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

                              reverse: true,
                              shrinkWrap: false,

                              // shrinkWrap: true,
                              itemBuilder: (context, index) {
                                _keys[index] =
                                    RectGetter
                                        .createGlobalKey();
                                return
                                  RectGetter(
                                    key: _keys[index],
                                    child:
                                    AutoScrollTag(
                                      key: ValueKey(index),
                                      controller: _scrollController,
                                      index: index,
                                      child: MessageItem(
                                          user: widget.user,
                                          userid : widget.userID,
                                          chatBloc: widget.chatBloc,
                                          message: snapshot.data[index],
                                          message1: index == snapshot.data.length - 1 ? snapshot.data[index]
                                              : snapshot.data[index + 1],
                                          idx: index,
                                          idMax: snapshot.data.length - 1,
                                          isMax: index == snapshot.data.length - 1
                                              ? true
                                              : false,
                                          onPayloadPress: widget
                                              .onPayloadPress,
                                          onSelect: widget.onSelect,
                                          onMediaView: widget .onMediaView,
                                          search: widget.search,
                                          duration: duration,
                                          position: position,
                                          audioPlayer: audioPlayer,
                                        //  playerState: playerState,
                                          play: listMsg,
                                          pause: listPause,
                                          myAvatar: myAvatar,
                                          avatar: widget._jsonMessage['avatar'],
                                      ),

                                    )


                                  );

                              },

                              controller: _scrollController,
                              itemCount: snapshot.data != null ? snapshot.data.length : 0,

                            ),
                            onRefresh: _onRefresh,

                          )
                        //  controller: _refreshController,

                        //  onLoading: _onLoading,
                        //  ),

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
                                    snapshot.data == null ?
                                    Container(height: 0.0, width: 0.0,)

                                        :
                                    Container(
                                      height: 28,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: darkMode? Colors.white: CurrentTheme.PrimaryLightColor,
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          borderRadius: const BorderRadius.all(Radius.circular(15))
                                      ),
                                      child:
                                      Padding(
                                          padding: const EdgeInsets.only(left: 2.0, right:2.0),
                                          child:  Center(
                                            child:  snapshot.data == null ? const Text('') : Text(readTimestamp(snapshot.data[value]['time']), style: TextStyle(color: Colors.black, fontSize: 12)),

                                            /*
                                                                                snapshot == null ? Text('') : Text('${formatter.format(DateTime.fromMillisecondsSinceEpoch(int.parse(snapshot.data[value]['time']) * 1000))}', style: TextStyle(color: Colors.black45, fontSize: 12)),


                                                                                 */
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

                      show ?  Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                            child: Container(
                              height: 40,
                              width: 26,
                              margin: const EdgeInsets.only(right:5, bottom: 12),
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: Colors.black26,
                                  border: Border.all(width: 1, color: Colors.white)),
                              child:
                              const Padding(
                                padding: EdgeInsets.only(left: 6, top: 9),
                                child: FaIcon(FontAwesomeIcons.angleDoubleDown, size: 20, color: Colors.white,),
                              ),

                            ),
                            onTap: () async{
                              // if(_scrollController.positions.isNotEmpty){
                              _scrollController
                                  .animateTo(
                                0.0,
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(
                                    milliseconds: 200),
                              );
                              _timer?.cancel();
                              await EasyLoading.show(
                                status: 'loading...',
                                maskType: EasyLoadingMaskType.clear,
                              );
                             // print('EasyLoading show');
                              setState(() {
                                show = false;
                              });
                            }
                          // }
                        ),
                      ) : Container()  ,
                    ]
                ),


/*
                                                         new ListView.builder(
                                                           physics: const AlwaysScrollableScrollPhysics(),

                                                         // shrinkWrap: true,
                                                          itemBuilder: (context, index) { return  MessageItem(
                                                            user: widget.user,
                                                            chatBloc: widget.chatBloc,
                                                            message: snapshot.data[index],
                                                            message1: index == snapshot.data.length - 1 ? snapshot.data[index] : snapshot.data[index + 1],
                                                            idx: index,
                                                            isMax: index == snapshot.data.length - 1 ? true : false ,
                                                            onPayloadPress: widget.onPayloadPress,
                                                            onMediaView: widget.onMediaView,
                                                          );},
                                                           controller: _scrollController,
                                                           itemCount: snapshot.data != null ? snapshot.data.length : 0,
                                                        ),

 */
                //   onRefresh: _onRefresh,

                //   )
              )
          );
      },
    )
    : Container();
  }
}
