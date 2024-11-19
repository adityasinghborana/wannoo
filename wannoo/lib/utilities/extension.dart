import 'package:flutter/material.dart';

extension AnimatedContainerExtensions on Widget {
  /// Fade-in animation
  Widget fadeIn({
    required Duration duration,
    Curve curve = Curves.easeIn,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: this,
    );
  }

  /// Bounce animation
  Widget bounce({
    required Duration duration,
    Curve curve = Curves.elasticOut,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: this,
    );
  }
}
