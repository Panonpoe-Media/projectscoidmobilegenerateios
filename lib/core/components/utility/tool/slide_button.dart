import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
//import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:math';
import 'dart:math' as math;
import 'dart:ui';
import 'package:projectscoid/views/Chat/widgets/chat/messages_types/common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart';
import 'package:projectscoid/views/Chat/widgets/commons/bubble/bubble_widget.dart';
import 'package:rxdart/rxdart.dart';

typedef SlideEvent = void Function(String selectedLabel);

class SlideButton extends StatefulWidget {
  final String? label1;
  final String? label2;
  final String? label3;
  final String? label4;
  final double? widthSC;
  final SlideEvent? onSelected;
  SlideButton({
    @required this.label1,
    @required this.label2,
    @required this.label3,
    @required this.label4,
    @required this.widthSC,
    @required this.onSelected,
  });
  @override
  _SlideButtonState createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton> {
  List<Color> gradient = [
    Colors.transparent,
    Colors.transparent,
  ];
  double buttonPosition = 120.0;
  double buttonXPosition = 0.0;
  double buttonXXPosition = 0.0;
  double deltaButton = 0.0;
  String? event;
  bool show = false;
  bool showPlayer = false;
  bool show1 = false;
  Stopwatch watch = Stopwatch();
  Timer? timer;
  int secondBefore = 0;
  String elapsedTime = '';
  bool mic = false;
  AnimationController? _controller;
  String localFilePath = '';
  Duration? duration;
  Duration? position;
  AudioPlayer? audioPlayer;
  bool isPlay = false;
  bool isPause = false;
  int speed = 0;
  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;


  @override
  void initState() {
    super.initState();
    buttonXPosition = widget.widthSC! - 62.0;
    initAudioPlayer();
 
  }

  void initAudioPlayer() {

    audioPlayer = AudioPlayer();
   
  }



  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          audioPlayer!.positionStream,
          audioPlayer!.bufferedPositionStream,
          audioPlayer!.durationStream,
              (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  void onComplete() {

    position = const Duration(seconds: 0);
    setState(() {
      isPlay = false;
      //  playerState = PlayerState.stopped;
      duration = const Duration(seconds: 0);
      position = const Duration(seconds: 0);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
    audioPlayer!.stop();
    super.dispose();
    // widget.chatBloc.getQuickMenuItems();
  }

  startWatch() {
    timer?.cancel();
    setTime();
    if (!mounted) return;
    setState(() {
      //startStop = false;
      watch.start();
      timer = Timer.periodic(const Duration(milliseconds: 100), updateTime);
    });
  }

  stopWatch() {
    timer?.cancel();
    setState(() {
      //startStop = true;
      watch.stop();


    });
    watch.reset();
  }

  updateTime(Timer timer) {
    if (watch.isRunning) {
      if (!mounted) return;
      setState(() {
        //print("startstop Inside=$startStop");
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }

  setTime() {
    watch.reset();
    /*
    var timeSoFar = watch.reset();
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });

     */
  }

  String transformMilliSeconds(int? milliseconds) {
    print('milliseconds == $milliseconds');
    int hundreds = (milliseconds! / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();
    String hoursStr = '';
    if((hours % 60) > 0){
      hoursStr = '${(hours % 60).toString()}.';
    }

    String minutesStr = (minutes % 60).toString();
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    if(seconds - secondBefore == 1){
      secondBefore = seconds;
      if(show == true && show1 == true){
        if(mic){
           setState(() {
          mic = false;
           });
        }else {
          setState(() {
            mic = true;
          });
        }

        }else{
        if(mic){
          // setState(() {
          mic = false;
          // });
        }else{
          // setState(() {
          mic = true;
          // });

        }
      }
    }

    return "$hoursStr$minutesStr.$secondsStr";
  }


  Future<String> _getVoice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('voicepath') ?? '';

  }

  Future play(String kUrl,  String basename, bool sts) async {
    isPlay = true;
    isPause = false;

    //final dir = await getExternalStorageDirectory();
    String path = await _getVoice();
    final file = File('$path');

    if (await file.exists()){
      localFilePath = file.path;
      if(sts){
        //audioPlayer.setSpeed(1.0);
      }
      _playLocal(sts);
      // print('halooooo aku');

      setState(() {
        localFilePath = file.path;

      });
    }

  }

  Future _playLocal(bool sts) async {
    // audioPlayer.play(localFilePath, isLocal: true);
    final dr  = await audioPlayer?.durationFuture;
    if(audioPlayer?.position != Duration.zero && (transformMilliSeconds(audioPlayer!.position.inMilliseconds) != transformMilliSeconds(dr!.inMilliseconds)) ){
      print(transformMilliSeconds(audioPlayer!.position.inMilliseconds));
      // print('ini' + transformMilliSeconds(dr.inMilliseconds));
      // print('ada1');
      /*
      _positionDataStream.first.then((value)async{
        try {
          await audioPlayer.setAudioSource(
              AudioSource.uri(Uri.file(localFilePath)),  initialPosition: value.position,
              preload: false);
          audioPlayer.play();
        } catch (e) {
          print("Error loading audio source: $e");
        }
      });

       */
      await  audioPlayer!.play();
      if(sts){
        audioPlayer!.setSpeed(1.0);
      }

    }else {
      //  print('tidak ada1');
      try {
        await audioPlayer!.setAudioSource(
            AudioSource.uri(Uri.file(localFilePath)), initialPosition: Duration.zero,
            preload: true);
      } catch (e) {
        print("Error loading audio source: $e");
      }
      await  audioPlayer!.play();
      if(sts){
        audioPlayer!.setSpeed(1.0);
      }
    }



    // playerState =   PlayerState.playing;
    // setState(() => playerState =   PlayerState.playing);
  }

  Future pause()async {
    if(!this.mounted) return;
    setState(() {
      isPause = true;
      //playerState =   PlayerState.paused;

    });
    await audioPlayer!.pause();
    // isPause = true;

    // print('hancurrrr');



    //  setState(() => playerState =   PlayerState.paused);
  }

  Future stop() async {
    await audioPlayer!.stop();
    setState(() {
      // playerState =   PlayerState.stopped;
      position = const Duration();
    });
  }

  Future mute(bool muted) async {
    // await audioPlayer.mute(muted);
    setState(() {
      isMuted = muted;
    });
  }


  Widget _buildPlayer(String url, String basename, Duration dr) => Container(
    padding: const EdgeInsets.only(left: 0),
    child:

    Row(
      mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          width: 38,
          child: isPlay? isPause ?
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

                if(isPlay){
                  //positionData?.position;
                  return SeekBar(
                    duration: positionData?.duration ?? Duration.zero,
                    position: positionData?.position ?? Duration.zero,
                    bufferedPosition:
                    positionData?.bufferedPosition ?? Duration.zero,
                    onChangeEnd: audioPlayer!.seek,
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


           // if (!isPlay )
            //  Padding(
            //    padding: EdgeInsets.only(left:20),
            //    child:Text(transformMilliSeconds(dr.inMilliseconds).replaceAll(':','.'),style:  TextStyle(fontSize: 12, color:Colors.black54)),
            //  ),

            StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;

                if(positionData?.position != Duration.zero && isPlay) {
                  return Row(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                        padding: EdgeInsets.only(left:20),
                        child: Text(
                            positionData?.position!= null
                                ? "${transformMilliSeconds(positionData!.position ?.inMilliseconds).replaceAll(':','.') ?? ''}"
                                : positionData?.duration  != null ? transformMilliSeconds(positionData!.duration ?.inMilliseconds).replaceAll(':','.') : '',
                            style: TextStyle(fontSize: 12, color:Colors.black54)

                        )
                    ),

                  ]);
                }else{
                  return Container();
                }
              },
            ),


            //   if (position != null && isPlay ) _buildProgressView()
          ],
        ),
      ],
    ),


    //  )



  );

  @override
  Widget build(BuildContext context) {
    var space = 4/4.7 * MediaQuery.of(context).size.width;
    final size =MediaQuery.of(context).size;
    final width =size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: MediaQuery.of(context).size.width,
      height:180.0,
      padding: const EdgeInsets.all(4),

      child: Stack(
        children: <Widget>[

          Positioned(
            top:  0,
            left: show == true && show1 == true? widget!.widthSC! - 62.0 - deltaButton +40: widget!.widthSC! - 62.0 - deltaButton +8 ,
            right: 0,
            bottom: 0,
            child:
            show? Container(
              width: 60.0,
              height: 50.0,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.black45,
                  width: 1,
                ),
              ),
              child:
                  Column(
                    children: const [
                      SizedBox(height: 15,),
                          Icon(Icons.lock_open, color: Colors.black87, size: 24,),
                        /*
                  Text(
                    '${widget.label1.toUpperCase()}',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  )

                   */
                      SizedBox(height: 10,),
                      Icon(Icons.arrow_upward, color: Colors.black54, size: 24,),

                    ],
                  )

            ): Container(),
          ),
         show1?  Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 300.0,
              height: show == false && show1 == true? 200.0 : 50.0,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: show == false && show1 == true? BorderRadius.horizontal() :  BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.black45,
                    width: 1,
                  ),
                ),
              child:
              show == false && show1 == true?
              Column(
                children: [
                  showPlayer? Container(height: 50) : Container(height: 50),
                  Container(height: 100,
                  child :
                  showPlayer? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric( vertical: 10),
                          child:
                          Bubble(
                              margin: BubbleEdges.only(top: 5,left: 0, right: 0),
                              color: Colors.black26,
                              nip:      BubbleNip.no,
                              child:


                              Center(child: Container( height: width * 1/2, child: _buildPlayer('', '', Duration(milliseconds: int.tryParse('0')??0))))
                          )
                        )

                      ]
                  )
                      :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      //Icon(Icons.lock_open, color: Colors.black54,),\
                      SizedBox(width: 20,),
                      Container(
                          child: Row(
                            children: [

                              /*
                              mic ? Container(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.mic,
                                    color: Colors.deepOrange,
                                    size: 25,
                                  )) : Container(padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                    size: 25,
                                  )),

                               */

                              //SizedBox(width: 3,),
                              Text(elapsedTime, style: TextStyle(fontSize: 20.0, color:Colors.black45)),



                            ],
                          )
                      )
                      ,

                      SizedBox(width: 10,),





                      Expanded(
                          child: WaveDotWidget(progress:(watch.elapsedMilliseconds % 10000) / 10000)
                      ),


                    ],
                  )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      //Icon(Icons.lock_open, color: Colors.black54,),\

                      Container(
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              GestureDetector(

                                onTap: (){
                                  event = widget.label2;

                                  stopWatch();
                                  isPlay = false;
                                  isPause = true;
                                  setState(() {
                                    show1 = false;
                                    showPlayer = false;
                                  });

                                },
                                child:  Icon(
                                  Icons.delete_sharp,
                                  color: Colors.black26,
                                  size: 38,
                                ),
                              ),
                              /*

                              mic ? Container(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.mic,
                                    color: Colors.deepOrange,
                                    size: 25,
                                  )) : Container(padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                    size: 25,
                                  )),


                              SizedBox(width: 3,),
                              Text(elapsedTime, style: TextStyle(fontSize: 20.0, color:Colors.black45)),

                               */
                            ],
                          )
                      )
                      ,
                      SizedBox(width: 180,) ,
                       GestureDetector(

                            onTap: (){
                             // event = widget.label2;
                              event = watch.elapsedMilliseconds.toString();
                              stopWatch();

                              setState(() {
                                showPlayer = true;
                              });

                            },
                            child:  Icon(
                            Icons.stop_circle_outlined,
                            color: Colors.red,
                            size: 45,
                            ),
                      ),

                      SizedBox(width: 30,),





                    ],
                  )
                ],
              )
              :    Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  //Icon(Icons.lock_open, color: Colors.black54,),\

                  Container(
                      child: Row(
                        children: [

                          mic ? Container(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.mic,
                                color: Colors.deepOrange,
                                size: 25,
                              )) : Container(padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.mic,
                                color: Colors.white,
                                size: 25,
                              )),
                          SizedBox(width: 3,),
                          Text(elapsedTime, style: TextStyle(fontSize: 20.0, color:Colors.black45)),
                        ],
                      )
                  )
                  ,

                  SizedBox(width: 90,),
                  Icon(Icons.arrow_back, color: Colors.black54, size: 12,),
                  SizedBox(width: 10,),
                  Text(
                    'Geser untuk membatalkan',
                    style: TextStyle(
                        fontSize: 9,
                        color: Colors.black45
                    ),
                  ),
                  SizedBox(width: 60,),





                ],
              )

              /*
              Center(
                  child: Text(
                    '${widget.label2.toUpperCase()}',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  )), */
            ),


          ):  Container(),

          Positioned(
            left: buttonXPosition - deltaButton,
            right:buttonXXPosition,
            top: buttonPosition - deltaButton,
            child:
            show == false && show1 == true?
            GestureDetector(

              onTap: (){

               // event = watch.elapsedMilliseconds.toString();
                setState(() {
                  show1 = false;
                });
               // stopWatch();
                widget.onSelected!(event!);
              },
              // onPanUpdate: onPanUpdate,
              // onPanEnd: onPanEnd,
              child: Container(
                  width: 56.0 + deltaButton,
                  height: 53.0 + deltaButton,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  child:
                  const Center(
                      child:Icon(Icons.send, color: Colors.white,)
                  )

                /*
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_up,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                      ),
                    ],
                  ),

                   */

              ),
            )
            :GestureDetector(
              onLongPress: (){
                setState(() {
                  show = true;
                  show1 = true;
                  deltaButton = 50;
                });
                startWatch();
                event = widget.label3;
                onPanUpdate;
                widget.onSelected!(event!);

              },
              onLongPressMoveUpdate:onPanUpdate,
              onLongPressEnd: (details){



                if (buttonPosition < 80) {
                  show = false;
                  event = widget.label1;
                  onPanEnd();
                } else if (buttonXPosition < 80) {


                  event = widget.label2;
                  stopWatch();
                  setState(() {
                    show1 = false;
                  });
                  onPanEnd();
                }else{
                  if(show1 == true && show == true){
                   // show1 = false;
                    event = 'i'+watch.elapsedMilliseconds.toString();
                    setState(() {
                      show1 = false;
                    });
                    stopWatch();
                    widget.onSelected!(event!);
                  }else{
                    show1 = false;
                    event = watch.elapsedMilliseconds.toString();
                    stopWatch();
                    onPanEnd();
                  }



                }

                setState(() {
                  show = false;
                  deltaButton = 0;
                });



              },
              // onPanUpdate: onPanUpdate,
              // onPanEnd: onPanEnd,
              child: Container(
                  width: 56.0 + deltaButton ,
                  height: 53.0 + deltaButton ,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  child:
                  //QuarterCircle(
                  //  circleAlignment: CircleAlignment.bottomRight,
                  //  color: Colors.green,
                  //),
                  Center(
                    child:Icon(Icons.mic, color: Colors.white, size: show1 == true && show == true? 40 : 26)
                  )

                /*
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_up,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                      ),
                    ],
                  ),

                   */

              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPanUpdate(LongPressMoveUpdateDetails details) {
    setState(() {

     // if (buttonPosition <= 111 && buttonXPosition <= 111 ){
      if((buttonXPosition > widget.widthSC! - 62.0 -6 && buttonXPosition < widget.widthSC! - 62.0 +6) && buttonPosition <= 120.0){
        buttonPosition += details.localOffsetFromOrigin.dy;
      }
      if(( buttonPosition > 117.0  && buttonPosition < 123.0) && buttonXPosition <= widget.widthSC! - 62.0 ){
        buttonXPosition += details.localOffsetFromOrigin.dx;
        buttonXXPosition -= details.localOffsetFromOrigin.dx;
      }





        if (buttonPosition < 80) {
          gradient = [
            Colors.green,
            Colors.white,
          ];
          event = widget.label1;
        } else if (buttonXPosition < 80) {
          gradient = [
            Colors.white,
            Colors.green,
          ];
          event = widget.label2;
        } else {
          gradient = [
            Colors.white,
            Colors.white,
          ];
          event = null;
        }
     // }


      /*
      buttonPosition += details.delta.dy;
      if (buttonPosition < 30) {
        buttonPosition = 30;
      } else if (buttonPosition > 180) {
        buttonPosition = 190;
      }

      if (buttonPosition < 80) {
        gradient = [
          Colors.green,
          Colors.white,
        ];
        event = widget.label1;
      } else if (buttonPosition > 140) {
        gradient = [
          Colors.white,
          Colors.red,
        ];
        event = widget.label2;
      } else {
        gradient = [
          Colors.white,
          Colors.white,
        ];
        event = null;
      }

       */
    });
  }

  void onPanEnd() {
    setState(() {
      buttonPosition = 120.0;
      buttonXPosition = widget!.widthSC! - 62.0;
      buttonXXPosition = 0.0;
      gradient = [
        Colors.white,
        Colors.white,
      ];

      widget!.onSelected!(event!);
    });
  }
}


enum CircleAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class QuarterCircle extends StatelessWidget {
  final CircleAlignment circleAlignment;
  final Color color;

  const QuarterCircle({
    this.color = Colors.grey,
    this.circleAlignment = CircleAlignment.topLeft,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRect(
        child: CustomPaint(
          painter: QuarterCirclePainter(
            color!,
            circleAlignment,
          ),
        ),
      ),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  final CircleAlignment? circleAlignment;
  final Color? color;

  const QuarterCirclePainter(this.color, this.circleAlignment);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.height, size.width);
    final offset = circleAlignment == CircleAlignment.topLeft
        ? const Offset(.0, .0)
        : circleAlignment == CircleAlignment.topRight
        ? Offset(size.width, .0)
        : circleAlignment == CircleAlignment.bottomLeft
        ? Offset(.0, size.height)
        : Offset(size.width, size.height);
    canvas.drawCircle(offset, radius, Paint()..color = color!);
  }

  @override
  bool shouldRepaint(QuarterCirclePainter oldDelegate) {
    return color == oldDelegate.color &&
        circleAlignment == oldDelegate.circleAlignment;
  }
}



class WaveDotWidget extends StatefulWidget {
  final double? progress;
  const WaveDotWidget({Key? key, this.progress}) : super(key: key);

  @override
  State<WaveDotWidget> createState() => _WaveDotWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _WaveDotWidgetState extends State<WaveDotWidget>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
    _controller!.value = 1.0;

  }


  
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller!,
        child: Container(height: 40,child: Text('Hallllooooooooooooooo'),),
        builder: (context, snapshot) {
          return  CustomPaint(
              painter: DashLinePainter(progress:widget!.progress! > 1.0 ? 1.0 : widget!.progress!),
            );

        });
  }
}


class DashLinePainter extends CustomPainter {
  final double? progress;

  DashLinePainter({this.progress});

  final Paint _paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width * progress!, size.height / 2);

    Path dashPath = Path();

    double dashWidth = 10.0;
    double dashSpace = 5.0;
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }
    canvas.drawPath(dashPath, _paint);
  }

  @override
  bool shouldRepaint(DashLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}