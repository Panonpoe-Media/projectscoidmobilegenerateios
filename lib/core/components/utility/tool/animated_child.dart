import 'package:flutter/material.dart';

class AnimatedChildVar extends AnimatedWidget {
  final int? index;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final Widget? child;

  final String? label;
  final TextStyle? labelStyle;
  final Color? labelBackgroundColor;
  final Widget? labelWidget;

  final bool? visible;
  final VoidCallback? onTap;
  final VoidCallback? toggleChildren;
  final ShapeBorder? shape;
  final String? heroTag;

  AnimatedChildVar({
    Key? key,
    required Animation<double> animation ,
    required this.index,
    required this.backgroundColor,
    required this.foregroundColor,
    this.elevation = 6.0,
    required this.child,
    required this.label,
    required this.labelStyle,
    required this.labelBackgroundColor,
    required this.labelWidget,
    this.visible = false,
    required this.onTap,
    required  this.toggleChildren,
    required this.shape,
    required this.heroTag,
  }) : super(key: key, listenable: animation);
  Animation<double> get _progress => listenable as Animation<double>;
  Widget buildLabel() {
   // final  Animation<double> animation = listenable;


    if (!((label != null || labelWidget != null) && visible! && _progress.value == 48.0)) {
      return Container();
    }

    if (labelWidget != null) return labelWidget!;

    return GestureDetector(
      onTap: _performAction,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
        margin: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: labelBackgroundColor ?? Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              offset: Offset(0.8, 0.8),
              blurRadius: 2.4,
            )
          ],
        ),
        child: Text(label!, style: labelStyle),
      ),
    );
  }

  void _performAction() {
    if (onTap != null) onTap!();
    toggleChildren!();
  }

  Widget build(BuildContext context) {
    //final Animation<double> animation = listenable;

    final Widget buttonChild = _progress.value > 47.0
        ? Container(
            width: _progress.value,
            height: _progress.value,
            child: child ?? Container(),
          )
        : Container(
            width: 0.0,
            height: 0.0,
          );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          buildLabel(),
          Container(
            width: 48.0,
            height: _progress.value,
            padding: EdgeInsets.only(bottom: 50.0 - _progress.value),
            child: Container(
              height: 48.0,
              width: _progress.value,
              padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
              child: FloatingActionButton(
                heroTag: heroTag,
                onPressed: _performAction,
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                elevation: elevation ?? 6.0,
                child: buttonChild,
              ),
            ),
          )
        ],
      ),
    );
  }
}
