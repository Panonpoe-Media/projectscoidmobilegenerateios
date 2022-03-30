
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/models/messages/button_message_model.dart';
import 'package:projectscoid/views/Chat/models/messages/commons/commons.dart';
import 'package:projectscoid/views/Chat/pages/styles.dart';

class ButtonMessageWidget extends StatefulWidget {
  final dynamic message;
  final Function? onPayloadPress;

  const ButtonMessageWidget({Key? key, this.message, this.onPayloadPress})
      : super(key: key);

  @override
  _ButtonMessageWidgetState createState() => _ButtonMessageWidgetState();
}

class _ButtonMessageWidgetState extends State<ButtonMessageWidget> {
  late ButtonMessageModel _buttonMessageModel;

  @override
  Widget build(BuildContext context) {
    _buttonMessageModel = ButtonMessageModel.fromJson(widget.message);
    return Card(
        child: Column(
      children: <Widget>[
        Padding(
          child: Text(_buttonMessageModel.attachment!.payload!.text!,
              style: Styles.messageTitleTextStyle),
          padding: Styles.massageTitlePadding,
        ),
        Column(
          children: buttons(),
        )
      ],
    ));
  }

  List<Widget> buttons() {
    List<Widget> btnsList = [];
    _buttonMessageModel.attachment?.payload?.buttons
        ?.forEach((button) => btnsList.add(SizedBox(
            width: double.infinity,
            child: OutlineButton(
              child: Text(button.title!),
              onPressed: () {
                switch (button.type) {
                  case 'modal':
                    _showModal();
                    break;
                  default:
                    print('Unknow button type: ${button.type}');
                }
              },
            ))));
    return btnsList;
  }

  void _showModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: getAnswers(),
          );
        });
  }

  List<Widget> getAnswers() {
    List<ListTile> answersList = [];
    _buttonMessageModel.attachment?.payload?.modalAnswers?.forEach((answer) {
      answersList.add(ListTile(
        title: Text(answer.title!),
        leading: const Icon(Icons.chevron_right),
        onTap: () {
          Buttons button = Buttons(
              title: answer.title, payload: answer.payload, type: 'modal');
          if (widget.onPayloadPress != null) {
            widget.onPayloadPress!(button);
          }
          Navigator.pop(context);
        },
      ));
    });
    return answersList;
  }
}
