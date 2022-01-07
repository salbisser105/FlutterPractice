import 'package:flutter/material.dart';

class ListView3Screen extends StatelessWidget {
  const ListView3Screen({Key? key}) : super(key: key);
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
          title: const Text('Listview Tipo 3'),
        ),
        body: ListView.separated(
          itemCount: options.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(options[index]),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              final game = options[index];
              print(game);
            },
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}
