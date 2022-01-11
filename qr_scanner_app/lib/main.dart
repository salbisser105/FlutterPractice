import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/src/providers/providers.dart';
import 'package:qr_scanner_app/src/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        title: 'QR App',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'map': (_) => const MapScreen()
        },
        theme: ThemeData(
            primaryColor: Colors.green,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.green)),
      ),
    );
  }
}
