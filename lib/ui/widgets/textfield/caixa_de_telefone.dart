import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_pet/utils/formatters.dart';
import 'package:i_pet/utils/ValidatorsCampos.dart';

class CampoTelefone extends StatefulWidget {
  final String label;
  final TextEditingController? controller;

  const CampoTelefone({
    Key? key,
    required this.label,
    this.controller,
  }) : super(key: key);

  @override
  State<CampoTelefone> createState() => _CampoTelefoneState();
}

class _CampoTelefoneState extends State<CampoTelefone> {
  late TextEditingController _controller;
  String? _erro;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  void _validarTelefone(String value) {
    String telefoneNumerico = Formatters.telefoneFormatter.getUnmaskedText();

    setState(() {
      _erro = Validators.validarTelefone(telefoneNumerico) ? null : "Telefone inválido";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.96,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.phone,
        inputFormatters: [Formatters.telefoneFormatter],
        onChanged: _validarTelefone,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorText: _erro,
        ),
      ),
    );
  }
}