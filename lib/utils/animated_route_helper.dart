import 'package:flutter/material.dart';
import 'package:i_pet/routing/routingHelper.dart';

Route createAnimatedRouteFromName(String routeName, {Object? arguments}) {
  return PageRouteBuilder(
    settings: RouteSettings(name: routeName, arguments: arguments),
    pageBuilder: (context, animation, secondaryAnimation) {
      final route = RouteGeneratorHelper.generateRoute(
        RouteSettings(name: routeName, arguments: arguments),
      );
      return (route as MaterialPageRoute).builder(context); // extrai o widget
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      return FadeTransition(opacity: curved, child: child);
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}