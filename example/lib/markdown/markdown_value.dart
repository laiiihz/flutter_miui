class MV {
  static String dialogConfirm = '''
# DialogConfirm
```dartshowMIUIConfirmDialog(
  context: context,
  child: Text(''),
  confirm: () {},
  title: 'title',
);
```
''';
  static String dialogSingleConfirm = '''
# DialogConfirm
```dartshowMIUIConfirmDialog(
  context: context,
  child: Text(''),
  confirm: () {},
  title: 'title',
  single:true,
);
```
''';
  static String dialogStandard = '''
# DialogStandard
```dart
showMIUIConfirmDialog(
  context: context,
  confirm: () {},
  title: 'title',
  content:  Text(''),
  label: 'test',
);
```
''';

  static String dialogColored = '''
# DialogStandard
```dart
showMIUIDialog(
  context: context,
  content: Text(''),
  dyOffset: 0.5,
  label: 'demo',
  color: Colors.blueAccent,
);
```
''';
  static String buttonAll = '''
# Button Code
```dart
MIUIButton( 
  child: Text('按钮 standard'),
  onPressed: () {},
),
MIUIButton(
child: Text('按钮 danger'),
onPressed: () {},
color: MIUIStateColor.danger,
),
MIUIButton(
  child: Text('按钮 info'),
  onPressed: () {},
  color: MIUIStateColor.info,
),
MIUIButton(
  child: Text('按钮 warn'),
  onPressed: () {},
  color: MIUIStateColor.warn,
),
```
''';

  static String appBar = '''
  # AppBar Standard
  ```dart
  MIUIAppBar(
    title: Text('应用栏 standard'),
  ),
  ```
  # AppBar with Actions
  ```dart
  MIUIAppBar(
    title: Text('应用栏 actions'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.face),
        onPressed: () {},
      ),
    ],
  ),
  ```
  ''';
}
