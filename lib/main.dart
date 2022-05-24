// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'cadastroJogador.dart';
import 'initial.dart';
import 'package:flutter/material.dart';
import 'firebase.dart';

void main() {
  firebaseInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futech',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const Initial(title: 'Futech - Home'),
        '/cadastro': (BuildContext context) =>
            const CadastrarJogador(title: 'Cadastrar Jogador'),
      },
    );
  }
}
