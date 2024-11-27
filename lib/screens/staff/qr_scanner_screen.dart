
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../constants/app_style.dart';
import 'exchange_trash_screen.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'QR Scanner',
        style: kLableTextStyleTilte22Green,
      )),
      body: MobileScanner(
        controller: MobileScannerController(
            detectionSpeed: DetectionSpeed.noDuplicates),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;

          final Uint8List? image = capture.image;
          print(barcodes.first.rawValue);

          if (barcodes.first.rawValue != null) {
            final value = barcodes.first.rawValue!.split(':');
            Get.to(() => ExchangeTrashScreen(
                  username: value[0],
                  email: value[1],
                ));
          }
        },
      ),
    );
  }
}
