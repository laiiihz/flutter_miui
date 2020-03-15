import 'package:example/markdown/markdown_value.dart';
import 'package:example/markdown/markdown_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';

class ButtonView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MIUIAppBar(
        title: Text('按钮 Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MarkdownView(
                    data: MV.buttonAll,
                    title: 'Button Code',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        physics: MIUIScrollPhysics(),
        children: <Widget>[
          MIUIButton(
            child: Text('按钮 standard'),
            onPressed: () {},
          ),
          MIUIButton(
            child: Text('按钮 danger'),
            onPressed: () {},
            color: MIUIStateColor.danger,
          ),
          MIUIButton(
            child: Text('按钮 info'),
            onPressed: () {},
            color: MIUIStateColor.info,
          ),
          MIUIButton(
            child: Text('按钮 warn'),
            onPressed: () {},
            color: MIUIStateColor.warn,
          ),
        ],
      ),
    );
  }
}
