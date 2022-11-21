import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PagamentoPage extends StatefulWidget {
  const PagamentoPage({Key? key}) : super(key: key);

  @override
  State<PagamentoPage> createState() => _PagamentoPageState();
}

class _PagamentoPageState extends State<PagamentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(242, 145, 208, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Localização',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
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
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Informe sua Cidade'),
                ),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Informe seu Endereço'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Text(
                    'Forma de pagamento',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
