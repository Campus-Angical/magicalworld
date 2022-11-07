import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:magicalworld/domain/servico.dart';
import 'package:magicalworld/presentation/controllers/servico/servico_detail_ctrl.dart';
import 'package:magicalworld/presentation/pages/servico/servico_denucia.dart';
import 'package:magicalworld/presentation/pages/servico/servico_pagamento.dart';

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
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(242, 145, 208, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                : Color.fromARGB(255, 255, 203, 199)),
                      ),
                      Text('${servico.like}'),
                      Padding(
                        padding: const EdgeInsets.only(left: 280),
                        child: GestureDetector(
                          child: Row(
                            children: [Icon(Icons.device_unknown_rounded)],
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DenuciaPage(),
                            ));
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PagamentoPage(),
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(242, 145, 208, 1)),
                    width: 350,
                    height: 50,
                    child: Center(
                        child: Text(
                      'Adquerir Serviço',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
              ),
            ),
            Center(
              child: Text(
                'Descrição do Produto',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Divider(
                height: 2,
                thickness: 0.2,
                color: Color.fromRGBO(242, 145, 208, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                servico.descricao,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
