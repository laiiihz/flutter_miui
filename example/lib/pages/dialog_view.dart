import 'package:example/markdown/markdown_config.dart';
import 'package:example/markdown/markdown_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';

class DialogView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MIUIAppBar(title: Text('对话框 Demo')),
      body: ListView(
        physics: MIUIScrollPhysics(),
        children: <Widget>[
          MIUIButton(
            child: Text('Dialog Standard'),
            onPressed: () {
              showMIUIDialog(
                context: context,
                dyOffset: 0.5,
                content: DartMarkdown(
                  data: MV.dialogStandard,
                  context: context,
                ),
                label: 'test',
              );
            },
          ),
          MIUIButton(
            child: Text('Dialog Confirm'),
            onPressed: () {
              showMIUIConfirmDialog(
                context: context,
                child: DartMarkdown(
                  data: MV.dialogConfirm,
                  context: context,
                ),
                confirm: () {},
                title: 'Dialog Confirm',
              );
            },
          ),
          MIUIButton(
            child: Text('Dialog Single Confirm'),
            onPressed: () {
              showMIUIConfirmDialog(
                context: context,
                single: true,
                child: DartMarkdown(
                  data: MV.dialogSingleConfirm,
                  context: context,
                ),
                confirm: () {},
                title: 'Dialog Confirm',
              );
            },
          ),
          MIUIButton(
            child: Text('Dialog Colored'),
            onPressed: () {
              showMIUIDialog(
                context: context,
                content: DartMarkdown(
                  data: MV.dialogConfirm,
                  context: context,
                ),
                dyOffset: 0.5,
                label: 'demo',
                color: Colors.blueAccent,
              );
            },
          ),
        ],
      ),
    );
  }
}
