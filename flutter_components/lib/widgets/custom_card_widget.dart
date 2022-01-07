import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album_outlined, color: AppTheme.primary),
            title: Text('Text title'),
            subtitle: Text('Subtitle text'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Ok'),
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(right: 20.0))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
