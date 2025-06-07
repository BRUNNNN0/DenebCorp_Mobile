import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/core/widgets/progress_indicator_widget.dart';
import 'package:i_pet/domain/entities/cadastro/cadastro_entity.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/ui/pages/cadastro/view_model/cadastro_viewmodel.dart';
import 'package:i_pet/ui/pages/login/view_models/login_viewmodel.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_data.dart';
import 'package:i_pet/utils/ValidatorsCampos.dart';
import 'package:i_pet/utils/formatters.dart';
import 'package:i_pet/utils/util_text.dart';

class CadastroWidgets extends StatefulWidget {
  const CadastroWidgets({super.key});

  @override
  State<CadastroWidgets> createState() => _CadastroWidgetsState();
}

class _CadastroWidgetsState extends State<CadastroWidgets> {
  late final TextEditingController _FnameTextController;
  late final TextEditingController _LnameTextController;
  late final TextEditingController _TelefoneTextController;
  late final TextEditingController _CPFTextController;
  late final TextEditingController _emailTextController;
  late final TextEditingController _dataNascimentoController;
  late final TextEditingController _passwordTextController;
  late final CadastroViewmodel _cadastroViewmodel;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _FnameTextController = TextEditingController();
    _LnameTextController = TextEditingController();
    _CPFTextController = TextEditingController();
    _TelefoneTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _dataNascimentoController = TextEditingController();
    _cadastroViewmodel = context.read<CadastroViewmodel>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CadastroViewmodel, IRequestState<void>>(
      builder: (context, state) {
        final bool isProcessing = state is RequestProcessingState;
        return Form(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: campoFirstname(
                  controller: _FnameTextController,
                  isEnabled: !isProcessing,
                ),
              ),

              espaco_14(),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: campoLastname(
                  controller: _LnameTextController,
                  isEnabled: !isProcessing,
                ),
              ),

              espaco_14(),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CampoCPF(
                  controller: _CPFTextController,
                  isEnabled: !isProcessing,
                ),
              ),

              espaco_14(),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: campodeTelefone(
                  controller: _TelefoneTextController,
                  isEnabled: !isProcessing,
                ),
              ),

              espaco_14(),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: campoEmail(
                  controller: _emailTextController,
                  isEnabled: !isProcessing,
                ),
              ),

              espaco_14(),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CampoDataCadastro(
                  controller: _dataNascimentoController,
                  onTap: _abrirDatePicker,
                  isEnabled: !isProcessing,
                ),
              ),

              espaco_14(),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CampoSenhaCadastro(
                  controller: _passwordTextController,
                  isEnabled: !isProcessing,
                  obscureText: _obscureText,
                  onToggleVisibility: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: isProcessing ? null : onregister, 
                      child: isProcessing
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(
                              UtilText.labelRegisterTitle.toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),          
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _abrirDatePicker() async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );

    if (dataSelecionada != null) {
      _dataNascimentoController.text = Validators.formatarData(dataSelecionada);
    }
  }

  void onregister() {
    final cadastroEntity = CadastroEntity(
      firstName: _FnameTextController.text,
      lastName: _LnameTextController.text,
      password: _passwordTextController.text,
      email: _emailTextController.text,
      phoneNumber: _TelefoneTextController.text,
      birth_date: _dataNascimentoController.text,
      cpf: _CPFTextController.text,
    );

    _cadastroViewmodel.onRegister(cadastroEntity);
  }
}

class CampoDataCadastro extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final bool isEnabled;

  const CampoDataCadastro({
    super.key,
    required this.controller,
    required this.onTap,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.96,
      child: TextField(
        enabled: isEnabled,
        controller: controller,
        readOnly: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: UtilText.labelDTNascimento,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: onTap,
          ),
        ),
      ),
    );
  }
}

class campoFirstname extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled;

  const campoFirstname({
    super.key,
    required this.controller,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: UtilText.labelFirsname,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class campoLastname extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled;

  const campoLastname({
    super.key,
    required this.controller,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: UtilText.labelLastname,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class CampoCPF extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled;

  const CampoCPF({
    super.key,
    required this.controller,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [Formatters.cpfFormatter],
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: UtilText.labelCPF,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class campodeTelefone extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled;

  const campodeTelefone({
    super.key,
    required this.controller,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      controller: controller,
      keyboardType: TextInputType.phone,
      inputFormatters: [Formatters.telefoneFormatter],
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: UtilText.labelTelefone,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class campoEmail extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled;

  const campoEmail({
    super.key,
    required this.controller,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: UtilText.labelLoginYourEmail,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class CampoSenhaCadastro extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const CampoSenhaCadastro({
    super.key,
    required this.controller,
    required this.isEnabled,
    required this.obscureText,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      controller: controller,
      textInputAction: TextInputAction.done,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: UtilText.labelLoginYourPassword,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: onToggleVisibility,
        ),
      ),
    );
  }
}

String removerFormatacao(String item) {
  return item.replaceAll(RegExp(r'\D'), ''); // Remove tudo que não for dígito
}
