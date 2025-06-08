import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/core/widgets/progress_indicator_widget.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/ui/pages/recovery_Password/view_models/tela_recuperar_viewmodel.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';
import 'package:i_pet/utils/animated_route_helper.dart';

import 'package:i_pet/utils/util_text.dart';


class RecuperarSenhaFormWidget extends StatefulWidget {
  const RecuperarSenhaFormWidget({super.key});

  @override
  State<RecuperarSenhaFormWidget> createState() => _RecuperarSenhaFormWidgetState();
}

class _RecuperarSenhaFormWidgetState extends State<RecuperarSenhaFormWidget> {
  late final TextEditingController _emailTextController;
  late final RecuperarSenhaViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _viewModel = context.read<RecuperarSenhaViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecuperarSenhaViewModel, IRequestState<void>>(
      builder: (context, state) {
        final bool isProcessing = state is RequestProcessingState;

        return Form(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  enabled: !isProcessing,
                  controller: _emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: UtilText.labelLoginYourEmail,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.email),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: ElevatedButton(
                  onPressed: isProcessing ? null : _onRecoverPassword,
                  child: isProcessing
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'RECUPERAR SENHA',
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
              espaco_14(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    createAnimatedRouteFromName('/login'),
                  );
                },
                child: const Text(
                  '< Voltar para o login',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _onRecoverPassword() {
    final email = _emailTextController.text.trim();
    _viewModel.onRecuperarSenha(email);
  }
}