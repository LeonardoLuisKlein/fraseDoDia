import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _frases = [
    'Nada está tão ruim que não possa piorar',
    'Terra de saci qualquer coice é voadora',
    'Se a vida te der limões faça uma caipirinha'
  ];

  var _fraseGerada = 'Clique abaixo para gerar uma frase';

  void _gerarFrase() {
    var _numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[_numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    var imagem = Image.asset("images/frasesDoDia.png");
    var frase = Text(_fraseGerada,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            fontSize: 25, fontStyle: FontStyle.italic, color: Colors.black));
    var botao = ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            elevation: 0,
            fixedSize: const Size(220.0, 80.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () {
          _gerarFrase();
        },
        child: const Text(
          "Nova Frase",
          style: TextStyle(fontSize: 25),
        ));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases do dia"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                imagem,
                frase,
                botao,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
