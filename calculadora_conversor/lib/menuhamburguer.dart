import 'package:flutter/material.dart';
import 'login.dart';

Widget Menu(BuildContext context) {
  return
  Drawer(
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
          leading: Icon(Icons.home),
          title: Text('Saida'),
          subtitle: Text('Finalizar Sessao'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
      ],
    ),
  );
} 

/*
@override
Widget build(BuildContext context){
return Drawer(
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
          leading: Icon(Icons.home),
          title: Text('Saida'),
          subtitle: Text('Finalizar Sessao'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
      ],
    ),
  );
*/

//}
/*
Widget _drawer(context) {
  return Drawer(
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
          leading: Icon(Icons.home),
          title: Text('Saida'),
          subtitle: Text('Finalizar Sessao'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
      ],
    ),
  );
}
*/