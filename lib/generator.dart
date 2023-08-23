import 'dart:developer';
import 'dart:io';
import 'dart:ui';
// Developed by Abdullah Al-Hakimi
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_and_generator/Models/ad_interstitial_model.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              code != ''
                  ? Text('')
                  : Padding(
                      padding: const EdgeInsets.all(35),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffA8242D),
                            width: 2,
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                            color: Color(
                              0xffA8242D,
                            ),
                          ),
                          controller: title,
                          textAlign: TextAlign.center,
                          cursorColor: const Color(0xffA8242D),
                          cursorHeight: 20,
                          decoration: const InputDecoration(
                            hintText: ' Code ',
                            hintStyle: TextStyle(
                              color: Color(0xffA8242D),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
              code != ''
                  ? MaterialButton(
                      height: 35,
                      minWidth: 100,
                      color: const Color(0xffA8242D),
                      onPressed: () {
                        setState(() {
                          code = '';
                          title.text = '';
                          First();
                        });
                        //AdInterstitial.showInterstitialAd();
                        //log('Ad Is Showing---------------------->');
                      },
                      child: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                  : MaterialButton(
                      height: 35,
                      minWidth: 100,
                      color: const Color(0xffA8242D),
                      onPressed: () {
                        setState(() {
                          code = title.text;
                        });
                        //AdInterstitial.loadInterstitialAd();
                        //log('Ad Is Loading---------------------->');
                      },
                      child: const Text(
                        "Create",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 40,
              ),
              code == ''
                  ? Text('')
                  : BarcodeWidget(
                      barcode: Barcode.qrCode(
                        errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                      ),
                      data: '$code',
                      width: 200,
                      height: 200,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
