import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _db;

  get db => _db == null ? initDb() : _db;

  Future<Database> initDb() async {
    _db = await openDatabase('contatos.db');
    return _db!;
  }
}
