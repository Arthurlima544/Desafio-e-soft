import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AnotacaoDatabase {
  static Database? _db;

  Future<Database?> getDatabase() async {
    if (_db == null) {
      _db = await databaseInitialize();
    }
    return _db;
  }

  Future<Database> databaseInitialize() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'anotacoes.db';
    final database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  FutureOr<void> _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE anotacao(id TEXT PRIMARY KEY, titulo TEXT, descricao TEXT, concluido INTEGER)');
  }
}
