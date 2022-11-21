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
        backgroundColor: Color.fromRGBO(242, 145, 208, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cadastre seu serviço',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  width: 200,
                  child: Divider(
                    thickness: 3,
                    color: Color.fromRGBO(242, 145, 208, 1),
                  ),
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: imageCtrl,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 247, 122, 236), width: 2),
                    ),
                    hintText: 'Endereço da imagem',
                    prefixIcon: Icon(Icons.link, color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 247, 122, 236),
                            width: 2),
                      ),
                      hintText: 'Informe seu nome',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 247, 122, 236),
                            width: 2),
                      ),
                      hintText: 'Informe o valor',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.attach_money_outlined,
                        color: Colors.black,
                      )),
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 247, 122, 236),
                            width: 2),
                      ),
                      hintText: 'Informe a descrição do serviço:',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.description,
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório!';
                    }
                  },
                ),
                SizedBox(height: 40),
                Container(
                  height: 60,
                  width: 200,
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
                              content: Text('Seu serviço foi cadastrado com sucesso',),
                            ));

                            Navigator.pop(context);
                          });
                        }
                      },
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
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
