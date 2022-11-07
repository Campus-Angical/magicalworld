import 'package:flutter/material.dart';
import 'package:magicalworld/data/repositories/servico_repository.dart';
import 'package:magicalworld/domain/servico.dart';
import 'package:magicalworld/presentation/controllers/servico/servico_form_ctrl.dart';

class ServicoFormPage extends StatefulWidget {
  ServicoFormCtrl controller = ServicoFormCtrl();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController imageCtrl = TextEditingController();
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController precoCtrl = TextEditingController();
  TextEditingController descricaoCtrl = TextEditingController();

  ServicoRepository repository = ServicoRepository();

  ServicoFormPage({Key? key}) : super(key: key);

  @override
  State<ServicoFormPage> createState() => _ServicoFormPageState();
}

class _ServicoFormPageState extends State<ServicoFormPage> {
  get formKey => widget.formKey;

  TextEditingController get imageCtrl => widget.imageCtrl;

  TextEditingController get nomeCtrl => widget.nomeCtrl;

  TextEditingController get precoCtrl => widget.precoCtrl;

  TextEditingController get descricaoCtrl => widget.descricaoCtrl;

  get repository => widget.repository;
  ServicoFormCtrl get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Color.fromRGBO(242, 145, 208, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: imageCtrl,
                  decoration: const InputDecoration(
                      labelText: 'Link',
                      hintText: 'Endereço da imagem',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.link)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nomeCtrl,
                  decoration: const InputDecoration(
                      hintText: 'Informe seu nome:',
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                      suffixIcon: Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: precoCtrl,
                  decoration: const InputDecoration(
                      hintText: 'Informe o valor',
                      border: OutlineInputBorder(),
                      labelText: 'Valor',
                      suffixIcon: Icon(Icons.attach_money_outlined)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLines: null,
                  controller: descricaoCtrl,
                  decoration: const InputDecoration(
                      hintText: 'Informe a descrição do serviço:',
                      border: OutlineInputBorder(),
                      labelText: 'Descrição',
                      suffixIcon: Icon(Icons.description)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                  },
                ),
                SizedBox(height: 40),
                Container(
                  height: 56,
                  width: 216,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(242, 145, 208, 1)),
                  child: OutlinedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          (await controller.submit(
                                  imageCtrl.text,
                                  nomeCtrl.text,
                                  double.parse(precoCtrl.text),
                                  descricaoCtrl.text))
                              .fold((l) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Erro ao Cadastrar!'),
                            ));
                          }, (r) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Sucesso!'),
                            ));
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
