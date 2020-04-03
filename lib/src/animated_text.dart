import 'package:flutter/material.dart';

class AnimatedText extends ImplicitlyAnimatedWidget {
  AnimatedText({
    Duration duration = const Duration(milliseconds: 500),
    this.value,
    this.valueDouble,
    this.fixed = 2,
    Curve curve = Curves.easeInOutCubic,
    this.style,
  })  : assert(value != null || valueDouble != null),
        assert(value == null || valueDouble == null),
        super(
          duration: duration,
          curve: curve,
        );
  final int value;
  final double valueDouble;
  final int fixed;
  final TextStyle style;
  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedTextState();
}

class _AnimatedTextState extends AnimatedWidgetBaseState<AnimatedText> {
  Tween<double> _doubleValue;
  Tween<int> _intValue;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.value != null
          ? _intValue.evaluate(animation).toString()
          : _doubleValue.evaluate(animation).toStringAsFixed(2),
      style: widget.style,
    );
  }

  @override
  void forEachTween(visitor) {
    if ((widget.value != null)) {
      _intValue = visitor(
        _intValue,
        widget.value,
        (dynamic value) => new IntTween(begin: value),
      );
    } else {
      _doubleValue = visitor(
        _doubleValue,
        widget.valueDouble,
        (dynamic value) => new Tween<double>(begin: value),
      );
    }
  }
}
