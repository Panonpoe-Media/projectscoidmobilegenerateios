
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:projectscoid/views/Chat/models/messages/messages.dart';
import 'package:projectscoid/views/Chat/widgets/commons/loading_indicator_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageMessageWidget extends StatelessWidget {
  final dynamic message;

  const ImageMessageWidget({Key? key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SendMsgModel1 imageModel = SendMsgModel1.fromJson(message);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        LoadingIndicatorWidget(),
        Center(
            child: GestureDetector(
          child: FadeInImage.memoryNetwork(
            image: imageModel.attachment!,
            placeholder: kTransparentImage,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullScreenWrapper(
                          imageProvider:
                             //  Image(image: FileImage(File(path)))
                              NetworkImage(imageModel.attachment!),
                        )));
          },
        )),
      ],
    );
  }
}

class FullScreenWrapper extends StatelessWidget {
  const FullScreenWrapper(
      {this.imageProvider,
      this.loadingChild,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale,
      this.initialScale,
      this.basePosition = Alignment.center});

  final ImageProvider? imageProvider;
  final Widget? loadingChild;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final dynamic initialScale;
  final Alignment? basePosition;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: imageProvider,
          loadingBuilder: (context, event) => Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            ),
          ),
          backgroundDecoration: backgroundDecoration,
          minScale: minScale,
          maxScale: maxScale,
          initialScale: initialScale,
          basePosition: basePosition,
        ));
  }
}