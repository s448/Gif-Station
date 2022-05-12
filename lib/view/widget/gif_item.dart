import 'package:flutter/material.dart';
import 'package:gif_project/constant/strings.dart';

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
      onTap: (() async {
        print(allGifs[0]);
        Navigator.pushNamed(
          context,
          gifDetailsScreenRoute,
          arguments: <dynamic>[
            allGifs[i].username ?? "none-0",
            allGifs[i].images.original.webp ?? "none-1",
            allGifs[i].title ?? "none-2",
            allGifs[i].importDatetime ?? "none-3",
            allGifs[i].user.avatarUrl ?? "none-4",
            allGifs[i].user.isVerified ?? "none-5",
            allGifs[i].images.original.size ?? "none-6",
          ],
        );
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
