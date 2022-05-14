import 'dart:developer';

import 'package:gif_project/constant/strings.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerServices {
  //url launcher for the rate button
  Future<void> launchRateUrl(url) async {
    try {
      !await launchUrl(Uri.parse(url));
    } catch (e) {
      log(e.toString());
    }
  }

  //for sharing the app
  Future<void> shareApp() async {
    try {
      Share.share(
        'Download (Gif Station) best Gifs & Stickers app from her => $appUrl ',
        subject: 'downlaod Gif Station',
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
