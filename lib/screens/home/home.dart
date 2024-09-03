import 'package:daily_vital/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: Container(
        padding: const EdgeInsets.fromLTRB(30.0, 150.0, 30.0, 0.0),
        child: Center(
          child: ElevatedButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            label: const Text('logout'),
            icon: const Icon(Icons.logout),
          ),
        ),
      ),
    );
  }
}