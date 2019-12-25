import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MIUITag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 30,
        maxHeight: 30,
      ),
      child: Container(
        height: 30,
        width: 20,
        child: Center(
          child: Text('test'),
        ),
        decoration: BoxDecoration(
          color: Colors.pink,
          border: Border.fromBorderSide(BorderSide()),
        ),
      ),
    );
  }
}
