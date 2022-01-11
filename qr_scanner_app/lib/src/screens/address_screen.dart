import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/widgets/widgets.dart';


class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    return const ScanTilesWidget(type: 'http');
  }
}