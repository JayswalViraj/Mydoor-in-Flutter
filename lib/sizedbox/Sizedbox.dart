import 'package:flutter/material.dart';

class Sizedbox extends StatelessWidget {



  Sizedbox({this.width, this.height});

  final width;

  final height;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
