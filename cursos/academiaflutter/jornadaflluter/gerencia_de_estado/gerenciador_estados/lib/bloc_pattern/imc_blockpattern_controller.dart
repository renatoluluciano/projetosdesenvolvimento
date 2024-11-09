import 'dart:async';
import 'dart:math';

import 'package:gerenciador_estados/bloc_pattern/imc_state.dart';

class ImcBlockpatternController {
  final _imcStreamControlle = StreamController<ImcState>.broadcast()
    ..add(ImcState(imc: 0.0));

  Stream<ImcState> get imcOut => _imcStreamControlle.stream;

  Future<void> calcularImc({required peso, required altura}) async {
    _imcStreamControlle.add(ImcStateLoading());

    await Future.delayed(Duration(seconds: 1));

    final imc = peso / pow(altura, 2);

    _imcStreamControlle.add(ImcState(imc: imc));
  }

  void dispose() {
    _imcStreamControlle.close();
  }
}
