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
  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;
  late final CadastroViewmodel _cadastroViewmodel;
   bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _FnameTextController = TextEditingController();
    _LnameTextController = TextEditingController();
    _TelefoneTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
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
              child: TextFormField(
                enabled: !isProcessing,
                controller: _FnameTextController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: UtilText.labelFirsname,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                ),
              ),
            ),
              
            espaco_14(),

              SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                enabled: !isProcessing,
                controller: _LnameTextController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: UtilText.labelLastname,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                ),
              ),
            ),   	    
              
            espaco_14(),

              SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                enabled: !isProcessing,
                controller: _TelefoneTextController,
                keyboardType: TextInputType.phone,
                inputFormatters: [Formatters.telefoneFormatter],
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: UtilText.labelTelefone,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                ),
              ),
            ),            
              
            espaco_14(),  

              SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                enabled: !isProcessing,
                controller: _emailTextController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: UtilText.labelLoginYourEmail,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                ),
              ),
            ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    enabled: !isProcessing,
                    controller: _passwordTextController,
                    textInputAction: TextInputAction.done,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: UtilText.labelLoginYourPassword,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    prefixIcon: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(Icons.lock),
                    ),
                    suffixIcon: IconButton(
                    icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                onPressed: () {
                  setState(() {
                  _obscureText = !_obscureText;
                });
          },
        ),
      ),
    ),
  ),
),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: onregister,
                    child: !isProcessing ? Text(
                    UtilText.labelRegisterTitle.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ): const ProgressIndicatorWidget(),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

    void onregister() {
    final cadastroEntity = CadastroEntity(
                              firstName: _FnameTextController.text,
                              lastName: _LnameTextController.text,
                              email: _emailTextController.text,
                              phoneNumber: removerFormatacaoTelefone(_TelefoneTextController.text),
                              password: _passwordTextController.text,

                            );

                            _cadastroViewmodel.onRegister(cadastroEntity);
  }
}



class CampoDataCadastro extends StatefulWidget {
  final TextEditingController controller;

  const CampoDataCadastro({super.key, required this.controller});

  @override
  State<CampoDataCadastro> createState() => _CampoDataCadastroState();
}

class _CampoDataCadastroState extends State<CampoDataCadastro> {
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
        textInputAction: TextInputAction.next,
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

String removerFormatacaoTelefone(String telefone) {
  return telefone.replaceAll(RegExp(r'\D'), ''); // Remove tudo que não for dígito
}