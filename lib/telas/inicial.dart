import 'package:aof_flutter/dados/vacilos.dart';
import 'package:aof_flutter/telas/tela_vacilo.dart';
import 'package:flutter/material.dart';

class Inicial extends StatefulWidget {
  const Inicial({Key? key}) : super(key: key);

  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  String _selectedOption = '';
  String _inputNumber = '';
  String _generatedText = '';
  String _largeText = '';
  Vacilos _vacilos = Vacilos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário IR'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedOption = 'formulario_ir';
                      });
                    },
                    child: const Text('Declaração de IR'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedOption = 'formulario_antigo';
                      });
                    },
                    child: const Text('Formulário Antigo'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              _selectedOption.isNotEmpty
                  ? Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Número (no formato 0000/000000000)',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _inputNumber = value;
                            });
                          },
                        ),
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
