import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:magicalworld/domain/failures/failures.dart';
import 'package:magicalworld/domain/servico.dart';
import 'package:magicalworld/presentation/controllers/servico/servico_list_ctrl.dart';
import 'package:magicalworld/presentation/pages/servico/servico_detail.dart';
import 'package:magicalworld/presentation/pages/servico/servico_form_page.dart';

class ServicoListPage extends StatefulWidget {
  final ServicoListCtrl controller = ServicoListCtrl();
  ServicoListPage({Key? key}) : super(key: key);

  @override
  State<ServicoListPage> createState() => _ServicoListPageState();
}

class _ServicoListPageState extends State<ServicoListPage> {
  ServicoListCtrl get controller => widget.controller;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(242, 145, 208, 1),
        actions: [
               Row(
                 children: [
                    CircleAvatar(child: Image.asset('')),
                 ],
               )
            ],
      ),
      body: Column(
        children: [
          FutureBuilder<dartz.Either<Failure, List<Servico>>>(
            future: controller.favoritos(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.fold(
                  (failure) {
                    return Text('Erro: ${failure.message}');
                  },
                  (servicos) {
                    if(servicos.isEmpty){
                      return 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 140),
                              child: Image.asset('assets/img/zyro-image.png', height: 400, width: 400,),
                            ),
                          ],
                        );
                      
                    }else{
                       return Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 0.7),
                            children: buildCardItens(servicos)),
                      ),
                    );

                    }
                   
                  },
                );
              }

              return const Center(child: CircularProgressIndicator());
            }),
          )
        ],
      ),
    );
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    s.nome,
                    style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Text('R\$ ${s.preco}',
                            style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 51, 47, 47)))
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
