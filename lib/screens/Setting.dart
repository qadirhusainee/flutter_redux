import 'package:flutter/material.dart';

import 'package:basic_flutter/common/mainDrawer.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: Center(
        child: Text("Setting"),
      ),
      drawer: MainDrawer('setting'),
    );
  }
}
