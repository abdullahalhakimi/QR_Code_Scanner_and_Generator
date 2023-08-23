import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static const bool _testMode = false;

  static String get bannerAdUnitId {
    if (_testMode) {
      return BannerAd.testAdUnitId;
    }
    return 'ca-app-pub-4734000358819500/7564695446';
  }

  static String get interstitialAdUnitId {
    if (_testMode) {
      return InterstitialAd.testAdUnitId;
    }
    return 'ca-app-pub-4734000358819500/1546082008';
  }
}
