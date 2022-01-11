import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan( String value ) async {

    final nuevoScan =  ScanModel(value: value);
    final id = await DBProvider.db.newScan(nuevoScan);
    // Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;

    if ( selectedType == nuevoScan.type ) {
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  loadScanByType( String type ) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...scans];
    selectedType = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById( int id ) async {
    await DBProvider.db.deleteScan(id);
  }



}

