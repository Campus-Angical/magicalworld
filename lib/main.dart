import 'package:flutter/material.dart';
import 'package:magicalworld/presentation/pages/home_page.dart';

void main() {
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
    )
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
              label: 'home',
              backgroundColor: Colors.pink,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Perfil',
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Cadastrar',
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline_sharp),
                label: 'Favoritos',
                backgroundColor: Colors.pink)
          ],
          onTap: (index) {
            _curr = index;
            setState(() {});
          }),
    );
  }
}
