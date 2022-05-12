//here the web services of sharing & downloading the gifs and stickers

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';

class ShareMediaServices {
  //return the directory where the file should be saved
  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory? dir = await DownloadsPathProvider.downloadsDirectory;
    path = '${dir!.path}/$uniqueFileName.webp';
    if (kDebugMode) {
      print(path);
    }
    return path;
  }

  //download the file to the app directory in local file storage
  Future<void> downloadMedia(url, fileName) async {
    Dio dio = Dio();
    String savePath = await getFilePath(fileName);
    dio.download(url, savePath, deleteOnError: true,
        onReceiveProgress: (rcv, total) {
      print(
          'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');
    }).then((value) => print("<<<<<<<<Done>>>>>>>>"));
  }

  // //create visible directory to save the media inside it
  // Future<String> createFolderInAppDocDir(String folderName) async {
  //   //ask for a permission to get access to the external storage
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     //requiest for access permissions
  //     await Permission.storage.request();
  //   }

  //   //App Document Directory + folder name
  //   if (status.isGranted) {
  //     final Directory _appDocDirFolder = Directory('/data/user/0/$folderName/');

  //     if (await _appDocDirFolder.exists()) {
  //       //if folder already exists return path
  //       print(_appDocDirFolder);
  //       return _appDocDirFolder.path;
  //     } else {
  //       try {
  //         //if folder not exists create folder and then return its path
  //         final Directory _appDocDirNewFolder =
  //             await _appDocDirFolder.create(recursive: true);
  //         print(_appDocDirFolder);
  //         return _appDocDirNewFolder.path;
  //       } catch (e) {
  //         print("ERROR>>>" + e.toString());
  //         print(status);
  //         return "";
  //       }
  //     }
  //   } else {
  //     print('permission denyed');
  //     return "error";
  //   }
  // }
}
