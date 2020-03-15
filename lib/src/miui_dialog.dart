import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';

showMIUIDialog({
  @required BuildContext context,
  @required double dyOffset,
  @required Widget content,
  @required String label,
  bool dismissible = true,
  bool haveTextField = false,
  bool noPadding = false,
  Color color,
}) {
  showGeneralDialog(
      context: context,
      barrierColor: Colors.black26,
      barrierLabel: label,
      barrierDismissible: dismissible,
      transitionDuration: Duration(milliseconds: 250),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              padding: noPadding ? null : EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  content,
                  AnimatedContainer(
                    curve: Curves.easeInOutCubic,
                    duration: Duration(milliseconds: 200),
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final value = Curves.easeInOutCubic.transform(animation.value);
        return Transform.translate(
          offset: Offset(0, (1 - value) * dyOffset * 1000),
          child: child,
        );
      });
}

class MIUIDialogTitle extends StatelessWidget {
  MIUIDialogTitle(
    this.title, {
    Key key,
  })  : assert(title != null),
        super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Text(
          this.title,
          style: TextStyle(
            color: Theme.of(context).textTheme.caption.color,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class MIUIDialogButton extends StatelessWidget {
  MIUIDialogButton({
    Key key,
    @required this.onPressed,
    @required this.child,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MIUIButton(
      child: child,
      onPressed: onPressed,
    );
  }
}

class MIUIConfirmContent extends StatelessWidget {
  MIUIConfirmContent({
    Key key,
    @required this.child,
    @required this.title,
    @required this.confirm,
    this.cancel,
    @required this.cancelString,
    @required this.confirmString,
    this.single = false,
  }) : super(key: key);
  final Widget child;
  final String title;
  final VoidCallback confirm;
  final VoidCallback cancel;
  final String cancelString;
  final String confirmString;
  final bool single;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MIUIDialogTitle(this.title),
        this.child,
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            this.single
                ? SizedBox()
                : Expanded(
                    child: MIUIDialogButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (this.cancel != null) this.cancel();
                      },
                      child: Text(this.cancelString),
                    ),
                  ),
            SizedBox(width: this.single ? 0 : 10),
            Expanded(
              child: MIUIDialogButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (this.confirm != null) this.confirm();
                },
                child: Text(
                  this.confirmString,
                  style: TextStyle(
                    color: Color(0xff179AF3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

showMIUIConfirmDialog({
  @required BuildContext context,
  @required Widget child,
  @required String title,
  @required VoidCallback confirm,
  String cancelString = '取消',
  String confirmString = '确定',
  VoidCallback cancel,
  Color color,
  bool single = false,
}) {
  showMIUIDialog(
      context: context,
      dyOffset: 0.4,
      color: color,
      content: MIUIConfirmContent(
        child: child,
        title: title,
        confirm: confirm,
        cancel: cancel,
        confirmString: confirmString,
        cancelString: cancelString,
        single: single,
      ),
      label: '${Random().nextDouble()}');
}

class MIUIDialogTextField extends StatelessWidget {
  MIUIDialogTextField({
    Key key,
    @required this.textEditingController,
    @required this.title,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final String title;
  final borderDecoration = OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff0196FF), width: 2),
    borderRadius: BorderRadius.circular(16),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          this.title,
          style: TextStyle(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
              fontSize: 18),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: TextField(
            controller: this.textEditingController,
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Color(0xff141414)
                      : Color(0xffeeeeee),
              border: borderDecoration,
              disabledBorder: borderDecoration,
              enabledBorder: borderDecoration,
              errorBorder: borderDecoration,
              focusedErrorBorder: borderDecoration,
              focusedBorder: borderDecoration,
            ),
          ),
        )
      ],
    );
  }
}
