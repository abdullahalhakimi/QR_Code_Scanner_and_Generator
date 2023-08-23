import 'package:google_mobile_ads/google_mobile_ads.dart';

// test Open Ad: ca-app-pub-3940256099942544/3419835294
// Real Open Ad: ca-app-pub-4734000358819500/5776669732
class AdOpen {
  AppOpenAd? openAd;

  loadAd() {
    AppOpenAd.load(
        adUnitId: 'ca-app-pub-4734000358819500/5776669732',
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
          print("Ad is loaded");
          openAd = ad;
          openAd!.show();
        }, onAdFailedToLoad: (error) {
          print("Ad failed to load: $error");
        }),
        orientation: AppOpenAd.orientationPortrait);
  }

  showAd() {
    if (openAd == null) {
      print("trying to show before the Ad");
      loadAd();
      return;
    }

    openAd!.fullScreenContentCallback =
        FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
      print("onAdShowedFullScreenContent");
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      ad.dispose();
      print("onAdFailedToShowFullScreenContent $error");
      openAd = null;
      loadAd();
    }, onAdDismissedFullScreenContent: (ad) {
      ad.dispose();
      print("Dismissed");
      openAd = null;
      loadAd();
    });
    openAd!.show();
  }
}
