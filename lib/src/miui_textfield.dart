import 'package:flutter/material.dart';

class MIUITextField extends TextField {
  MIUITextField({
    TextEditingController controller,
    Color primaryColor,
    Color enabledColor = Colors.grey,
    @required BuildContext context,
    String hintText,
    String errorText,
  }) : super(
          controller: controller,
          showCursor: true,
          cursorColor: primaryColor == null ? Color(0xff179AF3) : primaryColor,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            fillColor: Theme.of(context).brightness == Brightness.light
                ? Color(0xffEEEEEE)
                : Color(0xff141414),
            filled: true,
            border: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(
                width: 2,
                color: primaryColor == null ? Color(0xff179AF3) : primaryColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: primaryColor == null ? Color(0xff179AF3) : primaryColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        );
}
