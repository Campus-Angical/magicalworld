import 'package:flutter/material.dart';
import 'package:magicalworld/domain/servico.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Servico(
                'https://sp-ao.shortpixel.ai/client/to_auto,q_lossy,ret_img/https://forfunfestas.com.br/wp-content/uploads/2017/12/Homem-Aranha-1-site.jpg',
                'Homem Aranha',
                300.00),
                Servico('https://i.pinimg.com/736x/90/2d/d9/902dd929bcd166f05755b567f0b92cd0.jpg', 'Pequena Sereia', 500),
                Servico('https://soloinfantil.com/wp-content/uploads/2015/05/festa-do-bob-esponja-como-fazer.jpg', 'Bob Esponja', 500),
                Servico('https://img.elo7.com.br/product/original/2ADEA52/decoracao-festa-infantil-jardim-encantado-festamenina.jpg', 'Rapunzel', 300)
          ])),
    );
  }
       //Método

  List<Widget> buildCardItens(List<Servico> servicos) {
    List<Widget> itens = [];
    for (Servico s in servicos) {
      itens.add(Card(
        child: Column(
          children: [
            Image.network(s.imageUrl, width: 400, height: 100, fit: BoxFit.cover),
            Text(s.nome),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.attach_money_sharp),
                  Text('${s.preco}'),
                ],
              ),
            )
          ],
        ),
      ));
    }
    return itens;
  }
}
