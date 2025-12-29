import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/qr_scanner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner App',
      theme: ThemeData(primarySwatch: Colors.indigo),

      // 👇 FIRST SCREEN
      home: const LoginScreen(),

      routes: {
        '/scanner': (context) => const QRScannerScreen(),
      },
    );
  }
}
