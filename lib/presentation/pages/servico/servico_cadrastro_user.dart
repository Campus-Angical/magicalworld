import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CadastrouserPage extends StatefulWidget {
  const CadastrouserPage({Key? key}) : super(key: key);

  @override
  State<CadastrouserPage> createState() => _CadastrouserPageState();
}

class _CadastrouserPageState extends State<CadastrouserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(242, 145, 208, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Nome',
                        hintText: 'Informe seu nome',
                        suffixIcon: Icon(Icons.person)),
                  ),
                ),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'E-mail',
                        hintText: 'Informe seu email',
                        suffixIcon: Icon(Icons.email)),
                  ),
                ),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: 'Informe sua senha',
                        suffixIcon: Icon(Icons.lock_outlined)),
                  ),
                ),
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'senha novamento',
                        hintText: 'Informe sua senha',
                        suffixIcon: Icon(Icons.lock_outlined)),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 145, 208, 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    'Logar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
