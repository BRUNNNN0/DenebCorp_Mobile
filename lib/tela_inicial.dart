import 'package:flutter/material.dart';

class tela_Inicial extends StatefulWidget {
  const tela_Inicial({super.key});

  @override
  State<tela_Inicial> createState() => _tela_InicialState();
}

class _tela_InicialState extends State<tela_Inicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 250,
            child: Image.asset("assets/image/primeiraTela.png", fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                height: 250, // Altura do quadrado
                width: double.infinity, // Ocupa toda a largura
                color: Colors.white,
              child: Column(
                children: [
                  espacamentoInicial(),

                  //botão de login
                  SizedBox(
                     width: MediaQuery.of(context).size.width * 0.96,
                      child:ElevatedButton(onPressed: () {  },
                        style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.blue[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      child: Text(
                        "Já tenho uma conta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                    )
                  ),

                espacmentoBasico(),

                  //botão de cadastro
                  SizedBox(
                     width: MediaQuery.of(context).size.width * 0.96,
                      child:ElevatedButton(onPressed: () {  },
                        style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.white,
                        shape: 
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: const Color.fromRGBO(66, 165, 245, 1), width: 2),  
                        ),
                      ),
                      child: Text(
                        "Criar nova Conta",
                        style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: 16,
                          ),
                        ),
                    )
                  ),               

                ],
              ), 
            ),
          ),
        ],
      ),
    );
  }
}

class espacamentoInicial extends StatelessWidget {
  const espacamentoInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 15);
  }
}

class espacmentoBasico extends StatelessWidget {
  const espacmentoBasico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10);
  }
}