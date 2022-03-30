import 'dart:io';

import 'package:aplikasi_jadwal/database/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'jadwal.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE jadwal(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          hari TEXT,
          mapel1 TEXT,
          mapel2 TEXT,
          mapel3 TEXT,
          mapel4 TEXT    
      )
      ''');
  }

  Future<List<Jadwal>> getJadwal() async {
    Database db = await instance.database;
    var jadwal = await db.query('jadwal', orderBy: 'id');
    List<Jadwal> jadwalList =
        jadwal.isNotEmpty ? jadwal.map((c) => Jadwal.fromMap(c)).toList() : [];
    return jadwalList;
  }

  Future<int> add(Jadwal jadwal) async {
    Database db = await instance.database;
    return await db.insert('jadwal', jadwal.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('jadwal', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Jadwal jadwal) async {
    Database db = await instance.database;
    return await db.update('jadwal', jadwal.toMap(),
        where: "id = ?", whereArgs: [jadwal.id]);
  }
}
