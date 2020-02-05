import 'package:flutter/material.dart';

class MIUIAppBar extends StatefulWidget implements PreferredSizeWidget {
  MIUIAppBar({Key key, @required this.title, this.actions}) : super(key: key);
  final String title;
  final List<Widget> actions;
  @override
  State<StatefulWidget> createState() => _MIUIAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _MIUIAppBarState extends State<MIUIAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: widget.actions,
    );
  }
}
