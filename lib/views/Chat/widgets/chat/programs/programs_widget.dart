import 'package:flutter/material.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'package:projectscoid/views/Chat/models/models.dart';
import 'package:projectscoid/views/Chat/widgets/chat/programs/program-item_widget.dart';
import 'package:projectscoid/views/Chat/widgets/commons/empty_warning_widget.dart';

class ProgramsWidget extends StatefulWidget {
  final ChatBloc? bloc;
  final UserModel? user;

  const ProgramsWidget({Key? key, this.bloc, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProgramsWidgetState();
}

class _ProgramsWidgetState extends State<ProgramsWidget> {
  @override
  void initState() {
    super.initState();
    widget.bloc?.getPrograms(widget.user!);
  }
/*
  void _toggleSubscription(ProgramModel program) {
    widget.bloc.subscribeUnsubscribe(program, widget.user);
  }

 */

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.bloc?.programsListStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Widget _widget = const IgnorePointer();
        if (snapshot.hasData) {
          if (snapshot.data.length > 0) {
            _widget = const Padding(
              padding: EdgeInsets.only(top: 8),
              child: SizedBox(),
                  /*
              ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => ProgramItem(
                  program: ProgramModel.fromJson(snapshot.data[index]),
                  user: widget.user!,
                  onTap: _toggleSubscription,
                ),
              ),

                   */
            );
          } else {
            _widget = EmptyWarningWidget(
              Icons.playlist_add_check,
              message: 'No Available Programs Yet',
            );
          }
        }
        return _widget;
      },
    );
  }
}
