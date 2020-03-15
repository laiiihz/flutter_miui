import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';

class TextFieldView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MIUIAppBar(
        title: Text('文本输入框'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        physics: MIUIScrollPhysics(),
        children: <Widget>[
          MIUITextField(context: context),
        ],
      ),
    );
  }
}
