import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_code_scanner_and_generator/Models/ad_helper.dart';

class AdBanner extends StatefulWidget {
  const AdBanner({Key? key}) : super(key: key);

  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;
  final AdSize _adSize = AdSize.banner;

  @override
  void initState() {
    super.initState();
    _initBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  void _initBannerAd() {
    _bannerAd = BannerAd(
      size: _adSize,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
            print("Ad is Loaded Successfully");
          });
        },
        onAdFailedToLoad: (ad, error) {
          log('Ad Failed to load: ${error.message}');
        },
      ),
      request: const AdRequest(),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdLoaded) {
      return Container(
        height: _adSize.height.toDouble(),
        width: _adSize.width.toDouble(),
        alignment: Alignment.center,
        child: AdWidget(ad: _bannerAd),
      );
    }
    return Container();
  }
}
