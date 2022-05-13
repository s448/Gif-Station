//here the web services of sharing & downloading the gifs and stickers
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_project/constant/colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class ShareMediaServices {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //return the directory where the file should be saved
  Future<String> getFilePath(uniqueFileName) async {
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      Permission.storage.request();
    }
    String path = '';
    String dir = "/storage/emulated/0";
    //await DownloadsPathProvider.downloadsDirectory;
    path = '$dir/GifStation/$uniqueFileName.webp';
    if (kDebugMode) {
      print(">>>>>>>" + path);
    }
    return path;
  }

  //share the downloaded media
  Future<void> shareMedia(url, fileName) async {
    Dio dio = Dio();
    String savePath = await getFilePath(fileName);
    await dio.download(url, savePath,
        deleteOnError: true, onReceiveProgress: (rcv, total) {});
    Share.shareFiles([savePath], text: fileName);
  }

  Future<bool> checkFileExist(path) async {
    bool directoryExists = await Directory(path).exists();
    bool fileExists = await File(path).exists();
    if (directoryExists || fileExists) {
      return true;
    } else {
      return false;
    }
  }
}
