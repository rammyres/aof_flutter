import 'dart:convert';
import 'package:aof_flutter/modelos/vacilo.dart';
import 'package:flutter/services.dart';

class Vacilos {
  List<Vacilo> vacilos = [];

  // Vacilos() {
  //   carregarVacilos();
  // }

  Future<void> carregarVacilos() async {
    String jsonString = await rootBundle.loadString('assets/vacilos.json');
    final jsonData = jsonDecode(jsonString);

    var i = 0;
    for (Map<String, dynamic> item in jsonData['vacilos']) {
      vacilos.add(Vacilo.fromJson(item));
      i++;
      print(i);
    }
  }

  Vacilo? vacilosPorTipo({required String tipo}) {
    for (Vacilo _ in vacilos) {
      if (_.tipo == tipo) {
        return _;
      }
    }
    return null;
  }
}
