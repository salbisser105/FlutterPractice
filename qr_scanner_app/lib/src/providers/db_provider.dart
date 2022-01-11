import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';
export 'package:qr_scanner_app/src/models/scan_model.dart';

import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    //Path where we are going to save the Database.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');

    //creates database
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          type TEXT,
          value TEXT
        )
        ''');
    });
  }

  newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    //verify database
    final db = await database;

    final res = await db.rawInsert('''
        INSERT INTO Scans(id, type, value)
          VALUES($id, $type, $value)
     ''');

    return res;
  }

Future<int> newScan (ScanModel newScanModel) async{
   final db = await database;
    final res = await db.insert('Scans', newScanModel.toJson() );

    // this is the ID of the last item registered added. 
    return res;
}

  Future<ScanModel?> getScanById( int id ) async {

    final db  = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
          ? ScanModel.fromJson( res.first )
          : null;
  }

   Future<List<ScanModel>> getAllScans() async {

    final db  = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty
          ? res.map( (s) => ScanModel.fromJson(s) ).toList()
          : [];
  }
   Future<List<ScanModel>> getScansByType( String type ) async {

    final db  = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE type = '$type'    
    ''');

    return res.isNotEmpty
          ? res.map( (s) => ScanModel.fromJson(s) ).toList()
          : [];
  }


  Future<int> updateScan( ScanModel nuevoScan ) async {
    final db  = await database;
    final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [ nuevoScan.id ] );
    return res;
  }

  Future<int> deleteScan( int id ) async {
    final db  = await database;
    final res = await db.delete( 'Scans', where: 'id = ?', whereArgs: [id] );
    return res;
  }

  Future<int> deleteAllScans() async {
    final db  = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans    
    ''');
    return res;
  }


}
