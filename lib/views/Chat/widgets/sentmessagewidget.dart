import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';

class SentMessageWidget extends StatelessWidget {
  final int i;
  const SentMessageWidget({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager =  Provider.of<ThemeManager>(context);
    final ChatModel chat = messages[i];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "${chat.time}",
            style: Theme.of(context).textTheme.bodyText2?.apply(color: Colors.grey),
          ),
          const SizedBox(width: 15),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .6),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: myColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Text(
              "${chat.message}",
              style: Theme.of(context).textTheme.bodyText2?.apply(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
