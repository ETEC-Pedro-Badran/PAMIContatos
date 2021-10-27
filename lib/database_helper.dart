import 'package:sqflite/sqflite.dart';

import 'contato_model.dart';

class DatabaseHelper {
  Database? _db;

  get db => _db == null ? initDb() : _db;

  Future<Database> initDb() async {
    _db = await openDatabase(
      'contatos.db',
      singleInstance: true,
      onCreate: (db, version) async {
        await db.execute(
            "create table contato ( id INT primary key, nome TEXT, email TEXT, telefone TEXT, foto TEXT )");
        print("Banco de dados criado com sucesso!");
      },
      onOpen: (db) => print("Banco de dados aberto."),
    );
    return _db!;
  }

  Future<int> inserir(Contato contato) async {
    var id = await db.insert("contato", contato.toMap());
    return id;
  }

  Future<bool> excluir(Contato contato) {
    return db.delete('contato', {'id': '${contato.id}'});
  }

  Future<bool> atualizar(Contato contato) {
    return db.update('contato', contato.toMap());
  }
}
