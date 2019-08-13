import 'package:flutter/material.dart';

import 'package:basic_flutter/common/mainDrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Text("Home"),
      ),
      drawer: MainDrawer(),
    );
  }
}
