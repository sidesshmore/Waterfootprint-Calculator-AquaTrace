import 'dart:ffi';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareCard extends StatefulWidget {
  const ShareCard({Key? key}) : super(key: key);

  @override
  State<ShareCard> createState() => _ShareCardState();
}

class _ShareCardState extends State<ShareCard> {
  final _screenshotController = ScreenshotController();
  double footprint = 0;

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
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
            text:
                "Download Aqua trace and start tracking your WaterFootprint now! \n https://pub.dev/packages/share_plus");
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  Future<void> getTotal() async {
    final dio = Dio();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final response = await dio
        .get('${dotenv.env["URL"]}/user/today/${uid}');
    print(response.data);
    if (response.statusCode == 200) {
      setState(() {
        footprint = (double.parse(response.data["total"]));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getTotal();
  }

  GlobalKey previewContainer = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: double.infinity,
      child: RepaintBoundary(
        key: previewContainer,
        child: Screenshot(
          controller: _screenshotController,
          child: SizedBox(
            height: height * 0.5,
            child: Card(
              color: Colors.white,
              elevation: 3,
              shadowColor: Colors.grey.shade600,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/shareCardImage.png',
                        height: height * 0.24,
                        fit: BoxFit.fill,
                        width: width * 0.86,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Today\'s Water Footprint :',
                        style: TextStyle(
                            fontSize: width * 0.045, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' ${footprint.toInt()} Litres',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.045)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text('Preserve water, preserve life.',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.045)),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, bottom: 16.0, right: 16),
                      child: ElevatedButton.icon(
                        onPressed: _takeScreenshot,
                        icon: const Icon(Icons.share),
                        label: Text(
                          'Share with your friends',
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 24, 94, 247),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
