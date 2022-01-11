import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/src/providers/providers.dart';
import 'package:qr_scanner_app/src/utils/utils.dart';


class ScanButtonWidget extends StatelessWidget {
  const ScanButtonWidget({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon( Icons.filter_center_focus ),
      onPressed: () async {

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', false, ScanMode.QR );
        // final barcodeScanRes = 'https://fernando-herrera.com';
        // const String barcodeScanRes = 'geo:6.2400345, -75.5819296';

        if ( barcodeScanRes == '-1' ) {
          return;
        }

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        
        final nuevoScan = await scanListProvider.newScan(barcodeScanRes);

        launchURL(context, nuevoScan);
      }
    );
  }
}