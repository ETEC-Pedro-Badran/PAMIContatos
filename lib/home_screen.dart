import 'package:contatos/contato_screen.dart';
import 'package:flutter/material.dart';

enum OrderOptions { orderaz, orderza }

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agenda de Contatos',
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text("Ordenar A-Z"),
                  value: OrderOptions.orderaz,
                ),
                const PopupMenuItem(
                    child: Text("Ordenar Z-A"), value: OrderOptions.orderza)
              ];
            },
            onSelected: _orderList,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContatoScreen(),
          ));
        },
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }

  void _orderList(OrderOptions value) {}
}
