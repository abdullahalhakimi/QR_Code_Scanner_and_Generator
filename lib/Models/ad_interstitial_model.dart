import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_code_scanner_and_generator/Models/ad_helper.dart';

class AdInterstitial {
  static late InterstitialAd _interstitialAd;
  static bool isAdReady = false;

  static void loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback:
            InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          isAdReady = true;
          _interstitialAd = ad;
        }, onAdFailedToLoad: (error) {
          log('c: ${error.message}');
        }));
  }

  static void showInterstitialAd() {
    if (isAdReady) {
      _interstitialAd.show();
    }
  }
}
