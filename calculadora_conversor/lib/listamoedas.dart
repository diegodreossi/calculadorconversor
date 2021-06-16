import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'contacalculadora.dart';
import 'menuhamburguer.dart';
import 'calculadora.dart';
import 'login.dart';
import 'moedas.dart';

//List<String> resultados = [];

class Moedas extends StatefulWidget {
  @override
  _MoedasStateLista createState() => _MoedasStateLista();
}
//Não deu certo a exibição dos documentos do firestore
//Nos dois historicos há algum problema
class _MoedasStateLista extends State<Moedas> {
  //referencia a coleção
  late CollectionReference moedas;

  @override
  void initState() {
    super.initState();
    moedas =
        FirebaseFirestore.instance.collection('moedas');
  }

//*****************************************
  // Definir a aparência de como cada documento deve ser exibido
  //
  Widget exibirDocumento(item) {
    //Converter um DOCUMENTO em um OBJETO
    Moeda nmoeda = Moeda.fromJson(item.data(), item.id); //usuario do sistema
    

    
    return ListTile(
      title: Text(
          '${nmoeda.nome}  -  ${nmoeda.pais}',
          style: TextStyle(fontSize: 26)),
      subtitle:  Text(
          'Valor em real: ${nmoeda.valorReal}',
          style: TextStyle(fontSize: 26)) ,  
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (){
          //
          // Apagar um documento da coleção "cafes"
          //
          moedas.doc(nmoeda.id).delete();
        },
      ),

      onTap: (){
        Navigator.pushNamed(context, '/criarmoedas', arguments: nmoeda.id);
        

      },


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
          title: Text("Lista de Moedas"),),
        floatingActionButton: FloatingActionButton(
             foregroundColor: Colors.white,
             backgroundColor: Colors.yellow,
             child: Icon(Icons.add),
             onPressed: (){
             Navigator.pushNamed(context, '/criarmoedas');
             }
             ),

        body: Container(
            padding: EdgeInsets.all(30), 
            child: StreamBuilder<QuerySnapshot>(

          //fonte de dados
          stream: moedas.snapshots(),

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
        ),//<--
            
             
            

          
        );
  }
}
