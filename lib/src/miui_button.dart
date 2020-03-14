import 'package:flutter/material.dart';

///MIUI Button
///
///Create a MIUI11 Style Button
class MIUIButton extends StatelessWidget {
  MIUIButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.color,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: MaterialButton(
        elevation: 0,
        focusElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        color: Theme.of(context).brightness == Brightness.light
            ? Color(0xfff6f6f6)
            : Color(0xff39393b),
        textColor:
            color == null ? Theme.of(context).textTheme.caption.color : color,
        padding: EdgeInsets.only(top: 14, bottom: 14),
        onPressed: this.onPressed,
        child: this.child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
