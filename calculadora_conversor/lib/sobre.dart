import 'package:flutter/material.dart';
import 'calculadora.dart';
import 'login.dart';
import 'inicio.dart';
import 'sobre.dart';
import 'editar.dart';
import 'conversor.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  double num1;
  double num2;
  double resultado;
  String email = '';
  String senha = '';

  Widget _body() {
    return Column(
      
      children: [
        SingleChildScrollView(
          child: SizedBox(
            //Altura e largura infinita
            //width:MediaQuery.of(context).size.width,
            
            //height:MediaQuery.of(context).size.height,
            //Pega informações do context
           
            child: Padding(
              padding: const EdgeInsets.only(left:8.0,right: 8),
              child: Container(
                /*decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),*/
                child: Container(
                  /*height: 50,
                  width: 400,*/
                  
                  child: Column(
                    //Alinhamento
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          /*height: 50,
                          width: 400,*/
                          child: Text('Sobre',
                              style: TextStyle(fontSize: 35)),
                              //Image.asset('assets/imagens/bmw_m2.png'),
                             
                        ),
  
                        
                      ),

                      Center(
                        child: Container(
                          height: 300,
                          width: 300,
                          child: Image.asset('lib/imagens/diego.jpg'),
                             
                        ),
  
                        
                      ),

                      
                      Row(children: [Container(height: 40)],),


                      Container(
                        height: 180,
                        width: 400,
                        decoration:
                           BoxDecoration(border: Border.all(color: Colors.black)),

                          child: Card(
                          borderOnForeground: true,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                
                               //Botões
                        Row(
                        children: [
                         Text('Ola,'),
                         Text('Meu nome e Diego Dreossi, aluno da FATEC RP.'),
                        ],
                        ),

                        Row(children: [Text('Tenho 23 anos e moro em Ribeirão Preto, atualmente'),],),
                        Row(children: [Text('desempregado. Este é um projeto da aula Eletiva '),],),
                        Row(children: [Text('para dispositivos moveis.'),],),
                        Row(children: [Text('Será um app de calculadora e conversor.'),],),
                      
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
