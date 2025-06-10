import 'package:flutter/material.dart';
import 'package:i_pet/domain/entities/serviceServiceOfferEntity/service_service_offer_entity.dart';
import 'package:i_pet/ui/pages/perfil/view_models/tela_perfil_viewmodel.dart';
import 'package:i_pet/utils/formatters.dart';
import 'package:url_launcher/url_launcher.dart';

class widgetDetalhar extends StatelessWidget {
  final CombinedServiceOffer servico;
  
  const widgetDetalhar({super.key, required this.servico});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: telainf(
          nomeServico: servico.service.name,
          tipoDoAnimal: servico.service.animalType,
          ValorServico: Formatters.formatarValorBRL(servico.offer.price),
          descricao: servico.service.description,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 16, left: 24, right: 24),
        child: botaoWhats(
          nomeServico: servico.service.name,
          numeroWhats: servico.service.whatsApp_number,
        ),
      ),
    );
  }
}

class telainf extends StatelessWidget {
  final String nomeServico;
  final String tipoDoAnimal;
  final String ValorServico;
  final String descricao;

  const telainf({
    super.key,
    required this.nomeServico,
    required this.tipoDoAnimal,
    required this.ValorServico,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    late final TelaPerfilViewModel _telaPerfilViewModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  botaovoltar(),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 8),
                  Text(
                    nomeServico,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.pets, size: 20, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('Tipo: $tipoDoAnimal'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money, size: 20, color: Colors.grey),
                    SizedBox(width: 4),
                    Text("Preço: $ValorServico"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Descrição do Serviço',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            descricao,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class botaoWhats extends StatelessWidget {
  final String nomeServico;
  final String numeroWhats;
  const botaoWhats({
    super.key,
    required this.nomeServico,
    required this.numeroWhats,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String numero = numeroWhats;
        String servicoNome = nomeServico;
        String msg = "Olá! Tenho interesse no serviço: $servicoNome.";
        abrirWhatsApp(numero, msg);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF22C55E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text(
        'Quero Contratar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


class botaovoltar extends StatelessWidget {
  const botaovoltar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.of(context).pop(); // Volta para a tela anterior
      },
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      label: const Text(
        'Voltar',
        style: TextStyle(color: Colors.black),
      ),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black, // Cor do ícone e do texto
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}

  void abrirWhatsApp(String numero, String mensagem) async {
    final uri = Uri.parse(
      "https://wa.me/$numero?text=${Uri.encodeComponent(mensagem)}",
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o WhatsApp.';
    }
  }
