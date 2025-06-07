import 'package:intl/intl.dart';

class Validators {
  static bool validarEmail(String email) {
    String padraoEmail =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    return RegExp(padraoEmail).hasMatch(email);
  }

  static bool validarTelefone(String telefone) {
    String apenasNumeros = telefone.replaceAll(RegExp(r'\D'), '');
    return apenasNumeros.length == 11;
  }


  static String formatarData(DateTime data) {
    return DateFormat('dd/MM/yyyy').format(data);
  }
}