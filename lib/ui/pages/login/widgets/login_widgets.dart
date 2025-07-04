import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/core/widgets/progress_indicator_widget.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/entities/login/login_entity.dart';
import 'package:i_pet/ui/pages/login/view_models/login_viewmodel.dart';
import 'package:i_pet/utils/animated_route_helper.dart';
import 'package:i_pet/utils/util_text.dart';



class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {

  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;
  late final LoginViewModel _loginViewModel;
   bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _loginViewModel = context.read<LoginViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginViewModel, IRequestState<String>>(
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
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: UtilText.labelLoginYourEmail,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    enabled: !isProcessing,
                    controller: _passwordTextController,
                    textInputAction: TextInputAction.done,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: UtilText.labelLoginYourPassword,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),                      
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
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                    onPressed: isProcessing ? null : onAuth,
                    child: isProcessing 
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                    UtilText.labelLoginTitle.toUpperCase(),
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
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    createAnimatedRouteFromName('/recuperar'),
                  );
                },
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onAuth() {
    final loginEntity = LoginEntity(login: _emailTextController.text, password: _passwordTextController.text);
    _loginViewModel.onAuthentication(loginEntity);
  }
}



