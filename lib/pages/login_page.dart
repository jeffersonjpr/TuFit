import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tufit/pages/cadastro_page.dart';
import '../controllers/autenticacao_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(AutenticacaoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        title: Text("Bem Vindo!"),
        actions: [
          TextButton(
            child: Text("Cadastre-se"),
            onPressed: () {
              //ir para a tela de cadastro usando GET
              Get.to(() => CadastroPage());
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: TextFormField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe o email corretamente!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: TextFormField(
                        controller: controller.senha,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informa sua senha!';
                          } else if (value.length < 6) {
                            return 'Sua senha deve ter no mínimo 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState.validate()) {
                            controller.login();
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Obx(() => Text(
                                  controller.botaoPrincipal.value,
                                  style: TextStyle(fontSize: 20))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
