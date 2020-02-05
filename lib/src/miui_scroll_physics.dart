import 'package:flutter/material.dart';

class MIUIScrollPhysics extends ScrollPhysics {
  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    return AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics());
  }
}
