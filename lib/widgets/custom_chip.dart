import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final Widget child;

  CustomChip({
    Key key,
    this.child,
    this.color,
    this.padding,
  });

  final Color color;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    Color _defaultColor = Color.fromRGBO(85, 85, 85, 1);

    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
      decoration: BoxDecoration(
        border: Border.all(
          color: color ?? _defaultColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color ?? _defaultColor,
        ),
        child: child,
      ),
    );
  }
}
