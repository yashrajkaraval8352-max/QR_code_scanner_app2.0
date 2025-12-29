import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultCard extends StatelessWidget {
  final String result;

  const ResultCard({super.key, required this.result});

  bool _isUrl(String text) {
    return text.startsWith('http://') || text.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Scanned Result",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(result, textAlign: TextAlign.center),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.copy),
                  label: const Text("Copy"),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: result));
                  },
                ),
                if (_isUrl(result))
                  ElevatedButton.icon(
                    icon: const Icon(Icons.open_in_browser),
                    label: const Text("Open"),
                    onPressed: () async {
                      final uri = Uri.parse(result);
                      await launchUrl(
                        uri,
                        mode: LaunchMode.inAppWebView, // 🔥 opens inside app
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
