import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: _width,
          height: _height,
          decoration:
              BoxDecoration(color: _color, borderRadius: _borderRadiusGeometry),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle_outline, size: 35),
        onPressed: () {
          changeShape(context);
        },
      ),
    );
  }

  void changeShape(BuildContext context) {
    final rnd = Random();
    setState(() {
      _width = rnd.nextInt(300).toDouble() + 20;
      _height = rnd.nextInt(80).toDouble() + 40;
      _color = Color.fromRGBO(
          rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255), 1);
      _borderRadiusGeometry =
          BorderRadius.circular(rnd.nextInt(100).toDouble() + 5);
    });
  }
}
