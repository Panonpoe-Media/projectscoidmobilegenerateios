import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/models/models.dart';

class ProgramItem extends StatelessWidget {
//  final ProgramModel program;
  final String? program;
  final UserModel? user;
  final Function? onTap;

  const ProgramItem({Key? key, this.program, this.user, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.arrow_right),
     // title: Text(program.name),
      title: Text(''),
      subtitle: Text(
        '',
        //program.description,
        maxLines: 3,
        textAlign: TextAlign.justify,
        overflow: TextOverflow.ellipsis,
      ),
      dense: true,
      //trailing:
          /*
            IconButton(
          icon: subscribeUnsubscribeIcon,
          color: isSubscribed ? Colors.green[400] : Colors.grey[400],
          onPressed: () => onTap!(program)),
          */

    );


  }

 // get isSubscribed => program.users.contains(user?.sId);

 // Widget get subscribeUnsubscribeIcon =>
  //   Icon(isSubscribed ? Icons.check_circle : Icons.check_circle_outline);
}
