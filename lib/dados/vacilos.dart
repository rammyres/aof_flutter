import 'package:aof_flutter/modelos/vacilo.dart';

class Vacilos {
  final vacilos = [
    Vacilo(tipo: "formulario_ir", texto: "Conforme IN 147-1 12.9"),
    Vacilo(tipo: "formulario_antigo", texto: "Conforme resolve"),
  ];

  Vacilo? vacilosPorTipo({required String tipo}) {
    for (Vacilo _ in vacilos) {
      if (_.tipo == tipo) {
        return _;
      }
    }
    return null;
  }
}
