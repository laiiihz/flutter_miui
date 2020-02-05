import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Home(),
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
            child: Icon(Icons.add_shopping_cart),
            onPressed: () {
              showMIUIDialog(
                context: context,
                dyOffset: 0.6,
                content: Text('test'),
                label: 'test',
                color: Colors.pink,
              );
              showMIUIConfirmDialog(
                context: context,
                child: TextField(),
                title: 'test',
                confirm: () {},
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
