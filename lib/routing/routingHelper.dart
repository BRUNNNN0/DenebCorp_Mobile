
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_pet/ui/pages/cadastro/tela_cadastro.dart';
import 'package:i_pet/ui/pages/login/tela_login.dart';
import 'package:i_pet/ui/pages/pagina_inicial/tela_inicial.dart';
import 'package:i_pet/ui/pages/perfil/tela_perfil.dart';

final class RouteGeneratorHelper{

  static Route<dynamic> generateRoute(RouteSettings settings){
    final Object? args = settings.arguments;
    return switch (settings.name){
      kInitial => createRoutePage(const tela_Inicial()),
      kLogin => createRoutePage(const tela_login()),
      kCadastro => createRoutePage(const tela_cadastro()),
      kPerfil => createRoutePage(const TelaPerfil()),

      // TODO: Handle this case.
      String() => throw UnimplementedError(),
      // TODO: Handle this case.
      null => throw UnimplementedError(),
    };
  }
  
  static PageRoute createRoutePage(Widget widget){
    return MaterialPageRoute( 
      builder: (context) => widget,
    );
  }


static Route<dynamic> createRouteError() {
    const String msg = 'Error Route';
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text(msg),
          ),
        );
      },
    );
  }

  static const String kInitial = '/';
  static const String kLogin = '/login';
  static const String kCadastro = '/cadastro';
  static const String kPerfil = '/perfil';


}