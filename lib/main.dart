import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_pet/configs/injection_container.dart' as injector;
import 'package:flutter/material.dart';
import 'package:i_pet/core/service/IApp_Service.dart';
import 'package:i_pet/firebase_options.dart';
import 'package:i_pet/routing/routingHelper.dart';
import 'package:i_pet/ui/pages/cadastro/tela_cadastro.dart';
import 'package:i_pet/ui/pages/login/tela_login.dart';
import 'package:i_pet/ui/pages/pagina_inicial/tela_inicial.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i_pet/ui/pages/perfil/tela_perfil.dart';
import 'package:i_pet/utils/util.dart';



void main () async {
  WidgetsFlutterBinding.ensureInitialized(); // necessário
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await injector.init();
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale(Util.kLanguageCode,Util.kCountryCode)
      ],
       
      onGenerateRoute: RouteGeneratorHelper.generateRoute,
      navigatorKey: injector.getIt<IAppService>().navigatorKey,

    );
  
  }
}