import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:magicalworld/domain/failures/failures.dart';
import 'package:magicalworld/domain/servico.dart';
import 'package:magicalworld/presentation/controllers/servico/servico_list_ctrl.dart';
import 'package:magicalworld/presentation/pages/servico/servico_detail.dart';

class HomePage extends StatefulWidget {
  final ServicoListCtrl controller = ServicoListCtrl();
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ServicoListCtrl get controller => widget.controller;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(242, 145, 208, 1),
          title: Center(child: Text('Magical World')),
        ),
        body: Column(
          children: [
            FutureBuilder<dartz.Either<Failure, List<Servico>>>(
                future: controller.search(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.fold((failure) {
                      return Text('Erro: ${failure.message}');
                    }, (servicos) {
                      return Expanded(
                        child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 0.7),
                            children: buildCardItens(servicos)),
                      );
                    });
                  }

                  return const Center(child: CircularProgressIndicator());
                }))
          ],
        ));
  }

  List<Widget> buildCardItens(List<Servico> servicos) {
    List<Widget> itens = [];
    for (Servico s in servicos) {
      itens.add(GestureDetector(
        onTap: (() {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => ServicoDetail(s))));
        }),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Card(
            child: Column(
              children: [
                Image.network(s.imageUrl,
                    width: 400, height: 145, fit: BoxFit.cover),
                Text(
                  s.nome,
                  style: TextStyle(fontSize: 19),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Text('${s.preco}',
                            style: TextStyle(fontSize: 15, color: Colors.blue))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    }
    return itens;
  }
}
