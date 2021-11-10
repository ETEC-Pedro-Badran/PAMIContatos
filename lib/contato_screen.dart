import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'contato_model.dart';

class ContatoScreen extends StatefulWidget {
  const ContatoScreen({Key? key}) : super(key: key);

  @override
  State<ContatoScreen> createState() => _ContatoScreenState();
}

class _ContatoScreenState extends State<ContatoScreen> {
  var contato = Contato();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Contato"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                        contato.imagem = photo!.path;
                      });
                    },
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: (contato.imagem == null)
                              ? DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: ExactAssetImage('images/person.png'))
                              : DecorationImage(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(contato.imagem)),
                          boxShadow: kElevationToShadow[1]),
                    ),
                  )),
                ],
              ),
            ),
            const TextField(
              decoration: InputDecoration(label: Text("Nome")),
            ),
            const TextField(
              decoration: InputDecoration(label: Text("Email")),
            ),
            const TextField(
              decoration: InputDecoration(label: Text("Telefone")),
            ),
          ],
        ),
      ),
    );
  }
}
