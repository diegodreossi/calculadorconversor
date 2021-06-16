import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaCriarConta extends StatefulWidget {
  @override
  _TelaCriarContaState createState() => _TelaCriarContaState();
}

class _TelaCriarContaState extends State<TelaCriarConta> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtcpf = TextEditingController();
  var txttelefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Criar Conta'),
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
                  prefixIcon: Icon(Icons.person), labelText: 'Nome'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: txtEmail,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email), labelText: 'Email'),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: txtSenha,
              style: TextStyle(
                  color: Colors.blue[50], fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock), labelText: 'Senha'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: txtcpf,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email), labelText: 'CPF'),
            ),
            SizedBox(height: 20),

            TextField(
              controller: txttelefone,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email), labelText: 'Telefone'),
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
                    child: Text('Criar'),
                    onPressed: () {
                      criarConta
                      (txtNome.text, txtEmail.text, txtSenha.text,txtcpf.text,txttelefone.text);
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
  void criarConta(nome, email, senha, cpf, telefone) {
    FirebaseAuth fa = FirebaseAuth.instance;
    fa
        .createUserWithEmailAndPassword(
            //Cria um usuario no serviço Authentication no firebase
            email: email,
            password: senha)
        .then((resultado) {
      //armazenar dados adicionais no Firestore
      var db = FirebaseFirestore.instance;
      db.collection('usuarios').doc(resultado.user!.uid).set({
        'nome': nome,
        'email': email,
        'cpf': cpf,
        'telefone': telefone
      }).then((valor) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Usuário criado com sucesso.'),
            duration: Duration(seconds: 2)));
        Navigator.pop(context);
      });
    }).catchError((erro) {
      if (erro.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('ERRO: O email informado já está em uso.'),
            duration: Duration(seconds: 2)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('ERRO: ${erro.message}'),
            duration: Duration(seconds: 2)));
      }
    });
  }
}
