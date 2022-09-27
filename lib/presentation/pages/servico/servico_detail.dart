import 'package:flutter/material.dart';
import 'package:magicalworld/domain/servico.dart';

class ServicoDetail extends StatelessWidget {
    Servico servico;
  ServicoDetail(this.servico, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          Image.network(servico.imageUrl),       
          Text(servico.nome),        
          Text('${servico.preco}'),
        ],
      ),
    );
  }

}