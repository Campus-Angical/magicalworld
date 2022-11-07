import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magicalworld/presentation/pages/home_page.dart';
import 'package:magicalworld/presentation/pages/servico/login.dart';
import 'package:magicalworld/presentation/pages/servico/servico_cadrastro_user.dart';
import 'package:magicalworld/presentation/pages/servico/servico_denucia.dart';
import 'package:magicalworld/presentation/pages/servico/servico_form_page.dart';
import 'package:magicalworld/presentation/pages/servico/servico_pagamento.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController controller = PageController();
  List<Widget> _list = [
    HomePage(),
    Container(
      color: Colors.amber,
    ),
    ServicoFormPage(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list[_curr],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _curr,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
                backgroundColor: Color.fromRGBO(242, 145, 208, 1)),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity_outlined),
                label: 'Perfil',
                backgroundColor: Color.fromRGBO(242, 145, 208, 1)),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Cadastrar',
                backgroundColor: Color.fromRGBO(242, 145, 208, 1)),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outlined),
                label: 'Favoritos',
                backgroundColor: Color.fromRGBO(242, 145, 208, 1))
          ],
          onTap: (index) {
            _curr = index;
            setState(() {});
          }),
    );
  }
}
