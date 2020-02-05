import 'package:flutter/material.dart';

class MIUIListTileTrailing extends StatelessWidget {
  MIUIListTileTrailing({
    Key key,
    this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        this.child == null
            ? SizedBox()
            : DefaultTextStyle(
                style: TextStyle(
                  color: Colors.grey,
                ),
                child: this.child,
              ),
        SizedBox(width: 10),
        Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ],
    );
  }
}

class MIUIListTileSubtitle extends StatelessWidget {
  MIUIListTileSubtitle({
    Key key,
    @required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.grey,
      ),
      child: this.child,
    );
  }
}
