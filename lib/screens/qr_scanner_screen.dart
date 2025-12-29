import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../widgets/result_card.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String scannedResult = "Scan a QR Code";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Scanner")),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              onDetect: (barcode) {
                final code = barcode.barcodes.first.rawValue;
                if (code != null) {
                  setState(() {
                    scannedResult = code;
                  });
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ResultCard(result: scannedResult), // ✅ correct usage
          ),
        ],
      ),
    );
  }
}
