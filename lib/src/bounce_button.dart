import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BounceButton extends StatefulWidget {
  ///The shape of the button's [Material].
  ///
  ///The button's highlight and splash are clipped to this shape.
  ///If the button has an elevation, then its drop shadow is
  ///defined by this shape as well.
  ///
  ///Defaults to the value from the current [BounceButton.FLAT].
  final ShapeBorder shape;
  final EdgeInsets padding;
  final Widget child;
  final Color startColor;
  final Color endColor;
  final double scale;
  BounceButton({
    Key? key,
    this.shape = BounceButton.FLAT,
    this.padding = const EdgeInsets.all(16),
    required this.child,
    this.startColor = const Color(0xFFDDDDDD),
    this.endColor = const Color(0xFFBBBBBB),
    this.scale = 0.9,
  }) : super(key: key);

  static const OUTLINE = const RoundedRectangleBorder(
    side: const BorderSide(
      width: 0.5,
      color: Colors.black26,
    ),
    borderRadius: const BorderRadius.only(
      topLeft: const Radius.circular(8),
      topRight: const Radius.circular(8),
      bottomLeft: const Radius.circular(8),
      bottomRight: const Radius.circular(8),
    ),
  );

  static const FLAT = const RoundedRectangleBorder(
    borderRadius: const BorderRadius.only(
      topLeft: const Radius.circular(8),
      topRight: const Radius.circular(8),
      bottomLeft: const Radius.circular(8),
      bottomRight: const Radius.circular(8),
    ),
  );

  @override
  _BounceButtonState createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton>
    with SingleTickerProviderStateMixin {
  bool _buttonHeldDown = false;
  late Tween<double> _scaleTween;
  late ColorTween _colorTween;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  onTap() {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  onUp() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  _animate() {
    if (_animationController.isAnimating) return;
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController.animateTo(1.0,
            duration: const Duration(milliseconds: 200))
        : _animationController.animateTo(0.0,
            duration: const Duration(milliseconds: 100));
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) _animate();
    });
  }

  @override
  void initState() {
    super.initState();
    _scaleTween = Tween<double>(begin: 1.0, end: widget.scale);
    _colorTween = ColorTween(begin: widget.startColor, end: widget.endColor);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _scaleAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_scaleTween);

    _colorAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_colorTween);
  }

  @override
  void didUpdateWidget(covariant BounceButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.endColor != widget.endColor) {
      _colorTween.end = widget.endColor;
    }
    if (oldWidget.startColor != widget.startColor) {
      _colorTween.begin = widget.startColor;
    }
    if (oldWidget.scale != widget.scale) {
      _scaleTween.end = widget.scale;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        Widget _result = Material(
          shape: widget.shape,
          color: _colorAnimation.value,
          child: child,
        );
        _result = Transform.scale(scale: _scaleAnimation.value, child: _result);
        return _result;
      },
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (detail) {
          onTap();
        },
        onTapUp: (detail) {
          onUp();
        },
        onTapCancel: () {
          onUp();
        },
        child: Padding(
          padding: widget.padding,
          child: widget.child,
        ),
      ),
    );
  }
}
