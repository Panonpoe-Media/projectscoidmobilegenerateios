import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projectscoid/views/Chat/models/models.dart';
import 'package:intl/intl.dart';
import 'package:projectscoid/views/Chat/widgets/widgets.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:projectscoid/views/components/index.dart';
import 'package:flutter_html/style.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/services.dart';
//import 'package:image_downloader/image_downloader.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/app/signin.dart';
import 'package:html/parser.dart' show parse;
import 'package:filesize/filesize.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
//import 'package:audioplayer/audioplayer.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:projectscoid/views/Chat/widgets/chat/messages_types/common.dart';
import 'package:rxdart/rxdart.dart';
import 'package:projectscoid/core/components/utility/tool/blockquote.dart';
//import 'package:blockquote/blockquote.dart';

class TextMessageWidget extends StatefulWidget {
  final dynamic message;
  final bool? darkmode;
  final String? search;
  Duration?duration;
  Duration? position;
  AudioPlayer? audioPlayer;
 // PlayerState playerState;
  List<int?>? play;
  List<int?>? pause;
  int? idx;
  String? avatar;
  bool? equal;
  TextMessageWidget({Key? key, this.message, this.darkmode, this.search = '',  this.duration, this.position, this.audioPlayer, // this.playerState,
    this.play, this.pause,this.idx, this.avatar,this.equal}) : super(key: key);

  @override
  _TextMessageWidgetState createState() => _TextMessageWidgetState();
}




class _TextMessageWidgetState extends State<TextMessageWidget> {

//class TextMessageWidget extends StatelessWidget {
  var parser = EmojiParser();
  bool? isPlay = false;
  bool? isPause = false;

  int? speed = 0;

  String? localFilePath;
  //StreamSubscription _positionSubscription;
  //StreamSubscription _audioPlayerState1Subscription;
  Duration? duration;
  Duration? position;
  //PlayerState playerState = PlayerState.stopped;

  //get isPlaying => playerState == PlayerState.playing;
  //get isPaused => playerState == PlayerState.paused;
  //get isStop => playerState == PlayerState.stopped;

  get durationText =>
      widget.duration != null ? widget.duration.toString().split('.').first : '';

  get positionText =>
      widget.position != null ? widget.position.toString().split('.').first : '';

  bool isMuted = false;



  @override
  void initState() {
    super.initState();
    if(widget.play!.isNotEmpty){
      if(widget.play![0] == widget.idx) {
        isPlay = true;
      }

    }
    if(widget.pause!.isNotEmpty){
      if(widget.pause![0] == widget.idx) {
        isPause = true;
      }
    }

    _init();
/*
    _positionSubscription = widget.audioPlayer!.onAudioPositionChanged
        .listen((p){
          //if(isPlay){
               setState(() => position = p);
           // }

         // print('halooooo aku');
               });
    _audioPlayerState1Subscription =
        widget.audioPlayer!.onPlayerStateChanged.listen((s) {
          if (s == AudioPlayerState.PLAYING) {
            setState(() => duration = widget.audioPlayer!.duration);
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

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    widget.audioPlayer!.playbackEventStream.listen((event) {
      if(event.duration != null){
        if(transformMilliSeconds(event.updatePosition.inMilliseconds)== transformMilliSeconds(event.duration!.inMilliseconds)){
          // print('oke' + transformMilliSeconds(event.updatePosition.inMilliseconds));
          // print('oke1' + transformMilliSeconds(event.duration.inMilliseconds));
          widget.play!.clear();
          widget.pause!.clear();
          widget.audioPlayer!.stop();
          speed = 0;
         //  widget.audioPlayer!.setSpeed(1.0);
          if(! mounted) return;
          setState(() {
            isPlay = false;
          });


          // print('complete');
        }
      }
    },
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    // Try to load audio from a source and catch any errors.
    /*
    try {
      await  widget.audioPlayer!.setAudioSource(AudioSource.uri(Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));
    } catch (e) {
      print("Error loading audio source: $e");
    }

     */
  }


  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          widget.audioPlayer!.positionStream,
          widget.audioPlayer!.bufferedPositionStream,
          widget.audioPlayer!.durationStream,
              (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  void onComplete() {
    widget.play!.clear();
    widget.pause!.clear();
    position = const Duration(seconds: 0);
    setState(() {
      isPlay = false;
    //  playerState = PlayerState.stopped;
      duration = const Duration(seconds: 0);
      position = const Duration(seconds: 0);
    });
  }
  Future play(String kUrl,  String basename, bool sts) async {

    isPlay = true;
    isPause = false;
    widget.play?.add(widget.idx!);
    widget.pause?.clear();
    final dir = await getExternalStorageDirectory();
    final file = File('${dir?.path}/Record/received/$basename');

    if (await file.exists()){
      localFilePath = file.path;
      _playLocal(sts);
    //  print('halooooo aku');
      if(sts){
      // await widget.audioPlayer!.setSpeed(1.0);
      }
      setState(() {
        localFilePath = file.path;

      });

    }else{
      _loadFile(Uri.parse(kUrl), basename);
      final dr  = await widget.audioPlayer?.durationFuture;
      if(widget.audioPlayer?.position != Duration.zero && (transformMilliSeconds(widget.audioPlayer!.position!.inMilliseconds!) != transformMilliSeconds(dr!.inMilliseconds)) ){
        print(transformMilliSeconds(widget.audioPlayer!.position!.inMilliseconds));
        print('ini' + transformMilliSeconds(dr.inMilliseconds));
        print('ada1');
        /*
      _positionDataStream.first.then((value)async{
        try {
          await widget.audioPlayer!.setAudioSource(
              AudioSource.uri(Uri.file(localFilePath)),  initialPosition: value.position,
              preload: false);
          widget.audioPlayer!.play();
        } catch (e) {
          print("Error loading audio source: $e");
        }
      });

       */
      await  widget.audioPlayer?.play();
        if(sts){
           widget.audioPlayer?.setSpeed(1.0);
        }
      }else {
        print('tidak ada');
        try {
          await widget.audioPlayer?.setAudioSource(
              AudioSource.uri(Uri.parse(kUrl)), initialPosition: Duration.zero,
              preload: true);
        } catch (e) {
          print("Error loading audio source: $e");
        }
        await  widget.audioPlayer?.play();
        if(sts){
          widget.audioPlayer?.setSpeed(1.0);
        }
      }
      // widget.audioPlayer!.play(kUrl);


      if(sts){
       // await   widget.audioPlayer!.setSpeed(1.0);
      }
      setState(() {
        //  playerState =   PlayerState.playing;

      });
    }

  }
  Future _playLocal(bool sts) async {
    // widget.audioPlayer!.play(localFilePath, isLocal: true);
    final dr  = await widget.audioPlayer!.durationFuture;
    if(widget.audioPlayer!.position != Duration.zero && (transformMilliSeconds(widget.audioPlayer!.position.inMilliseconds) != transformMilliSeconds(dr!.inMilliseconds)) ){
      print(transformMilliSeconds(widget.audioPlayer!.position!.inMilliseconds));
      print('ini' + transformMilliSeconds(dr.inMilliseconds));
      print('ada1');
      /*
      _positionDataStream.first.then((value)async{
        try {
          await widget.audioPlayer!.setAudioSource(
              AudioSource.uri(Uri.file(localFilePath)),  initialPosition: value.position,
              preload: false);
          widget.audioPlayer!.play();
        } catch (e) {
          print("Error loading audio source: $e");
        }
      });

       */
      await  widget.audioPlayer!.play();
      if(sts){
        widget.audioPlayer!.setSpeed(1.0);
      }

    }else {
      print('tidak ada1');
      try {
        await widget.audioPlayer!.setAudioSource(
            AudioSource.uri(Uri.file(localFilePath!)), initialPosition: Duration.zero,
            preload: true);
      } catch (e) {
        print("Error loading audio source: $e");
      }
      await  widget.audioPlayer!.play();
      if(sts){
        widget.audioPlayer!.setSpeed(1.0);
      }
    }



    // playerState =   PlayerState.playing;
    // setState(() => playerState =   PlayerState.playing);
  }

  Future pause()async {
    if(!mounted) return;
    setState(() {
      isPause = true;
      //playerState =   PlayerState.paused;

    });
    await widget.audioPlayer?.pause();
    // isPause = true;
    widget.pause?.add(widget.idx!);
    // print('hancurrrr');



    //  setState(() => playerState =   PlayerState.paused);
  }

  Future stop() async {
    widget.pause!.clear();

    await widget.audioPlayer!.stop();
    setState(() {
     // playerState =   PlayerState.stopped;
      widget.position = const Duration();
    });
  }

  Future mute(bool muted) async {
   // await widget.audioPlayer!.mute(muted);
    setState(() {
      isMuted = muted;
    });
  }



  Future<Uint8List>? _loadFileBytes(Uri? url, {required OnError onError}) async {
    Uint8List? bytes;
    try {
      bytes = await readBytes(url!);
    } on ClientException {
      rethrow;
    }
    return bytes;
  }

  Future _loadFile(Uri kUrl, String basename) async {
    final bytes = await _loadFileBytes(kUrl,
        onError: (Exception exception) =>
            print('_loadFile => exception $exception'));

    final dir = await getExternalStorageDirectory();

    final String dirPath = '${dir?.path}/Record/received';
    var d = Directory(dirPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    final file = File('${dir?.path}/Record/received/$basename');
    await file.create();
    if(!mounted) return;

    // print('ok');
    if (await file.exists()){
      await file.writeAsBytes(bytes!);
      //print('tidak ok');
      // localFilePath = file.path;

      // setState(() {
      localFilePath = file.path;
      //  });
    }else{
      // print('tidak ok1');
    }
    //setState(() {
    // localFilePath = file.path;
    // });
  }

  transformMilliSeconds(int milliseconds) {
   // print('milliseconds == $milliseconds');
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();
    String hoursStr = '';
    if((hours % 60) > 0){
      hoursStr = '${(hours % 60).toString()}:';
    }



    String minutesStr = (minutes % 60).toString();
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr$minutesStr:$secondsStr";
  }
  Widget _buildPlayer(String url, String basename, Duration dr) => Container(
    padding: const EdgeInsets.only(left: 2),
    child:
    // ListTile(
    /*
        leading:Container(
          width: 72,
          height: 72,
          /* decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        offset: Offset(0, 5),
                        blurRadius: 10)
                  ],
                ), */
          child: Stack(
            children: <Widget>[

              Container(
                width: 60,
                height: 55,
                decoration: ShapeDecoration(
                  shadows:[
                    BoxShadow(color: Colors.grey, offset: Offset(0.4, 0.4)),
                  ],

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                    side: BorderSide(
                        width: 2,
                        color: Colors.white
                    ),
                  ),


                  image: DecorationImage(
                    image: NetworkImage(widget.avatar),
                    fit: BoxFit.fill,

                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 18,
                  width: 18,
                  child: Icon(Icons.mic),
                ),
              ),




            ],
          ),
        ),

         */
    //  subtitle:
    Row(
      mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          width: 36,
          child: isPlay!? isPause! ?
          IconButton(
            padding: const EdgeInsets.only(top: 1),
            onPressed:  () => play(url, basename, false),
            iconSize: 45.0,
            icon: const Icon(Icons.play_arrow),
            color: Colors.black54,
          )
              :
          IconButton(
            onPressed:  ()=>pause() ,
            padding: const EdgeInsets.only(top: 1),
            iconSize: 38.0,
            icon: const Icon(Icons.pause),
            color:Colors.black54,
          )

              :IconButton(
            padding: const EdgeInsets.only(top: 1),
            onPressed:  () => play(url, basename, true),
            iconSize: 45.0,
            icon: const Icon(Icons.play_arrow),
            color: Colors.black54,
          ),
        ),


        Column(
          mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;

                if(isPlay!){
                  //positionData?.position;
                  return SeekBar(
                    duration: positionData?.duration ?? Duration.zero,
                    position: positionData?.position ?? Duration.zero,
                    bufferedPosition:
                    positionData?.bufferedPosition ?? Duration.zero,
                    onChangeEnd: widget.audioPlayer!.seek,
                  );
                }

                else{
                  return SeekBar(
                    duration:  Duration.zero,
                    position: Duration.zero,
                    bufferedPosition: Duration.zero,
                    // onChangeEnd: (){},
                  );
                }



              },
            ),


/*

              if (dr != null && isPlay )
                Container(

                    width: 162,
                    child:
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor:  Colors.black12,
                        inactiveTrackColor:  Colors.black12,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
                        thumbColor: Colors.green,
                      ),
                      child:

                      Slider(

                          value: position?.inMilliseconds?.toDouble() ?? 0.0,
                          onChanged: (double value) {
                            return widget.audioPlayer!.seek((value / 1000).roundToDouble());
                          },
                          min: 0.0,
                          max:dr.inMilliseconds.toDouble()),
                    )
                ),
              if (dr != null && !isPlay )
                Container(

                    width: 162,
                    child:
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor:  Colors.black12,
                        inactiveTrackColor:  Colors.black12,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
                        thumbColor: Colors.green,
                      ),
                      child:
                      Slider(
                          value:  0.0,
                          onChanged: (double value) {

                          },
                          min: 0.0,
                          max: dr.inMilliseconds.toDouble()),
                    )
                ),

 */


            if (!isPlay! )
              Padding(
                padding: const EdgeInsets.only(left:20),
                child:Text(transformMilliSeconds(dr.inMilliseconds).replaceAll(':','.'),style:  const TextStyle(fontSize: 12, color:Colors.black54)),
              ),

            StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;

                if(positionData?.position != Duration.zero && isPlay!) {
                  return Row(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Text(
                            positionData?.position!= null
                                ? "${transformMilliSeconds(positionData!.position!.inMilliseconds).replaceAll(':','.') ?? ''}"
                                : positionData?.duration  != null ? transformMilliSeconds(positionData!.duration! .inMilliseconds!).replaceAll(':','.') : '',
                            style: const TextStyle(fontSize: 12, color:Colors.black54)

                        )
                    ),

                  ]);
                }else{
                  return Container();
                }
              },
            ),
          //  if (position != null && isPlay ) _buildProgressView()
          ],
        ),


        isPlay!? speed == 0?
        SizedBox(
            width: 63,
            height: 58,
            child: Center(
                child:
                TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.grey) ,
                      overlayColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blue.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blue.withOpacity(0.12);
                          }
                          return Colors.blue.withOpacity(0.12); // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: (){
                      widget.audioPlayer!.setSpeed(1.5);
                      setState(() {
                        speed = 1;
                      });
                    },
                    child: Text('1 X')
                )
            )
        )
            :
        Container(
            width: 63,
            height: 58,
            child: Center(
                child:
                speed == 1?
                TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.grey) ,
                      overlayColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blue.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blue.withOpacity(0.12);
                          }
                          return Colors.blue.withOpacity(0.12); // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      widget.audioPlayer!.setSpeed(2.0);
                      setState(() {
                        speed = 2;
                      });
                    },
                    child: const Text('1.5 X')
                ):
                TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.grey) ,
                      overlayColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blue.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blue.withOpacity(0.12);
                          }
                          return Colors.blue.withOpacity(0.12); // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: (){
                      widget.audioPlayer!.setSpeed(1.0);
                      setState(() {
                        speed = 0;
                      });
                    },
                    child: const Text('2 X')
                )
            )
        )
            :
        SizedBox(
          width: 63,
          height: 58,
          /* decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        offset: Offset(0, 5),
                        blurRadius: 10)
                  ],
                ), */
          child: Stack(
            children: <Widget>[


              Padding(padding: const EdgeInsets.only(left: 15),
                       child:  Container(
                         width: 56,
                         height: 58,
                         decoration: ShapeDecoration(
                           shadows:const [
                             BoxShadow(color: Colors.grey, offset: Offset(0.4, 0.4)),
                           ],

                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(80.0),
                             side: const BorderSide(
                                 width: 2,
                                 color: Colors.white
                             ),
                           ),


                           image: DecorationImage(
                             image: NetworkImage(widget.avatar!),
                             fit: BoxFit.fill,

                           ),
                         ),
                       ),
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    height: 30,
                    width: 45,
                    child:
                    const Padding(
                      padding: EdgeInsets.only(right: 45),
                      child:Icon(Icons.mic, color: Colors.green, size: 25,),
                    )

                ),
              ),




            ],
          ),
        ),
      ],
    ),


    //  )



  );


  Row _buildProgressView() => Row(mainAxisSize: MainAxisSize.min, children: [
    Padding(
        padding: const EdgeInsets.only(left:20),
        child: Text(
            position != null
                ? "${transformMilliSeconds(position!.inMilliseconds).replaceAll(':','.') ?? ''}"
                : duration != null ? transformMilliSeconds(duration!.inMilliseconds).replaceAll(':','.') : '',
            style: const TextStyle(fontSize: 12, color:Colors.black54)

        )
    ),

  ]);


  @override
  void dispose() {
   // _positionSubscription.cancel();
    //_audioPlayerState1Subscription.cancel();
    super.dispose();
  }
  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';
      time = format.format(date.toUtc());
    return time;
  }
  bool isImage(String ext ){
    bool isImage = false;
    if(['.tif','.tiff','.bmp','.jpg', '.jpeg', '.gif', '.png', '.eps'].contains(p.extension(ext)) && ext.contains('https://upload.projects.co.id/upload/')) {
      if (ext.contains('[')) {
        isImage = false;
      } else {
        isImage = true;
      }
  }else {
      if (ext.contains('<img') && ext.contains('thumbnail')) {
        isImage = true;
      }
    }


    return isImage;
  }


  String getAsset(String basename){
    String fileType = '';
    /*
     - assets/fileext/avi.png
    - assets/fileext/css.png
    - assets/fileext/csv.png
    - assets/fileext/doc.png
    - assets/fileext/exe.png
    - assets/fileext/file.png
    - assets/fileext/html.png
    - assets/fileext/javascript.png
    - assets/fileext/json-file.png
    - assets/fileext/jpg.png
    - assets/fileext/mp3.png
    - assets/fileext/mp4.png
    - assets/fileext/pdf.png
    - assets/fileext/png.png
    - assets/fileext/ppt.png
    - assets/fileext/psd.png
    - assets/fileext/svg.png
    - assets/fileext/xls.png
    - assets/fileext/xml.png
    - assets/fileext/zip.png

      */
    switch(p.extension(basename)){
      case ".pdf":{
        fileType = 'assets/fileext/pdf.png';
      }
      break;
      case ".avi":{
        fileType = 'assets/fileext/avi.png';
      }
      break;
      case ".css":{
        fileType = 'assets/fileext/css.png';
      }
      break;
      case ".csv":{
        fileType = 'assets/fileext/csv.png';
      }
      break;
      case ".doc":{
        fileType = 'assets/fileext/doc.png';
      }
      break;
      case ".docx":{
        fileType = 'assets/fileext/doc.png';
      }
      break;
      case ".exe":{
        fileType = 'assets/fileext/exe.png';
      }
      break;
      case ".html":{
        fileType = 'assets/fileext/html.png';
      }
      break;
      case ".htm":{
        fileType = 'assets/fileext/html.png';
      }
      break;
      case ".javascript":{
        fileType = 'assets/fileext/javascript.png';
      }
      break;
      case ".json":{
        fileType = 'assets/fileext/json-file.png';
      }
      break;
      case ".jpg":{
        fileType = 'assets/fileext/jpg.png';
      }
      break;
      case ".jpeg":{
        fileType = 'assets/fileext/jpg.png';
      }
      break;
      case ".mp4":{
        fileType = 'assets/fileext/mp4.png';
      }
      break;
      case ".mp3":{
        fileType = 'assets/fileext/mp3.png';
      }
      break;
      case ".png":{
        fileType = 'assets/fileext/png.png';
      }
      break;
      case ".ppt":{
        fileType = 'assets/fileext/ppt.png';
      }
      break;
      case ".psd":{
        fileType = 'assets/fileext/psd.png';
      }
      break;
      case ".svg":{
        fileType = 'assets/fileext/svg.png';
      }
      break;
      case ".xls":{
        fileType = 'assets/fileext/xls.png';
      }
      break;
      case ".xlsx":{
        fileType = 'assets/fileext/xls.png';
      }
      break;
      case ".xml":{
        fileType = 'assets/fileext/xml.png';
      }
      break;
      case ".zip":{
        fileType = 'assets/fileext/zip.png';
      }
      break;

      default :{
        fileType = 'assets/fileext/file.png';

      }
      break;


    }


    return fileType;

  }

  bool isFile(String ext ){
    bool isFile = false;
    if( ext.contains('https://upload.projects.co.id/upload/')|| ext.contains('https://cdn.projects.co.id/upload/')||ext.contains('https://upload.projects.co.id/files/download.php')){
      if(ext.contains('[')){
        isFile = false;
      }else{
        var document = parse(ext);
        var dat = document.getElementsByClassName('chat-file-link');
        if((dat != null) && (dat.isNotEmpty)){
          isFile = true;
        }else {
          var data = document.getElementsByClassName('download');
          if ((data != null) && (data.isNotEmpty)) {
            isFile = true;
          } else {
            var data = document.getElementsByClassName('chat-download');
            if ((data != null) && (data.isNotEmpty)) {
              isFile = true;
            }
          }
        }


      }
    }
    return isFile;
  }

  String addTag(String keyword, String str){
    int length = keyword.length;
    if(keyword == ''){
      return str;
    }else{
      int idx = str.toLowerCase().indexOf(keyword.toLowerCase());
      if(idx > -1){
        str = str.substring(0, idx + length) + '</a>' +str.substring(idx + length);
        str = str.substring(0, idx ) + '<a style="background-color:red">' +str.substring(idx );
        return str;
      }else{
        return str;
      }
    }

  }

  bool CheckNonSearch(String keyword, String str){
    int length = keyword.length;
    if(keyword == ''){
      return true;
    }else{
      int idx = str.toLowerCase().indexOf(keyword.toLowerCase());
      if(idx > -1){

        return false;
      }else{
        return true;
      }
    }

  }
  bool isQoute(String ext ){
    if(ext.contains("blockquote")){return true;}else{ return false;}
  }

  String toThumb(String htmlText){
   // print('ini html image == $htmlText');

    return htmlText;
    /*
    return htmlText.replaceAll('.tif','-thumb.tif').replaceAll('.tiff','-thumb.tiff')
        .replaceAll('.bmp','-thumb.bmp').replaceAll('.jpg','-thumb.jpg')
        .replaceAll('.jpeg','-thumb.jpeg').replaceAll('.tif','-thumb.tif')
        .replaceAll('.png','-thumb.png').replaceAll('.gif','-thumb.gif')
        .replaceAll('.eps','-thumb.eps');

     */
  }


  String? parseThumb(String? htmlText){
    //print('ini html image == $htmlText');
    var document = parse(htmlText);
    var data = document.getElementsByClassName('thumbnail');
    if(data.isNotEmpty){
      return data[0].attributes['src'];

    }else{

      var data = document.getElementsByClassName('chat-thumbnail');
      return data[0].attributes['src'];
    }

    // return htmlText;
    /*
    return htmlText.replaceAll('.tif','-thumb.tif').replaceAll('.tiff','-thumb.tiff')
        .replaceAll('.bmp','-thumb.bmp').replaceAll('.jpg','-thumb.jpg')
        .replaceAll('.jpeg','-thumb.jpeg').replaceAll('.tif','-thumb.tif')
        .replaceAll('.png','-thumb.png').replaceAll('.gif','-thumb.gif')
        .replaceAll('.eps','-thumb.eps');

     */
  }
  File? filePath(String? filename) {
    // Directory dir = await getApplicationDocumentsDirectory();
    String pathName = p.join('/storage/emulated/0/Download', filename);
    return File(pathName);
  }
 // TextMessageWidget({Key key, this.message, this.darkmode, widget.search = ''}) : super(key: key);
  /*
  @override
  Widget build(BuildContext context){
    return(Text('okehhhhh'));
  }

   */

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final width =size.width;
    SendMsgModel? textModel = SendMsgModel.fromJson(widget.message);
    File? file = File(textModel.message!);
    String basename = p.basename(file.path);
    //TextMessageModel textModel = TextMessageModel.fromJson(message);
    //return Text(textModel.text);
    DateTime? date;
    String? fileName = '';
    String? fileInfo = '';
    int? fileSize;
    int? progress = 0;
    String? fileMessage = '';
    String? quote = '';
    String? quoteName = '';
    String? quoteContent = '';
    File? file1 ;
    var myFile;
    double? cWidth = MediaQuery.of(context).size.width * 0.8;
    var dateformat = DateFormat('dd/MM/yyyy  hh:mm:ss');

    if(isFile(textModel.message!)){
      var document = parse(textModel.message);
      print('akuuuuuuu  2 ${textModel.message}');
      var dat = document.getElementsByClassName('chat-file-link');
      if((dat != null) && (dat.isNotEmpty)){
        var dt = document.getElementsByClassName('more');
        var d = document.getElementsByClassName('chat-file-info');

        // var doc = parse("<div class=\"chat\">  ${textModel.message} </div>" );
        // var d1 = doc.getElementsByClassName('chat');
        basename = dt[0].text;
        fileName = dt[0].attributes['href'];
        fileInfo = d[0].text;
        var doc = document.firstChild?.children.elementAt(1);
        if(doc!.nodes.last.hasChildNodes() || doc.nodes.last.toString().contains('://')){

          fileMessage = doc.nodes.last.toString().substring(1, doc.nodes.last.toString().length - 1);
          if(fileMessage == 'html div'){
            fileMessage = '';
          }
        }else{
          fileMessage = doc.nodes.last.text;
        }

      }else {
        var data = document.getElementsByClassName('download');
        if ((data != null) && (data.isNotEmpty)) {
          basename = data[0].text;
          fileName = data[0].attributes['href'];

          fileSize = int.tryParse(data[0].attributes['x-size']!);
          date = DateTime.tryParse(data[0].attributes['x-date']!);
        } else {
          var data1 = document.getElementsByClassName('chat-download');

          var dt = document.getElementsByTagName('div');
          // print('haloo man');
          // print('child1 == ${document.children[0].text.replaceAll(dt[0].text, '')}');

          fileMessage = document.children[0].text.replaceAll(dt[0].text, '');

          basename = data1[0].text;
          var tempbname = basename;
          // print('filename1 $basename');
          fileName = data1[0].attributes['href'];
          if (fileName == null) {
            var data3 = document.getElementsByClassName('more');

            basename = data3[0].text;
            //  print('filename2 $basename');
            fileName = data3[0].attributes['href'];
          }

          // print('filename $fileName');
          if (data1[0].attributes['x-size'] != null) {
            fileSize = int.tryParse(data1[0].attributes['x-size']!);
            date = DateTime.tryParse(data1[0].attributes['x-date']!);
          } else {
            var dtparse = tempbname.replaceAll(basename, '');

            if (int.tryParse(dtparse.split(',')[0].split(':')[1]) == null) {
              fileSize = null;
            } else {
              fileSize = int.tryParse(dtparse.split(',')[0].split(':')[1]);
            }

            //date = DateTime.tryParse(dtparse.split(',')[1].split(':')[1]);
            if (int.tryParse(dtparse.split(',')[1].split(':')[1]) == null) {
              date = null;
            } else {
              date = DateTime.fromMillisecondsSinceEpoch(
                  int.tryParse(dtparse.split(',')[1].split(':')[1]!)!);
            }
          }
        }
      }




    }

  //  print('ini aku textModel.type  ${textModel.message}');

    if(isImage(textModel.message!)&&(textModel.message!.contains('<img'))){
      var document = parse(textModel.message);
      var dt = document.getElementsByTagName('div');
      File file1 = File("${parseThumb(textModel.message)}");
      String basename = p.basename(file1.path);
      myFile = filePath(basename);
      if(dt.isNotEmpty){
      //  print('child2 == ${document.children[0].text.replaceAll(dt[0].text, '')}');

        fileMessage = document.children[0].text.replaceAll(dt[0].text, '').replaceFirst('<', '');
      }

    }

    if(isQoute(textModel.message!)){
      String  str = textModel.message!;
      String  start = "<blockquote>";
      String end = "</blockquote>";

      int startIndex = str.indexOf(start);
      if (startIndex == -1){
        start = "blockquote";
        end = "/blockquote";
        startIndex = str.indexOf(start);
      }

      final endIndex = str.indexOf(end, startIndex + start.length);

      quote = str.substring(startIndex + start.length, endIndex);
      quoteName = str.substring(0, str.indexOf(start)) ;
      quoteContent = str.substring(str.indexOf(end) + end.length , str.length - 1);
    }


    /*
    return(Text(parser.emojify(textModel.message)  ));


     */
    return
      (
          CheckNonSearch(widget.search!, textModel.message!) ?

          textModel.type == 2 ?
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Bubble(
                  margin: const BubbleEdges.only(top: 10,left: 16, right: 50),
                  color: Colors.orange[100],
                  nip: BubbleNip.no,
                  alignment: Alignment.center,

                  child:  isImage(textModel.message!)?
                  textModel.message!.contains('<img') ?
                  fileMessage == '' ?

                  GestureDetector(
                      onTap: (){
                        String? source = parseThumb(textModel.message!);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowImage1(image:'${source?.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.')}')));
                      },
                      child:
                      Image(
                          image:
                             NetworkToFileImage(
                             url: parseThumb(textModel.message),
                             file: myFile),
                        )
                  )
                      :  fileName!.contains('ECT.mp3') ?
                  SizedBox(width:width*3/4, child: _buildPlayer(fileName, basename, Duration(milliseconds: int.tryParse(fileMessage!)??0))):
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      GestureDetector(
                          onTap: (){
                            String? source = parseThumb(textModel.message!);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ShowImage1(image:'${source?.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.')}')));
                          },
                          child:
                          Image(
                          image:
                             NetworkToFileImage(
                             url: parseThumb(textModel.message),
                             file: myFile),
                        )
                      ),
                      const SizedBox(height: 5,),
                      fileMessage!.contains('<')|| fileMessage!.contains('://') ?
                      HtmlWidget(parser.emojify(addTag(widget.search!, fileMessage))  ,
                        //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                        textStyle: const TextStyle(fontSize:14, color: Colors.black),
                        onTapUrl: (url) async{
                          if(url.toLowerCase().contains('projects.co.id')){


                            if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                              if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                      (Route<dynamic> route) => true,
                                );

                              }else {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url + '/'));
                              }
                            }


                          }else
                          {
                            if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }else{
                              if (await canLaunch('https://' + url)) {
                                await launch('https://' + url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }


                          }
                          throw 'Could not launch ';
                        },
                      )
                          : Text(parser.emojify(addTag(widget.search!, fileMessage)), style: const TextStyle(fontSize:14, color: Colors.black) ,),

                    ],
                  )

                      :Html(data: '<img src=${textModel.message} >',
                    style: {

                      "html": Style(
                          alignment: Alignment.topLeft,
                          //padding: const EdgeInsets.only(top:30),
                          fontSize: FontSize.small,
                          fontWeight: FontWeight.w400
                      ),
                    },
                    onImageTap:(src, _, __, ___){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowImage1(image:'$src')));
                    },

                  )
                      : isFile(textModel.message!)?

                  fileMessage == '' ?
                  GestureDetector(
                    child:

                    Container(
                        width: width * 3/4,
                        height: 65,

                        decoration: ShapeDecoration(
                          color:Colors.red[50],
                          shadows:const [
                            BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
                          ],

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                                width: 1,
                                color: Colors.white
                            ),
                          ),

                        ),
                        child:
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Row(
                              children:[
                                Container(
                                  height: 42,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(getAsset(basename)) ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                              
                                

Expanded(
                                  child:    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$basename', style: const TextStyle(color: Colors.red, fontSize: 15), overflow: TextOverflow.ellipsis,maxLines: 1, ),
                                    fileSize == null? fileInfo == ''? Container() :  Text(fileInfo,style: const TextStyle(fontSize: 12)) : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),

                                ),

                              ]
                            ),
                           
                            ],
                          ),
                        )
                    ),
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShowFile1(file: fileName,fz:fileSize == null? fileInfo == ''? '': fileInfo  :filesize(fileSize), basename: basename,)));

                    },
                  )
                      :  fileName!.contains('ECT.mp3') ?
                  SizedBox(width:width*3/4, child: _buildPlayer(fileName, basename, Duration(milliseconds: int.tryParse(fileMessage!)??0))):
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      GestureDetector(
                        child:

                        Container(
                            width: width * 3/4,
                            height: 65,

                            decoration: ShapeDecoration(
                              color:Colors.red[50],
                              shadows:const [
                                BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
                              ],

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: const BorderSide(
                                    width: 1,
                                    color: Colors.white
                                ),
                              ),

                            ),
                            child:
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Row(
                              children:[
                                Container(
                                  height: 42,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(getAsset(basename)) ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
Expanded(
                                  child:    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$basename', style: const TextStyle(color: Colors.red, fontSize: 15), overflow: TextOverflow.ellipsis,maxLines: 1, ),
                                    fileSize == null? fileInfo == ''? Container() :  Text(fileInfo,style: const TextStyle(fontSize: 12)) : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),

                                ),

                              ]
                            ),
                               
                                ],
                              ),
                            )
                        ),
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowFile1(file: fileName,fz:fileSize == null? fileInfo == ''? '': fileInfo  :filesize(fileSize), basename: basename,)));

                        },
                      ),


                      const SizedBox(height: 5,),
                      fileMessage!.contains('<')|| fileMessage!.contains('://') ?
                      HtmlWidget(parser.emojify(addTag(widget.search!, fileMessage))  ,
                        //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                        textStyle: const TextStyle(fontSize:14, color: Colors.black),
                        onTapUrl: (url) async{
                          if(url.toLowerCase().contains('projects.co.id')){


                            if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                              if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                      (Route<dynamic> route) => true,
                                );

                              }else {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url + '/'));
                              }
                            }


                          }else
                          {
                            if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }else{
                              if (await canLaunch('https://' + url)) {
                                await launch('https://' + url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }


                          } throw 'Could not launch';
                        }, 
                      )
                          : Text(parser.emojify(addTag(widget.search!, fileMessage)), style: const TextStyle(fontSize:14, color: Colors.black) ,),

                    ],
                  )
                  /*
                  FileViewAtt(
                    ctx : context,
                    value: basename,
                    value1: textModel.message,
                    caption: 'Sample',
                  )

                       */
                      :
                  //    HtmlWidget(parser.emojify('1234')  ,
                  isQoute(textModel.message!) ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quoteName,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold ),
                      ),
                      BlockQuote(
                          blockColor: Colors.green,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              quote.contains('chat-image') ? Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width * 3/4,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  image: DecorationImage(
                                      alignment: Alignment.topCenter,
                                      image: NetworkImage(parseThumb(quote!)!),
                                      fit: BoxFit.fitWidth),
                                ),
                              ) :
                              Html( data:
                              quote.contains('chat-file') ?
                              quote :


                              ' ${readText(quote, 100)}',

                              ),

                            ],
                          )
                      ),
                      quoteContent.contains('<')|| quoteContent.contains('://') ?
                      HtmlWidget(
                        parser.emojify(addTag(widget.search!, quoteContent)),
                        //  HtmlWidget(parser.emojify(textModel.message)  ,
                        //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                        textStyle: const TextStyle(fontSize:14, color: Colors.black),
                        onTapUrl: (url) async{
                          if(url.toLowerCase().contains('projects.co.id')){


                            if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                              if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                      (Route<dynamic> route) => true,
                                );

                              }else {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url + '/'));
                              }
                            }


                          }else
                          {

                            if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }else{
                              if (await canLaunch('https://' + url)) {
                                await launch('https://' + url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }


                          }

                          throw 'Could not launch ';
                        },
                      )
                          : Text(parser.emojify(addTag(widget.search!, quoteContent)), style: const TextStyle(fontSize:14, color: Colors.black) ,)
                    ],
                  )

                      :
                  textModel.message!.contains('<')|| textModel.message!.contains('://') ?
                  HtmlWidget('<b>Admin:  </b>' + parser.emojify(addTag(widget.search!, textModel.message!))  ,
                    //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                    textStyle: const TextStyle(fontSize:15, color: Colors.black),
                    onTapUrl: (url) async{
                      if(url.toLowerCase().contains('projects.co.id')){


                        if(url.contains(RegExp(r'[0-9]'))){
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
                          if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                  (Route<dynamic> route) => true,
                            );

                          }else {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url + '/'));
                          }
                        }


                      }else
                      {
                        if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }

                        }else{
                          if (await canLaunch('https://' + url)) {
                            await launch('https://' + url);
                          } else {
                            throw 'Could not launch $url';
                          }

                        }




                      }
                      throw 'Could not launch ';
                    },
                  )
                     : Text('Admin: ' + parser.emojify(addTag(widget.search!, textModel.message!)), style: const TextStyle(fontSize:15, color: Colors.black) ,),



                ),
                Padding(
                  padding : const EdgeInsets.only(top: 5, left: 26),
                  child:    Text(
                    readTimestamp( textModel.time!) ,
                    style: TextStyle(
                      color: widget.darkmode!? Colors.white:Colors.black54,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ]
          )
              :Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Bubble(
                  margin: const BubbleEdges.only(top: 10,left: 16, right: 50),
                  //  color: darkMode? Colors.black45:Color.fromARGB(255, 225, 255, 199),
                  nip: widget.equal! ?  BubbleNip.no:BubbleNip.leftTop,
                  child:  isImage(textModel.message!)?
                  textModel.message!.contains('<img') ?

                    fileMessage == '' ?

                    GestureDetector(
                        onTap: (){
                          String? source = parseThumb(textModel.message!);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ShowImage1(image:source!.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.'))));
                        },
                        child:
                            Image(
                          image:
                             NetworkToFileImage(
                             url: parseThumb(textModel.message),
                             file: myFile),
                        )
                     )
                        :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                          GestureDetector(
                              onTap: (){
                                String? source = parseThumb(textModel.message!);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ShowImage1(image:source!.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.'))));
                              },
                              child:
                              Image(
                          image:
                             NetworkToFileImage(
                             url: parseThumb(textModel.message),
                             file: myFile),
                        )
                          ),
                          const SizedBox(height: 5,),
                          fileMessage!.contains('<')|| fileMessage!.contains('://') ?
                          HtmlWidget(parser.emojify(addTag(widget.search!, fileMessage))  ,
                          //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                          textStyle: const TextStyle(fontSize:14, color: Colors.black),
                          onTapUrl: (url) async{
                            if(url.toLowerCase().contains('projects.co.id')){


                              if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                                if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                        (Route<dynamic> route) => true,
                                  );

                                }else {
                                  AppProvider.getRouter(context)!.navigateTo(
                                      context,
                                      urlToRoute(url + '/'));
                                }
                              }


                            }else
                             {
                              if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }

                              }else{
                                if (await canLaunch('https://' + url)) {
                                  await launch('https://' + url);
                                } else {
                                  throw 'Could not launch $url';
                                }

                              }


                            }
                            throw 'Could not launch';
                          
                          },
                        )
                            : Text(parser.emojify(addTag(widget.search!, fileMessage)), style: const TextStyle(fontSize:14, color: Colors.black) ,),

                      ],
                    )
                 // )

                    /*
                  Html(data: toThumb(textModel.message),
                    style: {
                      "html": Style(
                          alignment: Alignment.topLeft,
                          fontSize: FontSize.small,
                          fontWeight: FontWeight.w400
                      ),
                    },
                    onImageTap:(src, _, __, ___){
                      String source = src;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowImage1(image:'${source!.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.')}')));
                    },

                  )

                     */

                      :Html(data: '<img src=${textModel.message} >',
                    style: {

                      "html": Style(
                          alignment: Alignment.topLeft,
                          //padding: const EdgeInsets.only(top:30),
                          fontSize: FontSize.small,
                          fontWeight: FontWeight.w400
                      ),
                    },
                    onImageTap:(src, _, __, ___){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowImage1(image:'$src')));
                    },

                  )
                      : isFile(textModel.message!)?

                      fileMessage == '' ?
                      GestureDetector(
                        child:

                        Container(
                            width: width * 3/4,
                            height: 65,

                            decoration: ShapeDecoration(
                              color:Colors.red[50],
                              shadows:const [
                                BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
                              ],

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: const BorderSide(
                                    width: 1,
                                    color: Colors.white
                                ),
                              ),

                            ),
                            child:
                         Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Row(
                              children:[
                                Container(
                                  height: 42,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(getAsset(basename)) ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
Expanded(
                                  child:    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$basename', style: const TextStyle(color: Colors.red, fontSize: 15), overflow: TextOverflow.ellipsis,maxLines: 1, ),
                                    fileSize == null? fileInfo == ''? Container() :  Text(fileInfo,style: const TextStyle(fontSize: 12)) : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),

                                ),

                              ]
                            ),
                           
                          ],
                        ),
                      )
                        ),
                      onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  ShowFile1(file: fileName,fz:fileSize == null? fileInfo == ''? '': fileInfo  :filesize(fileSize), basename: basename,)));

                  },
                  )
                          :  fileName!.contains('ECT.mp3') ?
                      SizedBox(width:width*3/4, child: _buildPlayer(fileName, basename, Duration(milliseconds: int.tryParse(fileMessage!)??0))):
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          GestureDetector(
                            child:

                            Container(
                                width: width * 3/4,
                                height: 65,

                                decoration: ShapeDecoration(
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
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      
                                      Row(
                              children:[
                                Container(
                                  height: 42,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(getAsset(basename)) ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
Expanded(
                                  child:    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$basename', style: const TextStyle(color: Colors.red, fontSize: 15), overflow: TextOverflow.ellipsis,maxLines: 1, ),
                                    fileSize == null? fileInfo == ''? Container() :  Text(fileInfo,style: const TextStyle(fontSize: 12)) : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),

                                ),

                              ]
                            ),
                                   
                                    ],
                                  ),
                                )
                            ),
                            onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ShowFile1(file: fileName,fz:fileSize == null? fileInfo == ''? '': fileInfo  :filesize(fileSize), basename: basename,)));

                            },
                          ),


                          const SizedBox(height: 5,),
                          fileMessage!.contains('<')|| fileMessage!.contains('://') ?
                          HtmlWidget(parser.emojify(addTag(widget.search!, fileMessage))  ,
                            //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                            textStyle: const TextStyle(fontSize:14, color: Colors.black),
                            onTapUrl: (url) async{
                              if(url.toLowerCase().contains('projects.co.id')){


                                if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                                  if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                          (Route<dynamic> route) => true,
                                    );

                                  }else {
                                    AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/'));
                                  }
                                }


                              }else
                              {
                                if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }

                                }else{
                                  if (await canLaunch('https://' + url)) {
                                    await launch('https://' + url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }

                                }


                              }
                              throw 'Could not launch ';
                            },
                          )
                              : Text(parser.emojify(addTag(widget.search!, fileMessage)), style: const TextStyle(fontSize:14, color: Colors.black) ,),

                        ],
                      )

                      :
                  //    HtmlWidget(parser.emojify('1234')  ,
                  isQoute(textModel.message!) ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quoteName,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold ),
                      ),
                      BlockQuote(
                          blockColor: Colors.green,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              quote.contains('chat-image') ? Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width * 3/4,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  image: DecorationImage(
                                      alignment: Alignment.topCenter,
                                      image: NetworkImage(parseThumb(quote!)!),
                                      fit: BoxFit.fitWidth),
                                ),
                              ) :
                              Html( data:
                              quote.contains('chat-file') ?
                              quote :


                              ' ${readText(quote, 100)}',

                              ),

                            ],
                          )
                      ),
                      quoteContent.contains('<')|| quoteContent.contains('://') ?
                      HtmlWidget(
                        parser.emojify(addTag(widget.search!, quoteContent)),
                        //  HtmlWidget(parser.emojify(textModel.message)  ,
                        //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                        textStyle: const TextStyle(fontSize:14, color: Colors.black),
                        onTapUrl: (url) async{
                          if(url.toLowerCase().contains('projects.co.id')){


                            if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                              if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                      (Route<dynamic> route) => true,
                                );

                              }else {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url + '/'));
                              }
                            }


                          }else
                          {

                            if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }else{
                              if (await canLaunch('https://' + url)) {
                                await launch('https://' + url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }


                          }

                          throw 'Could not launch ';
                        },
                      )
                          : Text(parser.emojify(addTag(widget.search!, quoteContent)), style: const TextStyle(fontSize:14, color: Colors.black) ,)
                    ],
                  )

                      :
                  textModel.message!.contains('<')|| textModel.message!.contains('://') ?
                  HtmlWidget(parser.emojify(addTag(widget.search!, textModel.message!))  ,
                    //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                    textStyle: const TextStyle(fontSize:14, color: Colors.black),
                    onTapUrl: (url) async{
                      if(url.toLowerCase().contains('projects.co.id')){


                        if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                          if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                  (Route<dynamic> route) => true,
                            );

                          }else {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url + '/'));
                          }
                        }


                      }else
                      {
                        if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }

                        }else{
                          if (await canLaunch('https://' + url)) {
                            await launch('https://' + url);
                          } else {
                            throw 'Could not launch $url';
                          }

                        }


                      }
                      throw 'Could not launch ';
                    },
                  )
                      : Text(parser.emojify(addTag(widget.search!, textModel.message!)), style: const TextStyle(fontSize:14, color: Colors.black) ,),

                ),
                Padding(
                  padding : const EdgeInsets.only(top: 5, left: 26),
                  child:    Text(
                    readTimestamp( textModel.time!) ,
                    style: TextStyle(
                      color: widget.darkmode!? Colors.white:Colors.black54,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ]
          )
          :
          textModel.type == 2 ?
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Bubble(
                  margin: const BubbleEdges.only(top: 10,left: 16, right: 50),
                  color: Colors.orange[100],
                  nip: BubbleNip.no,
                  alignment: Alignment.center,
                  child:  isImage(textModel.message!)?
                  textModel.message!.contains('<img') ?
                  fileMessage == '' ?

                  GestureDetector(
                      onTap: (){
                        String? source = parseThumb(textModel.message!);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowImage1(image:'${source!.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.')}')));
                      },
                      child:
                      Image(
                          image:
                             NetworkToFileImage(
                             url: parseThumb(textModel.message),
                             file: myFile),
                        )
                  )
                      :  fileName!.contains('ECT.mp3') ?
                  SizedBox(width:width*3/4, child: _buildPlayer(fileName, basename, Duration(milliseconds: int.tryParse(fileMessage!)??0))):
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      GestureDetector(
                          onTap: (){
                            String? source = parseThumb(textModel.message!);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ShowImage1(image:'${source!.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.')}')));
                          },
                          child:
                          Image(
                          image:
                             NetworkToFileImage(
                             url: parseThumb(textModel.message),
                             file: myFile),
                        )
                      ),
                      const SizedBox(height: 5,),
                      fileMessage!.contains('<')|| fileMessage!.contains('://') ?
                      HtmlWidget(parser.emojify(addTag(widget.search!, fileMessage))  ,
                        //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                        textStyle: const TextStyle(fontSize:14, color: Colors.black),
                        onTapUrl: (url) async{
                          if(url.toLowerCase().contains('projects.co.id')){


                            if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                              if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                      (Route<dynamic> route) => true,
                                );

                              }else {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url + '/'));
                              }
                            }


                          }else
                          {
                            if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }else{
                              if (await canLaunch('https://' + url)) {
                                await launch('https://' + url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }


                          } throw 'Could not launch';
                        }, 
                      )
                          : Text(parser.emojify(addTag(widget.search!, fileMessage)), style: const TextStyle(fontSize:14, color: Colors.black) ,),

                    ],
                  )

                      :Html(data: '<img src=${textModel.message} >',
                    style: {

                      "html": Style(
                          alignment: Alignment.topLeft,
                          //padding: const EdgeInsets.only(top:30),
                          fontSize: FontSize.small,
                          fontWeight: FontWeight.w400
                      ),
                    },
                    onImageTap:(src, _, __, ___){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowImage1(image:'$src')));
                    },

                  )
                      : isFile(textModel.message!)?

                  fileMessage == '' ?
                  GestureDetector(
                    child:

                    Container(
                        width: width * 3/4,
                        height: 65,

                        decoration: ShapeDecoration(
                          color:Colors.red[50],
                          shadows:const [
                            BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
                          ],

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                                width: 1,
                                color: Colors.white
                            ),
                          ),

                        ),
                        child:
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Row(
                              children:[
                                Container(
                                  height: 42,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(getAsset(basename)) ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
Expanded(
                                  child:    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$basename', style: const TextStyle(color: Colors.red, fontSize: 15), overflow: TextOverflow.ellipsis,maxLines: 1, ),
                                    fileSize == null? fileInfo == ''? Container() :  Text(fileInfo,style: const TextStyle(fontSize: 12)) : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),

                                ),

                              ]
                            ),
                           
                            ],
                          ),
                        )
                    ),
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShowFile1(file: fileName,fz:fileSize == null? fileInfo == ''? '': fileInfo  :filesize(fileSize), basename: basename,)));

                    },
                  )
                      :  fileName!.contains('ECT.mp3') ?
                  SizedBox(width:width*3/4, child: _buildPlayer(fileName, basename, Duration(milliseconds: int.tryParse(fileMessage!)??0))):
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      GestureDetector(
                        child:

                        Container(
                            width: width * 3/4,
                            height: 65,

                            decoration: ShapeDecoration(
                              color:Colors.red[50],
                              shadows:const [
                                BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
                              ],

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: const BorderSide(
                                    width: 1,
                                    color: Colors.white
                                ),
                              ),

                            ),
                            child:
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Row(
                              children:[
                                Container(
                                  height: 42,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(getAsset(basename)) ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
Expanded(
                                  child:    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$basename', style: const TextStyle(color: Colors.red, fontSize: 15), overflow: TextOverflow.ellipsis,maxLines: 1, ),
                                    fileSize == null? fileInfo == ''? Container() :  Text(fileInfo,style: const TextStyle(fontSize: 12)) : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),

                                ),

                              ]
                            ),
                               
                                ],
                              ),
                            )
                        ),
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowFile1(file: fileName,fz:fileSize == null? fileInfo == ''? '': fileInfo  :filesize(fileSize), basename: basename,)));

                        },
                      ),


                      const SizedBox(height: 5,),
                      fileMessage!.contains('<')|| fileMessage!.contains('://') ?
                      HtmlWidget(parser.emojify(addTag(widget.search!, fileMessage))  ,
                        //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                        textStyle: const TextStyle(fontSize:14, color: Colors.black),
                        onTapUrl: (url) async{
                          if(url.toLowerCase().contains('projects.co.id')){


                            if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                              if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                      (Route<dynamic> route) => true,
                                );

                              }else {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url + '/'));
                              }
                            }


                          }else
                          {
                            if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }else{
                              if (await canLaunch('https://' + url)) {
                                await launch('https://' + url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }


                          } throw 'Could not launch';
                        }, 
                      )
                          : Text(parser.emojify(addTag(widget.search!, fileMessage)), style: const TextStyle(fontSize:14, color: Colors.black) ,),

                    ],
                  )
                  /*
                  FileViewAtt(
                    ctx : context,
                    value: basename,
                    value1: textModel.message,
                    caption: 'Sample',
                  )

                       */
                      :
                  //    HtmlWidget(parser.emojify('1234')  ,
                  HtmlWidget('<b>Admin:  </b>' + parser.emojify(addTag(widget.search!, textModel.message!))  ,
                    //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                    textStyle: const TextStyle(fontSize:14, color: Colors.black),
                    onTapUrl: (url) async{
                      if(url.toLowerCase().contains('projects.co.id')){


                        if(url.contains(RegExp(r'[0-9]'))){
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
                          if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                  (Route<dynamic> route) => true,
                            );

                          }else {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url + '/'));
                          }
                        }


                      }else
                      {
                        if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }

                        }else{
                          if (await canLaunch('https://' + url)) {
                            await launch('https://' + url);
                          } else {
                            throw 'Could not launch $url';
                          }

                        }




                      }
                      throw 'Could not launch ';
                    },
                  ),


                ),
                Padding(
                  padding : const EdgeInsets.only(top: 5, left: 26),
                  child:    Text(
                    readTimestamp( textModel.time!) ,
                    style: TextStyle(
                      color: widget.darkmode!? Colors.white:Colors.black54,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ]
          )
              :Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Bubble(
                  margin: const BubbleEdges.only(top: 10,left: 16, right: 50),
                  //  color: darkMode? Colors.black45:Color.fromARGB(255, 225, 255, 199),
                  nip: widget.equal! ?  BubbleNip.no:BubbleNip.leftTop,
                  child:  isImage(textModel.message!)?
                  textModel.message!.contains('<img') ?
                  fileMessage == '' ?

                  GestureDetector(
                      onTap: (){
                        String? source = parseThumb(textModel.message!);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowImage1(image:'${source!.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.')}')));
                      },
                      child:
                      Image(
                          image:
                             NetworkToFileImage(
                             url: parseThumb(textModel.message),
                             file: myFile),
                        )
                  )
                      :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      GestureDetector(
                          onTap: (){
                            String? source = parseThumb(textModel.message!);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ShowImage1(image:'${source!.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.')}')));
                          },
                          child:
                          Image(
                          image:
                             NetworkToFileImage(
                             url: parseThumb(textModel.message),
                             file: myFile),
                        )
                      ),
                      const SizedBox(height: 5,),
                      fileMessage!.contains('<')|| fileMessage!.contains('://') ?
                      HtmlWidget(parser.emojify(addTag(widget.search!, fileMessage))  ,
                        //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                        textStyle: const TextStyle(fontSize:14, color: Colors.black),
                        onTapUrl: (url) async{
                          if(url.toLowerCase().contains('projects.co.id')){


                            if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                              if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                      (Route<dynamic> route) => true,
                                );

                              }else {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url + '/'));
                              }
                            }


                          }else
                          {
                            if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }else{
                              if (await canLaunch('https://' + url)) {
                                await launch('https://' + url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }


                          } throw 'Could not launch';
                        }, 
                      )
                          : Text(parser.emojify(addTag(widget.search!, fileMessage)), style: const TextStyle(fontSize:14, color: Colors.black) ,),

                    ],
                  )

                      :Html(data: '<img src=${textModel.message} >',
                    style: {

                      "html": Style(
                          alignment: Alignment.topLeft,
                          //padding: const EdgeInsets.only(top:30),
                          fontSize: FontSize.small,
                          fontWeight: FontWeight.w400
                      ),
                    },
                    onImageTap:(src, _, __, ___){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowImage1(image:'$src')));
                    },

                  )
                      : isFile(textModel.message!)?
                  fileMessage == '' ?
                  GestureDetector(
                    child:

                    Container(
                        width: width * 3/4,
                        height: 65,

                        decoration: ShapeDecoration(
                          color:Colors.red[50],
                          shadows:const [
                            BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
                          ],

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                                width: 1,
                                color: Colors.white
                            ),
                          ),

                        ),
                        child:
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Row(
                              children:[
                                Container(
                                  height: 42,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(getAsset(basename)) ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
Expanded(
                                  child:    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$basename', style: const TextStyle(color: Colors.red, fontSize: 15), overflow: TextOverflow.ellipsis,maxLines: 1, ),
                                    fileSize == null? fileInfo == ''? Container() :  Text(fileInfo,style: const TextStyle(fontSize: 12)) : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),

                                ),

                              ]
                            ),
                           
                            ],
                          ),
                        )
                    ),
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShowFile1(file: fileName,fz:fileSize == null? fileInfo == ''? '': fileInfo  :filesize(fileSize), basename: basename,)));

                    },
                  )
                      :  fileName!.contains('ECT.mp3') ?
                  SizedBox(width:width*3/4, child: _buildPlayer(fileName, basename, Duration(milliseconds: int.tryParse(fileMessage!)??0))):
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      GestureDetector(
                        child:

                        Container(
                            width: width * 3/4,
                            height: 65,

                            decoration: ShapeDecoration(
                              color:Colors.red[50],
                              shadows:const [
                                BoxShadow(color: Colors.grey, offset: Offset(0.2, 0.2)),
                              ],

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: const BorderSide(
                                    width: 1,
                                    color: Colors.white
                                ),
                              ),

                            ),
                            child:
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Row(
                              children:[
                                Container(
                                  height: 42,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(getAsset(basename)) ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
Expanded(
                                  child:    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$basename', style: const TextStyle(color: Colors.red, fontSize: 15), overflow: TextOverflow.ellipsis,maxLines: 1, ),
                                    fileSize == null? fileInfo == ''? Container() :  Text(fileInfo,style: const TextStyle(fontSize: 12)) : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),

                                ),

                              ]
                            ),
                               
                                ],
                              ),
                            )
                        ),
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowFile1(file: fileName!,fz:fileSize! == null? fileInfo == ''? '': fileInfo  :filesize(fileSize!), basename: basename,)));

                        },
                      ),


                      const SizedBox(height: 5,),
                      fileMessage!.contains('<')|| fileMessage!.contains('://') ?
                      HtmlWidget(parser.emojify(addTag(widget.search!, fileMessage))  ,
                        //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                        textStyle: const TextStyle(fontSize:14, color: Colors.black),
                        onTapUrl: (url) async{
                          if(url.toLowerCase().contains('projects.co.id')){


                            if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                              if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                      (Route<dynamic> route) => true,
                                );

                              }else {
                                AppProvider.getRouter(context)!.navigateTo(
                                    context,
                                    urlToRoute(url + '/'));
                              }
                            }


                          }else
                          {
                            if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }else{
                              if (await canLaunch('https://' + url)) {
                                await launch('https://' + url);
                              } else {
                                throw 'Could not launch $url';
                              }

                            }


                          } throw 'Could not launch';
                        }, 
                      )
                          : Text(parser.emojify(addTag(widget.search!, fileMessage)), style: const TextStyle(fontSize:14, color: Colors.black) ,),

                    ],
                  )
                  /*
              FileViewAtt(
                ctx : context,
                value: basename,
                value1: textModel.message,
                caption: 'Sample',
              )

                   */
                      :

                  //    HtmlWidget(parser.emojify('1234')  ,
                  HtmlWidget(parser.emojify(addTag(widget.search!, textModel.message!))  ,
                    //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                    textStyle: const TextStyle(fontSize:14, color: Colors.black),
                    onTapUrl: (url) async{
                      if(url.toLowerCase().contains('projects.co.id')){


                        if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                          if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                  (Route<dynamic> route) => true,
                            );

                          }else {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url + '/'));
                          }
                        }


                      }else
                      {
                        if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }

                        }else{
                          if (await canLaunch('https://' + url)) {
                            await launch('https://' + url);
                          } else {
                            throw 'Could not launch $url';
                          }

                        }


                      }
                      throw 'Could not launch ';
                    },
                  ),


                ),
                Padding(
                  padding : const EdgeInsets.only(top: 5, left: 26),
                  child:    Text(
                    readTimestamp( textModel.time!) ,
                    style: TextStyle(
                      color: widget.darkmode!? Colors.white:Colors.black54,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ]
          )

      );















    /*
    return
      (
          textModel.type == 2?
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Bubble(
                  margin: const BubbleEdges.only(top: 10,left: 16, right: 50),
                  //  color: darkMode? Colors.black45:Color.fromARGB(255, 225, 255, 199),
                  nip: BubbleNip.no,
                  child:  isImage(textModel.message!)?
                  textModel.message!.contains('<img') ?
                  Html(data: textModel.message,
                    style: {
                      "html": Style(
                          alignment: Alignment.topLeft,
                          fontSize: FontSize.small,
                          fontWeight: FontWeight.w400
                      ),
                    },
                    onImageTap:(src, _, __, ___){
                      String source = src;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowImage1(image:'${source!.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.')}')));
                    },

                  )

                      :Html(data: '<img src=${textModel.message} >',
                    style: {

                      "html": Style(
                          alignment: Alignment.topLeft,
                          //padding: const EdgeInsets.only(top:30),
                          fontSize: FontSize.small,
                          fontWeight: FontWeight.w400
                      ),
                    },
                    onImageTap:(src, _, __, ___){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowImage1(image:'$src')));
                    },

                  )
                      : isFile(textModel.message!)?

                  GestureDetector(
                    child:   Container(
                      width: width * 3/4,
                      height: 65,

                      decoration: ShapeDecoration(
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
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Row(
                              children:[
                                Container(
                                  height: 42,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(getAsset(basename)) ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
Expanded(
                                  child:    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$basename', style: const TextStyle(color: Colors.red, fontSize: 15), overflow: TextOverflow.ellipsis,maxLines: 1, ),
                                    fileSize == null? fileInfo == ''? Container() :  Text(fileInfo,style: const TextStyle(fontSize: 12)) : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),

                                ),

                              ]
                            ),
                            fileSize == null? Container() : fileSize == null? Container() : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),

                    ),

                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowFile1(file:fileName,fz:fileSize == null? '' :filesize(fileSize), basename: basename,)));

                    },
                  )
                      /*
                  FileViewAtt(
                    ctx : context,
                    value: basename,
                    value1: textModel.message,
                    caption: 'Sample',
                  )

                       */
                      :
                  //    HtmlWidget(parser.emojify('1234')  ,
                  HtmlWidget(parser.emojify(addTag(widget.search!, textModel.message!))  ,
                    //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                    textStyle: const TextStyle(fontSize:14, color: Colors.black),
                    onTapUrl: (url) async{
                      if(url.toLowerCase().contains('projects.co.id')){


                        if(url.contains(RegExp(r'[0-9]'))){
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
                          if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                                  (Route<dynamic> route) => true,
                            );

                          }else {
                            AppProvider.getRouter(context)!.navigateTo(
                                context,
                                urlToRoute(url + '/'));
                          }
                        }


                      }else
                      {
                        if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }

                        }else{
                          if (await canLaunch('https://' + url)) {
                            await launch('https://' + url);
                          } else {
                            throw 'Could not launch $url';
                          }

                        }




                      }
                    },
                  ),


                ),
                Padding(
                  padding : const EdgeInsets.only(top: 5, left: 26),
                  child:    Text(
                    readTimestamp( textModel.time!) ,
                    style: TextStyle(
                      color: widget.darkmode!? Colors.white:Colors.black54,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ]
          )
          :Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Bubble(
              margin: const BubbleEdges.only(top: 10,left: 16, right: 50),
              //  color: darkMode? Colors.black45:Color.fromARGB(255, 225, 255, 199),
              nip: widget.equal! ?  BubbleNip.no:BubbleNip.leftTop,
              child:  isImage(textModel.message!)?
              textModel.message!.contains('<img') ?
              Html(data: textModel.message,
                style: {
                  "html": Style(
                      alignment: Alignment.topLeft,
                      fontSize: FontSize.small,
                      fontWeight: FontWeight.w400
                  ),
                },
                onImageTap:(src, _, __, ___){
                  String source = src;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowImage1(image:'${source!.replaceAll('upload.projects', 'cdn.projects').replaceAll('-thumb.', '.')}')));
                },

              )

                  :Html(data: '<img src=${textModel.message} >',
                style: {

                  "html": Style(
                      alignment: Alignment.topLeft,
                      //padding: const EdgeInsets.only(top:30),
                      fontSize: FontSize.small,
                      fontWeight: FontWeight.w400
                  ),
                },
                onImageTap:(src, _, __, ___){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowImage1(image:'$src')));
                },

              )
                  : isFile(textModel.message!)?
              GestureDetector(
                child:   Container(
                  width: width * 3/4,
                  height: 65,

                  decoration: ShapeDecoration(
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
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Row(
                              children:[
                                Container(
                                  height: 42,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(getAsset(basename)) ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
Expanded(
                                  child:    Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$basename', style: const TextStyle(color: Colors.red, fontSize: 15), overflow: TextOverflow.ellipsis,maxLines: 1, ),
                                    fileSize == null? fileInfo == ''? Container() :  Text(fileInfo,style: const TextStyle(fontSize: 12)) : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),

                                ),

                              ]
                            ),
                        fileSize == null? Container() : fileSize == null? Container() : Text('(${filesize(fileSize)}, ${dateformat.format(date!)} WIB)', style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),

                ),

                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowFile1(file: fileName,fz:fileSize == null? '' :filesize(fileSize), basename: basename,)));

                },
              )
                  /*
              FileViewAtt(
                ctx : context,
                value: basename,
                value1: textModel.message,
                caption: 'Sample',
              )

                   */
                  :
              //    HtmlWidget(parser.emojify('1234')  ,
              HtmlWidget(parser.emojify(addTag(widget.search!, textModel.message!))  ,
                //bodyPadding: const EdgeInsets.only(left:8, right: 8, bottom: 5),
                textStyle: const TextStyle(fontSize:14, color: Colors.black),
                onTapUrl: (url) async{
                  if(url.toLowerCase().contains('projects.co.id')){


                    if(url.toLowerCase().contains(RegExp(r'[0-9]'))){
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
                      if(urlToRoute(url ) == '' || urlToRoute(url ) =='/public/home'){
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login(application: context,isLogin: false,)),
                              (Route<dynamic> route) => true,
                        );

                      }else {
                        AppProvider.getRouter(context)!.navigateTo(
                            context,
                            urlToRoute(url + '/'));
                      }
                    }


                  }else
                  {
                    if(url.toLowerCase().contains('https://') || url.toLowerCase().contains('http://') ){
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }

                    }else{
                      if (await canLaunch('https://' + url)) {
                        await launch('https://' + url);
                      } else {
                        throw 'Could not launch $url';
                      }

                    }


                  }
                },
              ),


            ),
            Padding(
              padding : const EdgeInsets.only(top: 5, left: 26),
              child:    Text(
                readTimestamp( textModel.time!) ,
                style: TextStyle(
                  color: darkmode? Colors.white:Colors.black54,
                  fontSize: 11.0,
                ),
              ),
            ),
          ]
      )

      );

     */

      /*
      HtmlWidget(textModel.message ),

       */
      /*
      Column(
        children:<Widget> [
          HtmlWidget(textModel.message + '<p>09.00</p>'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('09.00'),
            ],
          )

        ],
      )

     */


  //  return Text(message['message']);
  }


}




class ShowImage1 extends StatefulWidget {
  final String? image;

  ShowImage1({Key ? key, this.image}): super(key: key);

  @override
  ShowImage1State createState() => ShowImage1State();
}


class ShowImage1State extends State<ShowImage1> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File? _imageFile;
  int _progress = 0;
 // final String image1;
  List<File> _mulitpleFiles = [];
  bool _permissionReady = false;
  PermissionStatus _permissionStatus = PermissionStatus.denied;
 // ShowImage1State({this.image1});
  @override
  void initState() {
    super.initState();
    _checkPermission().then((hasGranted) {
      setState(() {
        _permissionReady = hasGranted;
      });
    });
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

        return permission == Permission.storage;
        //||
        // permission == Permission.manageExternalStorage;
      }
    }).toList();//.map((permission)async{ await _requestPermission(permission);});
    // prm.forEach((element)async{ return await _requestPermission(element);

    // });

    return await _requestPermission(prm[0]);



  }


  Future<bool> _requestPermission(Permission permission) async {
    final status = await permission.request();
    //  print('haloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo');
    // setState(() {
    //print(status);
    _permissionStatus = status;
   // print(_permissionStatus);
    if(_permissionStatus.isGranted){return true;}else{
      return false;
    }
    // });

  }

  @override
  Widget build(BuildContext context) {
    File file1 = File("${widget.image}");
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
      _permissionReady ?
      PhotoView(
        imageProvider:
        NetworkToFileImage(

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
      ): Container()

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


class TypingMessageWidget extends StatelessWidget {
  final dynamic message;

  const  TypingMessageWidget({Key? key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //TextMessageModel textModel = TextMessageModel.fromJson(message);
    //return Text(textModel.text);
    return const Text('Typing...', style: TextStyle(
      color: Colors.black45,
    ),);
  }
}

class ShowFile1 extends StatefulWidget {
  final String? file;
  final String? fz;
  final String? basename;

  ShowFile1({this.file, this.fz, this.basename});

  @override
  ShowFile1State createState() => ShowFile1State();
}


class ShowFile1State extends State<ShowFile1> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File? _fileFile;
  int _progress = 0;
//  final String file1;
  List<File> _mulitpleFiles = [];
 // ShowFile1State({this.file1});
  @override
  void initState() {
    super.initState();


  }
  //String file;
//  ShowImage({this.file});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var fl = widget.file!.replaceAll('cdn.', 'upload.');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0.0,

          title: const Padding(
            padding: EdgeInsets.only(left: 10.0,right: 10.0),
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
               // print('progress === $val');
                setState(() {
                  //progress = val;

                });
              },
              ctx : context,
              fz: widget.fz,
              value: widget.basename,
              value1: fl,
              caption: 'Sample',
            )
        )


    );

  }

}