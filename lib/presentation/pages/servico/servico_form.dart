
import 'package:flutter/material.dart';
import 'package:magicalworld/data/repositories/servico_repository.dart';
import 'package:magicalworld/domain/servico.dart';

class ServicoForm extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController imageCtrl = TextEditingController();
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController precoCtrl = TextEditingController();
  TextEditingController descricaoCtrl = TextEditingController();

  ServicoRepository repository = ServicoRepository();

  ServicoForm({Key? key}) : super(key: key);

  @override
  State<ServicoForm> createState() => _ServicoFormState();
}

class _ServicoFormState extends State<ServicoForm> {
  get formKey => null;

  TextEditingController get imageCtrl => widget.imageCtrl;

   TextEditingController get nomeCtrl => widget.nomeCtrl;

  TextEditingController get precoCtrl => widget.precoCtrl;

  TextEditingController get descricaoCtrl => widget.descricaoCtrl;

   get  repository => widget.repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: imageCtrl,
                decoration: const InputDecoration(
                  hintText: 'imagem:',
                  border: OutlineInputBorder(),
                  labelText: 'imagem',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                },
              ),
              TextFormField(
                controller: nomeCtrl,
                decoration: const InputDecoration(
                  hintText: 'nome:',
                  border: OutlineInputBorder(),
                  labelText: 'nome',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                },
              ),
              TextFormField(
                controller: precoCtrl,
                decoration: const InputDecoration(
                  hintText: 'preco:',
                  border: OutlineInputBorder(),
                  labelText: 'preco',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                },
              ),
              TextFormField(
                controller: descricaoCtrl,
                decoration: const InputDecoration(
                  hintText: 'descricao:',
                  border: OutlineInputBorder(),
                  labelText: 'descricao',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                 
                },
              ),
               OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Servico servico =
                          Servico('',imageCtrl.text, nomeCtrl.text, double.parse(precoCtrl.text), descricaoCtrl.text,0);

                      repository.add(servico);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Cadastrar')),
            ],
          ),
        ),
      ),
       
    );
  }
}
