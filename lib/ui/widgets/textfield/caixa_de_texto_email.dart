import 'package:flutter/material.dart';
import 'package:i_pet/utils/ValidatorsCampos.dart';

class CampoEmail extends StatefulWidget {
  final String label;
  final TextEditingController? controller;

  const CampoEmail({
    Key? key,
    required this.label,
    this.controller,
  }) : super(key: key);

  @override
  State<CampoEmail> createState() => _CampoEmailState();
}

class _CampoEmailState extends State<CampoEmail> {
  late TextEditingController _controller;
  String? _erro;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  void _validarEmail(String value) {
    setState(() {
      _erro = Validators.validarEmail(value) ? null : "E-mail inválido";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.96,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.emailAddress,
        onChanged: _validarEmail,
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