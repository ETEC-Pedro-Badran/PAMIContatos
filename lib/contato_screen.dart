// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'contato_model.dart';
import 'database_helper.dart';

class ContatoScreen extends StatefulWidget {
  const ContatoScreen({Key? key}) : super(key: key);

  @override
  State<ContatoScreen> createState() => _ContatoScreenState();
}

class _ContatoScreenState extends State<ContatoScreen> {
  Contato _contato = Contato();

  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Contato"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /* validação*/
          if (_contato.nome.length <= 3) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Preencha o nome com mais de 3 caracteres."),
            ));
            return;
          }

          if (!_contato.email.contains("@")) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Informe um email válido."),
            ));
            return;
          }

          if (_contato.telefone.length < 10) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Informe um telefone válido."),
            ));
            return;
          }

          await DatabaseHelper().inserir(_contato);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () async {
                      final ImagePicker _picker = ImagePicker();
                      final XFile? photo =
                          await _picker.pickImage(source: ImageSource.camera);

                      setState(() {
                        _contato.imagem = photo!.path;
                      });
                    },
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: (_contato.imagem == null)
                              ? DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: ExactAssetImage('images/person.png'))
                              : DecorationImage(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(_contato.imagem)),
                          boxShadow: kElevationToShadow[1]),
                    ),
                  )),
                ],
              ),
            ),
            TextField(
              onChanged: (value) => _contato.nome = value,
              decoration: InputDecoration(label: Text("Nome")),
            ),
            TextField(
              onChanged: (value) => _contato.email = value,
              decoration: InputDecoration(label: Text("Email")),
            ),
            TextField(
              onChanged: (value) => _contato.telefone = value,
              decoration: InputDecoration(label: Text("Telefone")),
            ),
          ],
        ),
      ),
    );
  }
}
