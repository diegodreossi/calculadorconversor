import 'package:flutter/material.dart';
import 'calculadora.dart';
import 'login.dart';
import 'inicio.dart';
import 'sobre.dart';
import 'editar.dart';
import 'conversor.dart';

import 'historico.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String tnum1 = '', tnum2 = '', tresultado = '';
  double num1, num2;
  double resultado;

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 50,
                            width: 400,
                            child: Text('            Calculadora',
                                style: TextStyle(fontSize: 35)),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 500,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Card(
                            borderOnForeground: true,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 100,
                                        child: TextField(
                                          onChanged: (text) {
                                            tnum1 = text;
                                            num1 = double.parse(tnum1);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 20,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 100,
                                        child: TextField(
                                          onChanged: (text) {
                                            tnum2 = text;
                                            num2 = double.parse(tnum2);
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 20,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 200,
                                        child: Text(
                                          '= $tresultado',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                      )
                                    ],
                                  ),

                                  //Botões
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            resultado = num1 + num2;
                                            //tresultado = '$resultado';
                                            tresultado =
                                                resultado.toStringAsFixed(3);
                                            resultados.add('Calculadora - $tresultado');//
                                          });
                                        },
                                        child: Text('+'),
                                      ),
                                      Container(
                                        width: 45,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            resultado = num1 - num2;
                                            //tresultado = '$resultado';
                                            tresultado =
                                            resultado.toStringAsFixed(3);
                                            resultados.add('Calculadora - $tresultado');//
                                          });
                                        },
                                        child: Text('-'),
                                      ),
                                      Container(
                                        width: 45,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            resultado = num1 * num2;
                                            //tresultado = '$resultado';
                                            tresultado =
                                            resultado.toStringAsFixed(3);
                                            resultados.add('Calculadora - $tresultado');//
                                          });
                                        },
                                        child: Text('x'),
                                      ),
                                      Container(
                                        width: 45,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (num2 == 0) {
                                              tresultado = '###';
                                            } else {
                                              resultado = num1 / num2;
                                              //tresultado = '$resultado';
                                              tresultado =
                                              resultado.toStringAsFixed(3);
                                              resultados.add('Calculadora - $tresultado');//
                                            }
                                          });
                                        },
                                        child: Text('/'),
                                      ),
                                      Container(
                                        width: 45,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            tnum1 = '';
                                            tnum2 = '';
                                            tresultado = '';
                                          });
                                        },
                                        child: Text('C'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(50), //Corta imagem
                    child: Image.asset('lib/imagens/diego.jpg'),
                  ),
                  accountName: Text(nomeConta),
                  accountEmail: Text(emailConta)),

              //Item de lista de menu já pronto
              ListTile(
                //Extremidades esquerda
                leading: Icon(Icons.alternate_email),
                title: Text('Sobre'),
                subtitle: Text('Descricao'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/sobre');
                },
              ),

              ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                subtitle: Text('Primeira pagina'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/inicio');
                },
              ),

              ListTile(
                leading: Icon(Icons.calculate),
                title: Text('Calculadora'),
                subtitle: Text('Calcule as 4 operacoes'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/calculadora');
                },
              ),

              ListTile(
                leading: Icon(Icons.calculate),
                title: Text('Conversor'),
                subtitle: Text('Conversor de moedas'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/conversor');
                },
              ),

              ListTile(
                //Extremidades esquerda
                leading: Icon(Icons.add_circle_rounded),
                title: Text('Editar'),
                subtitle: Text('Editar o perfil'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/editar');
                },
              ),

              ListTile(
                //Extremidades esquerda
                leading: Icon(Icons.add_circle_rounded),
                title: Text('Historico'),
                subtitle: Text('resultados'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/historico');
                },
              ),/////////

              ListTile(
                //Extremidades esquerda
                leading: Icon(Icons.home),
                title: Text('Saida'),
                subtitle: Text('Finalizar Sessao'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Inicio"),
        ),
        body: Stack(
          //Pilha
          children: [
            Container(color: Colors.grey[200]),
            _body(),
          ],
        ));
  }
}
