// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          children: const [
            CustomCardWidget(),
            SizedBox(height: 10),
            CustomCard2Widget(
              imageUrl:
                  'https://media.wired.com/photos/6046813abc9d842459e763e1/master/pass/games_valhalla_wanderlust.jpg',
              textTitle: 'Valhalla',
            ),
            SizedBox(height: 10),
            CustomCard2Widget(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeoaHtSertyMlkfyN06xDMEsuTXupAI4m08hWuxjtOFbFdd2FHupw_zHceeHidnFu3GXw&usqp=CAU',
                textTitle: 'Fury Valhalla'),
            SizedBox(height: 10),
            CustomCard2Widget(
                imageUrl:
                    'https://i.pinimg.com/originals/f0/f0/c0/f0f0c0ac2127043f2f2586f7927d9da9.jpg',
                textTitle: 'Gates of Valhalla')
          ],
        ));
  }
}
