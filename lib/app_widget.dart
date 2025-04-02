

import 'package:flutter/material.dart';
import 'package:i_pet/tela_inicial.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: tela_Inicial(),
    );
  
  }
}