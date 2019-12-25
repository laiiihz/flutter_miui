import 'package:flutter/material.dart';

class MIUIListTile extends StatelessWidget {
  MIUIListTile({
    Key key,
    this.title,
    this.onPressed,
    this.subTitle,
    this.detail,
  }) : super(key: key);
  final Widget title;
  final Widget subTitle;
  final VoidCallback onPressed;
  final Widget detail;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: ListTile(
        leading: Icon(Icons.add),
        title: this.title,
        subtitle: DefaultTextStyle(
          style: TextStyle(
            color: Colors.grey,
          ),
          child: this.subTitle,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            this.detail == null
                ? SizedBox()
                : DefaultTextStyle(
              style: TextStyle(
                color: Colors.grey,
              ),
              child: this.detail,
            ),
            SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}