import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import 'mycircleavatar.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';


class ReceivedMessagesWidget extends StatelessWidget {
  final int? i;
  const ReceivedMessagesWidget({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatModel chat = messages[i!];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: <Widget>[
          MyCircleAvatar(
            imgUrl: chat.sender!.avatarUrl!,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${chat.sender?.name}",
                style: Theme.of(context).textTheme.caption,
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Color(0xfff9f9f9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  "${chat.message}",
                  style: Theme.of(context).textTheme.bodyText1?.apply(
                        color: Colors.black87,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Text(
            "${chat.time}",
            style: Theme.of(context).textTheme.bodyText2?.apply(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
