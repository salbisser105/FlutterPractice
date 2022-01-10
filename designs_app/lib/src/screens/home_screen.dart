import 'package:designs_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          const BackgroundWidget(),
          // Home Body
          _HomeBody()
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationWidget(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          // Titulos
          PageTitleWidget(),

          // Card Table
          CardTableWidget(),
        ],
      ),
    );
  }
}
