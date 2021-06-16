//Inicio

import 'package:flutter/material.dart';
import 'login.dart';


class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  
 

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
                          child: Text('Inicio',
                              style: TextStyle(fontSize: 35)),
                              //Image.asset('assets/imagens/bmw_m2.png'),
                             
                        ),
  
                        
                      ),

                      

                      
                      Row(children: [Container(height: 40)],),


                      Container(
                        height: 400,
                        width: 400,
                        decoration:
                           BoxDecoration(border: Border.all(color: Colors.black)),

                          child: Card(
                          borderOnForeground: true,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                
                              Text('Gostaria de utilizar qual desses?'),
                              Container(height:20),

                               //Botões
                          Row(
                          children: [
                          ElevatedButton(
                            
                            onPressed: () {
                              
                                Navigator.of(context).pushNamed(
                                    '/calculadora'); 
                              
                            },
                            child: Text('Calculadora'),
                          ),
                          Container(width: 190,), 

                          ElevatedButton(
                            onPressed: () {
                             
                            Navigator.of(context).pushNamed(
                                '/conversor'); 
                          
                          },
                            child: Text('Conversor'),
                          ),
          
                              ],
                            ),

                            Image.network(
                            'https://cdn5.colorir.com/desenhos/color/201703/calculadora-solar-colegio-1332667.jpg'),



                              ]),
                        ),
                      ),

                      )],
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
                  Navigator.of(context).pushReplacementNamed('/historicoconversor');
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
