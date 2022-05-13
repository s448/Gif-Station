import 'package:flutter/material.dart';
import 'package:gif_project/constant/styles.dart';
import 'package:gif_project/data/model/lists_of_data.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key, required this.index, required this.function})
      : super(key: key);
  final int index;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Colors.pink),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Image.asset(homeButtonsData[index]['image']),
                  const VerticalDivider(
                    thickness: 2.0,
                    indent: 5,
                  ),
                  Text(
                    homeButtonsData[index]['name'],
                    style: boldStyle,
                  )
                ],
              ),
            ),
            Text(
              homeButtonsData[index]['description'].toString(),
              style: traditionalStyle,
            )
          ],
        ),
      ),
    );
  }
}
