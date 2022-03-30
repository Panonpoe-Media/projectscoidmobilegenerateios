import 'package:flutter/material.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideosPlayerWidget extends StatefulWidget {
  final dynamic video;
  final Function? onComplete;
  const YoutubeVideosPlayerWidget({Key? key, this.video, this.onComplete})
      : super(key: key);
  @override
  _YoutubeVideosPlayerWidgetState createState() =>
      _YoutubeVideosPlayerWidgetState();
}

class _YoutubeVideosPlayerWidgetState extends State<YoutubeVideosPlayerWidget> {
//  YoutubePlayerController _controller;
  @override
  void initState() {
    /*
    String videoId = YoutubePlayer.convertUrlToId(widget.video['url']);
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );

     */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    /*
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      onReady: () {
        print('Player is ready.');
      },
      onEnded: (data) {
        print('Video completo $data');
        widget.onComplete(widget.video);
      },
    );

     */
  }
}
