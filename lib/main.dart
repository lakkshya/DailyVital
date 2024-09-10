import 'package:daily_vital/models/appuser.dart';
import 'package:daily_vital/screens/wrapper.dart';
import 'package:daily_vital/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daily_vital/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: appTheme,
        home: const Wrapper(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const Wrapper(),
        //   '/home': (context) => Home(),
        //   '/profile': (context) => const Profile(),
        // },
      ),
    );
  }
}