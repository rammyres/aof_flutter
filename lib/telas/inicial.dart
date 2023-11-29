import 'package:aof_flutter/dados/vacilos.dart';
import 'package:flutter/material.dart';
import "package:aof_flutter/modelos/vacilo.dart";

class Inicial extends StatefulWidget {
  Inicial({Key? key}) : super(key: key);

  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  String _selectedOption = '';
  String _inputNumber = '';
  String _generatedText = '';
  String _largeText = '';
  late Vacilos _vacilos;
  List<DropdownMenuItem<String>> items = [];
  String _alertText = '';

  @override
  void initState() {
    super.initState();
    _vacilos = Vacilos();
    _carregarVacilos();
    _updateAlertText(); // Chamar a função para exibir o alerta ao iniciar
  }

  Future<void> _carregarVacilos() async {
    await _vacilos.carregarVacilos();

    Set<String> tiposUnicos =
        _vacilos.vacilos.map((vacilo) => vacilo.tipo).toSet();

    setState(() {
      _selectedOption = tiposUnicos.isNotEmpty ? tiposUnicos.first : '';
      items = tiposUnicos.map((tipo) {
        Vacilo vacilo = _vacilos.vacilos.firstWhere((v) => v.tipo == tipo);
        return DropdownMenuItem<String>(
          value: vacilo.tipo,
          child: Text(vacilo.descricao),
        );
      }).toList();
    });
  }

  void _updateAlertText() {
    Vacilo? vacilo = _vacilos.vacilosPorTipo(tipo: _selectedOption);
    if (vacilo != null) {
      setState(() {
        _alertText = vacilo.alerta;
      });
    } else {
      setState(() {
        _alertText = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerar resposta para devoluções'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Escolha uma opção:',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              // DropdownButton preenchido com a lista de vacilos
              DropdownButton<String>(
                hint: const Text('Selecione o motivo da devolução'),
                value: _selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue!;
                    _updateAlertText();
                  });
                },
                items: items,
              ),
              const SizedBox(height: 20.0),
              _selectedOption.isNotEmpty
                  ? Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'AOF (no formato 0000/000000000)',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _inputNumber = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20.0),
                        if (_alertText.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              _alertText,
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.red),
                            ),
                          ),
                        const SizedBox(height: 20.0),
                        if (_inputNumber.isNotEmpty)
                          TextFormField(
                            maxLines: null,
                            decoration: const InputDecoration(
                              labelText: 'Justificativa',
                              hintText:
                                  'Escreva o texto enviado pela PSO/CENOP aqui',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _largeText = value;
                              });
                            },
                          ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/telaVacilo',
                                arguments: {
                                  "aof": _inputNumber,
                                  "vacilo": _vacilos.vacilosPorTipo(
                                      tipo: _selectedOption),
                                  "justificativa": _largeText,
                                });
                          },
                          child: const Text('Enviar'),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          _generatedText,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
