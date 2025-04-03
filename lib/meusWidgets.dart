  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_localizations/flutter_localizations.dart';
  import 'package:intl/intl.dart';
  import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';




  class caixadetexto extends StatelessWidget {
    final String label;

    const caixadetexto({
      Key? key,
      required this.label,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.96,
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }
  }

  class caixadetextoemail extends StatefulWidget {
  final String label;
  final TextEditingController? controller;

  const caixadetextoemail({
    Key? key,
    required this.label,
    this.controller,
  }) : super(key: key);

  @override
  State<caixadetextoemail> createState() => _caixadetextoemailState();
}

class _caixadetextoemailState extends State<caixadetextoemail> {
  late TextEditingController _controller;
  String? _erro;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  void _validarEmail(String value) {
    // Expressão regular para validar e-mail
    String padraoEmail =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    bool emailValido = RegExp(padraoEmail).hasMatch(value);

    setState(() {
      _erro = emailValido ? null : "E-mail inválido";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.96,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.emailAddress,
        onChanged: _validarEmail, // Chama a verificação a cada mudança
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorText: _erro, // Exibe erro caso o e-mail seja inválido
        ),
      ),
    );
  }
}

class caixadetextotelefone extends StatefulWidget {
  final String label;
  final TextEditingController? controller;

  const caixadetextotelefone({
    Key? key,
    required this.label,
    this.controller,
  }) : super(key: key);

  @override
  State<caixadetextotelefone> createState() => _caixadetextotelefoneState();
}

class _caixadetextotelefoneState extends State<caixadetextotelefone> {
  late TextEditingController _controller;
  String? _erro;

  // Máscara para telefone no formato (44) 9 9999-9999
  final maskFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {"#": RegExp(r'[0-9]')}, // Apenas números
  );

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  void _validarTelefone(String value) {
    // Remove os caracteres não numéricos
    String telefoneNumerico = maskFormatter.getUnmaskedText();

    if (telefoneNumerico.length != 11) {
      setState(() {
        _erro = "Telefone inválido";
      });
    } else {
      setState(() {
        _erro = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.96,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.phone,
        inputFormatters: [maskFormatter], // Aplica a máscara
        onChanged: _validarTelefone, // Chama a verificação a cada mudança
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorText: _erro, // Exibe erro caso o telefone seja inválido
        ),
      ),
    );
  }
}


class caixadetextosenha extends StatefulWidget {
  final String label;

  const caixadetextosenha({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  _caixadetextosenhaState createState() => _caixadetextosenhaState();
}

class _caixadetextosenhaState extends State<caixadetextosenha> {
  bool _obscureText = true; // Controla se a senha está visível ou oculta

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.96,
      child: TextField(
        obscureText: _obscureText, // Alterna entre mostrar ou ocultar a senha
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText; // Alterna o estado da senha
              });
            },
          ),
        ),
      ),
    );
  }
}


class botao extends StatelessWidget {
final String texto_botao;
final Color cor_botao;
final Color cor_borda;
final Color cor_daFonte;
final double tamanho_daFonte;
final double larguraEmporc;


  const botao({
    Key? key,
    required this.texto_botao,
    required this.larguraEmporc,
    required this.cor_botao,
    required this.cor_borda,
    required this.cor_daFonte,
    required this.tamanho_daFonte,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return                 
      SizedBox(
        width: MediaQuery.of(context).size.width * larguraEmporc, 
        child: ElevatedButton.icon(
          onPressed: () async {},
            label: Text(
              texto_botao,
                style: TextStyle(fontSize: tamanho_daFonte,color: cor_daFonte),
              ),
        style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: cor_botao,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: cor_borda), 
          ),
        ),
      ),
    );
  }
}




  class espacamentoInicial extends StatelessWidget {
    const espacamentoInicial({super.key});

    @override
    Widget build(BuildContext context) {
      return SizedBox(height: 18);
    }
  }

  class espacamentonormal extends StatelessWidget {
    const espacamentonormal({super.key});

    @override
    Widget build(BuildContext context) {
      return SizedBox(height: 14);
    }
  }

  class caixa_Branca extends StatelessWidget {
    const caixa_Branca({super.key});

    @override
    Widget build(BuildContext context) {
      return const Placeholder();
    }
  }

class espacamentoalto extends StatelessWidget {
  const espacamentoalto({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 25);
  }
}

class CaixaTextoData extends StatefulWidget {
  final TextEditingController controller;

  const CaixaTextoData({super.key, required this.controller});

  @override
  State<CaixaTextoData> createState() => _CaixaTextoDataState();
}

class _CaixaTextoDataState extends State<CaixaTextoData> {
  Future<void> _selecionarData(BuildContext context) async {
    DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
     
    );

    if (dataSelecionada != null) {
      String dataFormatada = DateFormat('dd/MM/yyyy').format(dataSelecionada);
      setState(() {
        widget.controller.text = dataFormatada;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.96,
      child: TextField(
        controller: widget.controller,
        readOnly: true, // Impede edição manual
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
