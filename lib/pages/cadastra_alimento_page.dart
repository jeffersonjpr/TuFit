import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastraAlimento extends StatelessWidget {
  final _nome = TextEditingController();
  final _marca = TextEditingController();

  final _quantidade = TextEditingController();
  final _caloria = TextEditingController();
  final _carboidrato = TextEditingController();
  final _proteina = TextEditingController();
  final _gordura = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Alimento'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                controller: _nome,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe o nome do alimento !";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: TextFormField(
                controller: _marca,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Marca',
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            const Divider(
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: TextFormField(
                controller: _quantidade,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Quantidade (ml / gr)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe a quantidade !";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: TextFormField(
                controller: _caloria,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Calorias',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe as calorias !";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: TextFormField(
                controller: _carboidrato,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Carboidratos (gr)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe os Carboidratos !";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: TextFormField(
                controller: _proteina,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Proteínas (gr)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe as Proteínas !";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: TextFormField(
                controller: _gordura,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gorduras (gr)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe as Gorduras !";
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
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepPurple)),
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
                      padding: EdgeInsets.all(16.0), // p/ deixar o botão maior
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
      ),
    );
  }
}
