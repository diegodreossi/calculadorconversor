import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaCriarMoeda extends StatefulWidget {
  @override
  _TelaCriarMoedaState createState() => _TelaCriarMoedaState();
}

class _TelaCriarMoedaState extends State<TelaCriarMoeda> {
  var txtNome = TextEditingController();
  var txtPais = TextEditingController();
  var txtValorRS = TextEditingController();

  void getDocumentById(String id) async {
    await FirebaseFirestore.instance
        .collection('moedas')
        .doc(id)
        .get()
        .then((resultado) {
      txtNome.text = resultado.get('nome');
      txtPais.text = resultado.get('pais');
      txtValorRS.text = resultado.get('valorReal');
    });
  }

  @override
  Widget build(BuildContext context) {
    //RECUPERAR O ID do documento que foi passado como argumento
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtNome.text == '' && txtPais.text == '' && txtValorRS.text == '') {
        getDocumentById(id.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: Text('Adicionar moedas'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent[100]),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtNome,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person), labelText: 'Nome da moeda'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: txtPais,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email), labelText: 'Pais da moeda'),
            ),
            SizedBox(height: 20),
            TextField(
              //obscureText: true,
              controller: txtValorRS,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Valor da moeda em real'),
            ),
            SizedBox(height: 20),

            //----
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: Text('Pronto!'),
                    onPressed: () {
                      criarMoedaBD(
                          txtNome.text, txtPais.text, txtValorRS.text, id);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarMoedaBD(nome, pais, valoremreal, id) {
    var db = FirebaseFirestore.instance;
    if (id == null) {
      db.collection('moedas').add({
        'nome': nome,
        'pais': pais,
        'valorReal': valoremreal,
      });
    }else{
      //Atualizar documento
         db.collection('moedas').doc(id.toString()).update(
         {
         'nome': nome,
         'pais': pais,
         'valorReal': valoremreal,
         }
         );
    }
  }
}
