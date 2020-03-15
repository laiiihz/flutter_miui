import 'package:flutter/material.dart';
import 'package:flutter_miui/flutter_miui.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController =
      TextEditingController(text: '123');
  VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/banner.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.setLooping(true);
        _videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: MIUIAppBar(
        title: Text('Flutter-MIUI'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: ListView(
        physics: MIUIScrollPhysics(),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200,
                child: _videoPlayerController.value.initialized
                    ? VideoPlayer(_videoPlayerController)
                    : Text('wait'),
              ),
              Container(
                height: 200,
                child: Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
          MIUIButton(
            child: Text('应用栏'),
            onPressed: () {
              Navigator.of(context).pushNamed('appbar');
            },
          ),
          MIUIButton(
            child: Text('按钮'),
            onPressed: () {
              Navigator.of(context).pushNamed('button');
            },
          ),
          MIUIButton(
            child: Text('对话框'),
            onPressed: () {
              Navigator.of(context).pushNamed('dialog');
            },
          ),
          MIUIButton(
            child: Text('文本输入框'),
            onPressed: () {
              Navigator.of(context).pushNamed('textfield');
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
          TextField(),
          SizedBox(
            height: 20,
          ),
          MIUITextField(
            context: context,
          ),
        ],
      ),
    );
  }
}
