import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

class ShareCard extends StatefulWidget {
  const ShareCard({Key? key}) : super(key: key);

  @override
  State<ShareCard> createState() => _ShareCardState();
}

class _ShareCardState extends State<ShareCard> {
  final _screenshotController = ScreenshotController();

  Future<void> _takeScreenshot() {
    List<String> imagePaths = [];
    final RenderBox box = context.findRenderObject() as RenderBox;
    return Future.delayed(const Duration(milliseconds: 500), () async {
      RenderRepaintBoundary? boundary = previewContainer.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage();
      final directory = (await getApplicationDocumentsDirectory()).path;
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      File imgFile = File('$directory/screenshot.png');
      imagePaths.add(imgFile.path);
      imgFile.writeAsBytes(pngBytes).then((value) async {
        await Share.shareFiles(imagePaths,
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initInterstitialAd();
  }

  late InterstitialAd interstitialAd;
  bool isAdLoaded = false;
  var adUnit = 'ca-app-pub-3940256099942544/1033173712';

  initInterstitialAd() {
    InterstitialAd.load(
        adUnitId: adUnit,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          interstitialAd = ad;
          setState(() {
            isAdLoaded = true;
          });
        }, onAdFailedToLoad: (error) {
          interstitialAd.dispose();
        }));
  }

  GlobalKey previewContainer = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RepaintBoundary(
        key: previewContainer,
        child: Screenshot(
          controller: _screenshotController,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Color.fromARGB(255, 24, 94, 247),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.water_drop,
                      size: 50,
                      color: Colors.white,
                    ),
                    title: Text(
                      '1500 litres of water',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Congrats you're better than",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "60%",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 15),
                  child: Text(
                    "of the users 😁❤️\nKeep Going!!!!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, bottom: 16.0, right: 16),
                  child: ElevatedButton.icon(
                    onPressed: _takeScreenshot,
                    icon: const Icon(Icons.share),
                    label: const Text('Share with your friends'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      backgroundColor: const Color.fromARGB(255, 24, 94, 247),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, bottom: 16.0, right: 16),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (isAdLoaded) {
                        interstitialAd.show();
                      }
                    },
                    icon: const Icon(Icons.ads_click),
                    label: const Text('Ads Button'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      backgroundColor: const Color.fromARGB(255, 0, 140, 37),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
