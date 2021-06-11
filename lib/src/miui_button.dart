import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MButton extends StatefulWidget {
  final ShapeBorder shape;
  final Color startColor;
  final Color endColor;
  final EdgeInsets padding;
  final Widget child;
  final VoidCallback? onPressed;
  MButton({
    Key? key,
    this.shape = const StadiumBorder(),
    this.startColor = const Color(0xFF0C84FF),
    this.endColor = const Color(0xFF0C7AEB),
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 48,
    ),
    this.onPressed,
  }) : super(key: key);

  @override
  _MButtonState createState() => _MButtonState();
}

class _MButtonState extends State<MButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ColorTween _colorTween;
  late Animation<Color?> _colorAnimation;
  _setTween() {
    _colorTween.begin = widget.startColor;
    _colorTween.end = widget.endColor;
  }

  @override
  void initState() {
    super.initState();
    _colorTween = ColorTween(begin: widget.startColor, end: widget.endColor);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 50),
      value: 0.0,
      vsync: this,
    );

    _colorAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_colorTween);
  }

  @override
  void didUpdateWidget(covariant MButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setTween();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Material(
          shape: widget.shape,
          color: _colorAnimation.value,
          child: child,
        );
      },
      //TODO add height,minWidth prop
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (detail) => _animationController.forward(),
        onTapCancel: () => _animationController.reverse(),
        onTapUp: (detail) => _animationController.reverse(),
        onTap: widget.onPressed,
        child: Padding(
          padding: widget.padding,
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.subtitle2!,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
