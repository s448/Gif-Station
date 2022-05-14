import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper {
  //the bannaer add
  static String get adBannerId {
    //test unit id for banner ad : ca-app-pub-3940256099942544/6300978111
    return 'ca-app-pub-6633610550325739/5359861014';
  }

  //the open app ad
  static String get adOpenAppId {
    //test unit id for open app : ca-app-pub-3940256099942544/3419835294
    return 'ca-app-pub-6633610550325739/5994285831';
  }

  //the reward add
  static String get adRewardId {
    //test unit id for reward ad : ca-app-pub-3940256099942544/5224354917
    return 'ca-app-pub-6633610550325739/9741959153';
  }

  //initialize the admob {called when the app is opened in the main function}

  Future<InitializationStatus> initGoogleMobileAds() {
    // Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }
}

/// Listens for app foreground events and shows app open ads.
