import 'package:flutter/material.dart';
import 'package:magicalworld/domain/servico.dart';
import 'package:magicalworld/presentation/controllers/servico/servico_detail_ctrl.dart';

class ServicoDetail extends StatefulWidget {
  ServicoDetailCtrl controller = ServicoDetailCtrl();
  Servico servico;
  ServicoDetail(this.servico, {Key? key}) : super(key: key);

  @override
  State<ServicoDetail> createState() => _ServicoDetailState();
}

class _ServicoDetailState extends State<ServicoDetail> {
  Servico get servico => widget.servico;
  ServicoDetailCtrl get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(servico.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.like(servico);
                        setState(() {});
                      },
                      icon: Icon(Icons.favorite,
                          color: controller.isLiked(servico)
                              ? Colors.red
                              : Colors.red[100]),
                    ),
                    Text('${servico.like}')
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: Padding(
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    'Contratar Serviço',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
            ),
          ),
          Center(child: Text('DESCRIÇÃO')),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(servico.descricao),
          ),
        ],
      ),
    );
  }
}
