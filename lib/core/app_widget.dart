

import 'package:flutter/material.dart';
import 'package:i_pet/ui/pages/cadastro/tela_cadastro.dart';
import 'package:i_pet/ui/pages/login/tela_login.dart';
import 'package:i_pet/ui/pages/pagina_inicial/tela_inicial.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i_pet/utils/util.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale(Util.kLanguageCode,Util.kCountryCode)
      ],
      home: tela_login(),
    );
  
  }
}