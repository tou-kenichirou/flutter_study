import 'package:flutter/material.dart';
import 'package:flutter_study/barcode_scan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String get title => 'Flutter_issue4_BarcodeScan';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BarcodeScanApp(title: title,),
    );
  }
}
