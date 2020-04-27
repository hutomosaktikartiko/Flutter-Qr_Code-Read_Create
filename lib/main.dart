import 'package:flutter/material.dart';
import 'package:qr_code/generate.dart' as generate;
import 'package:qr_code/scan.dart' as scan;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            controller: controller,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.add),
              ),
              Tab(
                  icon: Icon(Icons.center_focus_strong)
              )
            ]),
        body: TabBarView(
            controller: controller,
            children: <Widget>[
              generate.Generate(),
              scan.Scan()
            ]),
      ),
    );
  }
}
