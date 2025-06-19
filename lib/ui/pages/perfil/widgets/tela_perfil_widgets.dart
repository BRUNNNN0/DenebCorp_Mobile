import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/core/widgets/progress_indicator_widget.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/entities/user/user_entity.dart';
import 'package:i_pet/ui/navigator/custom_bottom_nav.dart';
import 'package:i_pet/ui/pages/perfil/view_models/tela_perfil_viewmodel.dart';
import 'package:i_pet/ui/widgets/button/botao_padrao_com_imagem.dart';
import 'package:i_pet/utils/util_text.dart';

class TelaPerfilWidget extends StatefulWidget {
  const TelaPerfilWidget({super.key});

  @override
  State<TelaPerfilWidget> createState() => _TelaPerfilWidgetState();
}

class _TelaPerfilWidgetState extends State<TelaPerfilWidget> {
  late final TelaPerfilViewModel _telaPerfilViewModel;
  UserEntity? _usuario;

  @override
  void initState() {
    super.initState();
    _telaPerfilViewModel = context.read<TelaPerfilViewModel>();
    _telaPerfilViewModel.pegarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TelaPerfilViewModel, IRequestState<UserEntity>>(
      builder: (context, state) {
        final bool isProcessing = state is RequestProcessingState;

        if (state is RequestCompletedState) {
          _usuario = state.data;
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isProcessing
                ? const Center(child: CircularProgressIndicator())
                : _usuario == null
                    ? const Center(child: Text("Dados não encontrados"))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildReadOnlyField("Nome", _usuario!.firstName),
                          _buildReadOnlyField("Sobrenome", _usuario!.lastName),
                          _buildReadOnlyField("Email", _usuario!.email),
                          _buildReadOnlyField("Telefone", _usuario!.phoneNumber),
                          _buildReadOnlyField("CPF", _usuario!.cpf),
                          _buildReadOnlyField("Data de nascimento", _usuario!.birth_date),
                        ],
                      ),
          ),
        );
      },
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: TextEditingController(text: value),
        enabled: false,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  void onLoad() {
    _telaPerfilViewModel.pegarUsuario();
  }
}
