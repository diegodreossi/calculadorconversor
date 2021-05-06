import 'package:calculadora_conversor/login.dart';
import 'package:flutter/material.dart';
import 'calculadora.dart';
import 'login.dart';
import 'inicio.dart';
import 'sobre.dart';
import 'editar.dart';
import 'conversor.dart';

class Editar extends StatefulWidget {
  @override
  _EditarState createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  String nomeNovo = '';

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
              padding: const EdgeInsets.only(left: 8.0, right: 8),
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
                          child: Text('Editar', style: TextStyle(fontSize: 35)),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 300,
                          width: 300,
                          child: Image.asset('lib/imagens/diego.jpg'),
                        ),
                      ),
                      Row(
                        children: [Container(height: 40)],
                      ),
                      Container(
                        height: 180,
                        width: 400,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Card(
                          borderOnForeground: true,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                TextField(
                                  onChanged: (text) {
                                    nomeNovo = text;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'NOVO NOME',
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
                                    emailConta = text;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'NOVO EMAIL',
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
                                //Botões
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                        if((nomeNovo == '' && emailConta == '') || 
                                        (nomeNovo == '' && emailConta == emailAtual)
                                        || (nomeNovo != '' && emailConta == emailAtual)
                                        || (nomeNovo == ''  && emailConta != emailAtual )){
                                          
                                        } else {
                                        emailAtual = emailConta;
                                        emailConta = emailConta;
                                        nomeConta = nomeNovo;
                                        Navigator.of(context).pushReplacementNamed('/inicio');
                                        }
                                        });
                                        
                                      },
                                      child: Text('Confirmar'),
                                    )
                                  ],
                                )
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
