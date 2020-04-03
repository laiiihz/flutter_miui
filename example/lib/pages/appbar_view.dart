import 'package:example/markdown/markdown_value.dart';
import 'package:example/markdown/markdown_view.dart';
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>MarkdownView(data: MV.appBar, title: 'AppBar Code',),),
              );
            },
          ),
        ],
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
