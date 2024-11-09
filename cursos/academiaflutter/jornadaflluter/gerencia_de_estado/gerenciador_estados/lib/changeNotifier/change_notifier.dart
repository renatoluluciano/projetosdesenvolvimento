import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_estados/changeNotifier/change_notifier_controller.dart';
import 'package:gerenciador_estados/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  final controller = ChangeNotifierController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC PAGE CHANGE NOTIFIER'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return ImcGauge(imc: controller.imc);
                    }),
                SizedBox(
                  height: 20,
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
                        controller.calcularIMC(peso: peso, altura: altura);
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
