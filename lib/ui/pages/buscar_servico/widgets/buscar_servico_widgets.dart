import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_pet/configs/factory_viewmodel.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/entities/serviceServiceOfferEntity/service_service_offer_entity.dart';
import 'package:i_pet/routing/routingHelper.dart';
import 'package:i_pet/ui/pages/buscar_servico/view_models/buscar_servico_viewmodel.dart';
import 'package:i_pet/ui/pages/detalhar_servico/widgets/detalhar_servico_widgets.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_25.dart';
import 'package:i_pet/utils/formatters.dart';

class buscarWidgets extends StatefulWidget {
  const buscarWidgets({super.key});

  @override
  State<buscarWidgets> createState() => _BuscarWidgetsState();
}

class _BuscarWidgetsState extends State<buscarWidgets> {
  late final BuscarServicoViewmodel _buscarServicoViewModel;

  @override
  void initState() {
    super.initState();
    _buscarServicoViewModel = context.read<BuscarServicoViewmodel>();
    _buscarServicoViewModel.findServices();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      BuscarServicoViewmodel,
      IRequestState<List<CombinedServiceOffer>?>
    >(
      builder: (context, state) {
        if (state is RequestProcessingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RequestCompletedState<List<CombinedServiceOffer>?>) {
          final listaServicos = state.value;
          if (listaServicos == null || listaServicos.isEmpty) {
            return const Center(child: Text("Nenhum serviço disponível."));
          }

          return Container(
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                espaco_25(),
                espaco_14(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Encontre um Serviço',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'para seu Pet',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.search, size: 35, color: Colors.blue),
                  ],
                ),
                espaco_25(),
                Expanded(
                  child: ListView.builder(
                    itemCount: listaServicos.length,
                    itemBuilder: (context, index) {
                      final servico = listaServicos[index];
                      return ServicoCard(
                        titulo: servico.service.name,
                        subtitulo: servico.service.animalType,
                        preco: Formatters.formatarValorBRL(servico.offer.price),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RouteGeneratorHelper.kdetalharServico,
                            arguments: servico,
                          );              
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }

        if (state is RequestErrorState) {
          return Center(child: Text("Erro: ${state.error}"));
        }

        return const Center(child: Text("Carregando serviços..."));
      },
    );
  }
}

class ServicoCard extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String preco;
  final VoidCallback onPressed;

  const ServicoCard({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.preco,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.black, width: 0.5),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitulo,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      preco,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Ver detalhes',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
