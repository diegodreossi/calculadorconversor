import 'package:calculadora_conversor/historicoconversor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'contaconversor.dart';
import 'login.dart';

class Conversor extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  String tnum1 = '', tresultado = '';
  double nreal = 0;
  double rescon = 0;
  
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
                            child: Text('            Conversor',
                                style: TextStyle(fontSize: 35)),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 550,
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
                                            nreal = double.parse(tnum1);
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Reais',
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
                                            rescon = nreal / 5.35;

                                            tresultado =
                                                rescon.toStringAsFixed(2);
                                            resultados2
                                                .add('Conversor - $tresultado');

                                            var db = FirebaseFirestore.instance;
                                            db
                                                .collection('contaconversor')
                                                .add({
                                                 'numreal':nreal,
                                                 'moedanova':'Dolar',
                                                 'resconvertido':rescon, 
                                                }
                                                );


                                          });
                                        },
                                        child: Text('Dolar'),
                                      ),
//------------------------------------------------------------------------------

                                      Container(
                                        width: 45,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            rescon = nreal / 6.4;
                                            tresultado =
                                                rescon.toStringAsFixed(2);
                                            resultados2
                                                .add('Conversor - $tresultado');


                                            var db = FirebaseFirestore.instance;
                                            db
                                                .collection('contaconversor')
                                                .add({
                                                 'numreal':nreal,
                                                 'moedanova':'Euro',
                                                 'resconvertido':rescon, 
                                                }
                                                ); 

                                          });
                                        },
                                        child: Text('Euro'),
                                      ),
//------------------------------------------------------------------------------

                                      Container(
                                        width: 45,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            rescon = nreal / 304381;
                                            tresultado =
                                                rescon.toStringAsFixed(2);
                                            resultados2
                                                .add('Conversor - $tresultado');

                                            var db = FirebaseFirestore.instance;
                                            db
                                                .collection('contaconversor')
                                                .add({
                                                 'numreal':nreal,
                                                 'moedanova':'Bitcoin',
                                                 'resconvertido':rescon, 
                                                }
                                                );

                                          });
                                        },
                                        child: Text('Bitcoin'),
                                      ),
//------------------------------------------------------------------------------

                                      Container(
                                        width: 45,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            rescon = nreal / 0.26;
                                            tresultado =
                                                rescon.toStringAsFixed(2);
                                            resultados2
                                                .add('Conversor - $tresultado');

                                          var db = FirebaseFirestore.instance;
                                            db
                                                .collection('contaconversor')
                                                .add({
                                                 'numreal':nreal,
                                                 'moedanova':'Peso MX',
                                                 'resconvertido':rescon, 
                                                }
                                                );

                                          });
                                        },
                                        child: Text('Peso MX'),
                                      ),
//------------------------------------------------------------------------------
                                      Container(
                                        width: 45,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
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
                    child: CircleAvatar(),
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
              ),

              ListTile(
                //Extremidades esquerda
                leading: Icon(Icons.money),
                title: Text('Moedas'),
                subtitle: Text('Lista de moedas'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/listamoedas');
                },
              ), 

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
          title: Text("Conversor"),
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
