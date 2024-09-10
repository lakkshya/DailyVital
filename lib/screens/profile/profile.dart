import 'package:flutter/material.dart';
import 'package:daily_vital/services/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
