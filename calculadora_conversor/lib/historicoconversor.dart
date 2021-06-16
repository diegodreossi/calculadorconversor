import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'contaconversor.dart';
import 'login.dart';

List<String> resultados2 = [];

class ListaHist2 extends StatefulWidget {
  /*String op, n1, n2;
  bool feito;

  ListaHist({this.feito,this.op, this.n1, this.n2});*/

  @override
  _ListaHist2 createState() => _ListaHist2();
}

class _ListaHist2 extends State<ListaHist2> {
  //referencia a coleção
  late CollectionReference contaconversor;

  @override
  void initState() {
    super.initState();
    contaconversor = FirebaseFirestore.instance.collection('contaconversor');
  }

//----------------------------------------------------------------------
//*****************************************
  // Definir a aparência de como cada documento deve ser exibido
  //
  Widget exibirDocumento(item) {
    //Converter um DOCUMENTO em um OBJETO
    Contaconversor concon = Contaconversor.fromJson(item.data(), item.id);

    return ListTile(
      
      title: Text(
          '${concon.numreal} reais em ${concon.moedanova} e ${concon.resconvertido}',
          style: TextStyle(fontSize: 26)),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          //
          // Apagar um documento da coleção "cafes"
          //
          contaconversor.doc(concon.id).delete();
        },
      ),
    );
  }

//----------------------------------------------------------------------
  /*Widget _contaHist2(BuildContext context, int indice) {
    return Container(
        child: ListTile(
      leading: Icon(Icons.people),
      title: Text(resultados2[indice]),
    ));
  }*/

  /*Widget _body() {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            child: Text('Historico Conversor', style: TextStyle(fontSize: 35)),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemBuilder: _contaHist2,
            itemCount: resultados2.length,
          ),
        )
      ],
    );
  }*/

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
          title: Text("Historico do Conversor"),
        ),
        body:
         
         Stack(
          //Pilha
          children: [
          Container(color: Colors.grey[200]),  
         

          StreamBuilder<QuerySnapshot>(

          //fonte de dados
          stream: contaconversor.snapshots(),

          //aparência
          builder: (context, snapshot){

            switch(snapshot.connectionState){

              case ConnectionState.none:
                return Center(child: Text('Erro ao conectar ao Firestore'));

              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

              default:
                //dados recebidos do Firestore
                final dados = snapshot.requireData;

                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context,index){
                    return exibirDocumento(dados.docs[index]);
                  }
                );
            }
          }
        ),

            
            
          ],
        ));
  }
}
