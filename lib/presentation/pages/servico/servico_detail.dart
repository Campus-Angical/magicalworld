import 'package:flutter/material.dart';
import 'package:magicalworld/domain/servico.dart';

class ServicoDetail extends StatelessWidget {
  Servico servico;
  ServicoDetail(this.servico, {Key? key}) : super(key: key);
  int count = 0;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.red[100]),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.red[100]),
                )
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
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
