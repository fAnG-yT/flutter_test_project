import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemHero extends StatelessWidget {
  ItemHero({this.width, this.child, this.onTap, this.tag, this.height})
      : super();
  final double width;
  final Widget child;
  final VoidCallback onTap;
  final int tag;
  final double height;

  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Hero(
        tag: tag,
        child: Material(
          child: InkWell(
            onTap: onTap,
            child: child,
          ),
        ),
      ),
    );
  }
}
