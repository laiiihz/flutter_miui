import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';

class AppBarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MIUIAppBar(
        title: Text('应用栏'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        physics: MIUIScrollPhysics(),
        children: <Widget>[
          MIUIAppBar(
            title: Text('应用栏 standard'),
          ),
          MIUIAppBar(
            title: Text('应用栏 actions'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.face),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
