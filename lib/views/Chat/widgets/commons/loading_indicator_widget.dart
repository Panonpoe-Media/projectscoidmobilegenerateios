import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Center(
              child: LoadingBouncingGrid.square(
                borderSize: 3.0,
                size: 70.0,
                backgroundColor: Colors.grey,
                duration: Duration(milliseconds: 800),
              ),
            ),
          )
        ]);
  }
}
