import 'package:flutter/material.dart';

class CadastrarServicoScreen extends StatelessWidget {
  const CadastrarServicoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F4FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
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
              _buildInput(hint: 'Ex: Passeio com cães'),

              const SizedBox(height: 16),
              _buildLabel('Tipo de Animal'),
              _buildDropdown(),

              const SizedBox(height: 16),
              _buildLabel('Descrição do Serviço Base'),
              _buildInput(
                hint: "Descreva o serviço geral oferecido...",
                maxLines: 4,
              ),

              const SizedBox(height: 16),
              _buildLabel('Valor da Oferta (R\$)'),
              _buildInput(hint: 'Ex: 50.00', keyboardType: TextInputType.number),

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
                      // Ação de cadastro
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue.shade900,
      ),
    );
  }

  Widget _buildInput({
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      keyboardType: keyboardType,
      maxLines: maxLines,
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
        items: const [
          DropdownMenuItem(value: 'Cães', child: Text('Cães')),
          DropdownMenuItem(value: 'Gatos', child: Text('Gatos')),
          DropdownMenuItem(value: 'Outros', child: Text('Outros')),
        ],
        onChanged: (value) {},
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        hint: const Text('Selecione'),
      ),
    );
  }
}