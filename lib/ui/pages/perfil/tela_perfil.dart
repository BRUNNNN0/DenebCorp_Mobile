import 'package:flutter/material.dart';
import 'package:i_pet/ui/widgets/TextsUser/descricao_user.dart';
import 'package:i_pet/ui/widgets/TextsUser/nome_user.dart';
import 'package:i_pet/ui/widgets/backgroud/fundo_degrade_azul_claro.dart';
import 'package:i_pet/ui/widgets/button/botao_padrao_com_imagem.dart';
import 'package:i_pet/ui/widgets/imgUser/imagem_perfil.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';



class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FundoDegradeAzulClaro(),



          Padding(
            padding: const EdgeInsets.only(top: 85),
            child: Center(        
              child: Column(
                      children: [
                ImagemPerfil(caminhoImagem: "assets/image/gabriel.jpg"),
                espaco_14(),
                NomeUsuario(nome: 'Gabriel Melnoti'),
                DescricaoUsuario(descricao:  'Pai e apaixonado por Pet'),
                ]
              ),
            ),
          ),


          Align(
            alignment: Alignment.center,
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
              children: [
                   
                   BotaoCMimagem(
                    textoBotao: "Editar Perfil", 
                    corBotao: const Color.fromARGB(255, 132, 192, 241), 
                    corBorda: const Color.fromARGB(255, 132, 192, 241),
                    corFonte:   const Color.fromARGB(255, 0, 19, 34), 
                    tamanhoFonte: 18, 
                    larguraEmPorcentagem: 0.8, 
                    icone: Icon(Icons.edit, color: const Color.fromARGB(255, 0, 19, 34)), 
                    onPressed: () {
                      print("ok");
                    }
                  ),

                  espaco_14(),

                  BotaoCMimagem(
                    textoBotao: "Meus Pets", 
                    corBotao: const Color.fromARGB(255, 132, 192, 241), 
                    corBorda: const Color.fromARGB(255, 132, 192, 241),
                    corFonte:   const Color.fromARGB(255, 0, 19, 34), 
                    tamanhoFonte: 18, 
                    larguraEmPorcentagem: 0.8, 
                    icone: Image.asset("assets/image/miniIconePata.png",
                      width: 24,height: 24,), 
                    onPressed: () {
                      print("ok");
                    }
                  ),

                  espaco_14(),

                  BotaoCMimagem(
                    textoBotao: "Sair da conta", 
                    corBotao: const Color.fromARGB(255, 132, 192, 241), 
                    corBorda: const Color.fromARGB(255, 132, 192, 241),
                    corFonte:   const Color.fromARGB(255, 0, 19, 34), 
                    tamanhoFonte: 18, 
                    larguraEmPorcentagem: 0.8, 
                    icone: Icon(Icons.login_outlined, color: const Color.fromARGB(255, 0, 19, 34)), 
                    onPressed: () {
                      print("ok");
                    }
                  ),

                ]
              )
            )
          )
        ]
      )
    );    
  }
}