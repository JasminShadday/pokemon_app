import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = const AssetImage("assets/images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["bulbasauro", "charmander", "squirtle"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    if (kDebugMode) {
      print("Escolha do App: $escolhaApp");
    }
    if (kDebugMode) {
      print("Escolha do usuario: $escolhaUsuario");
    }

    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "bulbasauro":
        setState(() {
          _imagemApp = const AssetImage("assets/images/bulbasauro.png");
        });
        break;
      case "charmander":
        setState(() {
          _imagemApp = const AssetImage("assets/images/charmander.png");
        });
        break;
      case "squirtle":
        setState(() {
          _imagemApp = const AssetImage("assets/images/squirtle.png");
        });
        break;
    }

    //Validação do ganhador
    //Usuario Ganhador
    if ((escolhaUsuario == "bulbasauro" && escolhaApp == "squirtle") ||
        (escolhaUsuario == "squirtle" && escolhaApp == "charmander") ||
        (escolhaUsuario == "charmander" && escolhaApp == "bulbasauro")) {
      setState(() {
        _mensagem = "Parabéns!!! Você ganhou :)";
      });
      //App Ganhador
    } else if ((escolhaApp == "bulbasauro" && escolhaUsuario == "squirtle") ||
        (escolhaApp == "squirtle" && escolhaUsuario == "charmander") ||
        (escolhaApp == "charmander" && escolhaUsuario == "bulbasauro")) {
      setState(() {
        _mensagem = "Você perdeu :(";
      });
    } else {
      setState(() {
        _mensagem = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Pokémon",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: _imagemApp,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("bulbasauro"),
                child: Image.asset(
                  "assets/images/bulbasauro.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("charmander"),
                child: Image.asset(
                  "assets/images/charmander.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("squirtle"),
                child: Image.asset(
                  "assets/images/squirtle.png",
                  height: 100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
