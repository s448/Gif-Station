import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_project/constant/colors.dart';
import 'package:gif_project/constant/styles.dart';
import 'package:gif_project/data/admob_helper/admob_helper.dart';
import 'package:gif_project/data/web_service/format_size.dart';
import 'package:gif_project/data/web_service/share_media_services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
  //ADMOB REWARD ADS
  // TODO: Add _rewardedAd
  late RewardedAd rewardedAd;
  bool isRewardedAdReady = false;

  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdmobHelper.adRewardId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          if (kDebugMode) {
            print("____________________________ADLOADDED________");
          }
          rewardedAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                isRewardedAdReady = false;
              });
              loadRewardedAd();
            },
          );

          setState(() {
            isRewardedAdReady = true;
          });
        },
        onAdFailedToLoad: (err) {
          if (kDebugMode) {
            print(
                "____________________________AD FAILED TO LOAD ????????????________");
          }
          if (kDebugMode) {
            print('Failed to load a rewarded ad: ${err.message}');
          }
          setState(() {
            isRewardedAdReady = false;
          });
        },
      ),
    );
  }

  //for the download listener >>
  String downloadinMsg = "downloading...";
  bool isDownlaoding = false;
  bool isDownloaded = false;
  int percentage = 0;
  //download the file to the app directory in local file storage
  Future<void> downloadMedia(
    url,
    fileName,
  ) async {
    Dio dio = Dio();
    String savePath = await ShareMediaServices().getFilePath(fileName);
    try {
      await dio.download(url, savePath, deleteOnError: true,
          onReceiveProgress: (rcv, total) {
        setState(() {
          isDownlaoding = true;
        });
        percentage = (rcv / total * 100).floor();
      }).then((value) {
        setState(() {
          isDownlaoding = false;
        });
      }).then((value) async {
        //check existence
        checkExist(savePath);
      });
    } catch (e) {
      Get.dialog(SimpleDialog(
        children: [Text(e.toString())],
      ));
    }
  }

  checkExist(savePath) async {
    bool directoryExists = await Directory(savePath).exists();
    bool fileExists = await File(savePath).exists();
    if (directoryExists || fileExists) {
      setState(() {
        setState(() {
          isDownloaded = true;
        });
      });
    } else {
      if (kDebugMode) {
        print("NOT EXIST");
      }
    }
  }

  final List<dynamic> gifsData;
  String size = "";
  @override
  void initState() {
    super.initState();
    loadRewardedAd();
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
                onPressed: (() {
                  if (isRewardedAdReady) {
                    rewardedAd.show(onUserEarnedReward: ((ad, reward) {
                      //download the gif
                      downloadMedia(gifsData[1], gifsData[2]);
                    }));
                  } else {
                    //download the gif
                    downloadMedia(gifsData[1], gifsData[2]);
                  }
                }),
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
                onPressed: (() {
                  if (isRewardedAdReady) {
                    rewardedAd.show(onUserEarnedReward: ((ad, reward) {
                      //download and share the gif
                      ShareMediaServices().shareMedia(gifsData[1], gifsData[2]);
                    }));
                  } else {
                    //download and share the gif
                    ShareMediaServices().shareMedia(gifsData[1], gifsData[2]);
                  }
                }),
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
                    downloadinMsg + " " + percentage.toString() + "%",
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
