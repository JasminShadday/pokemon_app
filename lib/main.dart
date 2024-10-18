import 'package:flutter/material.dart';

import 'package:app_pokemon/jogo.dart';

void main() {
  runApp(_buildApp());
}

Widget _buildApp() {
  return const MaterialApp(
    home: Jogo(),
    debugShowCheckedModeBanner: false,
  );
}