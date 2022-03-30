import 'package:flutter/material.dart';

class BlockQuote extends StatelessWidget {
  ///
  /// Creates a <blockquote> like HTML </blockquote>
  ///
  const BlockQuote(
      {Key? key,
        @required this.child,
        this.blockColor,
        this.blockWidth,
        this.outerPadding,
        this.childPadding})
      : super(key: key);

  ///
  /// The [child] contained by the BlockQuote.
  ///
  /// [required]
  ///
  final Widget? child;

  ///
  /// BlockQuote's vertical line color
  ///
  /// default to [Theme]'s `accentColor`
  ///
  final Color? blockColor;

  ///
  /// BlockQuote's vertical line width
  ///
  /// default to `4.0`
  ///
  final double? blockWidth;

  ///
  /// BlockQuote's outer padding
  ///
  /// default to `const EdgeInsets.symmetric(horizontal: 15)`
  ///
  final EdgeInsetsGeometry? outerPadding;

  ///
  /// BlockQuote's outer padding
  ///
  /// default to `const EdgeInsets.only(left: 15, top: 5, bottom: 5)`
  ///
  final EdgeInsetsGeometry? childPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding ?? const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: blockColor ?? Theme.of(context).accentColor,
              width: blockWidth ?? 4.0,
            ),
          ),
        ),
        child: Padding(
          padding: childPadding ??
              const EdgeInsets.only(left: 15, top: 5, bottom: 5),
          child: child ?? SizedBox.shrink(),
        ),
      ),
    );
  }
}