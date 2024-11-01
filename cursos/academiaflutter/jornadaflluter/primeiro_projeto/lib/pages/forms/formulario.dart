import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final formKey = GlobalKey<FormState>(); //somente para um unico formulario

  final nomeCompletoController =
      TextEditingController(); //recuperar o texto no TextFormField

  final nomeGuerraContolador = TextEditingController();
  final valorInicialOpcao = 'Selecionar Policial';

  @override
  void dispose() {
    nomeCompletoController.dispose(); //descartar a variavel
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulario'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    //obscureText: true, //password
                    controller: nomeCompletoController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'Nome Completo:',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        isDense: true),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo X não preenchido';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nomeGuerraContolador,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'Nome de Guerra:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo X não preenchido';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nomeGuerraContolador,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'Data do Afastamento:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo X não preenchido';
                      }
                    },
                  ),
                ),
                DropdownButtonFormField<String>(
                    value: valorInicialOpcao,
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          value == valorInicialOpcao) {
                        return 'Policial não Selecionado';
                      }
                    },
                    items: [
                      DropdownMenuItem(
                          value: 'Selecionar Policial',
                          child: Text('Selecionar Policial')),
                      DropdownMenuItem(
                          value: 'Segunda Opção', child: Text('Segunda Opção')),
                      DropdownMenuItem(
                          value: 'Terceira Opção',
                          child: Text('Terceira Opção')),
                    ],
                    onChanged: (String? newValue) {}),
                ElevatedButton(
                    onPressed: () {
                      var formValid = formKey.currentState?.validate() ?? false;
                      var mensagem = 'Formulário inválido.';
                      if (formValid) {
                        mensagem = 'Formulario Válido';
                      }
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(mensagem)));
                    },
                    child: Text('Salvar')) // aqui aplica o validator
              ],
            ),
          ),
        ));
  }
}
