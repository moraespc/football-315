import 'package:flutter/material.dart';

class Initial extends StatefulWidget {
  const Initial({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Initial> createState() => _Initial();
}

class _Initial extends State<Initial> {
  String _escolhaRadio = '315';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(32),
      color: Color.fromARGB(255, 4, 70, 6),
      child: Center(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                'images/logo.png',
                width: 900,
                height: 200,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(32),
                    child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: "315",
                              groupValue: _escolhaRadio,
                              onChanged: (String? escolha) {
                                setState(() {
                                  _escolhaRadio = escolha!;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                            const Text("315",
                                style: TextStyle(color: Colors.white))
                          ],
                        ))),
                Padding(
                    padding: const EdgeInsets.all(32),
                    child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: "master",
                              groupValue: _escolhaRadio,
                              onChanged: (String? escolha) {
                                setState(() {
                                  _escolhaRadio = escolha!;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                            const Text("Master",
                                style: TextStyle(color: Colors.white))
                          ],
                        ))),
                Padding(
                    padding: const EdgeInsets.all(32),
                    child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: "campo",
                              groupValue: _escolhaRadio,
                              onChanged: (String? escolha) {
                                setState(() {
                                  _escolhaRadio = escolha!;
                                });
                              },
                              activeColor: Colors.white,
                              focusColor: Colors.white,
                            ),
                            const Text("Campo",
                                style: TextStyle(color: Colors.white))
                          ],
                        ))),
              ],
            ),
            FloatingActionButton.extended(
              label: const Text("INICIAR"),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              onPressed: () {},
            ),
          ],
        )),
      ),
    ));
  }
}
