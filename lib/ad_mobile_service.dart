import 'dart:io';

class AdMobService {
  static String? get interstitialAdUnitId {
    if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    }

    return null;
  }
}
