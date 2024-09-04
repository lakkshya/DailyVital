import 'package:daily_vital/models/appuser.dart';
import 'package:daily_vital/screens/authenticate/authenticate.dart';
import 'package:daily_vital/screens/authenticate/details.dart';
import 'package:daily_vital/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AppUser?>(context);

    //either return Authenticate or Home
    if(user == null) {
      return const Authenticate();
    } 
    else {
      return const Details();
    }
  }
}