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
    transitionDuration: const Duration(milliseconds: 400),
  );
}


Route createSlideAnimatedRouteFromName(String routeName, {Object? arguments}) {
  return PageRouteBuilder(
    settings: RouteSettings(name: routeName, arguments: arguments),
    pageBuilder: (context, animation, secondaryAnimation) {
      final route = RouteGeneratorHelper.generateRoute(
        RouteSettings(name: routeName, arguments: arguments),
      );
      return (route as MaterialPageRoute).builder(context); // extrai o widget
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Define o movimento da transição: da direita (Offset(1,0)) para a posição (Offset.zero)
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(1.0, 0.0), // começa fora da tela à direita
        end: Offset.zero,               // termina na posição normal
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}