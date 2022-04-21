import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4299197587738554/1900351941';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4299197587738554/1900351941';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4299197587738554/3759356388";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4299197587738554/3759356388";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4299197587738554/3759356388";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4299197587738554/3759356388";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4299197587738554/8717041730";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4299197587738554/8717041730";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
  static String get appNativeAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4299197587738554/9531429957";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4299197587738554/9531429957";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

}