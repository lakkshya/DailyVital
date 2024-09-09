import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: const Center(
        child: SpinKitFadingCircle(
          color: Colors.blueAccent,
          size: 100.0,
        ),
      ),
    );
  }
}