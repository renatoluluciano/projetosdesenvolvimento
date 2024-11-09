import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_estados/widgets/imc_gauge.dart';
import 'package:intl/intl.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({super.key});

  @override
  State<ValueNotifierPage> createState() => _ValueNotifierPageState();
}

//valuenotifier rebuild somente os valores e não a tela toda diferente do SetState

class _ValueNotifierPageState extends State<ValueNotifierPage> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  var imc = ValueNotifier(0.0);
  var formKey = GlobalKey<FormState>();

  void _calcularImc(double peso, double altura) {
    imc.value = 0;
    setState(() {
      imc.value = (peso / pow(altura, 2));
    });
  }

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
        title: const Text('IMC PAGE NOTIFIER'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ValueListenableBuilder<double>(
                  valueListenable: imc,
                  builder: (_, imcValue, __) {
                    return ImcGauge(imc: imcValue);
                  },
                ),
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
                        _calcularImc(peso, altura);
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
