import 'package:flutter/material.dart';

showMIUIMenu({
  @required BuildContext context,
  List<PopupMenuItem> items,
  RelativeRect rect,
}) {
  showMenu(
      context: context,
      position: rect,
      items: items,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ));
}