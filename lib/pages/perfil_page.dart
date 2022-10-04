import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tufit/pages/preview_page.dart';
import 'package:tufit/widgets/anexo.dart';

class PerfilPage extends StatefulWidget {
  //implementar o acesso ao db
  //implementar o firebase.storage para guardar a imagem
  String url;
  PerfilPage(this.url);
  //Arquivo da camera abaixo
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  File arquivo;
  final picker = ImagePicker();
  //String url = "https://i.imgur.com/ucXD9eX.png";

  Future getFileFromGallery() async {
    final file = await picker.getImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() => arquivo = File(file.path));
    }
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String userIDid() {
    final User user = auth.currentUser;
    return user.uid;
  }

  ShowPreview(file) async {
    file = await Get.to(() => PreviewPage(file: file));
    if (file != null) {
      setState(() => arquivo = file);
      Get.back();
    }
  }

  Future uploadImageToFirebase(BuildContext context) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("avatar" + userIDid() + ".jpg");
    UploadTask utask = ref.putFile(arquivo);
    utask.then((res) {
      print("IMAGEM ABAIXO");
      widget.url = res.ref.getDownloadURL().toString();
    });
  }

  Future downloadUrlimagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String downloadUrl =
        await storage.ref("avatar" + userIDid() + ".jpg").getDownloadURL();
    setState(() {
      widget.url = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (arquivo != null)
                    Anexo(
                      arquivo: arquivo,
                    ),
                  if (arquivo == null)
                    (Padding(
                        padding: EdgeInsets.all(24),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                //Foto de perfil do usuário
                                image: NetworkImage(widget.url),
                                fit: BoxFit.fill),
                          ),
                        ))),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple)),
                      onPressed: () => Get.to(() =>
                          CameraCamera(onFile: (file) => ShowPreview(file))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("Foto", style: TextStyle(fontSize: 20)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple)),
                      onPressed: () => getFileFromGallery(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("Escolher da Galeria",
                                style: TextStyle(fontSize: 20)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[800]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(21.0),
                                      side: BorderSide(color: Colors.black)))),
                      onPressed: () {
                        uploadImageToFirebase(context);
                        downloadUrlimagem();
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child:
                                Text("Salvar", style: TextStyle(fontSize: 20)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
