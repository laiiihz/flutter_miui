import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';

class AnimatedTextView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedTextViewState();
}

class _AnimatedTextViewState extends State<AnimatedTextView> {
  int _value = 0;
  double _valueDouble = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MIUIAppBar(
        title: Text('AnimatedText'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        physics: MIUIScrollPhysics(),
        children: <Widget>[
          Row(
            children: <Widget>[
              MIUIButton(
                child: Text('+'),
                onPressed: () {
                  setState(() {
                    _value += 10;
                    _valueDouble += 10;
                  });
                },
              ),
              MIUIButton(
                child: Text('-'),
                onPressed: () {
                  setState(() {
                    _value -= 10;
                    _valueDouble -= 10;
                  });
                },
              ),
            ],
          ),
          AnimatedText(
            value: _value,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          AnimatedText(
            valueDouble: _valueDouble,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}
