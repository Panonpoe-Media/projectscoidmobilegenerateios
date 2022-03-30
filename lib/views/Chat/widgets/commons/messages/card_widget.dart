import '../../../models/messages/commons/commons.dart';

import 'package:flutter/material.dart';
import '../../../pages/styles.dart';

class CardWidget extends StatelessWidget {
  final Elements? element;
  final Function? onPayloadPress;
  const CardWidget(this.element, {Key? key, required this.onPayloadPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(element!.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _cardTitle,
          _cardSubTitle,
          _cardButtons
        ],
      ),
    );
  }

  Container buttons(List<Buttons> buttons) {
    List<Widget> outlinedButtons = [];
    for (var button in buttons) {
      outlinedButtons.add(SizedBox(
        width: double.infinity,
        child: OutlineButton(
          child: Text(button.title!),
          onPressed: () {
            onPayloadPress!(button);
          },
        )));
    }

    return Container(
        margin: const EdgeInsets.only(left: 10.00, right: 10.00),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: outlinedButtons,
        ));
  }

  get _isImageOnlyElement => element?.defaultAction != null;

  Widget get _cardTitle => !_isImageOnlyElement
      ? Text(element!.title!, style: Styles.cardMessageTitleTextStyle)
      : const IgnorePointer();

  Widget get _cardSubTitle =>
      !_isImageOnlyElement && element?.subtitle != null
          ? Text(element!.subtitle!, style: Styles.cardMessageTitleTextStyle)
          : const IgnorePointer();

  Widget get _cardButtons =>
      element?.buttons != null ? buttons(element!.buttons!) : const IgnorePointer();
}
