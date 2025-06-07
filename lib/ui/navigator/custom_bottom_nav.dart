import 'package:flutter/material.dart';
import 'package:i_pet/routing/routingHelper.dart';
import 'package:i_pet/utils/animated_route_helper.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    String routeName;
    switch (index) {
      case 0:
        routeName = RouteGeneratorHelper.khome;
        break;
      case 1:
        routeName = RouteGeneratorHelper.kPerfil;
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      createAnimatedRouteFromName(routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey.shade600,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentIndex == 0 ? Colors.blue : Colors.grey.shade600,
          ),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: currentIndex == 1 ? Colors.blue : Colors.grey.shade600,
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}