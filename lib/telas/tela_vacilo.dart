import 'package:aof_flutter/modelos/vacilo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelaVacilo extends StatelessWidget {
  final Vacilo vacilo;
  final String aof;
  final String justificativa;
  final String alerta1 =
      "\nReiretamos a necessidade de diligência e cautela nas devoluções, considerando as implicações.\n";
  final String alerta2 =
      "\nDIOPE GESTÃO PSO e DIOPE SERVIÇOS JUDICIAIS cientificados, conforme orientação.";

  const TelaVacilo({
    super.key,
    required this.vacilo,
    required this.justificativa,
    required this.aof,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Texto do e-mail",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                children: [
                  TextSpan(
                    text:
                        'O AOF $aof foi devolvido sob a seguinte justificativa. \n\n',
                  ),
                  TextSpan(
                    text: justificativa,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: '\n\n${vacilo.texto}\n',
                  ),
                  TextSpan(text: alerta1),
                  TextSpan(text: alerta2),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String content =
                    'O AOF $aof foi devolvido sob a seguinte justificativa. '
                    '\n\n$justificativa\n\n${vacilo.texto}\n$alerta1 $alerta2';
                Clipboard.setData(ClipboardData(text: content)).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Conteúdo copiado para a área de transferência'),
                    ),
                  );
                });
              },
              child: const Text('Copiar para área de transferência'),
            ),
          ],
        ),
      ),
    );
  }
}
