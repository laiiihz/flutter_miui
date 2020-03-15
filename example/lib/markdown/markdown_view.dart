import 'package:example/markdown/markdown_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';

class MarkdownView extends StatefulWidget {
  MarkdownView({
    Key key,
    @required this.data,
    @required this.title,
  }) : super(key: key);
  final String title;
  final String data;
  @override
  State<StatefulWidget> createState() => _MarkdownViewState();
}

class _MarkdownViewState extends State<MarkdownView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MIUIAppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: DartMarkdown(
          data: widget.data,
          context: context,
        ),
      ),
    );
  }
}
