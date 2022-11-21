import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DenuciaPage extends StatefulWidget {
  const DenuciaPage({Key? key}) : super(key: key);

  @override
  State<DenuciaPage> createState() => _DenuciaPageState();
}

class _DenuciaPageState extends State<DenuciaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(242, 145, 208, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Denúncia',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
            Container(
              width: 90,
              child: Divider(
                thickness: 3,
                color: Color.fromRGBO(242, 145, 208, 1),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                maxLines: null,
                maxLength: 1000,
                decoration: InputDecoration(
                  hintText: 'Informe sua Reclamação',
                  prefixIcon: Icon(
                    Icons.sms_rounded,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 247, 122, 236), width: 2),
                  ),
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(242, 145, 208, 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Enviar Denúncia',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
