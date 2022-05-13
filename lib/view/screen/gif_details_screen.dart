import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_project/constant/colors.dart';
import 'package:gif_project/constant/styles.dart';
import 'package:gif_project/data/web_service/format_size.dart';
import 'package:gif_project/data/web_service/share_media_services.dart';
import 'package:intl/intl.dart';

class GifDetailsScreen extends StatefulWidget {
  GifDetailsScreen({Key? key, required this.gifData}) : super(key: key);
  final List<dynamic> gifData;

  @override
  // ignore: no_logic_in_create_state
  State<GifDetailsScreen> createState() =>
      _GifDetailsScreenState(gifsData: gifData);
}
//parameter List content
/*
0  username, 
1  images.original.url,
2  title,
3  import_datetime,
4  user.avatar_url,
5  user.avatarurl.is_verified,
*/

class _GifDetailsScreenState extends State<GifDetailsScreen> {
  //for the download listener >>
  String downloadinMsg = "downloading...";
  bool isDownlaoding = false;
  bool isDownloaded = false;
  int percentage = 0;
  //download the file to the app directory in local file storage
  Future<void> downloadMedia(url, fileName, BuildContext context) async {
    Dio dio = Dio();
    String savePath = await ShareMediaServices().getFilePath(fileName);
    try {
      await dio.download(url, savePath, deleteOnError: true,
          onReceiveProgress: (rcv, total) {
        setState(() {
          isDownlaoding = true;
        });
        percentage = (rcv / total * 100).floor();
        print(percentage);
      }).then((value) {
        setState(() {
          isDownlaoding = false;
        });
      }).then((value) async {
        bool directoryExists = await Directory(savePath).exists();
        bool fileExists = await File(savePath).exists();
        if (directoryExists || fileExists) {
          setState(() {
            print("EXIST");
            setState(() {
              isDownloaded = true;
            });
          });
        } else {
          print("NOT EXIST");
        }
      });
    } catch (e) {
      Get.dialog(SimpleDialog(
        children: [Text(e.toString())],
      ));
    }
  }

  final List<dynamic> gifsData;
  String size = "";
  @override
  void initState() {
    super.initState();

    //convert the byte size to mb or kb
    setState(() {
      size = FormatSize().formatBytes(int.parse(gifsData[6]), 1);
    });
  }

  _GifDetailsScreenState({required this.gifsData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          gifsData[2].toString(),
          style: appBarStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Image.network(
                gifsData[1],
                fit: BoxFit.fill,
              ),
            ),
            //first row >> include the avatar & name & verification badge
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                    gifsData[4],
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  gifsData[0].toString().toUpperCase(),
                  style: boldStyle,
                  overflow: TextOverflow.fade,
                ),
                gifsData[5] == true
                    ? const Icon(
                        Icons.verified,
                        color: primaryColor,
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              height: 15.0,
              child: Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Text(
                  "Published at : ",
                  style: traditionalStyle,
                ),
                Text(
                  DateFormat.yMMMd().format(DateTime.parse(gifsData[3])),
                  style: const TextStyle(color: primaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
              child: Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            //download button
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width, minHeight: 20.0),
              child: ElevatedButton(
                onPressed: (() => downloadMedia(
                      gifsData[1],
                      gifsData[2],
                      context,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Download ",
                      style: categoryStyle,
                    ),
                    const Icon(Icons.download),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("(" + size.toString() + ")"),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width, minHeight: 20.0),
              child: ElevatedButton(
                onPressed: (() =>
                    //download and share the gif
                    ShareMediaServices().shareMedia(
                      gifsData[1],
                      gifsData[2],
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Share ",
                      style: categoryStyle,
                    ),
                    const Icon(Icons.share)
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ),
            isDownlaoding
                ? Text(
                    downloadinMsg + " " + percentage.toString(),
                    style: traditionalStyle,
                  )
                : const SizedBox(),
            isDownloaded
                ? Text(
                    "Gif downloaded successfully",
                    style: successStyle,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
