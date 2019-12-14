library flutter_miui;

import 'dart:math';

import 'package:flutter/material.dart';

showMIUIDialog({
  @required BuildContext context,
  @required double dyOffset,
  @required Widget content,
  @required String label,
  bool dismissible = true,
  bool haveTextField = false,
  bool noPadding = false,
  Color color = Colors.white,
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
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Color(0xff222124)
                : Colors.white,
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

class MIUIListTile extends StatelessWidget {
  MIUIListTile({
    Key key,
    this.title,
    this.onPressed,
    this.subTitle,
    this.detail,
  }) : super(key: key);
  final Widget title;
  final Widget subTitle;
  final VoidCallback onPressed;
  final Widget detail;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: ListTile(
        leading: Icon(Icons.add),
        title: this.title,
        subtitle: DefaultTextStyle(
          style: TextStyle(
            color: Colors.grey,
          ),
          child: this.subTitle,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            this.detail == null
                ? SizedBox()
                : DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    child: this.detail,
                  ),
            SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class MIUIDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}

class MIUISwitch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MIUISwitchState();
}

class _MIUISwitchState extends State<MIUISwitch> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this._value = !this._value;
      },
      child: AnimatedContainer(
          height: 100,
          width: 100,
          duration: Duration(
            milliseconds: 400,
          )),
    );
  }
}

class MIUIScrollPhysics extends ScrollPhysics {
  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    return AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics());
  }
}

class MIUIAppBar extends StatefulWidget implements PreferredSizeWidget {
  MIUIAppBar({Key key, @required this.title, this.actions}) : super(key: key);
  final String title;
  final List<Widget> actions;
  @override
  State<StatefulWidget> createState() => _MIUIAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _MIUIAppBarState extends State<MIUIAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: widget.actions,
    );
  }
}

class MIUIButton extends StatelessWidget {
  MIUIButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      color: Colors.blueAccent,
      splashColor: Color(0xff0099FF),
      textColor: Colors.white,
      padding: EdgeInsets.only(top: 14, bottom: 14),
      onPressed: this.onPressed,
      child: Text('test'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}

showMIUIMenu({
  @required BuildContext context,
  List<PopupMenuItem> items,
  RelativeRect rect,
}) {
  showMenu(
      context: context,
      position: rect,
      items: items,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ));
}

showMIUIConfirmDialog({
  @required BuildContext context,
  @required Widget child,
  @required String title,
  @required VoidCallback confirm,
  @required String cancelString,
  @required String confirmString,
  VoidCallback cancel,
}) {
  showMIUIDialog(
      context: context,
      dyOffset: 0.4,
      content: MIUIConfirmContent(
        child: child,
        title: title,
        confirm: confirm,
        cancel: cancel,
        confirmString: confirmString,
        cancelString: cancelString,
      ),
      label: '${Random().nextDouble()}');
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
  }) : super(key: key);
  final Widget child;
  final String title;
  final VoidCallback confirm;
  final VoidCallback cancel;
  final String cancelString;
  final String confirmString;
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
            Expanded(
              child: MIUIDialogButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (this.cancel != null) this.cancel();
                },
                child: Text(this.cancelString),
              ),
            ),
            SizedBox(width: 25),
            Expanded(
              child: MIUIDialogButton(
                onPressed: this.confirm,
                colored: true,
                child: Text(this.confirmString),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MIUIDialogButton extends StatelessWidget {
  MIUIDialogButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.colored = false,
  }) : super(key: key);
  final VoidCallback onPressed;
  final bool colored;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      color: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? Color(0xff2F2E31)
          : Color(0xfff6f6f6),
      focusColor: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? Color(0xff2F2F2F)
          : Color(0xffe5e5e5),
      splashColor: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? Color(0xff2F2F2F)
          : Color(0xffe5e5e5),
      onPressed: this.onPressed,
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 18,
            color: colored
                ? Colors.blue
                : MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
          ),
          child: this.child),
    );
  }
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
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
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
