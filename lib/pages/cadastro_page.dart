import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tufit/controllers/autenticacao_controller.dart';

class CadastroPage extends StatelessWidget {
  final controller = Get.put(AutenticacaoController());
  //implementar o acesso ao db
  //implementar o firebase.storage para guardar a imagem
  final _email = TextEditingController();
  final _senha = TextEditingController();

  final _nome = TextEditingController();
  final _idade = TextEditingController();
  final _altura = TextEditingController();
  final _peso = TextEditingController();
  final _gernero = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastre-se'),
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value.isEmail) {
                              return null;
                            } else {
                              return "Email Invalido !";
                            }
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 24.0),
                      child: TextFormField(
                        controller: _senha,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Senha Invalida';
                          } else if (value.length < 6) {
                            return 'Sua senha deve ter no mínimo 6 caracteres';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 24.0),
                      child: TextFormField(
                        controller: _nome,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome',
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Informe o Nome !";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 24.0),
                      child: TextFormField(
                        controller: _idade,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Idade',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Idade Invalida !";
                          } else if (value.isAlphabetOnly) {
                            return "Idade Invalida !";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 24.0),
                      child: TextFormField(
                        controller: _gernero,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'genero',
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Informe o Genero !";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 24.0),
                      child: TextFormField(
                        controller: _altura,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Altura (m)',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Altura Invalida !";
                          } else if (value.isAlphabetOnly) {
                            return "Aultura Invalida !";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 24.0),
                      child: TextFormField(
                        controller: _peso,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Peso (kg)',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Peso Invalido !";
                          } else if (value.isAlphabetOnly) {
                            return "Peso Invalido !";
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.all(24),
                      child: ElevatedButton(
                        //botão de salvar as passivas
                        onPressed: () {
                          //oque acontece quando o botão salvar é clicado
                          if (_formKey.currentState.validate()) {
                            print("haha");
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check), //icone de check,
                            Padding(
                              padding: EdgeInsets.all(
                                  16.0), // p/ deixar o botão maior
                              child: Text(
                                'Salvar',
                                style: TextStyle(
                                    fontSize:
                                        20.0), //aumenta o tamanho do botão (tamanho do texto)
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              )));
  }
}
