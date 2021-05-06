import 'package:calculadora_conversor/editar.dart';
import 'package:calculadora_conversor/historico.dart';
import 'package:calculadora_conversor/inicio.dart';
import 'package:calculadora_conversor/sobre.dart';
import 'package:flutter/material.dart';

import 'calculadora.dart';
import 'login.dart';
import 'inicio.dart';
import 'sobre.dart';
import 'editar.dart';
import 'conversor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App',
        theme: ThemeData(
          
          
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/calculadora': (context) => Calculadora(),
          '/inicio': (context) => Inicio(),
          '/sobre': (context) => Sobre(),
          '/editar': (context) => Editar(),
          '/conversor':(context)=>Conversor(),
          '/historico':(context)=>ListaHist(),
        });
  }
}
