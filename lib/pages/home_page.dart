import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tufit/pages/cadastra_alimento_page.dart';
import 'package:tufit/pages/perfil_page.dart';
import 'package:tufit/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:tufit/pages/perfil_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String url = "https://i.imgur.com/ucXD9eX.png";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String userIDid() {
    final User user = auth.currentUser;
    return user.uid;
  }

  Future downloadUrlimagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String downloadUrl =
        await storage.ref("avatar" + userIDid() + ".jpg").getDownloadURL();
    setState(() {
      url = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    downloadUrlimagem();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        toolbarHeight: 80,
        leading: GestureDetector(
          child: Padding(
              padding: EdgeInsets.all(1),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      //Foto de perfil do usuário
                      image: NetworkImage(url),
                      fit: BoxFit.fill),
                ),
              )),
          onTap: () {
            //ir para tela de perfil (mudar foto de perfil)
            Get.to(() => PerfilPage(url));
          },
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Seu Imc é :',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Seu Imc ideal é :',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // Barra inferior. Configurações, Adicionar alimento e Mais
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          children: [
            PopupMenuButton(
              icon: Icon(Icons.menu),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Sair'),
                  onTap: () {
                    Navigator.pop(context);
                    AuthService.to.logout();
                  },
                )),
              ],
            ),
            Spacer(),
            //IconButton(icon: Icon(Icons.search), onPressed: () {}),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text('Cadastrar Alimento'),
                  onTap: () {
                    //Atalho para tela de cadastro de alimento
                    Navigator.pop(context);
                    Get.to(() => CadastraAlimento());
                  },
                )),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
