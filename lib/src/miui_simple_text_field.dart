import 'package:flutter/material.dart';

var _outlineBorder =  OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: BorderSide(
    color: Colors.transparent
  ),
);

class MIUISimpleTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MIUISimpleTextFieldState();
}

class _MIUISimpleTextFieldState extends State<MIUISimpleTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: MediaQuery.of(context).platformBrightness==Brightness.dark?Color(0xff222222):Color(0xffF0F0F0),
        contentPadding: EdgeInsets.only(
          bottom: 0,
          left: 20,
          right: 20,
          top: 10,
        ),
        border:_outlineBorder,
        disabledBorder: _outlineBorder,
        enabledBorder: _outlineBorder,
        errorBorder: _outlineBorder,
        focusedBorder: _outlineBorder,
        focusedErrorBorder: _outlineBorder,
      ),
    );
  }
}
