import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/extension/string_extension.dart';
import 'package:flutter_study/issue_4/webview_screen.dart';

class BarcodeScanApp extends StatefulWidget {
  const BarcodeScanApp({super.key, required this.title});

  final String title;

  @override
  BarcodeScanState createState() => BarcodeScanState();
}

class BarcodeScanState extends State<BarcodeScanApp> {
  String readData = '';

  Future<void> _scan(BuildContext context) async {
    try {
      final scanData = await BarcodeScanner.scan();
      setState(
        () => readData = scanData.rawContent,
      );
      final isbn = readData.convertIsbn10();

      if (!mounted) {
        return;
      }

      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) =>
              WebViewScreen(url: 'https://www.amazon.co.jp/dp/$isbn'),
        ),
      );
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          readData = 'カメラが許可されていない';
        });
      } else {
        setState(() => readData = '不明なエラー : $e');
      }
    } on FormatException {
      setState(
        () => readData = 'バーコード読み取り失敗',
      );
    } on Exception catch (e) {
      setState(() => readData = '不明なエラー : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () => _scan(context),
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              label: const Text('Scan'),
            ),
          ],
        ),
      ),
    );
  }
}
