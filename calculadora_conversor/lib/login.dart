import 'package:flutter/material.dart';
import 'calculadora.dart';
import 'login.dart';
import 'inicio.dart';
import 'sobre.dart';
import 'editar.dart';
import 'conversor.dart';

String emailAtual = 'diego.dreossi@fatec.sp.gov.br';
String senhaAtual = '1234';
String nomeConta = 'Diego';
String emailConta = 'diego.dreossi@fatec.sp.gov.br';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';
  

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
            // double.infinity,
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
                      /*Image.asset('assets/imagens/bmw_m2.png'),
                         */
                    ),

                    Container(
                        height: 300,
                        width: 300,
                        child: Image.network(
                            'https://cdn5.colorir.com/desenhos/color/201703/calculadora-solar-colegio-1332667.jpg')),
                    /* Container(
                      width: 30,
                      height: 30,
                    ),*/

                    SizedBox(
                      height: 150,
                      width: 400,
                      child: Card(
                        borderOnForeground: true,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (text) {
                                  email = text;
                                },
                                //keyboardType: TextInputType.emailAddress,
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
                            ],
                          ),
                        ),
                      ),
                    ),

                    //Campos de escrever texto

                    //Botões
                    ElevatedButton(
                      onPressed: () {
                        if (email == emailAtual &&
                            senha == senhaAtual) {
                          Navigator.of(context).pushNamed(
                              '/inicio'); //Da pra voltar a pag anterior
                          //Navigator.of(context).pushReplacementNamed('/home');
                          //Esse substitui pagina completamente

                          /*Navigator.of(context).pushReplacement( //não é possivel retornar a pagina anterior
                              MaterialPageRoute(builder: (context) => HomePage()),//tem botao de volta a pagina anterior
                            );*/ //Faz mudar de tela manualmente
                        }
                      },
                      child: Text('LOGIN'),
                    )
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
}
