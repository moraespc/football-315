// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastrarJogador extends StatefulWidget {
  const CadastrarJogador({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CadastrarJogador> createState() => _CadastrarJogador();
}

class _CadastrarJogador extends State<CadastrarJogador> {
  // ignore: prefer_final_fields
  bool? _selecionado = false;
  XFile? photo, picTemp;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Jogador"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          //Upload da foto
          Padding(
            padding: EdgeInsets.all(32),
            child: GestureDetector(
                onTap: () async {
                  photo = await picker.pickImage(source: ImageSource.camera);

                  setState(() {
                    picTemp = photo;
                  });
                },
                child: (photo == null)
                    ? CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 104, 189, 107),
                        radius: 100,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 80,
                          color: Colors.white,
                        ))
                    : CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(picTemp!.path),
                      )),
          ),

          //Campo para insercao do nome
          Padding(
            padding: EdgeInsets.all(32),
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
              ],
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Nome:"),
            ),
          ),

          //Campo para insercao do documento (CPF)
          Padding(
            padding: EdgeInsets.all(32),
            child: TextFormField(
              inputFormatters: [
                MaskTextInputFormatter(
                    mask: '###.###.###-##',
                    filter: {"#": RegExp(r'[0-9]')},
                    type: MaskAutoCompletionType.lazy),
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "CPF:"),
            ),
          ),

          //Campo para insercao da data de nascimento
          Padding(
            padding: EdgeInsets.all(32),
            child: TextFormField(
              inputFormatters: [
                MaskTextInputFormatter(
                    mask: '##/##/####',
                    filter: {"#": RegExp(r'[0-9]')},
                    type: MaskAutoCompletionType.lazy),
              ],
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(labelText: "Data de Nascimento:"),
            ),
          ),

          //Checkbox para a vacinacao
          Padding(
            padding: EdgeInsets.all(32),
            child: CheckboxListTile(
              title: Text("Vacinação:"),
              subtitle: Text("Marque apenas se tiver as duas doses"),
              value: _selecionado,
              onChanged: (bool? selecao) {
                setState(() {
                  _selecionado = selecao;
                });
              },
            ),
          ),

          //Botao para salvar o cadastro
          Padding(
            padding: EdgeInsets.all(32),
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: Text("Salvar"),
              icon: Icon(Icons.save),
            ),
          )
        ],
      )),
    );
  }
}
