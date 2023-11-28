import 'package:aof_flutter/modelos/vacilo.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            Text("O AOF $aof foi devolvido sob a seguinte justificativa."),
            Text(
              justificativa,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            Text(vacilo.texto),
          ],
        ),
      ),
    );
  }
}
