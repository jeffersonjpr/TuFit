import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tufit/controllers/autenticacao_controller.dart';

class CadastroPage extends StatelessWidget {
  final controller = Get.put(AutenticacaoController());
  //implementar o acesso ao db
  //implementar o firebase.storage para guardar a imagem

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
      ),
    );
  }
}
