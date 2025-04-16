import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formatters {
  static final telefoneFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {"#": RegExp(r'[0-9]')}, // Apenas números
  );
}