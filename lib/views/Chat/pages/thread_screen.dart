import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/pages/chat_screen.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:logging/logging.dart';
import 'dart:async';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/views/Chat/widgets/chat/thread-item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/utility/tool/speed_dial_varian.dart';
import 'package:projectscoid/core/components/utility/tool/speed_dial_child.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/app/theme_manager.dart';

class ThreadScreen extends StatefulWidget {

  final String? user;
  ChatBloc? chatBloc;
  BuildContext? ctx;
  ThreadScreen({Key? key, @required this.user, @required this.chatBloc, this.ctx})
      : super(key: key);

  @override
  _ThreadScreenState createState() => _ThreadScreenState();
}

class _ThreadScreenState extends State<ThreadScreen>   with RestorationMixin{
  final scrollThreshold = 200.0;
  final Logger log = new Logger('ChatBloc');
  int _currentIndex = 0;
  ScrollController? _scrollController;
  double initscroll = 0.0;
  List<dynamic>? message;
  List<dynamic> listThread = [];
  bool isLoading = true;


  final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'ThreadScreen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'ThreadScreen');
  }



  @override
  void initState() {

    super.initState();
   // widget.chatBloc.closeConnection();
  //  widget.chatBloc = new ChatBloc();
 //   widget.chatBloc.lg(widget.user);

    _currentIndex = 1;
    _scrollController = ScrollController();
    //print('death chat');
    //widget.chatBloc.thread.clear();
  //  print('id ${widget.chatBloc.id}');
   // message = widget.chatBloc.thread;
   // widget.chatBloc.wsSetHandlers();
    widget.chatBloc!.getIndexSpecial(1);

    fetchData();
   // setPref();
   // widget.chatBloc.getx();

   // widget.chatBloc.getIndex(1);


  }


  Future<void> fetchData()async {
    final ftr = _getChatSharedPrefs();
    ftr.then((value) async {
      //print('ini dari chat deep link 124567 ====  $value   ');
      if(value!.contains('chat')){


        int idx = value.indexOf('chat');
        String temp = value.substring(idx);
        String id = temp.split('/')[1];
       // String username = temp.split('/')[2];
       // String avatar = temp.split('/')[3];
        String thread = '';
        if(decode(widget.user!)> decode(id) ){
          thread = '$id/${widget.user}';
        }else{
          thread = '${widget.user}/$id';
        }
         print('ini dari chat deep link ====  $value   ');
        bool result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(
                user: {

                  "thread":"$thread",
                  "username":"$id",
                  "userid":"$id",
                  "display":"test saja",
                  "avatar":"",
                  "lastmessage":"<b>Konteks Percakapan: Link Dari Web App, Username dan Avatar akan muncul setelah anda kirim pesan pertama kali </b>",
                  "lastseen":1606880840,
                  "lasttime":1234567890

                },
                userID : widget.user,
                chatBloc : widget.chatBloc,
                trans : true,
                ctx: widget.ctx,
              ),
            )
        );
        if(!result) {
          widget.chatBloc!.getx();
          setState(() {
          //  widget.chatBloc!.getx();
          });
        }




       // print('ini dari chat deep link ====  $value   ');
       setPref();


      }
      setState(() {
        isLoading = false;
      });
    });
  }



  Future<String?> _getChatSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('chat_link')){
      return prefs.getString('chat_link');
    }else{return '';}



  }

  Future<void> setPref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('chat_link', '');
  }
  // ignore: unused_element
  void _scrollDown() {
    Timer(const Duration(microseconds: 100), () {
      if (_scrollController!.hasClients &&
          _scrollController!.position.viewportDimension <
              _scrollController!.position.maxScrollExtent) {
        _scrollController!.animateTo(_scrollController!.position.maxScrollExtent,
            curve: Curves.linear, duration: const Duration(milliseconds: 500));
      }
    });
  }

  void _onScroll()async {
    final maxScroll = _scrollController!.position.maxScrollExtent;
    final currentScroll = _scrollController!.position.pixels;
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("position", _scrollController!.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
      //past_projects.listing.add(PastProjectsList());
      widget.chatBloc!.getIndex(_currentIndex ++);
    }

  }


  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }


  SpeedDialVarianChild ButtonWidget(dynamic button, BuildContext context){
    final themeManager =  Provider.of<ThemeManager>(context);
    var darkMode;
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    return(
        SpeedDialVarianChild(
        child: const Icon(Icons.support_agent),
        label: button['online']!='0'? button['username'] : '${button['username']} offline'  ,
            backgroundColor: darkMode? Colors.white : button['online']!='0'? CurrentTheme.SecondaryColor :Colors.white ,
            foregroundColor: darkMode? Colors.black : button['online']!='0'? Colors.white : Colors.black ,
            labelBackgroundColor: darkMode? Colors.black :button['online']!='0'? CurrentTheme.SecondaryColor :Colors.white  ,
            labelStyle: TextStyle(fontSize: 14.0, color : darkMode? Colors.white : button['online']!='0'? Colors.white :Colors.black),

            onTap: ()async
        {
          String thread = '';
          if(decode(widget.user!)> decode(button['userid']) ){
            thread = '${button['userid']}/${widget.user}';
          }else{
            thread = '${widget.user}/${button['userid']}';
          }
          button.addAll({"thread":thread});
          print('ini dari chat deep link ====  ghghghg   ');
          bool result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(
                  user: button,
                  userID : widget.user,
                  chatBloc : widget.chatBloc
              ),
            ),
          );
          if(!result){
            widget.chatBloc!.getx();
            setState(() {
             // widget.chatBloc!.getx();
            });
          }
        }
    ));

  }


  List<SpeedDialVarianChild>	 listButton(BuildContext context, List<dynamic> data){
    final themeManager =  Provider.of<ThemeManager>(context);
    var darkMode;
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    final List<SpeedDialVarianChild> buttonChildren = <SpeedDialVarianChild>[
    ];

    for(var i = 0; i < data.length; i++)
    {
      // if(tools.buttons[i].text != "Table View"){

        buttonChildren.add(ButtonWidget(data[i],context));




      // }
    }
    if(data.isEmpty){
      buttonChildren.add(SpeedDialVarianChild(
          child: const Icon(Icons.support_agent),
          backgroundColor: darkMode? Colors.white : CurrentTheme.SecondaryColor,
          foregroundColor: darkMode? Colors.black : Colors.white,
          labelBackgroundColor: darkMode? Colors.black :Colors.white,
          labelStyle: TextStyle(fontSize: 14.0, color : darkMode? Colors.white : Colors.black),

          label: 'Maaf, admin off',

          onTap: ()async
          {


          }

      ));
    }





    buttonChildren.add(SpeedDialVarianChild(
        child: const Icon(Icons.search),
        label: 'Search',
        backgroundColor: darkMode? Colors.white : CurrentTheme.SecondaryColor,
        foregroundColor: darkMode? Colors.black : Colors.white,
        labelBackgroundColor: darkMode? Colors.black :Colors.white,
        labelStyle: TextStyle(fontSize: 14.0, color : darkMode? Colors.white : Colors.black),

        onTap: ()async
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ThreadSearchScreen(
                user: widget.user,
                chatBloc : widget.chatBloc,
                listThread: listThread,
              ),
            ),
          );

        }

    ));
    /*
    buttonChildren.add(SpeedDialVarianChild(
        child: Icon(Icons.search),
        backgroundColor: Colors.green,
        label: 'Unblock user',
        labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
        onTap: ()async
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => UnblockScreen(
                user: widget.user,
                chatBloc : widget.chatBloc,
                listThread: listThread,
              ),
            ),
          );

        }

    ));

     */

    return(
        buttonChildren
    );

  }

  Widget	 Buttons(BuildContext context, List<dynamic> data){
    final themeManager =  Provider.of<ThemeManager>(context);
    var darkMode;
    themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    return(
        SpeedDialVarian(
            marginRight: 35,
            marginBottom: 70,
           // animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: const IconThemeData(size: 22.0),
            // this is ignored if animatedIcon is non null
            child: const Icon(Icons.support_agent),
            visible: true,
            // If true user is forced to close dial manually
            // by tapping main button and overlay is not rendered.
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: CurrentTheme.MainAccentColor,
            overlayOpacity: 0.5,
            onOpen: (){
              //  setState((){
              //(true);
              // });
            },
            onClose: () {
             // activefab(false);
            },
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: darkMode? Colors.white : CurrentTheme.SecondaryColor,
            foregroundColor: darkMode? Colors.black : Colors.white,
            elevation: 8.0,
            shape: const CircleBorder(),

            children:listButton(context, data)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    //widget.chatBloc!.getBlacklist(widget.user, context);

    final prefs = SharedPreferences.getInstance();
    prefs.then((val){
      initscroll = val.getDouble("position")!;
      if(initscroll != 0.0 || initscroll != null ){
        _scrollController = ScrollController(initialScrollOffset: initscroll, keepScrollOffset: false );
        _scrollController?.addListener(_onScroll);
      } else {
        _scrollController = ScrollController(initialScrollOffset: initscroll , keepScrollOffset: false );
        _scrollController?.addListener(_onScroll);
      }
    });
   // print('helooooo');
    return

      Scaffold(
          body:
          isLoading? Container() : StreamBuilder<dynamic>(
            stream: widget.chatBloc?.threadStream,
           // stream: widget.chatBloc.getThreads(Duration(seconds:1)),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            //  print('horeeee');
              if (snapshot.hasError) {

                _onWidgetDidBuild(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                });


                return Text(snapshot.error.toString());
              }
              if (snapshot.data == null) {
               // print('reporttt1');
                //_recoveryHistoryMessages();
                log.severe('getHistory Fail!');
                return const Text('No chat list.');
              }
              //if (snapshot.hasData) {
               // _scrollDown();
             // }
              if (snapshot.data is List && snapshot.data.length == 0) {
  /*

   */


              /*
                StreamBuilder<dynamic>(
                    stream: widget.chatBloc.adminsStream,
                    // stream: widget.chatBloc.getThreads(Duration(seconds:1)),
                    initialData: [],
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      //  print('horeeee');
                      if (snapshot.hasError) {
                        return Container();
                      }
                      if (snapshot.data == null) {
                        return Container();
                      }

                      if (snapshot.data is List && snapshot.data.length == 0) {
                        return Container();
                      }
                      return Container();
                     // return(Buttons(context, snapshot.data));

                    }
                );

               */

                // print('reporttt');
                /*
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

                 */
                return Container();

              }

               if (snapshot.data is List && snapshot.data.length == 1) {

                 if(snapshot.data[0]['thread'] == 'wssclose'){
                   widget.chatBloc?.getIndexSpecial(1);
                   widget.chatBloc?.getFirstIndex(1);
                   return(
                       Container(
                         color: Colors.white,
                         child: const Align(
                           alignment: Alignment.bottomCenter,
                           child: Text("Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!"),
                         ),
                       )
                   );
                 }


               }


             // return Container(width: 0.0, height: 0.0);
  /*
              snapshot.data.insert(0,{
                "thread":"search",
              });

   */
             // listThread.clear();
             // listThread.addAll(snapshot.data);
             // print('list count ==== ${snapshot.data.length.toString()}');
              return ListView.builder(
                controller: _scrollController,
                itemCount: snapshot.data != null ? snapshot.data.length : 0,
                shrinkWrap: true,
                itemBuilder: (context, index) => ThreadItem(
                  chatBloc: widget.chatBloc,
                  index: index,
                  userID:  widget.user,
                  message: snapshot.data[index],
                  allData: snapshot.data,


                ),
              );

            },


          ),
          floatingActionButton:
          StreamBuilder<dynamic>(
              stream: widget.chatBloc?.adminsStream,
              // stream: widget.chatBloc.getThreads(Duration(seconds:1)),
              initialData: [],
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                //  print('horeeee');
                if (snapshot.hasError) {
                  return Container();
                }
                if (snapshot.data == null) {
                  return Container();
                }

                if (snapshot.data is List && snapshot.data.length == 0) {
                 // return Container();
                  return(Buttons(context, snapshot.data));

                }
                return(Buttons(context, snapshot.data));

              }
          ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      );


  }






}
