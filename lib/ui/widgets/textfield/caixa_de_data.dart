import 'package:flutter/material.dart';
import 'package:i_pet/utils/ValidatorsCampos.dart';

class campoData extends StatefulWidget {
  final TextEditingController controller;

  const campoData({super.key, required this.controller});

  @override
  State<campoData> createState() => _campoDataState();
}

class _campoDataState extends State<campoData> {
  Future<void> _selecionarData(BuildContext context) async {
    DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );

    if (dataSelecionada != null) {
      setState(() {
        widget.controller.text = Validators.formatarData(dataSelecionada);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.96,
      child: TextField(
        controller: widget.controller,
        readOnly: true,
        decoration: InputDecoration(
          labelText: "Data de Nascimento",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.date_range),
            onPressed: () => _selecionarData(context),
          ),
        ),
      ),
    );
  }
}