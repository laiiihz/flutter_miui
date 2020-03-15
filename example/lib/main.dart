import 'package:example/HomePage.dart';
import 'package:example/pages/appbar_view.dart';
import 'package:example/pages/button_view.dart';
import 'package:example/pages/dialog_view.dart';
import 'package:example/pages/textfield_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MIUI demo',
      theme: ThemeData.dark(),
      //    darkTheme: ThemeData.dark(),
      initialRoute: 'main',
      routes: {
        'main': (context) => HomePage(),
        'button': (context) => ButtonView(),
        'dialog': (context) => DialogView(),
        'appbar': (context) => AppBarView(),
        'textfield': (context) => TextFieldView(),
      },
    );
  }
}
