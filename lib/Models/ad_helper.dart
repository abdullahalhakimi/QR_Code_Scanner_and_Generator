import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdHelper {
//   static const bool _testMode = false;
//
//   static String get bannerAdUnitId {
//     if (_testMode) {
//       return BannerAd.testAdUnitId;
//     }
//     return 'ca-app-pub-4734000358819500/7564695446';
//   }
//
//   static String get interstitialAdUnitId {
//     if (_testMode) {
//       return InterstitialAd.testAdUnitId;
//     }
//     return 'ca-app-pub-4734000358819500/1546082008';
//   }
// }

class AdHelper {
  static const bool _testMode = false;

  static String get bannerAdUnitId {
    if (_testMode) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return 'ca-app-pub-4734000358819500/7564695446';
  }

  static String get interstitialAdUnitId {
    if (_testMode) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    return 'ca-app-pub-4734000358819500/1546082008';
  }
}
