import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

enum videoStatus { playing, paused }

class LocalVideosPlayerWidget extends StatefulWidget {
  final dynamic video;
  final Function? onComplete;

  const LocalVideosPlayerWidget({Key? key, this.video, this.onComplete})
      : super(key: key);

  @override
  _LocalVideosPlayerWidgetState createState() =>
      _LocalVideosPlayerWidgetState();
}

class _LocalVideosPlayerWidgetState extends State<LocalVideosPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  late ChewieController _chewieController;

  dynamic status = videoStatus.paused;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.video['url']);
    videoPlayerController.addListener(_videoPlayerControllerListener);

    _initChewieController();
  }

  void _videoPlayerControllerListener() {
    if (videoPlayerController.value.isInitialized) {
      Duration position = videoPlayerController.value.position;
      Duration duration = videoPlayerController.value.duration;
      if (videoPlayerController.value.isPlaying && status == videoStatus.paused)
        print('Video rodando');
      if (!videoPlayerController.value.isPlaying &&
          status == videoStatus.playing) print('Video pausado');
      if (position.compareTo(duration) == 0) widget.onComplete!(widget.video);
      status = videoPlayerController.value.isPlaying
          ? videoStatus.playing
          : videoStatus.paused;
    }
  }

  void _initChewieController() {
    _chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 16 / 9,
        autoPlay: false,
        looping: false,
        autoInitialize: true);
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
