import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magicalworld/firebase_options.dart';
import 'package:magicalworld/presentation/pages/home_page.dart';
import 'package:magicalworld/presentation/pages/servico/login.dart';
import 'package:magicalworld/presentation/pages/servico/servico_cadrastro_user.dart';
import 'package:magicalworld/presentation/pages/servico/servico_denucia.dart';
import 'package:magicalworld/presentation/pages/servico/servico_form_page.dart';
import 'package:magicalworld/presentation/pages/servico/servico_list_page.dart';
import 'package:magicalworld/presentation/pages/servico/servico_pagamento.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: MyApp()));
  

  FirebaseFirestore.instance.collection('servicos').doc('uGC5XeD7EqMDFcC1kU4X').delete();

  /*FirebaseFirestore.instance.collection('servicos').doc('PoE7jmba6YStLz84pq2C').update(
  {
    'preco':468
  }
 );*/

 
/*var collection = FirebaseFirestore.instance.collection('servicos');
  var result = await collection.get();
 
  for (var doc in result.docs) {
    print(doc['preco']);
  }*/

  /*var collection = FirebaseFirestore.instance.collection('servicos');
  final nomeQuery = await collection.where('nome', isEqualTo: 'Bob Esponja').get();
 
  for (var doc in nomeQuery.docs) {
    print(doc.reference.id);
    print(doc['nome']);
    print(doc['descricao']);
  }*/



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
    ServicoListPage()
  
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list[_curr],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(242, 145, 208, 1),
        currentIndex: _curr,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, color: Colors.white,),
                label: 'Home',
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity_outlined, color: Colors.white,),
                label: 'Perfil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outlined, color: Colors.white,),
                label: 'Favoritos'),
           
          ],
          onTap: (index) {
            _curr = index;
            setState(() {});
          }),
    );
  }
}
