import 'package:example/markdown/syntax_highlight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DartMarkdown extends MarkdownBody {
  DartMarkdown({
    @required String data,
    @required BuildContext context,
  }) : super(
          data: data,
          syntaxHighlighter: DartSyntaxHighlighter(
            Theme.of(context).brightness == Brightness.light
                ? SyntaxHighlighterStyle.lightThemeStyle()
                : SyntaxHighlighterStyle.darkThemeStyle(),
          ),
          styleSheet: MarkdownStyleSheet(
            code: TextStyle(
              backgroundColor: Colors.transparent,
            ),
            codeblockDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black12
                  : Colors.white10,
            ),
          ),
        );
}
