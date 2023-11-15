import 'package:flutter/material.dart';

class BackrounScreen extends StatelessWidget {

  final body;
  final backrouncolor;
   BackrounScreen({super.key, this.body, this.backrouncolor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: body,
       backgroundColor: backrouncolor,
       extendBody: true,
    );
  }
}
