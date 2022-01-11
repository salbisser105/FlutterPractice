import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/src/providers/providers.dart';
import 'package:qr_scanner_app/src/screens/address_screen.dart';
import 'package:qr_scanner_app/src/screens/maps_screen.dart';

import 'package:qr_scanner_app/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                  .deleteAll();
              })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBarWidget(),
      floatingActionButton: const ScanButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    // Usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScanByType('geo');
        return const MapsScreen();

      case 1:
        scanListProvider.loadScanByType('http');
        return const AddressScreen();

      default:
        return const MapsScreen();
    }
  }
}
