import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projectscoid/views/Chat/models/messages/list_message_model.dart';
import 'package:projectscoid/views/Chat/widgets/commons/messages/messages.dart';

class ListMessageWidget extends StatefulWidget {
  final dynamic message;
  final Function? onPayloadPress;
  const ListMessageWidget({Key? key, this.message, this.onPayloadPress})
      : super(key: key);
  @override
  _ListMessageWidgetState createState() => _ListMessageWidgetState();
}

class _ListMessageWidgetState extends State<ListMessageWidget> {
  ListMessageModel? _listMessageModel;

  @override
  Widget build(BuildContext context) {
    _listMessageModel = ListMessageModel.fromJson(widget.message);
    return Column(
      children: <Widget>[
        Column(mainAxisSize: MainAxisSize.max, children: _cardsList),
        Column(mainAxisSize: MainAxisSize.max, children: _buttons),
      ],
    );
  }

  List<Widget> get _cardsList {
    List<Widget> cards = [];
    _listMessageModel?.attachment?.payload?.elements?.forEach((element) {
      cards.add(Padding(
          child: CardWidget(
            element,
            onPayloadPress: widget.onPayloadPress,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5.0)));
    });
    return cards;
  }

  List<Widget> get _buttons {
    List<Widget> btnsList = [];
    _listMessageModel?.attachment?.payload?.buttons?.forEach((button) {
      btnsList.add(SizedBox(
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: OutlineButton(
                child: Text(button.title!),
                onPressed: () {
                  widget.onPayloadPress!(button);
                },
              ))));
    });
    return btnsList;
  }
}
