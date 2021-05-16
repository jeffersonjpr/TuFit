import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilPage extends StatelessWidget {
  //implementar o acesso ao db
  //implementar o firebase.storage para guardar a imagem

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(24),
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      //Foto de perfil do usuário
                      image: NetworkImage('https://i.imgur.com/pmWblEp.png'),
                      fit: BoxFit.fill),
                ),
              )),
        ],
      ),
    );
  }
}
