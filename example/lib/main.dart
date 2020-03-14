import 'package:example/pages/button_view.dart';
import 'package:example/pages/dialog_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MIUI demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: 'main',
      routes: {
        'main': (context) => Home(),
        'button': (context) => ButtonView(),
        'dialog': (context) => DialogView(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeState();
  }
}

class HomeState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeState> {
  TextEditingController textEditingController =
      TextEditingController(text: '123');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MIUIAppBar(
        title: 'Flutter-MIUI',
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: ListView(
        physics: MIUIScrollPhysics(),
        children: <Widget>[
          MIUIButton(
            child: Text('按钮'),
            onPressed: () {
              Navigator.of(context).pushNamed('button');
            },
          ),
          MIUIButton(
            child: Text('Dialog'),
            onPressed: () {
              Navigator.of(context).pushNamed('dialog');
            },
          ),
          MIUIButton(
            child: Icon(Icons.add_shopping_cart),
            onPressed: () {
              showMIUIConfirmDialog(
                context: context,
                child: TextField(),
                title: 'test',
                confirm: () {
                  print(Theme.of(context).accentColor);
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('test'),
            onTap: () {},
            subtitle: Text('test'),
            trailing: MIUIListTileTrailing(child: Text('adawd')),
          ),
          MIUIButton(
            onPressed: () {
              showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(0, 0, 100, 100),
                  items: [
                    PopupMenuItem(
                      child: Text('test'),
                    ),
                  ],
                  shape: MIUIMenuShape);
            },
            child: Text('show menu'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(textEditingController.text),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
