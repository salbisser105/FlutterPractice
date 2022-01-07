import 'package:flutter/material.dart';

class CustomCard2Widget extends StatelessWidget {
  final String imageUrl;
  final String textTitle;

  const CustomCard2Widget(
      {Key? key, required this.imageUrl, required this.textTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 25,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.blue,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 250),
          ),
          Container(
            color: Colors.lightBlue.withOpacity(0.3),
            alignment: AlignmentDirectional.centerEnd,
            padding:
                const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
            child: Text(textTitle),
          )
        ],
      ),
    );
  }
}
