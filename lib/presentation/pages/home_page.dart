
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:magicalworld/domain/servico.dart';
import 'package:magicalworld/presentation/pages/servico/servico_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(child: Text('Magical World')),
      ),
      drawer: Drawer(),

      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.9),
          children: buildCardItens([
            Servico(1,
                'https://sp-ao.shortpixel.ai/client/to_auto,q_lossy,ret_img/https://forfunfestas.com.br/wp-content/uploads/2017/12/Homem-Aranha-1-site.jpg',
                'Homem Aranha',300.00, 'Decoração do Home aranha ',0),
                Servico(2, 'https://i.pinimg.com/736x/90/2d/d9/902dd929bcd166f05755b567f0b92cd0.jpg', 'Pequena Sereia', 200,'Decoração da Pequena Sereia',0),
          ])),
          
          
    );
  }
       //Método

  List<Widget> buildCardItens(List<Servico> servicos) {
    List<Widget> itens = [];
    for (Servico s in servicos) {
      itens.add(GestureDetector(
         onTap: (() {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => ServicoDetail(s))));
        }),
        child: Card(
          child: Column(
            children: [
              Image.network(s.imageUrl, width: 400, height: 100, fit: BoxFit.cover),
              Text(s.nome),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  
                    Text('${s.preco}',style: TextStyle(fontSize: 15, color: Colors.blue))
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    }
    return itens;
  }
}