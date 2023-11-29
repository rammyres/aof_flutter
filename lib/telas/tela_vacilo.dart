import 'package:aof_flutter/modelos/vacilo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelaVacilo extends StatelessWidget {
  final Vacilo vacilo;
  final String aof;
  final String justificativa;
  const TelaVacilo({
    Key? key,
    required this.vacilo,
    required this.justificativa,
    required this.aof,
  }) : super(key: key);

  void _copyToClipboard(String textToCopy, BuildContext context) {
    Clipboard.setData(ClipboardData(text: textToCopy));
    const snackBar =
        SnackBar(content: Text('Texto copiado para a área de transferência'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final content = '''
O AOF $aof foi devolvido sob a seguinte justificativa.

*$justificativa*

${vacilo.texto}
''';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SelectableText.rich(
              TextSpan(
                text: content,
                style: const TextStyle(fontSize: 16.0),
              ),
              style: const TextStyle(
                  fontFamily: 'Roboto'), // Define a fonte desejada
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _copyToClipboard(content, context);
              },
              child: const Text('Copiar para a Área de Transferência'),
            ),
          ],
        ),
      ),
    );
  }
}
