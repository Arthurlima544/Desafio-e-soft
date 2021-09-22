import 'dart:async';
import 'dart:io';

import 'package:app_anotacoes/Models/AnotacaoModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AnotacaoDatabase {
  Future<Database> database() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'anotacoes.db';
    final database = openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE anotacao(id TEXT PRIMARY KEY, titulo TEXT, descricao TEXT, concluido INTEGER)',
        );
      },
      version: 1,
    );

    return database;
  }

  Future create(AnotacaoModel anotacaoModel) async {
    final db = await AnotacaoDatabase().database();

    await db.insert(
      'anotacao',
      anotacaoModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future update(AnotacaoModel anotacaoModel) async {
    final db = await AnotacaoDatabase().database();

    await db.update('anotacao', anotacaoModel.toJson(),
        where: 'id = ?', whereArgs: [anotacaoModel.id]);
  }

  Future delete(String id) async {
    final db = await AnotacaoDatabase().database();

    await db.delete('anotacao', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<AnotacaoModel>> getList() async {
    final db = await AnotacaoDatabase().database();

    final result = await db.query('anotacao');

    final List<AnotacaoModel> anotacaoList =
        result.map((e) => AnotacaoModel.fromJson(e)).toList();

    return anotacaoList;
  }
}
