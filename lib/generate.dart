import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String data = "www.facebook.com";

  final TextEditingController controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Generate QR Code"),
        ),
        body: Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                              controller: controllerText,
                              decoration:
                              InputDecoration(hintText: "Generate qr code..."),
                            )),
                        SizedBox(width: 10),
                        FlatButton(
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              data = controllerText.text;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 50),
                    Card(
                      elevation: 10,
                      child: QrImage(
                          version: 6,
                          foregroundColor: Colors.black,
                          errorCorrectionLevel: QrErrorCorrectLevel.M,
                          padding: EdgeInsets.all(20),
                          size: 300,
                          data: data),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
