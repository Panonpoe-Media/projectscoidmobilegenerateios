
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projectscoid/views/Chat/models/messages/messages.dart';
import 'package:projectscoid/views/Chat/pages/styles.dart';

class QuickReplyMessageWidget extends StatefulWidget {
  final dynamic message;
  final Function? onPayloadPress;
  const QuickReplyMessageWidget({Key? key, this.message, this.onPayloadPress})
      : super(key: key);

  @override
  _QuickReplyMessageWidgetState createState() =>
      _QuickReplyMessageWidgetState();
}

class _QuickReplyMessageWidgetState extends State<QuickReplyMessageWidget> {
  QuickReplyMessageModel? _quickReplyModel;

  @override
  Widget build(BuildContext context) {
    _quickReplyModel = QuickReplyMessageModel.fromJson(widget.message);
    return Card(
        child: Column(
      children: <Widget>[
        Padding(
          child:
              Text(_quickReplyModel!.text!, style: Styles.messageTitleTextStyle),
          padding: Styles.massageTitlePadding,
        ),
        Column(
          children: buttons(),
        )
      ],
    ));
  }

  quickReplyBtn(QuickReplies quickReply) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: OutlineButton(
              child: Text(quickReply.title!),
              onPressed: () {
                widget.onPayloadPress!(quickReply);
              },
            )));
  }

  List<Widget> buttons() {
    List<Widget> btnsList = [];
    if (_quickReplyModel?.quickReplies != null) {
      _quickReplyModel?.quickReplies
          ?.forEach((quickReply) => btnsList.add(quickReplyBtn(quickReply)));
    }
    return btnsList;
  }
}
