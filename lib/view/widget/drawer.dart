import 'package:flutter/material.dart';
import 'package:gif_project/constant/colors.dart';
import 'package:gif_project/constant/strings.dart';
import 'package:gif_project/constant/styles.dart';
import 'package:gif_project/data/web_service/drawer_services.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 12.0,
            ),
            Image.asset('assets/images/header.png'),
            const SizedBox(
              height: 15,
            ),
            DrawerButton(
              function: (() {
                DrawerServices().launchRateUrl(appUrl);
              }),
              title: "Rate the app",
              asset: 'assets/icons/star.png',
            ),
            const SizedBox(
              height: 15,
            ),
            DrawerButton(
              function: (() {
                DrawerServices().shareApp();
              }),
              title: "Share the app",
              asset: 'assets/icons/share.png',
            ),
            const SizedBox(
              height: 35,
              child: Divider(
                color: Colors.black,
                thickness: 2.7,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "version : ",
                    style: traditionalStyle,
                  ),
                  Text(
                    '1.0.0',
                    style: seeAllCategoriesButtonStyle,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 35,
              child: Divider(
                color: Colors.black,
                thickness: 2.7,
              ),
            ),
            InkWell(
              onTap: (() {
                DrawerServices().launchRateUrl("https://giphy.com/");
              }),
              child: Center(
                child: Image.asset('assets/images/poweredby_giphy.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key? key,
    required this.function,
    required this.title,
    required this.asset,
  }) : super(key: key);

  final VoidCallback function;
  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (function),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.black)),
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: traditionalStyle,
            ),
            Image.asset(
              asset,
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
