import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';

class ColorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ColorViewState();
}

class _ColorViewState extends State<ColorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MIUIAppBar(),
    );
  }
}
