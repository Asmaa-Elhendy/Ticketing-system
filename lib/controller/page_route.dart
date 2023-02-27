import 'package:flutter/material.dart';

Route createRoute(final Page2) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  Page2,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset(0,0);
      const curve = Curves.linearToEaseOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}