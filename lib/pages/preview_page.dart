import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewPage extends StatelessWidget {
  File file;

  PreviewPage({Key key, this.file}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;
  String userIDid() {
    final User user = auth.currentUser;
    return user.uid;
  }

  Future uploadImageToFirebase(BuildContext context) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("avatar" + userIDid() + ".jpg");
    UploadTask utask = ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned.fill(
                  child: Image.file(
                file,
                fit: BoxFit.cover,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.deepPurple.withOpacity(0.5),
                        child: IconButton(
                          icon: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            uploadImageToFirebase(context);
                            Get.back(result: file);
                          },
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.deepPurple.withOpacity(0.5),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () => Get.back(),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
