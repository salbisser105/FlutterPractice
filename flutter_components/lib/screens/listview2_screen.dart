import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({Key? key}) : super(key: key);
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
          title: const Text('Listview Tipo 2'),
        ),
        body: ListView.separated(
          itemCount: options.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(options[index]),
            trailing: const Icon(Icons.arrow_forward),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}
