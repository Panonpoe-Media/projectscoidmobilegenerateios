// ignore_for_file: unused_local_variable

import 'dart:convert';
//import '../models/messages/list_message_model.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';
import 'package:quiver/async.dart';
import 'dart:async';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
//import 'package:websocket_manager/websocket_manager.dart';

import 'package:ya_websocket/ya_websocket.dart';
import 'package:projectscoid/core/components/utility/secure/secure.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as l;
//import 'package:projectscoid/repository/repository.dart';
//import 'package:projectscoid/core/AppProvider.dart';

class PusherMessage {
  final String channelName;
  final String eventName;
  final String body;
  PusherMessage(this.channelName, this.eventName, this.body);
}

class ChatBloc  implements YaWebsocketDelegate{
  late YaWebsocket socket;

  List<dynamic> messages = [];
  List<dynamic> searchMessages = [];
  //List<dynamic> tempmessages = [];
  dynamic userinfoThread ;
  List<dynamic> thread = [];
  final List<dynamic> _searchThread = [];
  List<dynamic> threadHistory = [];
  List<dynamic> blocklist = [];
  dynamic selectedMessage;
  List<dynamic> multiSelectedMessage = [];
  List<dynamic> favoriteMessages = [];
  List<dynamic> programs = [];
 // List<QuickMenuItemModel> quickMenuItems = [];
  List<int> page = [];
  final _chatRepository = ChatRepository();
  final _selectedMessageController = BehaviorSubject();
  final _blacklistController = BehaviorSubject();
  final _messagesListController =      BehaviorSubject();//     BehaviorSubject(seedValue: []);
  final _messagesInfoController =      BehaviorSubject();
  var _searchListController =      BehaviorSubject();
 // _messagesListController.seeded(seedValue: []);
 // final  _threadController =      BehaviorSubject();
  late BehaviorSubject<dynamic> _threadController;
  late BehaviorSubject<dynamic> _adminsController;
  late BehaviorSubject<dynamic> _searchThreadController;
  final _favoriteMessagesListController = BehaviorSubject.seeded([]);
  final _programsListController = BehaviorSubject.seeded([]);
  final _quickMenuListController = BehaviorSubject.seeded([]);
  final Logger log = Logger('ChatBloc');
  bool change = true ;
  bool closeSocket = false;
  int nextThread = 0;
  int maxthread = 0;
  bool beforeThread = false;
  int pagecount = 999;
  int maxChatList = 1;
  int maxIndexCount = 1;
  final _pusherMessageController = BehaviorSubject();
  final _pusherMessageControllerST = BehaviorSubject();
  PusherMessage? pm;
  String id = '';
  bool messageOpen = false;
  String senderOpen = '';
  String myname = '';
  int searchIdx = -1 ;
  String searchItem = '';
  String timeopen = '0';
  bool isGetFT3 = false;
  bool isGetFT4 = false;
  bool outThread = false;
  int typeCount = 0;
  String blackListUser = '';
  String currentThread = '';
  String currentNewThread = '';
  String newThreadDisplay = '';
  String currentMsgThread = '';
  String tempMsg = '';
  bool openSign = false;
  bool isTyping = false;
  bool saveBlank = false;
  bool isHeader = false;
  bool alreadyLogin = false;
  var lastMessage = DateTime.now();
  String oldMessage1 = '';
  String oldNotify1 = '';
  String _webSocketURI = 'wss://push.projects.co.id'; // ws://192.168.1.46:8866/chat?user_id=1

  ChatBloc() {
    //socket = WebsocketManager(ConfigurationModel().wsUrl);
    socket = YaWebsocket();
    socket.delegate = this;
    _threadController = BehaviorSubject<dynamic>.seeded([]);
    _adminsController = BehaviorSubject<dynamic>.seeded([]);
    _searchThreadController = BehaviorSubject<dynamic>.seeded([]);
    _searchListController = BehaviorSubject<dynamic>.seeded([]);
    _messagesListController.add([]);
    _setIdxInfo(0);
   // _threadController.add([]);
   // await socket.connect();
    wsSetHandlers();
    Timer.periodic(const Duration(milliseconds: 60000), (timer) {
      var dtNow = DateTime.now();
      var diff = dtNow.difference(lastMessage);
       if(socket != null){
        // if(id != ''){
       //    getx();
       //  }
         if (diff.inSeconds > 30) {
          // if(id !=''){
             lastMessage = DateTime.now();
            // log.info('pingggggggggggggggggg');
             final jsonMessage = jsonEncode(
                 {
                   "cmd":"ping",
                 }
             );
             socket.send(jsonMessage);

          // }
        }
        // socket.send(jsonMessage);
       //  timer.cancel();
       }else{
        // socket.connect();
        // wsSetHandlers();
       //  print('no socket');

       }


     });





   // __wsSetHandlers();

   /* if(ConfigurationModel().token!= '') {
      var loginMsg = new LoginMsgModel(cmd: 'login', auth: ConfigurationModel().token);
      login(loginMsg);
      print('helooo${ConfigurationModel().token}');
      change = false;

        //
      } */


  }


 // StartChat

  Stream  get selectedMessagesToggleStream =>
      _selectedMessageController.stream;
  Stream get messagesListStream => _messagesListController.stream;
  Stream get messagesInfoStream => _messagesInfoController.stream;
  Stream get blacklistStream => _blacklistController.stream;
  //Stream get threadStream => _threadController.stream;
  Stream<dynamic> get threadStream => _threadController.stream;
  Stream<dynamic> get adminsStream => _adminsController.stream;
  Stream get onMessage => _pusherMessageController.stream;
  Stream get onMessageST => _pusherMessageControllerST.stream;
  Stream<dynamic> get searchThreadStream => _searchThreadController.stream;
  Stream<dynamic> get searchListStream => _searchListController.stream;


    // _messageChannel.receiveBroadcastStream().map(_toPusherMessage);
  Stream get favoriteMessagesListStream =>
      _favoriteMessagesListController.stream;

  Stream get programsListStream => _programsListController.stream;

  Stream get quickMenuListStream => _quickMenuListController.stream;
  bool get isclose => closeSocket;
  int get messageOffset => nextThread;
  int get max => maxthread;
  int get pagecountOffset => pagecount;
  int get searchIdxOffset => searchIdx;

  get cancelBlacklist => null;




  void startTimer() {
    int _start = 2;
    int _current = 2;
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: _start),
      new Duration(seconds: 1),
    );
   // print('mantap sekali lhhhooooooo');
    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
       _current = _start - duration.elapsed.inSeconds;
       if(_current == 1){
         if(!alreadyLogin){
         //  print('mantap sekali maaaaaaaangggggggggggggggggggg');
           lg(id);
         }
       }
    });

    sub.onDone(() {
     // print("Done");
      sub.cancel();
    });
  }



  Future<int> _getIdxInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('chatidx') ?? 0;

  }

  _setIdxInfo(int ntf)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('chatidx', ntf);
  }

  Future<String> _getIdx() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('chatlistidx') ?? '';
  }

  _setIdx(String idx)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('chatlistidx', idx);
  }

  Future<String> _getChatList(String thread) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

   var temp = prefs.getStringList('chatlist') ?? [];
    var res = temp.where(
            (x) => jsonDecode(x)['thread'].contains(thread)
    ).toList();
    if(res.length > 0){
      return res[0];
    } else return '';

  }

  _setChatList(String thread, String data)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var list = await _getChatList(thread);
    if(list == ''){
      var temp = prefs.getStringList('chatlist');
      if(temp != null){
        temp.add(data);
      }else{
        temp = [];
        temp.add(data);
      }

      await prefs.setStringList('chatlist', temp );
    }else{
      var temp = prefs.getStringList('chatlist');
      temp?.remove(list);
      temp?.add(data);
      await prefs.setStringList('chatlist',temp! );
    }


  }

  _initializeList()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('chatlist',[] );
  }

  _initializeIdx()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('chatlistidx', '');
  }

  void blacklist(String thread){
    final jsonMessage = jsonEncode({
      "cmd":"block",
      "thread":"$thread"
    });
     //print('send socket $thread');

    if(socket != null){
      socket.send(jsonMessage);
      // print('send socket $thread');
    }else{

    }

  }

/*
  Future<void> cancelBlacklist(String userID,  BuildContext context)async{
  //  APIRepository apiRepProvider = AppProvider.getApplication(context).projectsAPIRepository;
    String meta;

    var bl = await getBlacklist(id, context);


      var dbl = json.decode(bl);
      bool cancel = false;
      int count = 0;
      int val = 0;
      for(var item in dbl['bl']){
        if(item['userid'] == userID){
          cancel = true;
          val = count;
        }
        count ++;
      }
      if(cancel){
        dbl['bl'].removeAt(val);
      }
      meta = json.encode(dbl);

   // await apiRepProvider.loadAndSaveBlacklist(id, meta);
    await getBlacklist(id, context);
   // await getBlacklist(id, context);
  }

 */

  bool isBlacklisted(String userID){
    bool isBl = false;

    if(blackListUser == ''){
      isBl = false;
    }else{
      var dbl = json.decode(blackListUser);

      for(var item in dbl['bl']){
        if(item['userid'] == userID){
          isBl = true;
        }

      }

    }
    return isBl;

  }

/*
  Future<String> getBlacklist(String userID,  BuildContext context)async{
    APIRepository apiRepProvider = AppProvider.getApplication(context).projectsAPIRepository;
    var bl = await apiRepProvider.getBlacklist(userID);

    if(bl == ''){
      blackListUser = bl;
     // print('bl === $blackListUser');
      return bl ;
    }else{
      blackListUser = bl;
     // print('bl === $blackListUser');
      blocklist.clear();
      var dbl = json.decode(bl);
      blocklist.addAll(dbl['bl']);
      _blacklistController.add(blocklist);

      return bl ;
    }
    }

 */

  Future<String> _getThreadInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('thread') ?? '';

  }

  _setThreadInfo(String ntf)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('thread', ntf);
  }

/*
  PusherMessage _toPusherMessage(dynamic map) {
    if (map is Map) {
     // var body = new Map<String, dynamic>.from(map['body']);
      return new PusherMessage(map['date'], map['message'], map['body']);
    }
    return null;
  }

 */

  void deleteThread(){
  //  if(thread.isNotEmpty) thread.clear();
    thread.clear();
  }

  void nextTread(int next){
   // _messagesListController.
    messages.clear();
   // nextThread =  next;
  }

  bool isCanched(String offset, String thread){
    for(var th in threadHistory ){
      if(th['thread'] == thread){
        if(int.parse(offset) < int.parse(th['endoffset'])) return true;
      }
    }
    return false;
  }

  void socketClose()async{
   // closeSocket = true;
    id = '';

    deleteMsg();
    deleteThread();
    await socket.close();
  }

  void socketCloseSP(){
   // socket.close();

    id = '';
    deleteMsg();
    deleteThread();
   // socket.connect();
    //wsSetHandlers();
  }

  /*
  void getHistory(UserModel user) async {
    try {
      if (messages.isEmpty) {
        log.fine('Messages has ${messages.length} items... recovering history');
        ChatHistortModel chatHistortModel =
            await _chatRepository.getHistory(user);
        messages.addAll(_historyMessagesHandler(chatHistortModel));
       // _messagesListController.add(messages);
      }
    } catch (e) {
      log.severe('getHistory Fail!', e);
    }
  }

   */

/*
  void lgn(token){
   // const Sec30 = const Duration(seconds: 10);
    if (token != '' || token != null) {
      var loginMsg = new LoginMsgModel(
          cmd: 'login', auth: token);
     // login(loginMsg);
    }
   /* new Timer.periodic(Sec30, (Timer t) {
      if (token != '' || token != null) {
        var loginMsg = new LoginMsgModel(
            cmd: 'login', auth: token);
        if(change){
          login(loginMsg);
          change = false;
          print('helooo1');
        }else{
          login1(loginMsg);
          change = true;
          print('helooo2');
        }

       // print('helooo${ConfigurationModel().token}');
      }
    }); */
  }

 */

  void setUsername(String username){
    myname = username;

  }

  String getUsername(){
    return myname;
  }

  void lg(token){
    // const Sec30 = const Duration(seconds: 10);
    id = token;
  //  print('ini id nya $token');
    String auth  =  authSecure(token);
    // random/userid/yyyymmddhhnnss/signature

    if (token != '' || token != null) {
      socket.send(jsonEncode({
        'cmd': 'login',
        'auth': auth
      }));

    //  socket.send();
    }
    /* new Timer.periodic(Sec30, (Timer t) {
      if (token != '' || token != null) {
        var loginMsg = new LoginMsgModel(
            cmd: 'login', auth: token);
        if(change){
          login(loginMsg);
          change = false;
          print('helooo1');
        }else{
          login1(loginMsg);
          change = true;
          print('helooo2');
        }

       // print('helooo${ConfigurationModel().token}');
      }
    }); */
  }

  void lg1(token){
    // const Sec30 = const Duration(seconds: 10);
    id = token;
    //  print('ini id nya $token');
    String auth  =  authSecure(token);
    // random/userid/yyyymmddhhnnss/signature


   // socket.close();
    if(socket == null){
     // socket.connect();
     // wsSetHandlers();
    }


    if (token != '' || token != null) {
      socket.send(jsonEncode({
        'cmd': 'login',
        'auth': auth
      }));

      //  socket.send();
    }
    /* new Timer.periodic(Sec30, (Timer t) {
      if (token != '' || token != null) {
        var loginMsg = new LoginMsgModel(
            cmd: 'login', auth: token);
        if(change){
          login(loginMsg);
          change = false;
          print('helooo1');
        }else{
          login1(loginMsg);
          change = true;
          print('helooo2');
        }

       // print('helooo${ConfigurationModel().token}');
      }
    }); */
  }

  void getFavoriteMessages(UserModel user) async {
    try {
      List<dynamic> favorites = await _chatRepository.getFavorites(user);
      favorites.forEach((favorite) {
        if (!favoriteMessages.any((f) => f['_id'] == favorite['_id'])) {
          favorite['message']['_id'] = favorite['_id'];
          favoriteMessages.add(favorite);
        }
      });
      _favoriteMessagesListController.add(favoriteMessages);
    } catch (e) {
      log.severe('getFavoriteMessages Fail!', e);
      throw e;
    }
  }

  void getPrograms(UserModel user) async {
    try {
      List<dynamic> _programs = await _chatRepository.getPrograms(user);
      _programs.forEach((program) {
        if (!programs.any((p) => p['id'] == program['id'])) {
          programs.add(program);
        }
      });
      _programsListController.add(programs);
    } catch (e) {
      throw e;
    }
  }

  void addOrRemoveFavoriteMessage(dynamic message, bool favorite) async {
    try {
      final result =
          await _chatRepository.addOrRemoveFavoriteMessage(message, favorite);
      if (!favorite) {
        favoriteMessages.removeWhere((f) => f['_id'] == result['_id']);
      } else {
        result['message']['_id'] = result['_id'];
        favoriteMessages.add(result);
      }
    //  selectMessageToggle(result);
      _favoriteMessagesListController.add(favoriteMessages);
    } catch (e) {
      log.severe('addOrRemoveFavoriteMessage Fail!', e);
      throw e;
    }
  }

/*
  void subscribeUnsubscribe(ProgramModel program, UserModel user) async {
    try {
      final result = await _chatRepository.subscribeUnsubscribe(program, user);
      programs =
          programs.map((e) => e['_id'] == result['_id'] ? result : e).toList();
      _programsListController.add(programs);
    } catch (e) {
      log.severe('subscribeUnsubscribe Fail!', e);
      throw e;
    }
  }

  void getQuickMenuItems() async {
    try {
      Iterable quickMenuList = await _chatRepository.getQuickMenu();
      quickMenuItems =
          quickMenuList.map((qm) => QuickMenuItemModel.fromJson(qm)).toList();
      _quickMenuListController.add(quickMenuItems);
    } catch (e) {
      log.severe('getQuickMenuItems Fail!', e);
      throw e;
    }
  }

 */

  List<dynamic> addMessage(dynamic message) {
    if(messages.length >= 1){
      if(messages[messages.length - 1]['cmd'] == 'typing'){
        messages.removeLast();
      }
    }
    if(message['cmd'] != 'newthread'){
      messages.add(message);
    }

    _messagesListController.add(messages);



    if((message['cmd'] != 'typing') ||(message['cmd'] != 'newthread')){
      int idx = 0;
      int index = -1;
      String threadVal = '';
      String usernameVal = '';
      String useridVal = '';
      String displayVal = '';
      String avatarVal = '';
      String lastMessage = '';
      String lastTime = '';

      for (var th in thread){
        if((th['userid'] == message['sender'])||(th['userid'] == message['receiver'])){
          index = idx;
          threadVal = th['thread'];
          usernameVal = th['username'];
          useridVal = th['userid'];
          displayVal = th['display'];
          avatarVal = th['avatar'];
          lastMessage = message['message'];
          if(message['cmd'] == 'send'){
            lastTime = '${currentTimeInSeconds().toString()}';  //now
          }else
          lastTime = message['time'];
        }
        idx++;
      }
      if(index != -1){
        thread.removeAt(index);
        thread.insert( 0,    {
          "thread":"$threadVal",
          "username":"$usernameVal",
          "userid":"$useridVal",
          "display":"$displayVal",
          "avatar":"$avatarVal",
          "lastmessage":"$lastMessage",
          "lasttime":"$lastTime"
        },
        );
      }
      _threadController.add(thread);
    }
    if(message['cmd'] == 'newthread'){
      thread.insert( 0,    {
        "thread":"${message['thread']}",
        "username":"${message['username']}",
        "userid":"${message['userid']}",
        "display":"${message['display']}",
        "avatar":"${message['avatar']}",
        "lastmessage":"${message['lastmessage']}",
        "lasttime":"${message['lasttime']}"
      },
      );

      threadHistory.add({
        'thread':'${message['thread']}',
        'endoffset': '0'
      });
      _threadController.add(thread);

    }
   // thread.addAll()
    return messages;
  }

  void  addMessage1(dynamic message) {
    //if (message['type'] != 'typing') {
    //  messages.add(message);
    //  _messagesListController.add(messages);
    // }
    if(messages.length >= 1){
      if(messages[0]['cmd'] == 'typing'){
        messages.removeAt(0);
      }
    }
   // print('brp kali');
    if(messages.length >= 1){
      if(messages[0]['message'] == message['message'] ){
        //messages.removeAt(0);
      //  print('brp kali1');
      }else{
      //  print(messages[0]['message']);
      //  print(message['message']);
      //  print('brp kali2');
        messages.insert(0, message);
      }


    }else{
      messages.add(message);
    }
  //  if (currentMsgThread == currentThread){
      //  messages.add(message);
        //_messagesListController .add(messages);

  //  }

    _messagesListController.add(messages);


    // thread.addAll()
    //return messages;
  }

  List<dynamic> addMessage2(dynamic message) {
    //if (message['type'] != 'typing') {
    //  messages.add(message);
    //  _messagesListController.add(messages);
    // }
    if(messages.length >= 1){
      if(messages[messages.length - 1]['cmd'] == 'typing'){
        messages.removeLast();
      }
    }

    messages.add(message);
   // _messagesListController.add(messages);




    // thread.addAll()
    return messages;
  }

  void  addMessage3(dynamic message) {

    //  if (currentMsgThread == currentThread){
    messages.clear();
      messages.add(message);
   // messages.insert(0, message);
    //_messagesListController .add(messages);

    //  }

    _messagesListController.add(messages);


    // thread.addAll()
    //return messages;
  }

  void refreshReadMsg(String userid){
      List<dynamic> temp = [];
      messages.forEach((element) {
          if (element['userid'] == userid) {
                  temp.add({
                  "userid": "${element['userid']}",
                  "message": "${element['message']}",
                  "time": element['time'],
                  "rcvstatus": 3,
                  "msgtype": element['msgtype']
                  });

          }else{
            temp.add(element);

          }

      });

          messages.clear();
          messages.addAll(temp);
          _messagesListController.add(messages);


  }

  Future<int> getIdx(List<dynamic> data,String key)async{
    int idx = 0;
    int count = 0 ;

    data.forEach((element) {
      if(element['message'] == key){
        idx = count;
      }
      count ++;
    });

    return idx;
  }

  Future<void> addOldMessage(dynamic message)async {
   // List<dynamic> temp = [];
   // bool checkEmptyList = false;
   // int countAllElement = 0;

   // userinfoThread = message;
   // _messagesInfoController.add(userinfoThread);

    if(maxthread <= pagecount){
      if(  maxthread != 0){
        beforeThread = true;
        maxthread = nextThread;
      }

    }


    if(page.isNotEmpty){

     if((message['currpage'] > 0) && (message['currpage'] != message['lastpage']) && !page.contains(message['currpage']) ){

       page.add(message['currpage']);
       if(page[page.length - 1] != 1){
        // page.add(message['currpage']);
         messages.addAll(message['list'].reversed.toList());
		   if(searchItem !=  '')
			  {
				searchIdx = await  getIdx(messages, searchItem);
				searchItem = '';
			  }
         nextThread = message['currpage'];
		  isTyping = false;
		  timeopen = '0' ;
         _messagesListController.add(messages);
       }


     }

    }
    else if(message['currpage'] == message['lastpage']){
      _setChatList(message['thread'], jsonEncode(message));
      page.clear();
      page.add(message['lastpage']);
      messages.clear();
      messages.addAll(message['list'].reversed.toList());
      if(searchItem !=  '')
      {
        searchIdx = await  getIdx(messages, searchItem);
        searchItem = '';
      }
      nextThread = message['lastpage'];
      isTyping = false;
      timeopen = '0' ;
      _messagesListController.add(messages);
    }
    else{
      //print('good7');
      page.add(message['currpage']);

       messages.addAll(message['list'].reversed.toList());
      if(searchItem !=  '')
      {
        searchIdx = await  getIdx(messages, searchItem);
        searchItem = '';
      }

      isTyping = false;
      timeopen = '0' ;
      _messagesListController.add(messages);

    }



    //////////////////////////////////////
    ///                               ///
    /////////////////////////////////////


  }

  void addSearchMessage(dynamic message) {
    //List<dynamic> temp = [];
    searchMessages.clear();
    /*
    message['list'].reversed.toList().forEach((element) {
      temp.add({
        "userid": "${element['userid']}",
        "message": "${element['message']}",
        "time": element['time'],
        "rcvstatus": element['rcvstatus'],
        "msgtype": element['msgtype'],
        "thread":"${element['thread']}",
        "page":element['page']
      });
    });

     */


    searchMessages.addAll(message['list']);

    _searchListController.add(searchMessages);

    //////////////////////////////////////
    ///                               ///
    /////////////////////////////////////


  }

  void refreshOldMessage(List<dynamic> message, String userid) {
    List<dynamic> temp = [];
    List<dynamic> msg= [];
    msg.addAll(message);
        timeopen = currentTimeInSeconds().toString();

    //  }
    //}


    //  messages = [];

      //  print('apakah disini');
      // _messagesListController.;
       messages.clear();
       msg.forEach((element) {
         if (element['message'].length >= 5) {
                 if (element['message'].substring(
                     element['message'].length - 5) == '  ✓✓ ') {
                    temp.add(element);

                 } else {
                   if (element['userid'] == userid) {
                     if (element['message'].substring(
                         element['message'].length - 2) == '✓✓') {
                       temp.add(element);
                     } else {
                       int i = element['time'];
                       if (element['message'].contains(
                           'https://upload.projects.co.id/upload/usr')) {
                         temp.add(element);
                       } else {
                         if (element['message'].substring(
                             element['message'].length - 1) == '✓') {
                           temp.add({
                             "userid": "${element['userid']}",
                             "message": "${element['message']}✓",
                             "time": i
                           });
                         } else {
                           temp.add({
                             "userid": "${element['userid']}",
                             "message": "${element['message']}  ✓✓",
                             "time": i
                           });
                         }
                       }
                     }
                   } else {
                     temp.add(element);
                   }
                 }


           }else{
           if (element['userid'] == userid) {
             if (element['message'].substring(
                 element['message'].length - 2) == '✓✓') {
               temp.add(element);
             } else {
               int i = element['time'];
               if (element['message'].contains(
                   'https://upload.projects.co.id/upload/usr')) {
                 temp.add(element);
               } else {
                 if (element['message'].substring(
                     element['message'].length - 1) == '✓') {
                   temp.add({
                     "userid": "${element['userid']}",
                     "message": "${element['message']}✓",
                     "time": i
                   });
                 } else {
                   temp.add({
                     "userid": "${element['userid']}",
                     "message": "${element['message']}  ✓✓",
                     "time": i
                   });
                 }
               }
             }
           } else {
             temp.add(element);
           }

           }
       });
       /*

      if (messageOpen)
      {


        /*
          message['list'].reversed.toList().forEach((element) {
            if (element['userid'] == userid) {
              int i = element['time'];
                temp.add({
                  "userid": "${element['userid']}",
                  "message": "${element['message']}  ✓✓",
                  "time": i
                });
            } else {
              temp.add(element);
            };
          });

           */
        msg.reversed.toList().forEach((element) {
          if (element['message'].length >= 5) {
            if (element['message'].substring(
                element['message'].length - 5) == '  ✓✓ ') {
              if (element['userid'] != userid) {
                //timeopen = element['time'].toString();
              }
              //  print('haloooooooooooooooooooooooo');
              // temp.add(element);
            } else {
              if (timeopen != '0') {
                if (element['userid'] == userid) {
                  if (element['time'] <= int.parse(timeopen)) {
                    int i = element['time'];
                    if (element['message'].contains(
                        'https://upload.projects.co.id/upload/usr')) {
                      temp.add(element);
                    } else {
                      temp.add({
                        "userid": "${element['userid']}",
                        "message": "${element['message']}  ✓✓",
                        "time": i
                      });
                    }
                  } else {
                    int i = element['time'];
                    if (element['message'].contains(
                        'https://upload.projects.co.id/upload/usr')) {
                      temp.add(element);
                    } else {
                      temp.add({
                        "userid": "${element['userid']}",
                        "message": "${element['message']}  ✓✓",
                        "time": i
                      });
                    }
                  }
                } else {
                  temp.add(element);
                }
              } else {
                int i = element['time'];
                if (element['message'].contains(
                    'https://upload.projects.co.id/upload/usr')) {
                  temp.add(element);
                } else {
                  if (element['userid'] == userid) {
                    temp.add({
                      "userid": "${element['userid']}",
                      "message": "${element['message']}  ✓✓",
                      "time": i
                    });
                  } else {
                    temp.add(element);
                  }
                }
              }
            }
          } else {
            if (timeopen != '0') {
              if (element['userid'] == userid) {
                if (element['time'] <= int.parse(timeopen)) {
                  int i = element['time'];
                  temp.add({
                    "userid": "${element['userid']}",
                    "message": "${element['message']}  ✓✓",
                    "time": i
                  });
                } else {
                  int i = element['time'];
                  temp.add({
                    "userid": "${element['userid']}",
                    "message": "${element['message']}  ✓✓",
                    "time": i
                  });
                }
              } else {
                int i = element['time'];
                if (element['message'].contains(
                    'https://upload.projects.co.id/upload/usr')) {
                  temp.add(element);
                } else {
                  temp.add({
                    "userid": "${element['userid']}",
                    "message": "${element['message']}",
                    "time": i
                  });
                }
              }
            } else {
              if (element['userid'] == userid) {
                int i = element['time'];
                temp.add({
                  "userid": "${element['userid']}",
                  "message": "${element['message']}  ✓✓",
                  "time": i
                });
              } else {
                temp.add(element);
              }
            }
          };
        });

      } else
      {
        msg.reversed.toList().forEach((element) {
          if (element['message'].length >= 5) {
            if (element['message'].substring(
                element['message'].length - 5) == '  ✓✓ ') {
              if (element['userid'] != userid) {
                //timeopen = element['time'].toString();
              }
              //  print('haloooooooooooooooooooooooo');
              // temp.add(element);
            } else {
              if (timeopen != '0') {
                if (element['userid'] == userid) {
                  if (element['time'] <= int.parse(timeopen)) {
                    int i = element['time'];
                    if (element['message'].contains(
                        'https://upload.projects.co.id/upload/usr')) {
                      temp.add(element);
                    } else {
                      temp.add({
                        "userid": "${element['userid']}",
                        "message": "${element['message']}  ✓✓",
                        "time": i
                      });
                    }
                  } else {
                    int i = element['time'];
                    if (element['message'].contains(
                        'https://upload.projects.co.id/upload/usr')) {
                      temp.add(element);
                    } else {
                      temp.add({
                        "userid": "${element['userid']}",
                        "message": "${element['message']}  ✓✓",
                        "time": i
                      });
                    }
                  }
                } else {
                  temp.add(element);
                }
              } else {
                int i = element['time'];
                if (element['message'].contains(
                    'https://upload.projects.co.id/upload/usr')) {
                  temp.add(element);
                } else {
                  if (element['userid'] == userid) {
                    temp.add({
                      "userid": "${element['userid']}",
                      "message": "${element['message']}  ✓✓",
                      "time": i
                    });
                  } else {
                    temp.add(element);
                  }
                }
              }
            }
          } else {
            if (timeopen != '0') {
              if (element['userid'] == userid) {
                if (element['time'] <= int.parse(timeopen)) {
                  int i = element['time'];
                  temp.add({
                    "userid": "${element['userid']}",
                    "message": "${element['message']}  ✓✓",
                    "time": i
                  });
                } else {
                  int i = element['time'];
                  temp.add({
                    "userid": "${element['userid']}",
                    "message": "${element['message']}  ✓✓",
                    "time": i
                  });
                }
              } else {
                int i = element['time'];
                if (element['message'].contains(
                    'https://upload.projects.co.id/upload/usr')) {
                  temp.add(element);
                } else {
                  temp.add({
                    "userid": "${element['userid']}",
                    "message": "${element['message']}",
                    "time": i
                  });
                }
              }
            } else {
              if (element['userid'] == userid) {
                int i = element['time'];
                temp.add({
                  "userid": "${element['userid']}",
                  "message": "${element['message']}  ✓✓",
                  "time": i
                });
              } else {
                temp.add(element);
              }
            }
          };
        });
      }

        */




    //   String senderOpen = '';
    messages.addAll(temp);
    isTyping = false;
    timeopen = '0' ;
    _messagesListController.add(messages);

  }

  Future<void> addThread(String th)async {
   /* for(var objtr in th['list']){
      threadHistory.add({
         'thread':'${objtr['thread']}',
         'endoffset': '0'
      });
    }

    */


    int indexChat = await _getIdxInfo();
    if(indexChat == 1){


      _adminsController.add(jsonDecode(th)['admins']);
      _setIdxInfo(0);
    }

    if(jsonDecode(th)['currpage'] == 1){
      _setIdx(th);
    }

   // _adminsController.add(jsonDecode(th)['admins']);
 //  print('addthread');
 //  thread.clear();
 //  _threadController.add(thread);

   // if (jsonDecode(th)['type'] == 'index') {
     // messages.add(message);
    //  thread.addAll(jsonDecode(th)['list']);
    //  _threadController.add(jsonDecode(th)['list']);
    /*
      if(blackListUser != ''  && blackListUser != null ){
        var bl = json.decode(blackListUser);
        int cn = 0; int cn1 = 0;
        var list = [];
        list.addAll(jsonDecode(th)['list']);
        for(var item in jsonDecode(th)['list']){
          cn1 = 0;
           for(var obj in bl['bl'] ){
             if(item['userid'] == obj['userid']){
                list.removeWhere((item) => item['userid'] == obj['userid']);
             }
             cn1 ++;
            }
           cn ++;
        }
        if (thread.isEmpty) {
          _threadController.sink.add(list);
          thread.addAll(list);
          print('addthread3');
        } else {
          if (list[0]['thread'] != thread[0]['thread']) {
            thread.addAll(list);
            print('addthread2');
            _threadController.add(thread);
          } else {
            // print('Hasilnya....' + jsonDecode(th)['list'].toString());
            // _threadController.add(thread);
            thread.clear();
            thread.addAll(list);
            _threadController.add(thread);


            // print('addthread4');
          }
        }

      }else {
        */

        List<dynamic> temp =  [];
        temp.addAll(jsonDecode(th)['list']);
        temp.removeWhere((item) => item['blocked'] == 1);
        if (thread.isEmpty) {
          _threadController.sink.add(temp);
          thread.addAll(temp);
         // print('addthread3');
        } else {
          if (temp[0]['thread'] != thread[0]['thread']) {
            thread.addAll(temp);
           // print('addthread2');
            _threadController.add(thread);
          } else {
           // log.info('Hasilnya....${temp.length.toString()}' + jsonDecode(th)['list'].toString());
            // _threadController.add(thread);
            thread.clear();
           // thread.addAll(temp);
           // _threadController.sink.close();
            _threadController.sink.add(temp);
            thread.addAll(temp);

           // _threadController.add(thread);


            // print('addthread4');
          }
        }
     // }


     // print('addthread1');

  //  }
    //return thread;
  }

  Future<void> addSearchThread(String th)async {



    List<dynamic> temp =  [];
    temp.addAll(jsonDecode(th)['list']);


    _searchThread.clear();
    _searchThread.addAll(temp);
    _searchThreadController.add(_searchThread);



  }

/*
  List<dynamic> _historyMessagesHandler(ChatHistortModel chatHistortModel) {
    List<dynamic> listHistoryMessages = new List<dynamic>();
    try {
      chatHistortModel.history.map((h) {
        if (h.message['raw_message'] != null) {
          h.message['text'] = h.message['raw_message']['payloadTitle'] != null
              ? h.message['raw_message']['payloadTitle']
              : h.message['raw_message']['text'];
        }
        h.message['_id'] = h.sId;
        h.message['favorite'] = h.favorite;
        return h;
      }).forEach((h) {
        listHistoryMessages.add(h.message);
      });

    } catch (e) {
      log.severe('_historyMessagesHandler fail!', e);
      throw e;
    }
    return listHistoryMessages;
  }

 */

  void selectMessageToggle(dynamic message) {
   // print(message);
    if (selectedMessage != null) {
      selectedMessage =
          message['time'] == selectedMessage['time'] ? null : message;
    } else {
      selectedMessage = message;
    }
    _selectedMessageController.add(selectedMessage);
  }

  void multiSelectMessageToggle(dynamic message) {
    // print(message);
   // if (multiSelectedMessage != null) {
     // selectedMessage =
     // message['time'] == selectedMessage['time'] ? null : message;

      if(message['time'] == 0){
        multiSelectedMessage = [];
      }else {
         if(multiSelectedMessage.length == 0){
          multiSelectedMessage.add(message);
        }else{
          var msm = multiSelectedMessage;
          bool isSelect = true;
          int count = 0;
          for(var item in msm){
            if(item['time'] == message['time']){
              multiSelectedMessage.removeAt(count);
              isSelect = false;
              break;
            }
            count ++;
          }
          if(isSelect){

            multiSelectedMessage.add(message);
          }

        }

      }



   // } else {
   //   multiSelectedMessage = [];

   //   multiSelectedMessage.add(message);
   // }

    _selectedMessageController.add(multiSelectedMessage);
  }

  void sendMessage(SendMessageModel message, {bool isPostback = false}) {
    final jsonMessage = jsonEncode(message);
    log.fine('sending message:${message.text}');
    getIndexSpecial(1);
    if (!isPostback) socket.send(jsonMessage);

   // addMessage(jsonDecode(jsonMessage));
  }

  void sendMsg(SendMsgModel1 message, {bool isPostback = false}) {
    final jsonMessage = jsonEncode(message.toJson());
  /*  log.fine('sending message:${jsonEncode({
      "cmd":"message",
      "thread":"${message.thread}",

      "message":"${message.message} "
    })}'); */
    if(tempMsg != ''){
      /*
      addMessage1(
          {

            "userid": "$id",
            "message": "${message.message}",
            "time": currentTimeInSeconds(),
            "rcvstatus": 0
          }
      );

       */
      messages.clear();
    }else{
      /*
      addMessage1(
          {

            "userid": "$id",
            "message": "${message.message}",
            "time": currentTimeInSeconds(),
            "rcvstatus": 0
          }
      );

       */

    }

    isHeader = false;

    log.fine(jsonMessage);

    if(tempMsg != ''){

      socket.send(jsonEncode({
        "cmd":"message",
        "thread":"${message.thread}",
        "message":"$tempMsg "
      }));

      tempMsg = '';
     // isHeader = true;
    }
    //getIndexSpecial(1);
    socket.send(jsonMessage);

  }

  void sendMsg1(SendMsgModel1 message, {bool isPostback = false}) {
    final jsonMessage = jsonEncode(message.toJson());
    //print('aku disini');
    /*  log.fine('sending message:${jsonEncode({
      "cmd":"message",
      "thread":"${message.thread}",

      "message":"${message.message} "
    })}'); */
  /*
    addMessage3(
        {

          "userid": "$id",
          "message": "${message.message}",
          "time": currentTimeInSeconds(),
          "rcvstatus": 0
        }
    );

   */

    isHeader = true;
    tempMsg = message.message!;

   // getIndexSpecial(1);

    log.fine(jsonMessage);
   // socket.send(jsonMessage);



  }

  void readSignal(String thread) {
    //deleteMsg();
    final jsonMessage = jsonEncode({
      "cmd":"read",
      "thread":"$thread"
    });
    socket.send(jsonMessage);
    log.fine('sending message:1234 ini $thread');
    // socket.send(jsonMessage);
    //if (!isPostback) socket.send(jsonMessage);
    // addMessage(jsonDecode(jsonMessage));

  }

  void getFirstThreadSp(String thread)async{
    typeCount = 0;
    deleteMsg();
    _setIdxInfo(2);
    outThread = false;

    var val  = await _getChatList(thread);
    if(val != ''){
      //dfdsfdsfds
    // addOldMessage(jsonDecode(val));
     var value = jsonDecode(val);
     if(value['currpage'] == value['lastpage']){

      messages.clear();
      messages.addAll(value['list'].reversed.toList());
      if(searchItem !=  '')
      {
        searchIdx = await  getIdx(messages, searchItem);
        searchItem = '';
      }
      isTyping = false;
      timeopen = '0' ;
      _messagesListController.add(messages);
    }




     // print('halooo boy');
    }
    _setThreadInfo(thread);
    final jsonMessage = jsonEncode({
      "cmd":"thread",
      "thread":"$thread"
    });


  //  print('request == $jsonMessage');
   if(socket != null){
     socket.send(jsonMessage);
     alreadyLogin = false;
     startTimer();

     // print('send socket $thread');
   }else{

     /*Timer.periodic(Duration(milliseconds: 200), (timer) {
       if(socket != null){

         socket.send(jsonMessage);
         timer.cancel();
       }else{
         print('no socket');

       }


     });

      */
   }
   /*

    Timer.periodic(Duration(milliseconds: 15000), (timer) {
      //print('ini tidak sama $currentThread dengan $thread');
      if(isGetFT3){

        isGetFT3 = false;
        if(isGetFT3){
          print('isGetFT3..........................');
        }else{

          print('NOTisGetFT3.....................................');
        }

        timer.cancel();
      }else{
        final SendTypingModel message = new SendTypingModel(
            thread: thread);
        sendTyp(message);

      }


    });

    */

    /*  log.fine('sending message:${jsonEncode({
      "cmd":"message",
      "thread":"${message.thread}",
      "attachment":"${message.attachment}",
      "message":"${message.message} "
    })}'); */
   // socket.send(jsonMessage);
    //if (!isPostback) socket.send(jsonMessage);
    // addMessage(jsonDecode(jsonMessage));

  }

  void getFirstThread(String thread) {
    outThread = true;
    deleteMsg();
    final jsonMessage = jsonEncode({
      "cmd":"thread",
      "thread":"$thread"
    });

    if(socket != null){
      socket.send(jsonMessage);
      alreadyLogin = false;
      startTimer();

      // print('send socket $thread');
    }else{

      /*Timer.periodic(Duration(milliseconds: 200), (timer) {
       if(socket != null){

         socket.send(jsonMessage);
         timer.cancel();
       }else{
         print('no socket');

       }


     });

      */
    }



    /*  log.fine('sending message:${jsonEncode({
      "cmd":"message",
      "thread":"${message.thread}",
      "attachment":"${message.attachment}",
      "message":"${message.message} "
    })}'); */
    // socket.send(jsonMessage);
    //if (!isPostback) socket.send(jsonMessage);
    // addMessage(jsonDecode(jsonMessage));

  }

  void getFirstThread1(String thread) {
    outThread = true;
     deleteMsg();
    final jsonMessage = jsonEncode({
      "cmd":"thread",
      "thread":"$thread"
    });
    socket.send(jsonMessage);
    alreadyLogin = false;
    startTimer();

    currentThread = '';
    /*  log.fine('sending message:${jsonEncode({
      "cmd":"message",
      "thread":"${message.thread}",
      "attachment":"${message.attachment}",
      "message":"${message.message} "
    })}'); */
    // socket.send(jsonMessage);
    //if (!isPostback) socket.send(jsonMessage);
    // addMessage(jsonDecode(jsonMessage));

  }

  void getFirstThread2(String thread) {
    outThread = true;
    //deleteMsg();
    final jsonMessage = jsonEncode({
      "cmd":"thread",
      "thread":"$thread"
    });
    socket.send(jsonMessage);
    alreadyLogin = false;
    startTimer();

    currentThread = '';
    /*  log.fine('sending message:${jsonEncode({
      "cmd":"message",
      "thread":"${message.thread}",
      "attachment":"${message.attachment}",
      "message":"${message.message} "
    })}'); */
    // socket.send(jsonMessage);
    //if (!isPostback) socket.send(jsonMessage);
    // addMessage(jsonDecode(jsonMessage));

  }

  void getFirstThread3(String thread) {
    outThread = true;

    //deleteMsg();
    final jsonMessage = jsonEncode({
      "cmd":"thread",
      "thread":"$thread"
    });
    socket.send(jsonMessage);
    alreadyLogin = false;
    startTimer();

    isGetFT3 = true;
    currentThread = '';
    /*  log.fine('sending message:${jsonEncode({
      "cmd":"message",
      "thread":"${message.thread}",
      "attachment":"${message.attachment}",
      "message":"${message.message} "
    })}'); */
    // socket.send(jsonMessage);
    //if (!isPostback) socket.send(jsonMessage);
    // addMessage(jsonDecode(jsonMessage));

  }

  void getFirstThread4(String thread) {
    //outThread = true;

    //deleteMsg();
    final jsonMessage = jsonEncode({
      "cmd":"thread",
      "thread":"$thread"
    });
    socket.send(jsonMessage);
    alreadyLogin = false;
    startTimer();

    isGetFT4 = true;
    currentThread = '';
    /*  log.fine('sending message:${jsonEncode({
      "cmd":"message",
      "thread":"${message.thread}",
      "attachment":"${message.attachment}",
      "message":"${message.message} "
    })}'); */
    // socket.send(jsonMessage);
    //if (!isPostback) socket.send(jsonMessage);
    // addMessage(jsonDecode(jsonMessage));

  }

  void getChatThread( int nx, String thread) {

 // if(nextThread <= pagecount){

 // }else{
 //   maxthread = nextThread;
 // }




     // nextThread = nextThread--;





  //  print('halooo123 ${nextThread.toString()}');

if(page.contains(nx)){

}else{
  if( nx >= 1) {
    final jsonMessage = jsonEncode({
      "cmd": "thread",
      "thread": "$thread",
      "page": nx.toString()
    });
    socket.send(jsonMessage);
    alreadyLogin = false;
    startTimer();

  }
}


    /*  log.fine('sending message:${jsonEncode({
      "cmd":"message",
      "thread":"${message.thread}",
      "attachment":"${message.attachment}",
      "message":"${message.message} "
    })}'); */
  //  socket.send(jsonMessage);
    //if (!isPostback) socket.send(jsonMessage);
    // addMessage(jsonDecode(jsonMessage));

  }

  void getChatThreadSP( int nx, String thread, String keyword) {
    searchItem = keyword;
    typeCount = 0;
    deleteMsg();
    _setIdxInfo(2);
    _setThreadInfo(thread);
    maxthread = nx;
    //  print('halooo123 ${nextThread.toString()}');

    if( nx >= 1) {
      final jsonMessage = jsonEncode({
        "cmd": "thread",
        "thread": thread,
        "page": nx.toString()
      });
      socket.send(jsonMessage);
      alreadyLogin = false;
      startTimer();

    }
    /*  log.fine('sending message:${jsonEncode({
      "cmd":"message",
      "thread":"${message.thread}",
      "attachment":"${message.attachment}",
      "message":"${message.message} "
    })}'); */
    //  socket.send(jsonMessage);
    //if (!isPostback) socket.send(jsonMessage);
    // addMessage(jsonDecode(jsonMessage));

  }

// var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  static int currentTimeInSeconds() {
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    return (ms / 1000).round();
  }

  void sendTyp(SendTypingModel message, {bool isPostback = false}) {
    final jsonMessage = jsonEncode(
        {
          "cmd":"typing",
          "thread":"${message.thread}"
        }
    );
    //log.fine('sending message:${message.cmd}');
    //log.fine('sending message:${message.thread}');
    // if (!isPostback) socket.send(jsonMessage);
   // addMessage(jsonDecode(jsonMessage));
    socket.send(jsonMessage);

/*    addMessage({
      "cmd":"typing",
      "sender":"${message.receiver}",
      "time":"${currentTimeInSeconds().toString()}"
    });

 */

  }

  void sendTyp1(SendTypingModel message, {bool isPostback = false}) {

  //  log.fine('sending1 message:${message.cmd}');
  //  log.fine('sending1 message:${message.thread}');
   // log.fine('user id message:${messages[0]['userid']}');


      if(messages.isNotEmpty){
        if(messages[0]['userid'] != id && messages[0]['userid'] != 'zzzzzz') {
          if (messages[0]['message'].contains('https://upload.projects.co.id/upload/usr')) {

          } else {
            if (messages[0]['message'].length >= 5) {
              if (messages[0]['message'].substring(messages[0]['message'].length - 5) != '  ✓✓ ') {
                //  print('check');
                socket.send(jsonEncode({
                  "cmd": "message",
                  "thread": "${message.thread}",
                  "message": "${messages[0]['message']}  ✓✓ ",
                  "attachment": ""
                }));
               // refreshOldMessage(messages, id);

              }
              //
            } else {
               // print('check1');
              socket.send(jsonEncode({
                "cmd": "message",
                "thread": "${message.thread}",
                "message": "${messages[0]['message']}  ✓✓ ",
                "attachment": ""
              }));
             // refreshOldMessage(messages, id);

            }
          }
        }
      }

  }

  void login(LoginMsgModel message, {bool isPostback = false}) {
   /*


     */
  }

  void onPostBack(SendMessageModel message, title, payload) {
    sendMessage(message, isPostback: true);
    socket.send(jsonEncode({
      'channel': 'socket',
      'type': 'message',
      'user': message.user,
      'payloadTitle': title,
      'text': payload
    }));
  }

  void onPostBack1(SendMsgModel1 message, title, payload) {
    sendMsg(message, isPostback: true);
    socket.send(jsonEncode({
      'cmd': 'send',
      'receiver': message.thread,
      'message': message.message,
      'attachment': message.attachment
    }));
  }

  void closeConnection() {
    socket.close();
    closeSocket = true;
  }

  Future<void> wsSetHandlerssp(bool csc)async{
    closeSocket = csc;
    await socket.connect(_webSocketURI);
   // socket.onMessage(__onMessageHandler);
    /*
    socket.onClose((dynamic message) async{
     // log.info('websocketBloc ====> Close');
      if(!closeSocket){
       // await socket.close();
        await socket.connect();
        await __wsSetHandlers();

      }

    });

     */
  }

  Future<void> wsSetHandlers()async{
    //await socket.connect();
    if (socket != null) {
      await socket.connect(_webSocketURI);
      //socket.onMessage(__onMessageHandler);
     // log.info('websocketBloc ====> open');
      if(id != ''){
        lg(id);
       // getx();
        /*
        int indexChat = await _getIdxInfo();
        if(indexChat == 1){
          getIndexSpecial(1);
          _setIdxInfo(0);
        }
        if(indexChat == 2){
          String thread = await _getThreadInfo();
          final jsonMessage = jsonEncode({
            "cmd":"thread",
            "thread":"$thread"
          });

          if(socket != null){
            socket.send(jsonMessage);
            _setIdxInfo(0);
            // print('send socket $thread');
          }
        }

         */
      }
      /*
      socket.onClose((dynamic message) async{
      //  log.info('websocketBloc ====> Close');
        if(!closeSocket){
        // await socket.close();
         await socket.connect(_webSocketURI);
         if(id != ''){
           lg(id);}
         //await __wsSetHandlers();

        }

      });

       */

    }else{
      await socket.connect(_webSocketURI);
      if(id != ''){
        lg(id);}
      //await __wsSetHandlers();
    }
  }

/*
  Future<void> __wsSetHandlers()async{
    if (socket != null) {
     // log.info('websocketBloc ====> open');
      await socket.connect(_webSocketURI);
      socket.onMessage(__onMessageHandler);
      if(id != ''){
        lg(id);
        messages = [];
        messages.add({

          "userid": "wssclose",
          "message": "wssclose",
          "time": 1234,
          "msgtype": 111,
          "rcvstatus": 111,
        });

        _messagesListController.add(messages);

        messages = [];

        thread = [];
        thread.add({
          "thread":"wssclose",
          "username":"wssclose",
          "userid":"wssclose",
          "display":"wssclose",
          "avatar":"wssclose",
          "lastmessage":"wssclose",
          "lasttime":"wssclose"
        });
        _threadController.add(thread);
        thread = [];



        /*
        int indexChat = await _getIdxInfo();
        if(indexChat == 1){
          getIndexSpecial(1);
          _setIdxInfo(0);
        }
        if(indexChat == 2){
          String thread = await _getThreadInfo();
          final jsonMessage = jsonEncode({
            "cmd":"thread",
            "thread":"$thread"
          });

          if(socket != null){
            _setIdxInfo(0);
            socket.send(jsonMessage);
            // print('send socket $thread');
          }
        }

         */
      }

     // socket.onMessage(__onMessageHandler);
      socket.onClose((dynamic message)async{
       // log.info('websocketBloc ====> Close');
        if(!closeSocket)
        {
         // await socket.close();
          await socket.connect();
          await __wsSetHandlers();
        }


      });
    }else{
     // await socket.close();
      //await socket.connect();
      //await __wsSetHandlers();
      if(id != ''){
        lg(id);
      }
    }
  }

 */

  void deleteMsg(){
    //print('delete message...');
    if(page == null){
      maxthread = 0;
      nextThread = 0;
    }else{
      if(messages.isNotEmpty  ) {messages.clear();}
      maxthread = 0;
      nextThread = 0;
      page.clear();
    }

  }

  void searchIndex(String kw){

        socket.send(jsonEncode({
          'cmd': 'search-idx',
          'keyword': '$kw'
        }));

  }

  void searchInThread(String th, String kw){

    socket.send(jsonEncode({
      'cmd': 'search-thd',
      'thread':'$th',
      'keyword': '$kw'
    }));

  }

  void getIndex(int idx){
    if(idx == 1) {
      thread.clear();

      //  print('hereeeeee');
      socket.send(jsonEncode({
        'cmd': 'index',
        'page': idx.toString()
      }));

    } else{
      if(this.maxIndexCount > idx){
        socket.send(jsonEncode({
          'cmd': 'index',
          'page': idx.toString()
        }));


      }
    }

  }

  void getx(){

      thread.clear();

       // print('hereeeeee');
      socket.send(jsonEncode({
        'cmd': 'index'
      }));


  }

  void getIndexSpecial(int idx)async{
    _setIdxInfo(1);
    openSign = true;
    typeCount = 0;
    if(idx == 1) {
      thread.clear();
      var val = await _getIdx();
      if(val != ''){
        addThread(val);
      }

      if(socket == null || alreadyLogin != true){
        // socket.connect();
        //wsSetHandlers();
        lg1(id);
      }
      //  print('hereeeeee');
      socket.send(jsonEncode({
        'cmd': 'index',
        'page': idx.toString()
      }));

    } else{
      if(this.maxIndexCount > idx){
        socket.send(jsonEncode({
          'cmd': 'index',
          'page': idx.toString()
        }));


      }
    }

  }

  void getFirstIndex(int idx){
    if(idx == 1){
      thread.clear();
    }
    socket.send(jsonEncode({
      'cmd': 'index',
      'page': idx.toString()
    }));

  }

  void setCurrentThread(){
    currentThread = '';
    outThread = true;
    deleteMsg();
  }


  void getFX(int idx){

    socket.send(jsonEncode({
      'cmd': 'index',
      'page': idx.toString()
    }));
  }

  bool isJsonString(String str) {
    try {
      jsonDecode(str);
    } catch (e) {
      return false;
    }
    return true;
  }




  void onMediaView({String? url, String? blockId, String? sessionId}) {
    _chatRepository.eventCounterReport(
        {'url': url, 'blockId': blockId, 'sessionId': sessionId});
  }

  dispose() {
    _initializeIdx();
    _initializeList();
    socketClose();
    /*
    socketClose();
    _selectedMessageController.close();
    if(_threadController != null){
      _threadController.done;
      _threadController.close();
      _threadController = null;
    }
    if(_messagesListController != null){
      _messagesListController.done;
      _messagesListController = null;
    }

   // _messagesListController.close();
   // _messagesListController = null;

     */

  }

  dispose1() {
    /*
   // socketClose();
    if(_threadController != null){
      _threadController.done;
      _threadController.close();
      _threadController = null;
    }
    if(_messagesListController != null){
      _messagesListController.done;
      _messagesListController = null;
    }
   // _messagesListController.close();
   // _messagesListController = null;

     */

  }

  @override
  yaWebsocketDelegateOnClose(String code, String reason, String remote, String? tag) async {
    // TODO: implement yaWebsocketDelegateOnClose
    if(!closeSocket){
      // await socket.close();
      await socket.connect(_webSocketURI);
      if(id != ''){
        lg(id);}
      //await __wsSetHandlers();

    }
    //throw UnimplementedError();
  }

  @override
  yaWebsocketDelegateOnConnecting(String? tag) {
    // TODO: implement yaWebsocketDelegateOnConnecting
    print('haloooo');
   // setState(() {
   //   _data.add([false, "正在连接 $tag ($_webSocketURI) ，请不要进行其他操作。"]);
  //  });
    //throw UnimplementedError();
  }

  @override
  yaWebsocketDelegateOnError(String localizedMessage, String? message, String? tag) {
    // TODO: implement yaWebsocketDelegateOnError
    throw UnimplementedError();
  }

  @override
  yaWebsocketDelegateOnMessage(String message, String? tag) async {
    // TODO: implement yaWebsocketDelegateOnMessage
    String wsMessage =  message;
    //   print('WebsocketBloc recv: $wsMessage');
    //  log.info('WebsocketBloc recv: $wsMessage');
    l.log('WebsocketBloc recv: $wsMessage');
    int idx = wsMessage.indexOf('{');
    //bool sendType = true;

    //wsMessage = wsMessage.substring(idx);
    // int idx1 = wsMessage.indexOf('"type":"login"');
    // int idx2 = wsMessage.indexOf('"result":"success"');

    // if(idx1 != -1 && idx2 != -1){
    //   wsMessage = jsonEncode({"result":"success","type":"login","userid":"$id"});
    // }
    // var jsonString = '{"abc';

    var decodeSucceeded = false;
    try {
      // var decodedJSON = json.decode(wsMessage) as Map<String, dynamic>;
      if(idx == 0){
        decodeSucceeded = true;
        if(oldMessage1 != wsMessage) {
          if (isJsonString(wsMessage)) {
            // if (idx == 0 || (idx > 0 && idx1 != -1 && idx2 != -1)) {
            // print('idx === ${idx.toString()}');

            if (['message'].contains(jsonDecode(wsMessage)['type'])) {
              lastMessage = DateTime.now();
              wsMessage = wsMessage.substring(idx);

              // if(!isBlacklisted(jsonDecode(wsMessage)['sender'])){
              if ((jsonDecode(wsMessage)['sender'] == id && !isHeader)) {

                if(messages.isNotEmpty){
                //  messages.removeAt(0);

                }
                // print('halo bandung jaya');
                // readSignal(jsonDecode(wsMessage)['thread']);
                getFirstThread4(jsonDecode(wsMessage)['thread']);


                addMessage1(
                    {

                      "userid": "${jsonDecode(wsMessage)['sender']}",
                      "message": "${jsonDecode(wsMessage)['message']}",
                      "time": jsonDecode(wsMessage)['time'],
                      "msgtype": jsonDecode(wsMessage)['msgtype'],
                      "rcvstatus": jsonDecode(wsMessage)['rcvstatus'],
                    }
                );



                // _pusherMessageController.add(wsMessage);


                // getFirstThread4(jsonDecode(wsMessage)['thread']);
              } else {
                isHeader = false;
                if (jsonDecode(wsMessage)['thread'] == currentThread) {
                  if(outThread == true){
                    // getFirstIndex(1);
                    var tempid = '';
                    for (var obj in thread) {
                      print('objectds1 ${obj['sendername']}');
                      if (obj['userid'] != jsonDecode(wsMessage)['sender']) {
                        //print('objectds2 ${obj['sendername']}');
                        tempid = obj['sendername']??'';
                      }
                    }
                    if (tempid == '') {
                      tempid = newThreadDisplay;
                    }
                    var wsMessage1 = jsonEncode({
                      "type": "${jsonDecode(wsMessage)['type']}",
                      "display": "$tempid",
                      "thread": "${jsonDecode(wsMessage)['thread']}",
                      "sender": "${jsonDecode(wsMessage)['sender']}",
                      "message": "${jsonDecode(wsMessage)['message']}",
                      "time": jsonDecode(wsMessage)['time']
                    });
                    _pusherMessageController.add(wsMessage);
                  }else{
                    addMessage1(
                        {

                          "userid": "${jsonDecode(wsMessage)['sender']}",
                          "message": "${jsonDecode(wsMessage)['message']}",
                          "time": jsonDecode(wsMessage)['time'],
                          "msgtype": jsonDecode(wsMessage)['msgtype'],
                          "rcvstatus": jsonDecode(wsMessage)['rcvstatus'],
                        }
                    );

                    readSignal(currentThread);
                    //print('read signal = $currentThread');
                    var tempid = '';
                    for (var obj in thread) {
                      //  print('objectds1 ${obj['sendername']}');
                      if (obj['userid'] != jsonDecode(wsMessage)['sender']) {
                        // print('objectds2 ${obj['sendername']}');
                        tempid = obj['sendername']??'';
                      }
                    }
                    if (tempid == '') {
                      tempid = newThreadDisplay;
                    }
                    var wsMessage1 = jsonEncode({
                      "type": "${jsonDecode(wsMessage)['type']}",
                      "display": "$tempid",
                      "thread": "${jsonDecode(wsMessage)['thread']}",
                      "sender": "${jsonDecode(wsMessage)['sender']}",
                      "message": "${jsonDecode(wsMessage)['message']}",
                      "time": jsonDecode(wsMessage)['time']
                    });
                    _pusherMessageController.add(wsMessage);
                  }


                } else {
                  var tempid = '';
                  for (var obj in thread) {
                    //   print('objectds3 ${obj['sendername']}');
                    if (obj['userid'] != jsonDecode(wsMessage)['sender']) {
                      //   tempid = obj['sendername']??'';
                      print('objectds4 ${obj['sendername']}');
                    }
                  }
                  if (tempid == '') {
                    tempid = newThreadDisplay;
                  }
                  var  wsMessage1 = jsonEncode({
                    "type": "message",
                    "display": "$tempid",
                    "thread": "${jsonDecode(wsMessage)['thread']}",
                    "sender": "${jsonDecode(wsMessage)['sender']}",
                    "message": "${jsonDecode(wsMessage)['message']}",
                    "time": jsonDecode(wsMessage)['time']
                  });
                  _pusherMessageController.add(wsMessage);
                  // getFirstIndex(1);
                }
              }
              /*
            if (jsonDecode(wsMessage)['thread'] != currentThread) {
              _pusherMessageController.add(wsMessage);
            }else{
              if(jsonDecode(wsMessage)['sender'] != id){
                _pusherMessageController.add(wsMessage);
              }
            }

             */

              // _pusherMessageController.add(wsMessage);

              //  }

              //////////////////////////////////////////////////////////
              ////                                                 ////
              //////////////////////////////////////////////////////////
              //getFirstThread1(jsonDecode(wsMessage)['thread']);

            } else
            {
              if ([
                'index',
                'thread',
                'typing',
                'newthread',
                'read',
                'login',
                'adm-list',
                'search-thd',
                'search-idx'
              ].contains(
                  jsonDecode(wsMessage)['type'])) {
                lastMessage = DateTime.now();
                //  print('merdeka');
                if (jsonDecode(wsMessage.toString())['type'] == 'read') {
                  if (jsonDecode(wsMessage)['thread'] == currentThread) {
                    // getFirstThread(currentThread);
                    refreshReadMsg(id);
                  }
                }

                if (jsonDecode(wsMessage.toString())['type'] == 'search-thd') {
                  addSearchMessage(jsonDecode(wsMessage));
                  _pusherMessageController.add(wsMessage);
                }
                if (jsonDecode(wsMessage.toString())['type'] == 'search-idx') {
                  addSearchThread(wsMessage.toString());

                  _pusherMessageController.add(wsMessage);
                }
                if (jsonDecode(wsMessage.toString())['type'] == 'adm-list') {
                  _adminsController.add(
                      jsonDecode(wsMessage.toString())['admins']);
                }
                if (jsonDecode(wsMessage.toString())['type'] == 'login') {
                  alreadyLogin = true;
                  getIndexSpecial(1);


                  int indexChat = await _getIdxInfo();
                  if(indexChat == 1){
                    getIndexSpecial(1);
                    // _setIdxInfo(0);
                  }
                  if(indexChat == 2){
                    String thread = await _getThreadInfo();
                    final jsonMessage = jsonEncode({
                      "cmd":"thread",
                      "thread":"$thread"
                    });

                    socket.send(jsonMessage);
                    print('send socket here $thread');
                  }





                  _pusherMessageController.add(wsMessage);
                }

                if (jsonDecode(wsMessage.toString())['type'] == 'index') {
                  alreadyLogin = true;
                  this.maxIndexCount =
                  jsonDecode(wsMessage.toString())['lastpage'];
                  addThread(wsMessage.toString());
                  _setIdxInfo(0);
                  // l.log('halooooo tetsttttttt' + wsMessage.toString());
                  // _pusherMessageController.add(wsMessage);
                  _pusherMessageController.add(wsMessage);
                }
                if (jsonDecode(wsMessage)['type'] == 'typing') {
                  // print('typinggggggggggggggggggg');
                  //if (jsonDecode(wsMessage)['thread'] == currentThread &&
                  //   jsonDecode(wsMessage)['sender'] != id) {
                  isTyping = true;
                  //addOldMessage(jsonDecode(wsMessage), id);
                  _pusherMessageController.add(wsMessage);
                  //refreshOldMessage(messages, id);
                  // }
                }
                if (jsonDecode(wsMessage)['type'] == 'newthread') {
                  currentNewThread = jsonDecode(wsMessage)['thread'];
                  newThreadDisplay = jsonDecode(wsMessage)['display'];
                  //thread.add(wsMessage);
                  if (jsonDecode(wsMessage)['blocked'] == 0) {
                    thread.insert(0, wsMessage);
                    _threadController.sink.add(thread);
                    _pusherMessageController.add(wsMessage);
                  }
                }

                if (jsonDecode(wsMessage)['type'] == 'thread') {
                  alreadyLogin = true;
                  _setIdxInfo(0);
                  this.maxChatList = jsonDecode(wsMessage.toString())['lastpage'];
                  nextThread = jsonDecode(wsMessage)['currpage'];
                  pagecount = jsonDecode(wsMessage)['lastpage'];
                  currentThread = jsonDecode(wsMessage)['thread'];


                  // print('halooo $currentThread');
                  addOldMessage(jsonDecode(wsMessage));
                  _messagesInfoController.add(wsMessage);
                  // print('halo bandung jaya1');
                  _pusherMessageController.add(wsMessage);
                  // log.fine('sending message:currentThread ini $currentThread');
                  readSignal(currentThread);
                  if (isGetFT4) {
                    isGetFT4 = false;
                    getIndexSpecial(1);
                  }
                }

                //////////////////////////////////////////////////////////
                ////                                                 ////
                //////////////////////////////////////////////////////////


              } else {
                if (['notify'].contains(
                    jsonDecode(wsMessage)['type'])) {

                  if (wsMessage != oldNotify1) {
                    oldNotify1 = wsMessage;
                    _pusherMessageControllerST.add(wsMessage);
                    _pusherMessageController.add(wsMessage);
                  }
                }else{
                  _pusherMessageController.add(wsMessage);
                }
              }
            }

            /*
        } else {
          // if(!sendType){
          //   sendType = true;
          if (['notify'].contains(
              jsonDecode(wsMessage)['type'])) {
            _pusherMessageControllerST.add(wsMessage);
          }

          _pusherMessageController.add(wsMessage);
          //  }

        }

          */

          }
        }
        if(jsonDecode(wsMessage)['type'] == 'message') {
          if (wsMessage != oldMessage1) {
            oldMessage1 = wsMessage;
          }
        }
      }else{

        if(!decodeSucceeded){
          if(wsMessage.contains('"type":"thread"')){

            print('wsmx ${wsMessage.split('{')[0]}');


            if(currentThread != '') {

              if( maxthread > 1) {
                final jsonMessage = jsonEncode({
                  "cmd": "thread",
                  "thread": "$currentThread",
                  "page": maxthread.toString()
                });
                socket.send(jsonMessage);
                print('send socket here $currentThread');

              }else{
                final jsonMessage = jsonEncode({
                  "cmd": "thread",
                  "thread": "$currentThread"
                });
                socket.send(jsonMessage);
                print('send socket here $currentThread');
              }


            }else{
              int indexChat = await _getIdxInfo();

              if(indexChat == 2){
                String thread = await _getThreadInfo();
                final jsonMessage = jsonEncode({
                  "cmd":"thread",
                  "thread":"$thread"
                });

                socket.send(jsonMessage);
                print('send socket here $thread');
              }
            }
            wsMessage = wsMessage.substring(idx) + '"}';




            switch (wsMessage.split('{')[0].length){
              case 1 :{
                wsMessage = wsMessage.substring(idx) + '}';
                print('wsmx1 $wsMessage');
              } break;
              case 2 :{
                wsMessage = wsMessage.substring(idx) + '"}';
                print('wsmx2 $wsMessage');
              } break;
              case 3 :{
                wsMessage = wsMessage.substring(idx) + '*"}';
                print('wsmx3 $wsMessage');
              } break;
              case 4 :{
                wsMessage = wsMessage.substring(idx) + '**"}';
              } break;
              case 5 :{
                wsMessage = wsMessage.substring(idx) + '***"}';
              } break;
              case 6 :{
                wsMessage = wsMessage.substring(idx) + '****"}';
              } break;
              default:{
                wsMessage = wsMessage.substring(idx) + '"}';
              }
            }



          }

          if(wsMessage.contains('"admins"')){
            getIndexSpecial(1);

            switch (wsMessage.split('{')[0].length){
              case 1 :{
                wsMessage = wsMessage.substring(idx) + '}';
              } break;
              case 2 :{
                wsMessage = wsMessage.substring(idx) + '"}';
              } break;
              case 3 :{
                wsMessage = wsMessage.substring(idx) + 'x"}';
              } break;
              case 4 :{
                wsMessage = wsMessage.substring(idx) + 'ex"}';
              } break;
              case 5 :{
                wsMessage = wsMessage.substring(idx) + 'dex"}';
              } break;
              case 6 :{
                wsMessage = wsMessage.substring(idx) + 'ndex"}';
              } break;
              case 7 :{
                wsMessage = wsMessage.substring(idx) + 'index"}';
              } break;
              case 8 :{
                wsMessage = wsMessage.substring(idx) + '"index"}';
              } break;
              default:{
                wsMessage = wsMessage.substring(idx) + '"}';
              }
            }



          }
        }


        if(oldMessage1 != wsMessage) {
          if (isJsonString(wsMessage)) {
            // if (idx == 0 || (idx > 0 && idx1 != -1 && idx2 != -1)) {
            // print('idx === ${idx.toString()}');

            if (['message'].contains(jsonDecode(wsMessage)['type'])) {
              lastMessage = DateTime.now();
              wsMessage = wsMessage.substring(idx);

              // if(!isBlacklisted(jsonDecode(wsMessage)['sender'])){
              if ((jsonDecode(wsMessage)['sender'] == id && !isHeader)) {

                if(messages.length > 0){
                //  messages.removeAt(0);

                }
                // print('halo bandung jaya');
                // readSignal(jsonDecode(wsMessage)['thread']);
                getFirstThread4(jsonDecode(wsMessage)['thread']);


                addMessage1(
                    {

                      "userid": "${jsonDecode(wsMessage)['sender']}",
                      "message": "${jsonDecode(wsMessage)['message']}",
                      "time": jsonDecode(wsMessage)['time'],
                      "msgtype": jsonDecode(wsMessage)['msgtype'],
                      "rcvstatus": jsonDecode(wsMessage)['rcvstatus'],
                    }
                );



                // _pusherMessageController.add(wsMessage);


                // getFirstThread4(jsonDecode(wsMessage)['thread']);
              } else {
                isHeader = false;
                if (jsonDecode(wsMessage)['thread'] == currentThread) {
                  if(outThread == true){
                    // getFirstIndex(1);
                    var tempid = '';
                    for (var obj in thread) {
                      print('objectds1 ${obj['sendername']}');
                      if (obj['userid'] != jsonDecode(wsMessage)['sender']) {
                        print('objectds2 ${obj['sendername']}');
                        tempid = obj['sendername']??'';
                      }
                    }
                    if (tempid == '') {
                      tempid = newThreadDisplay;
                    }
                    var wsMessage1 = jsonEncode({
                      "type": "${jsonDecode(wsMessage)['type']}",
                      "display": "$tempid",
                      "thread": "${jsonDecode(wsMessage)['thread']}",
                      "sender": "${jsonDecode(wsMessage)['sender']}",
                      "message": "${jsonDecode(wsMessage)['message']}",
                      "time": jsonDecode(wsMessage)['time']
                    });
                    _pusherMessageController.add(wsMessage);
                  }else{
                    addMessage1(
                        {

                          "userid": "${jsonDecode(wsMessage)['sender']}",
                          "message": "${jsonDecode(wsMessage)['message']}",
                          "time": jsonDecode(wsMessage)['time'],
                          "msgtype": jsonDecode(wsMessage)['msgtype'],
                          "rcvstatus": jsonDecode(wsMessage)['rcvstatus'],
                        }
                    );

                    readSignal(currentThread);
                    //print('read signal = $currentThread');
                    var tempid = '';
                    for (var obj in thread) {
                      //  print('objectds1 ${obj['sendername']}');
                      if (obj['userid'] != jsonDecode(wsMessage)['sender']) {
                        // print('objectds2 ${obj['sendername']}');
                        tempid = obj['sendername']??'';
                      }
                    }
                    if (tempid == '') {
                      tempid = newThreadDisplay;
                    }
                    var wsMessage1 = jsonEncode({
                      "type": "${jsonDecode(wsMessage)['type']}",
                      "display": "$tempid",
                      "thread": "${jsonDecode(wsMessage)['thread']}",
                      "sender": "${jsonDecode(wsMessage)['sender']}",
                      "message": "${jsonDecode(wsMessage)['message']}",
                      "time": jsonDecode(wsMessage)['time']
                    });
                    _pusherMessageController.add(wsMessage);
                  }


                } else {
                  var tempid = '';
                  for (var obj in thread) {
                    //   print('objectds3 ${obj['sendername']}');
                    if (obj['userid'] != jsonDecode(wsMessage)['sender']) {
                      //   tempid = obj['sendername']??'';
                      print('objectds4 ${obj['sendername']}');
                    }
                  }
                  if (tempid == '') {
                    tempid = newThreadDisplay;
                  }
                  var  wsMessage1 = jsonEncode({
                    "type": "message",
                    "display": "$tempid",
                    "thread": "${jsonDecode(wsMessage)['thread']}",
                    "sender": "${jsonDecode(wsMessage)['sender']}",
                    "message": "${jsonDecode(wsMessage)['message']}",
                    "time": jsonDecode(wsMessage)['time']
                  });
                  _pusherMessageController.add(wsMessage);
                  // getFirstIndex(1);
                }
              }
              /*
            if (jsonDecode(wsMessage)['thread'] != currentThread) {
              _pusherMessageController.add(wsMessage);
            }else{
              if(jsonDecode(wsMessage)['sender'] != id){
                _pusherMessageController.add(wsMessage);
              }
            }

             */

              // _pusherMessageController.add(wsMessage);

              //  }

              //////////////////////////////////////////////////////////
              ////                                                 ////
              //////////////////////////////////////////////////////////
              //getFirstThread1(jsonDecode(wsMessage)['thread']);

            } else
            {
              if ([
                'index',
                'thread',
                'typing',
                'newthread',
                'read',
                'login',
                'adm-list',
                'search-thd',
                'search-idx'
              ].contains(
                  jsonDecode(wsMessage)['type'])) {
                lastMessage = DateTime.now();
                //  print('merdeka');
                if (jsonDecode(wsMessage.toString())['type'] == 'read') {
                  if (jsonDecode(wsMessage)['thread'] == currentThread) {
                    // getFirstThread(currentThread);
                    refreshReadMsg(id);
                  }
                }

                if (jsonDecode(wsMessage.toString())['type'] == 'search-thd') {
                  addSearchMessage(jsonDecode(wsMessage));
                  _pusherMessageController.add(wsMessage);
                }
                if (jsonDecode(wsMessage.toString())['type'] == 'search-idx') {
                  addSearchThread(wsMessage.toString());

                  _pusherMessageController.add(wsMessage);
                }
                if (jsonDecode(wsMessage.toString())['type'] == 'adm-list') {
                  _adminsController.add(
                      jsonDecode(wsMessage.toString())['admins']);
                }
                if (jsonDecode(wsMessage.toString())['type'] == 'login') {
                  alreadyLogin = true;
                  getIndexSpecial(1);


                  int indexChat = await _getIdxInfo();
                  if(indexChat == 1){
                    getIndexSpecial(1);
                    // _setIdxInfo(0);
                  }
                  if(indexChat == 2){
                    String thread = await _getThreadInfo();
                    final jsonMessage = jsonEncode({
                      "cmd":"thread",
                      "thread":"$thread"
                    });

                    socket.send(jsonMessage);
                    print('send socket here $thread');
                  }





                  _pusherMessageController.add(wsMessage);
                }

                if (jsonDecode(wsMessage.toString())['type'] == 'index') {
                  alreadyLogin = true;
                  this.maxIndexCount =
                  jsonDecode(wsMessage.toString())['lastpage'];
                  addThread(wsMessage.toString());
                  _setIdxInfo(0);
                  // l.log('halooooo tetsttttttt' + wsMessage.toString());
                  // _pusherMessageController.add(wsMessage);
                  _pusherMessageController.add(wsMessage);
                }
                if (jsonDecode(wsMessage)['type'] == 'typing') {
                  // print('typinggggggggggggggggggg');
                  //if (jsonDecode(wsMessage)['thread'] == currentThread &&
                  //   jsonDecode(wsMessage)['sender'] != id) {
                  isTyping = true;
                  //addOldMessage(jsonDecode(wsMessage), id);
                  _pusherMessageController.add(wsMessage);
                  //refreshOldMessage(messages, id);
                  // }
                }
                if (jsonDecode(wsMessage)['type'] == 'newthread') {
                  currentNewThread = jsonDecode(wsMessage)['thread'];
                  newThreadDisplay = jsonDecode(wsMessage)['display'];
                  //thread.add(wsMessage);
                  if (jsonDecode(wsMessage)['blocked'] == 0) {
                    thread.insert(0, wsMessage);
                    _threadController.sink.add(thread);
                    _pusherMessageController.add(wsMessage);
                  }
                }

                if (jsonDecode(wsMessage)['type'] == 'thread') {
                  alreadyLogin = true;
                  _setIdxInfo(0);
                  this.maxChatList = jsonDecode(wsMessage.toString())['lastpage'];
                  nextThread = jsonDecode(wsMessage)['currpage'];
                  pagecount = jsonDecode(wsMessage)['lastpage'];
                  currentThread = jsonDecode(wsMessage)['thread'];
                  // print('halooo $currentThread');
                  addOldMessage(jsonDecode(wsMessage));
                  _messagesInfoController.add(wsMessage);
                  //  print('halo bandung jaya1');
                  _pusherMessageController.add(wsMessage);
                  log.fine('sending message:currentThread ini $currentThread');
                  readSignal(currentThread);
                  if (isGetFT4) {
                    isGetFT4 = false;
                    getIndexSpecial(1);
                  }
                }

                //////////////////////////////////////////////////////////
                ////                                                 ////
                //////////////////////////////////////////////////////////


              } else {
                if (['notify'].contains(
                    jsonDecode(wsMessage)['type'])) {

                  if (wsMessage != oldNotify1) {
                    oldNotify1 = wsMessage;
                    _pusherMessageControllerST.add(wsMessage);
                    _pusherMessageController.add(wsMessage);
                  }
                }else{
                  _pusherMessageController.add(wsMessage);
                }



              }
            }

            /*
        } else {
          // if(!sendType){
          //   sendType = true;
          if (['notify'].contains(
              jsonDecode(wsMessage)['type'])) {
            _pusherMessageControllerST.add(wsMessage);
          }

          _pusherMessageController.add(wsMessage);
          //  }

        }

          */

          }
        }
        if(jsonDecode(wsMessage)['type'] == 'message') {
          if (wsMessage != oldMessage1) {
            oldMessage1 = wsMessage;
          }
        }
      }

    } on FormatException catch (e) {
      print('The provided string is not valid JSON $e');
      if(!decodeSucceeded){
        if(wsMessage.indexOf('"type":"thread"') != -1){

          print('wsmx ${wsMessage.split('{')[0]}');


          if(currentThread != '') {

            if( maxthread > 1) {
              final jsonMessage = jsonEncode({
                "cmd": "thread",
                "thread": "$currentThread",
                "page": maxthread.toString()
              });
              socket.send(jsonMessage);
              print('send socket here $currentThread');

            }else{
              final jsonMessage = jsonEncode({
                "cmd": "thread",
                "thread": "$currentThread"
              });
              socket.send(jsonMessage);
              print('send socket here $currentThread');
            }


          }else{
            int indexChat = await _getIdxInfo();

            if(indexChat == 2){
              String thread = await _getThreadInfo();
              final jsonMessage = jsonEncode({
                "cmd":"thread",
                "thread":"$thread"
              });

              socket.send(jsonMessage);
              print('send socket here $thread');
            }
          }
          wsMessage = wsMessage.substring(idx) + '"}';




          switch (wsMessage.split('{')[0].length){
            case 1 :{
              wsMessage = wsMessage.substring(idx) + '}';
              print('wsmx1 $wsMessage');
            } break;
            case 2 :{
              wsMessage = wsMessage.substring(idx) + '"}';
              print('wsmx2 $wsMessage');
            } break;
            case 3 :{
              wsMessage = wsMessage.substring(idx) + '*"}';
              print('wsmx3 $wsMessage');
            } break;
            case 4 :{
              wsMessage = wsMessage.substring(idx) + '**"}';
            } break;
            case 5 :{
              wsMessage = wsMessage.substring(idx) + '***"}';
            } break;
            case 6 :{
              wsMessage = wsMessage.substring(idx) + '****"}';
            } break;
            default:{
              wsMessage = wsMessage.substring(idx) + '"}';
            }
          }



        }

        if(wsMessage.indexOf('"admins"') != -1){
          getIndexSpecial(1);

          switch (wsMessage.split('{')[0].length){
            case 1 :{
              wsMessage = wsMessage.substring(idx) + '}';
            } break;
            case 2 :{
              wsMessage = wsMessage.substring(idx) + '"}';
            } break;
            case 3 :{
              wsMessage = wsMessage.substring(idx) + 'x"}';
            } break;
            case 4 :{
              wsMessage = wsMessage.substring(idx) + 'ex"}';
            } break;
            case 5 :{
              wsMessage = wsMessage.substring(idx) + 'dex"}';
            } break;
            case 6 :{
              wsMessage = wsMessage.substring(idx) + 'ndex"}';
            } break;
            case 7 :{
              wsMessage = wsMessage.substring(idx) + 'index"}';
            } break;
            case 8 :{
              wsMessage = wsMessage.substring(idx) + '"index"}';
            } break;
            default:{
              wsMessage = wsMessage.substring(idx) + '"}';
            }
          }



        }
      }

      wsMessage = wsMessage.substring(idx);
      int idx1 = wsMessage.indexOf('"type":"login"');
      int idx2 = wsMessage.indexOf('"result":"success"');

      if(idx1 != -1 && idx2 != -1){
        wsMessage = jsonEncode({"result":"success","type":"login","userid":"$id"});
      }
      if(oldMessage1 != wsMessage) {
        if (isJsonString(wsMessage)) {
          // if (idx == 0 || (idx > 0 && idx1 != -1 && idx2 != -1)) {
          // print('idx === ${idx.toString()}');

          if (['message'].contains(jsonDecode(wsMessage)['type'])) {
            lastMessage = DateTime.now();
            wsMessage = wsMessage.substring(idx);

            // if(!isBlacklisted(jsonDecode(wsMessage)['sender'])){
            if ((jsonDecode(wsMessage)['sender'] == id && !isHeader)) {

              if(messages.isNotEmpty){
              //  messages.removeAt(0);

              }
              print('halo bandung jaya');
              // readSignal(jsonDecode(wsMessage)['thread']);
              getFirstThread4(jsonDecode(wsMessage)['thread']);


              addMessage1(
                  {

                    "userid": "${jsonDecode(wsMessage)['sender']}",
                    "message": "${jsonDecode(wsMessage)['message']}",
                    "time": jsonDecode(wsMessage)['time'],
                    "msgtype": jsonDecode(wsMessage)['msgtype'],
                    "rcvstatus": jsonDecode(wsMessage)['rcvstatus'],
                  }
              );



              // _pusherMessageController.add(wsMessage);


              // getFirstThread4(jsonDecode(wsMessage)['thread']);
            } else {
              isHeader = false;
              if (jsonDecode(wsMessage)['thread'] == currentThread) {
                if(outThread == true){
                  // getFirstIndex(1);
                  var tempid = '';
                  for (var obj in thread) {
                    print('objectds1 ${obj['sendername']}');
                    if (obj['userid'] != jsonDecode(wsMessage)['sender']) {
                      print('objectds2 ${obj['sendername']}');
                      tempid = obj['sendername']??'';
                    }
                  }
                  if (tempid == '') {
                    tempid = newThreadDisplay;
                  }
                  var wsMessage1 = jsonEncode({
                    "type": "${jsonDecode(wsMessage)['type']}",
                    "display": "$tempid",
                    "thread": "${jsonDecode(wsMessage)['thread']}",
                    "sender": "${jsonDecode(wsMessage)['sender']}",
                    "message": "${jsonDecode(wsMessage)['message']}",
                    "time": jsonDecode(wsMessage)['time']
                  });
                  _pusherMessageController.add(wsMessage);
                }else{
                  addMessage1(
                      {

                        "userid": "${jsonDecode(wsMessage)['sender']}",
                        "message": "${jsonDecode(wsMessage)['message']}",
                        "time": jsonDecode(wsMessage)['time'],
                        "msgtype": jsonDecode(wsMessage)['msgtype'],
                        "rcvstatus": jsonDecode(wsMessage)['rcvstatus'],
                      }
                  );

                  readSignal(currentThread);
                  //print('read signal = $currentThread');
                  var tempid = '';
                  for (var obj in thread) {
                    //  print('objectds1 ${obj['sendername']}');
                    if (obj['userid'] != jsonDecode(wsMessage)['sender']) {
                      // print('objectds2 ${obj['sendername']}');
                      tempid = obj['sendername']??'';
                    }
                  }
                  if (tempid == '') {
                    tempid = newThreadDisplay;
                  }
                  var wsMessage1 = jsonEncode({
                    "type": "${jsonDecode(wsMessage)['type']}",
                    "display": "$tempid",
                    "thread": "${jsonDecode(wsMessage)['thread']}",
                    "sender": "${jsonDecode(wsMessage)['sender']}",
                    "message": "${jsonDecode(wsMessage)['message']}",
                    "time": jsonDecode(wsMessage)['time']
                  });
                  _pusherMessageController.add(wsMessage);
                }


              } else {
                var tempid = '';
                for (var obj in thread) {
                  //   print('objectds3 ${obj['sendername']}');
                  if (obj['userid'] != jsonDecode(wsMessage)['sender']) {
                    //   tempid = obj['sendername']??'';
                    print('objectds4 ${obj['sendername']}');
                  }
                }
                if (tempid == '') {
                  tempid = newThreadDisplay;
                }
                var  wsMessage1 = jsonEncode({
                  "type": "message",
                  "display": "$tempid",
                  "thread": "${jsonDecode(wsMessage)['thread']}",
                  "sender": "${jsonDecode(wsMessage)['sender']}",
                  "message": "${jsonDecode(wsMessage)['message']}",
                  "time": jsonDecode(wsMessage)['time']
                });
                _pusherMessageController.add(wsMessage);
                // getFirstIndex(1);
              }
            }
            /*
            if (jsonDecode(wsMessage)['thread'] != currentThread) {
              _pusherMessageController.add(wsMessage);
            }else{
              if(jsonDecode(wsMessage)['sender'] != id){
                _pusherMessageController.add(wsMessage);
              }
            }

             */

            // _pusherMessageController.add(wsMessage);

            //  }

            //////////////////////////////////////////////////////////
            ////                                                 ////
            //////////////////////////////////////////////////////////
            //getFirstThread1(jsonDecode(wsMessage)['thread']);

          } else
          {
            if ([
              'index',
              'thread',
              'typing',
              'newthread',
              'read',
              'login',
              'adm-list',
              'search-thd',
              'search-idx'
            ].contains(
                jsonDecode(wsMessage)['type'])) {
              lastMessage = DateTime.now();
              //  print('merdeka');
              if (jsonDecode(wsMessage.toString())['type'] == 'read') {
                if (jsonDecode(wsMessage)['thread'] == currentThread) {
                  // getFirstThread(currentThread);
                  refreshReadMsg(id);
                }
              }

              if (jsonDecode(wsMessage.toString())['type'] == 'search-thd') {
                addSearchMessage(jsonDecode(wsMessage));
                _pusherMessageController.add(wsMessage);
              }
              if (jsonDecode(wsMessage.toString())['type'] == 'search-idx') {
                addSearchThread(wsMessage.toString());

                _pusherMessageController.add(wsMessage);
              }
              if (jsonDecode(wsMessage.toString())['type'] == 'adm-list') {
                _adminsController.add(
                    jsonDecode(wsMessage.toString())['admins']);
              }
              if (jsonDecode(wsMessage.toString())['type'] == 'login') {
                alreadyLogin = true;
                getIndexSpecial(1);


                int indexChat = await _getIdxInfo();
                if(indexChat == 1){
                  getIndexSpecial(1);
                  // _setIdxInfo(0);
                }
                if(indexChat == 2){
                  String thread = await _getThreadInfo();
                  final jsonMessage = jsonEncode({
                    "cmd":"thread",
                    "thread":"$thread"
                  });

                  socket.send(jsonMessage);
                  print('send socket here $thread');
                }





                _pusherMessageController.add(wsMessage);
              }

              if (jsonDecode(wsMessage.toString())['type'] == 'index') {
                alreadyLogin = true;
                this.maxIndexCount =
                jsonDecode(wsMessage.toString())['lastpage'];
                addThread(wsMessage.toString());
                _setIdxInfo(0);
                // l.log('halooooo tetsttttttt' + wsMessage.toString());
                // _pusherMessageController.add(wsMessage);
                _pusherMessageController.add(wsMessage);
              }
              if (jsonDecode(wsMessage)['type'] == 'typing') {
                // print('typinggggggggggggggggggg');
                //if (jsonDecode(wsMessage)['thread'] == currentThread &&
                //   jsonDecode(wsMessage)['sender'] != id) {
                isTyping = true;
                //addOldMessage(jsonDecode(wsMessage), id);
                _pusherMessageController.add(wsMessage);
                //refreshOldMessage(messages, id);
                // }
              }
              if (jsonDecode(wsMessage)['type'] == 'newthread') {
                currentNewThread = jsonDecode(wsMessage)['thread'];
                newThreadDisplay = jsonDecode(wsMessage)['display'];
                //thread.add(wsMessage);
                if (jsonDecode(wsMessage)['blocked'] == 0) {
                  thread.insert(0, wsMessage);
                  _threadController.sink.add(thread);
                  _pusherMessageController.add(wsMessage);
                }
              }

              if (jsonDecode(wsMessage)['type'] == 'thread') {
                alreadyLogin = true;
                _setIdxInfo(0);
                this.maxChatList = jsonDecode(wsMessage.toString())['lastpage'];
                nextThread = jsonDecode(wsMessage)['currpage'];
                pagecount = jsonDecode(wsMessage)['lastpage'];
                currentThread = jsonDecode(wsMessage)['thread'];
                // print('halooo $currentThread');
                addOldMessage(jsonDecode(wsMessage));
                _messagesInfoController.add(wsMessage);
                //  print('halo bandung jaya1');
                _pusherMessageController.add(wsMessage);
                log.fine('sending message:currentThread ini $currentThread');
                readSignal(currentThread);
                if (isGetFT4) {
                  isGetFT4 = false;
                  getIndexSpecial(1);
                }
              }

              //////////////////////////////////////////////////////////
              ////                                                 ////
              //////////////////////////////////////////////////////////


            } else {
              if (['notify'].contains(
                  jsonDecode(wsMessage)['type'])) {

                if (wsMessage != oldNotify1) {
                  oldNotify1 = wsMessage;
                  _pusherMessageControllerST.add(wsMessage);
                  _pusherMessageController.add(wsMessage);
                }
              }else{
                _pusherMessageController.add(wsMessage);
              }
            }
          }

          /*
        } else {
          // if(!sendType){
          //   sendType = true;
          if (['notify'].contains(
              jsonDecode(wsMessage)['type'])) {
            _pusherMessageControllerST.add(wsMessage);
          }

          _pusherMessageController.add(wsMessage);
          //  }

        }

          */

        }
      }
      if(jsonDecode(wsMessage)['type'] == 'message') {
        if (wsMessage != oldMessage1) {
          oldMessage1 = wsMessage;
        }
      }

    }
    //throw UnimplementedError();
  }

  @override
  yaWebsocketDelegateOnOpen(String httpStatus, String httpStatusMessage, String? tag) {
    // TODO: implement yaWebsocketDelegateOnOpen
    print('haloooo');
   // throw UnimplementedError();
  }
}

