import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:qrscan/qrscan.dart';


class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String scanText = "Qr Code";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan Qr Code")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(scanText, style: TextStyle(fontSize: 20)),
            RaisedButton(
              child: Text("Scan Qr"),
              onPressed: () {
                scanQr();
              },
            )
          ],
        ),
      ),
    );
  }
  void scanQr() async {
    bool result = await SimplePermissions.checkPermission(Permission.Camera);
    PermissionStatus status = PermissionStatus.notDetermined;
    if(!result)
      status = await SimplePermissions.requestPermission(Permission.Camera);
    if(result || status == PermissionStatus.authorized) {
      String scanResult = await scan();
      setState(() {
        scanText = scanResult;
      });
    }
  }
}
