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
      appBar: MIUIAppBar(title: 'Dialog Demo'),
      body: ListView(
        physics: MIUIScrollPhysics(),
        children: <Widget>[
          MIUIButton(
            child: Text('Dialog Standard'),
            onPressed: () {
              showMIUIDialog(
                context: context,
                dyOffset: 0.5,
                content: Text('test'),
                label: 'test',
              );
            },
          ),
          MIUIButton(
            child: Text('Dialog Confirm'),
            onPressed: () {
              showMIUIConfirmDialog(
                context: context,
                child: Text('test'),
                confirm: () {},
                title: 'title',
              );
            },
          ),
          MIUIButton(
            child: Text('Dialog Colored'),
            onPressed: () {
              showMIUIDialog(
                context: context,
                content: Text('DEMO'),
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
