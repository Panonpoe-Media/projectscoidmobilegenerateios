import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/models/messages/generic_message_model.dart';
import 'package:projectscoid/views/Chat/widgets/commons/messages/messages.dart';

class GenericMessageWidget extends StatefulWidget {
  final dynamic message;
  final Function? onPayloadPress;

  const GenericMessageWidget({Key? key, this.message, this.onPayloadPress})
      : super(key: key);

  @override
  _GenericMessageWidgetState createState() => _GenericMessageWidgetState();
}

class _GenericMessageWidgetState extends State<GenericMessageWidget> {
  GenericMessageModel? _genericMessage;

  @override
  Widget build(BuildContext context) {
    _genericMessage = GenericMessageModel.fromJson(this.widget.message);
    return CarouselWidget(
      elements: _genericMessage?.attachment?.payload?.elements,
      onPayloadPress: widget.onPayloadPress,
    );
  }
}
