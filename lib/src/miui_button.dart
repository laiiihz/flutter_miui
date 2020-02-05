import 'package:flutter/material.dart';

class MIUIButton extends StatelessWidget {
  MIUIButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.colored = true,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onPressed;
  final bool colored;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      color: colored ? Theme.of(context).primaryColor : null,
      splashColor: colored ? Color(0xff0099FF) : null,
      textColor: colored
          ? Color(0xddffffff -
              Theme.of(context).textTheme.title.color.value +
              0xdd000000)
          : null,
      padding: EdgeInsets.only(top: 14, bottom: 14),
      onPressed: this.onPressed,
      child: this.child,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
