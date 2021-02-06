import 'dart:async';
import 'dart:io';

import 'package:bill_split/utilities/database/modal/tabledata_modal.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DropdownTableDataDatabaseProvider {
  DropdownTableDataDatabaseProvider._();

  static final DropdownTableDataDatabaseProvider db =
      DropdownTableDataDatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "DropdownTableData.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE DropdownTableData ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
          "cardName TEXT,"
          "name TEXT,"
          "invested integer,"
          "value integer"
          ")");
    });
  }

  addDropdownTableDataToDatabase(DropdownTableData dropdownTableData) async {
    final db = await database;
    var raw = await db.insert(
      "DropdownTableData",
      dropdownTableData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(raw);
    return raw;
  }

  updateDropdownTableData(DropdownTableData dropdownTableData) async {
    final db = await database;
    var response = await db.update(
        "DropdownTableData", dropdownTableData.toMap(),
        where: "id = ?", whereArgs: [dropdownTableData.name]);
    return response;
  }

  Future<DropdownTableData> getDropdownTableDataWithName(
      String cardName, String name) async {
    final db = await database;
    var response = await db.query("DropdownTableData",
        where: "cardName = ?, name = ?", whereArgs: [cardName, name]);
    return response.isNotEmpty
        ? DropdownTableData.fromMap(response.first)
        : null;
  }

  Future<List<DropdownTableData>> getAllDropdownTableData() async {
    final db = await database;
    var response = await db.query("DropdownTableData");
    List<DropdownTableData> list =
        response.map((c) => DropdownTableData.fromMap(c)).toList();
    return list;
  }

  deleteDropdownTableDataWithId(String name) async {
    final db = await database;
    return db.delete("DropdownTableData", where: "name = ?", whereArgs: [name]);
  }

  deleteAllDropdownTableData() async {
    final db = await database;
    db.delete("DropdownTableData");
  }

  Future<void> dropTableIfExistsThenReCreate() async {
    final db = await database;

    //here we execute a query to drop the table if exists which is called "tableName"
    //and could be given as method's input parameter too
    await db.execute("DROP TABLE IF EXISTS DropdownTableData");
  }
}
