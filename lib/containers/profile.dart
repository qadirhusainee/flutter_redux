import 'package:flutter/material.dart';

import 'package:basic_flutter/common/mainDrawer.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Text("My Profile"),
      ),
      drawer: MainDrawer('profile'),
    );
  }
}
