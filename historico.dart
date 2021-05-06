import 'package:flutter/material.dart';
import 'calculadora.dart';
import 'login.dart';
import 'inicio.dart';
import 'sobre.dart';
import 'editar.dart';
import 'conversor.dart';


List<String> resultados = [];

class ListaHist extends StatefulWidget{
  /*String op, n1, n2;
  bool feito;

  ListaHist({this.feito,this.op, this.n1, this.n2});*/

  @override
  _ListaHist createState()=> _ListaHist();

}

class _ListaHist extends State<ListaHist>{
  
  Widget _contaHist(BuildContext context, int indice){
    return Container(child: ListTile(
      leading: Icon(Icons.people),
      title: Text(resultados[indice]),

    ));
  }


  Widget _body() {
    return Column(
      
      children: <Widget>[Center(
        child: Container(            
              child: Text('Historico',
              style: TextStyle(fontSize: 35)),  
            ),

        

      ),
         Expanded(child: ListView.builder(
           physics: ClampingScrollPhysics(),
           itemBuilder: _contaHist,
           itemCount: resultados.length,   
           ),)
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
