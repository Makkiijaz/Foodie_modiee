import 'package:flutter/material.dart';

class FadeRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      var tween = Tween(begin: begin, end: end);
      var fadeAnimation = animation.drive(tween);
      return FadeTransition(opacity: fadeAnimation, child: child);
    },
  );
}
