import 'package:flutter/material.dart';
import 'package:i_pet/routing/routingHelper.dart';
import 'package:i_pet/ui/navigator/rotas_index.dart';
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
        routeName = RouteGeneratorHelper.kbuscarservico;
        break;
      case 2:
        routeName = RouteGeneratorHelper.kPerfil;
        break;
      default:
        return;
    }

    // Evita navegação redundante
    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushReplacement(
        context,
        createAnimatedRouteFromName(routeName),
      );
    }
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
            color: currentIndex == rotasIndex.indexHome ? Colors.blue : Colors.grey.shade600,
          ),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: currentIndex == rotasIndex.indexPesquisar ? Colors.blue : Colors.grey.shade600,
          ),
          label: 'Pesquisar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: currentIndex == rotasIndex.indexPerfil ? Colors.blue : Colors.grey.shade600,
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}


