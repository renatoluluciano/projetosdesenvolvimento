import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_estados/bloc_pattern/imc_blockpattern_controller.dart';
import 'package:gerenciador_estados/bloc_pattern/imc_state.dart';
import 'package:gerenciador_estados/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';

class ImcBlocPatternPage extends StatefulWidget {
  const ImcBlocPatternPage({super.key});

  @override
  State<ImcBlocPatternPage> createState() => _ImcBlocPatternPageState();
}

class _ImcBlocPatternPageState extends State<ImcBlocPatternPage> {
  final controller = ImcBlockpatternController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  //var imc = 0.0;
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC PAGE BlockPatern'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StreamBuilder<ImcState>(
                  builder: (context, snapshot) {
                    var imc = snapshot.data?.imc ?? 0;

                    return ImcGauge(imc: imc);
                  },
                  stream: controller.imcOut,
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<ImcState>(
                  stream: controller.imcOut,
                  builder: (context, snapshot) {
                    return Center(
                        child: Visibility(
                            visible: snapshot.data is ImcStateLoading,
                            child: CircularProgressIndicator()));
                  },
                ),
                TextFormField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Peso"),
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                        locale: 'pt_BR',
                        symbol: '',
                        decimalDigits: 2,
                        turnOffGrouping: true)
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Peso Obrigatorio';
                    }
                  },
                ),
                TextFormField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Altura"),
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                        locale: 'pt_BR',
                        symbol: '',
                        decimalDigits: 2,
                        turnOffGrouping: true)
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo Altura Obrigatorio';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      var formaValid =
                          formKey.currentState?.validate() ?? false;

                      if (formaValid) {
                        var formater = NumberFormat.simpleCurrency(
                          locale: 'pt_BR',
                          decimalDigits: 2,
                        );
                        double peso =
                            formater.parse(pesoController.text) as double;
                        double altura =
                            formater.parse(alturaController.text) as double;

                        controller.calcularImc(peso: peso, altura: altura);
                      }
                    },
                    child: Text('Calcular IMC')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
