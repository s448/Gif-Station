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
        print(allGifs[i]);
        Navigator.pushNamed(
          context,
          gifDetailsScreenRoute,
          arguments: <dynamic>[
            allGifs[i].username ?? "USERNAME-UNLNOWN",
            allGifs[i].images.original.url ??
                "https://www.gstatic.com/webp/gallery/3.sm.webp",
            allGifs[i].title ?? "TITLE-UNKNOWN",
            allGifs[i].importDatetime ?? "DATE-UNKNOWN",
            allGifs[i].user.avatarUrl!,
            allGifs[i].user.isVerified ?? false,
            allGifs[i].images.original.size ??
                "https://img.icons8.com/ios/344/gif--v2.gif",
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
