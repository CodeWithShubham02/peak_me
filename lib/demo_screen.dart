import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class ImeiScreen extends StatefulWidget {
  @override
  _ImeiScreenState createState() => _ImeiScreenState();
}

class _ImeiScreenState extends State<ImeiScreen> {

  static const platform = MethodChannel('imei');
  String _imei = 'Press button to get IMEI';
  Future<void> getImei() async {
    // Request runtime permission
    PermissionStatus status = await Permission.phone.status;
    if (!status.isGranted) {
      status = await Permission.phone.request();
    }

    if (status.isGranted) {
      try {
        final String result = await platform.invokeMethod('getIMEI');
        setState(() {
          _imei = result;
        });
      } on PlatformException catch (e) {
        setState(() {
          _imei = "Failed: ${e.message}";
        });
      }
    } else {
      setState(() {
        _imei = 'Phone permission not granted';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get IMEI")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _imei,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: (){},
              child: Text("Get IMEI"),
            )
          ],
        ),
      ),
    );
  }
}
