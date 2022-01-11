import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/widgets/scan_tiles_widget.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTilesWidget(type: 'geo');
  }
}
