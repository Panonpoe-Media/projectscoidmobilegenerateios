
import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/models/messages/video_message_model.dart';
import 'package:projectscoid/views/Chat/widgets/chat/messages_types/generic_message_widget.dart';
import 'package:projectscoid/views/Chat/widgets/chat/messages_types/video_message/local_videos_player_widget.dart';
import 'package:projectscoid/views/Chat/widgets/chat/messages_types/video_message/youtube_videos_player_widget.dart';

class VideoMessageWidget extends StatefulWidget {
  final dynamic message;
  final Function? onMediaView;
  final Function? onPayloadPress;
  const VideoMessageWidget(
      {Key? key, this.message, this.onMediaView, this.onPayloadPress})
      : super(key: key);

  @override
  _VideoMessageWidgetState createState() => _VideoMessageWidgetState();
}

class _VideoMessageWidgetState extends State<VideoMessageWidget> {
  late VideoMessageModel _videoMessage;

  @override
  Widget build(BuildContext context) {
    _videoMessage = VideoMessageModel.fromJson(this.widget.message);
    /* Keep the history working... */
    if (_videoMessage.attachment?.mobile == null) {
      return GenericMessageWidget(
        key: GlobalKey(),
        message: widget.message,
        onPayloadPress: widget.onPayloadPress!,
      );
    }
    return ListView.builder(
      itemCount: _videoMessage.attachment!.mobile!.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return _videoMessage.attachment?.mobile![index]['source'] == 'youtube'
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: YoutubeVideosPlayerWidget(
                  video: _videoMessage.attachment?.mobile![index],
                  onComplete: __onCompleteHandler,
                ))
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: LocalVideosPlayerWidget(
                  video: _videoMessage.attachment!.mobile![index],
                  onComplete: __onCompleteHandler,
                ));
      },
    );
  }

  __onCompleteHandler(dynamic video) {
    widget.onMediaView!(
        video['url'], _videoMessage.sId, _videoMessage.sessionId);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
