import 'package:flutter/material.dart';

class CovidDetailPage extends StatelessWidget {
  final int snapShot;
  CovidDetailPage({Key? key , required this.snapShot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('basılan ülkenin indexi : $snapShot'),
        ],
      ),
    );
  }
}