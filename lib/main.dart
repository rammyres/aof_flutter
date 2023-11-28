import 'package:flutter/material.dart';
import 'package:aof_flutter/telas/inicial.dart';
import 'package:aof_flutter/telas/tela_vacilo.dart';

void main() {
  runApp(const TextoEmail(Key("KeyApp1")));
}

class TextoEmail extends StatelessWidget {
  const TextoEmail(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devoluções Indevidas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const Inicial());
          case '/telaVacilo':
            final Map<String, dynamic>? args =
                settings.arguments as Map<String, dynamic>?;
            if (args != null) {
              return MaterialPageRoute(
                builder: (context) => TelaVacilo(
                  vacilo: args['vacilo'],
                  aof: args['aof'],
                  justificativa: args['justificativa'],
                ),
              );
            }
            return MaterialPageRoute(builder: (context) => const Scaffold());
          default:
            // Caso a rota não seja encontrada, retorne a rota inicial
            return MaterialPageRoute(builder: (context) => const Inicial());
        }
      },
    );
  }
}
