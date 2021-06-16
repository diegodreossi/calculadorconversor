import 'package:calculadora_conversor/calculadora.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'moedas.dart';

String emailAtual = '';
String senha = '';
String nmUsuarioAtual = '';
//late usuarios usuarioAtual;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            //Altura e largura infinita
            width: MediaQuery.of(context).size.width,
            //double.infinity, menos para SingleChildScrollView
            height: MediaQuery.of(context).size.height,
            //Pega informações do context

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  //Alinhamento
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 400,
                      child: Text('Calculadora e Conversor',
                          style: TextStyle(fontSize: 35)),
                    ),

                    Container(
                        height: 280,
                        width: 300,
                        child: Image.network(
                            'https://cdn5.colorir.com/desenhos/color/201703/calculadora-solar-colegio-1332667.jpg')),

                    SizedBox(
                      height: 250,
                      width: 400,
                      child: Card(
                        borderOnForeground: true,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (text) {
                                  nmUsuarioAtual = text;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 5,
                                  )
                                ],
                              ), 

                              //-----------------
                              TextField(
                                onChanged: (text) {
                                  emailAtual = text;
                                },
                                decoration: InputDecoration(
                                  labelText: 'EMAIL',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 5,
                                  )
                                ],
                              ),
                              TextField(
                                onChanged: (text) {
                                  senha = text;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'SENHA',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                  )
                                ],
                              ),

                               Row(
                                children: [
                                   Container(height: 10,width: 30,),
                                   ElevatedButton(
                                   onPressed: () {
                                   if (emailAtual == "" && senha == "") {
                                   //<-
                                   } else {
                                   //<-
                                   login(emailAtual, senha);
                                   } //<-
                                   },
                                   child: Text('LOGIN'),
                                   ),
                                   Container(height: 20, width: 150,),    
                                   ElevatedButton(
                                   onPressed: () {
                                   Navigator.of(context).pushNamed('/criarconta');
                                   },
                                   child: Text('Criar Conta'),  

                                
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //Campos de escrever texto

                    //Botões
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      //Pilha
      children: [
        Container(color: Colors.blueAccent[100]),
        _body(),
      ],
    ));
  }

  // LOGIN com Firebase Auth
  //
  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      isLoading = false;
      Navigator.pushReplacementNamed(context, '/inicio');
    }).catchError((erro) {
      var mensagem = '';
      if (erro.code == 'user-not-found') {
        mensagem = 'ERRO: Usuário não encontrado';
      } else if (erro.code == 'wrong-password') {
        mensagem = 'ERRO: Senha incorreta';
      } else if (erro.code == 'invalid-email') {
        mensagem = 'ERRO: Email inválido';
      } else {
        mensagem = erro.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$mensagem'), duration: Duration(seconds: 2)));
    });
  }
}
