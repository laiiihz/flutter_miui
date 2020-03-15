import 'package:flutter/material.dart';

class MIUIAppBar extends AppBar {
  MIUIAppBar({
    Widget title,
    List<Widget> actions,
    Widget leading,
  }) : super(
          leading: leading,
          title: title,
          actions: actions,
          centerTitle: true,
        );
}
