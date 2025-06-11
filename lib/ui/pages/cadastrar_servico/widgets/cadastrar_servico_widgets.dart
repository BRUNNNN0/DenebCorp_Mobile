import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/entities/service/service_entity.dart';
import 'package:i_pet/ui/pages/cadastrar_servico/viewmodels/viewmodels/tela_cadastrar_servico_viewmodel.dart';

class CadastrarServicoScreen extends StatefulWidget {
  const CadastrarServicoScreen({super.key});

  @override
  State<CadastrarServicoScreen> createState() => _CadastrarServicoScreenState();
}

class _CadastrarServicoScreenState extends State<CadastrarServicoScreen> {
  // Controllers para os campos

 late final TextEditingController _nomeController;
  late final TextEditingController _descricaoController;
  late final TextEditingController _precoController;

  final _formKey = GlobalKey<FormState>();
  late final CadastroDeServicoViewModel _cadastroViewmodel;
  // Estado do dropdown
  String? _categoriaSelecionada;



@override
void initState() {
  super.initState();
  _nomeController = TextEditingController();
  _descricaoController = TextEditingController();
  _precoController = TextEditingController();
 _cadastroViewmodel = context.read<CadastroDeServicoViewModel>();
}

   @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<CadastroDeServicoViewModel, IRequestState<void>>(
      builder: (context, state) {
        final bool isProcessing = state is RequestProcessingState;
    
        return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Center(
                      child: Text(
                        'Ofereça\nseu Serviço para Pets',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildLabel('Nome do Serviço'),
                    _buildInput(
                      hint: 'Ex: Passeio com cães',
                      controller: _nomeController,
                    ),
                    const SizedBox(height: 16),
                    _buildLabel('Tipo de Animal'),
                    _buildDropdown(),
                    const SizedBox(height: 16),
                    _buildLabel('Descrição do Serviço Base'),
                    _buildInput(
                      hint: "Descreva o serviço geral oferecido...",
                      controller: _descricaoController,
                      maxLines: 8,
                    ),
                    const SizedBox(height: 16),
                    _buildLabel('Valor da Oferta (R\$)'),
                    _buildInput(
                      hint: 'Ex: 50,00',
                      controller: _precoController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.pets_rounded),
                          label: const Text('Cadastrar Oferta'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2F80ED),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final precoFormatado = _precoController.text.replaceAll(',', '.');
                              final preco = double.tryParse(precoFormatado);
        
                              if (preco == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Digite um valor válido')),
                                );
                                return;
                              }

                                final tempo = Timestamp.now();


                              final servico = ServiceEntity(
                                name: _nomeController.text.trim(),
                                description: _descricaoController.text.trim(),
                                animalType: _categoriaSelecionada!,
                                createdAt:  tempo.toString()                 
                              );
        
                              _cadastroViewmodel.cadastrarServico(service: servico, preco: preco.toString());
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        );
      },
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

Widget _buildInput({
  required String hint,
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  int maxLines = 1,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    maxLines: maxLines,
    validator: (value) {
      if (value == null || value.trim().isEmpty) {
        return 'Campo obrigatório';
      }
      return null;
    },
    decoration: InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );
}

Widget _buildDropdown() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: DropdownButtonFormField<String>(
      value: _categoriaSelecionada,
      items: const [
        DropdownMenuItem(value: 'Cães', child: Text('Cães')),
        DropdownMenuItem(value: 'Gatos', child: Text('Gatos')),
        DropdownMenuItem(value: 'Outros', child: Text('Outros')),
      ],
      onChanged: (value) {
        setState(() {
          _categoriaSelecionada = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Selecione uma categoria';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      hint: const Text('Selecione'),
    ),
  );
}
}