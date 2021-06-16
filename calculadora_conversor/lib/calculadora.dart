import 'package:calculadora_conversor/moedas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'historico.dart';
import 'contacalculadora.dart';

String nomeUsuarioAtual = '';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String tnum1 = '', tnum2 = '', tresultado = '';
  double n1 = 0, n2 = 0;
  double res = 0;

  //-------------------------------------------
  //------------------------------------------
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
                                            n1 = double.parse(tnum1);
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
                                            n2 = double.parse(tnum2);
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
                                    //(Operaçoes matematicas)
                                    children: [
                                      //-------------------------------------
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            res = n1 + n2;
                                            //tresultado = '$resultado';
                                            tresultado = res.toStringAsFixed(3);
                                            resultados.add(
                                                'Calculadora - $tresultado');

                                            var db = FirebaseFirestore.instance;
                                            db
                                                .collection('contacalculadora')
                                                .add({
                                              'num1': n1,
                                              'num2': n2,
                                              'op': '+',
                                              'resultado': res,
                                            });
                                          });
                                        },
                                        child: Text('+'),
                                      ),
                                      //-------------------------------------
                                      Container(
                                        width: 45,
                                      ),
                                      //-------------------------------------
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            res = n1 - n2;
                                            //tresultado = '$resultado';
                                            tresultado = res.toStringAsFixed(3);
                                            resultados.add(
                                                'Calculadora - $tresultado');

                                            var db = FirebaseFirestore.instance;
                                            db
                                                .collection('contacalculadora')
                                                .add({
                                              'num1': n1,
                                              'num2': n2,
                                              'op': '-',
                                              'resultado': res,
                                            });
                                          });
                                        },
                                        child: Text('-'),
                                      ),
                                      //-------------------------------------
                                      Container(
                                        width: 45,
                                      ),
                                      //-------------------------------------
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            res = n1 * n2;
                                            //tresultado = '$resultado';
                                            tresultado = res.toStringAsFixed(3);
                                            resultados.add(
                                                'Calculadora - $tresultado');

                                            var db = FirebaseFirestore.instance;
                                            db
                                                .collection('contacalculadora')
                                                .add({
                                              'num1': n1,
                                              'num2': n2,
                                              'op': 'x',
                                              'resultado': res,
                                            });
                                          });
                                        },
                                        child: Text('x'),
                                      ),
                                      //-------------------------------------
                                      Container(
                                        width: 45,
                                      ),
                                      //-------------------------------------
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (n2 == 0) {
                                              tresultado = '###';
                                            } else {
                                              res = n1 / n2;

                                              tresultado =
                                                  res.toStringAsFixed(3);
                                              resultados.add(
                                                  'Calculadora - $tresultado');

                                              var db =
                                                  FirebaseFirestore.instance;
                                              db
                                                  .collection(
                                                      'contacalculadora')
                                                  .add({
                                                'num1': n1,
                                                'num2': n2,
                                                'op': '/',
                                                'resultado': res,
                                              });
                                            }
                                          });
                                        },
                                        child: Text('/'),
                                      ),
                                      //-------------------------------------
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
    //getDocumentById(email);
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: ClipRRect(
                    child: CircleAvatar(),//Image.asset('lib/imagens/diego.jpg'),
                  ),
                  accountName: Text(nmUsuarioAtual),
                  accountEmail: Text(emailAtual)),

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

              /*ListTile(
                //Extremidades esquerda
                leading: Icon(Icons.add_circle_rounded),
                title: Text('Editar'),
                subtitle: Text('Editar o perfil'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/editar');
                },
              ),*/

              ListTile(
                //Extremidades esquerda
                leading: Icon(Icons.add_circle_rounded),
                title: Text('Historico Calculadora'),
                subtitle: Text('resultados'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/historico');
                },
              ), /////////

              ListTile(
                //Extremidades esquerda
                leading: Icon(Icons.add_circle_rounded),
                title: Text('Historico Conversor'),
                subtitle: Text('resultados'),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed('/historicoconversor');
                },
              ), /////////
              ListTile(
                //Extremidades esquerda
                leading: Icon(Icons.money),
                title: Text('Moedas'),
                subtitle: Text('Lista de moedas'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/listamoedas');
                },
              ), 

//------------------------------------------------------------------------------
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
          title: Text("Calculadora"),
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
