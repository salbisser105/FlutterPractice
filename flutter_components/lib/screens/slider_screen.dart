import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _enabledImage = false;
  bool _enabledSlider = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Slider And Checks')),
        body: Column(
          children: [
            Slider.adaptive(
              value: _sliderValue,
              max: 400,
              min: 50,
              activeColor: AppTheme.primary,
              onChanged: _enabledSlider
                  ? (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    }
                  : null,
            ),
            _enabledImage
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Image(
                          fit: BoxFit.contain,
                          width: _sliderValue,
                          image: const NetworkImage(
                              'https://images.hdqwalls.com/wallpapers/4k-assassins-creed-valhalla-game-8d.jpg')),
                    ),
                  )
                : const SizedBox(height: 10.0),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Image(
                    fit: BoxFit.contain,
                    width: _sliderValue,
                    image: const NetworkImage(
                        'https://i.pinimg.com/originals/84/39/ef/8439efe44530d2e785b8e673ef1f4d30.jpg')),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

            SwitchListTile.adaptive(
                title: const Text('Enable Slider'),
                value: _enabledSlider,
                onChanged: (value) {
                  _enabledSlider = value;
                  setState(() {});
                }),
            SwitchListTile.adaptive(
                title: const Text('Enable Image'),
                value: _enabledImage,
                onChanged: (value) {
                  _enabledImage = value;
                  setState(() {});
                }),

            //INFO ABOUT THE APP: aboutListTile Widget
            // Checkbox(
            //     value: _enabledSlider,
            //     onChanged: (value) {
            //       _enabledSlider = value ?? true;
            //       setState(() {});
            //     }),
            // Checkbox(
            //     value: _enabledImage,
            //     onChanged: (value) {
            //       _enabledImage = value ?? false;
            //       setState(() {});
            //     }),
            // CheckboxListTile(
            //     title: const Text('Enable Image'),
            //     value: _enabledImage,
            //     onChanged: (value) {
            //       _enabledImage = value ?? false;
            //       setState(() {});
            //     }),
            // CheckboxListTile(
            //     title: const Text('Enable Slider'),
            //     value: _enabledSlider,
            //     onChanged: (value) {
            //       _enabledSlider = value ?? true;
            //       setState(() {});
            //     }),
            // Switch(
            //     value: _enabledImage,
            //     onChanged: (value) {
            //       _enabledImage = value;
            //       setState(() {});
            //     }),
          ],
        ));
  }
}
