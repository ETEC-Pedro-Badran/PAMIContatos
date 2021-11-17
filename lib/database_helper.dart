import 'package:sqflite/sqflite.dart';

import 'contato_model.dart';

class DatabaseHelper {
  Future<Database>? _db;

  Future<Database> getDb() {
    _db ??= _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final _db = await openDatabase(
      'contatos.db',
      singleInstance: true,
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
            "create table contato ( id INT primary key, nome TEXT, email TEXT, telefone TEXT, imagem TEXT )");
        print("Banco de dados criado com sucesso!");
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (newVersion == 2) {
          await db.execute("drop table contato ");
          await db.execute(
              "create table contato ( id INT primary key, nome TEXT, email TEXT, telefone TEXT, imagem TEXT )");
          print("Banco de dados atualizado para versão 2!");
        }
      },
      onOpen: (db) => print("Banco de dados aberto."),
    );
    return _db;
  }

  Future<int> inserir(Contato contato) async {
    var id = (await getDb()).insert("contato", contato.toMap());
    return id;
  }

  Future<int> excluir(Contato contato) async {
    return (await getDb())
        .delete('contato', where: 'id', whereArgs: [contato.id]);
  }

  Future<int> atualizar(Contato contato) async {
    return (await getDb()).update('contato', contato.toMap());
  }

  Future<List<Contato>> listar() async {
    return (await (await getDb()).query('contato'))
        .map((e) => Contato.fromMap(e))
        .toList();
  }
}
