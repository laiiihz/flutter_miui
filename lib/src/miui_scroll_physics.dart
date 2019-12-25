import 'package:flutter/material.dart';

class MIUIScrollPhysics extends ScrollPhysics {
  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    return AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics());
  }
}

class MIUIDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}
