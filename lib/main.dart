import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qr_code_scanner_and_generator/Models/ad_helper.dart';
import 'package:qr_code_scanner_and_generator/Models/ad_open_model.dart';
import 'generator.dart';
import 'scanner.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //RequestConfiguration config = RequestConfiguration(
  // testDeviceIds: <String>['A485FF8191A0455B947FB1604D28EB1E'],
  // );MobileAds.instance.updateRequestConfiguration(config);
  AdOpen().loadAd();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Ad banner
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;
  final AdSize _adSize = AdSize.banner;

  @override
  void initState() {
    super.initState();
    //_initBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    //_bannerAd.dispose();
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffA8242D),
          bottom: const TabBar(
            indicatorColor: Color(0xffffffff),
            tabs: [
              Tab(
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.qr_code,
                  size: 40,
                ),
              ),
            ],
          ),
          title: const Text(
            '  QR / Barcode Scanner',
          ),
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xffA8242D),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/app_logo.png',
                  width: 85,
                  height: 85,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: Color(0xffffffff),
                thickness: 2,
              ),
              const ListTile(
                dense: true,
                title: Text(
                  "Developed By:",
                  style: TextStyle(fontSize: 15),
                ),
                subtitle: Text(
                  "   Abdullah Al-Hakimi",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                color: Color(0xffffffff),
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: const [
                  Text(
                    "Contact Me Through",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xfd000000),
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  const url = 'https://wa.me/+967774440810';
                  _launchURL(url);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 10,
                  ),
                  child: Row(
                    children: const [
                      Text(
                        "WhatsApp",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.double_arrow_outlined,
                        size: 20,
                        color: Color(0xffffffff),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  const url =
                      'https://instagram.com/abdullhalhakimi?igshid=ZDdkNTZiNTM=';
                  _launchURL(url);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 10,
                  ),
                  child: Row(
                    children: const [
                      Text(
                        "Instagram",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.double_arrow_outlined,
                        color: Color(0xfffffffff),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Color(0xffffffff),
                thickness: 2,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Second(),
            First(),
          ],
        ),
        // bottomNavigationBar: _isAdLoaded
        //     ? Container(
        //         height: _bannerAd.size.height.toDouble(),
        //         width: _bannerAd.size.width.toDouble(),
        //         child: AdWidget(ad: _bannerAd),
        //       )
        //     : SizedBox(),
      ),
    );
  }

  _launchURL(String url) async {
    //const url = 'https://wa.me/+967774440810';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not open the Url';
    }
  }
}
