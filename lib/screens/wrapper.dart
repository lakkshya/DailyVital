import 'package:daily_vital/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //either return Authenticate or Home
    return const Authenticate();
  }
}