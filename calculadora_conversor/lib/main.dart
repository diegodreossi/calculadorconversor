import 'package:calculadora_conversor/criarmoedas.dart';
import 'package:calculadora_conversor/historico.dart';
import 'package:calculadora_conversor/historicoconversor.dart';
import 'package:calculadora_conversor/inicio.dart';
import 'package:calculadora_conversor/sobre.dart';
import 'package:calculadora_conversor/listamoedas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'calculadora.dart';
import 'criarconta.dart';
import 'login.dart';
import 'inicio.dart';
import 'sobre.dart';
import 'conversor.dart';
import 'moedas.dart';

Future<void> main() async {
  //Inicializar o FIRESTORE
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          //'/editar': (context) => Editar(),
          '/conversor': (context) => Conversor(),
          '/historico': (context) => ListaHist(),
          '/historicoconversor': (context) => ListaHist2(),
          '/criarconta': (context) => TelaCriarConta(),
          '/listamoedas' : (context) => Moedas(), 
          '/criarmoedas':(context)=>TelaCriarMoeda()
           });
  }
}
