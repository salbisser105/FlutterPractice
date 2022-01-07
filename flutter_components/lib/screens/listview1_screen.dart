import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({Key? key}) : super(key: key);
  final options = const [
    'Halo',
    'World of warcraft',
    'Runescape',
    'Combat Arms Europe'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listview Tipo 1'),
        ),
        body: ListView(
          children: [
            ///... is the spread operator, helps to extract each element of the list.
            ...options
                .map(
                  (game) => ListTile(
                    leading: const Icon(Icons.home),
                    title: Text(game),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                )
                .toList()
          ],
        ));
  }
}
