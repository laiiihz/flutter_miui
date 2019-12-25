import 'package:flutter/material.dart';

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