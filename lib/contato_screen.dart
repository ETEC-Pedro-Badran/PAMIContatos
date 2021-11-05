import 'package:flutter/material.dart';

class ContatoScreen extends StatelessWidget {
  const ContatoScreen({Key? key}) : super(key: key);

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
                      child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: ExactAssetImage('images/person.png')),
                        boxShadow: kElevationToShadow[1]),
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
