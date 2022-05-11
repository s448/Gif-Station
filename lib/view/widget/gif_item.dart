import 'package:flutter/material.dart';

class GifItem extends StatelessWidget {
  const GifItem({
    Key? key,
    required this.allGifs,
    required this.i,
  }) : super(key: key);

  final List allGifs; //list of gifs
  final int i; //item counter
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        print(allGifs[i].images.original.url + "dddddddddddddddddddd");
      }),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width / 2 - 10,
        height: MediaQuery.of(context).size.height / 4,
        child: Image.network(
          allGifs[i].images.original.webp,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
