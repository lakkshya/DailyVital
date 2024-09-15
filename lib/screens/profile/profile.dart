import 'package:flutter/material.dart';
import 'package:daily_vital/services/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  final String name = "John Doe";
  final String age = "30";
  final String contactNumber = "+1234567890";
  final String gender = "Male";
  final String avatarUrl = 'assets/man.png';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage(avatarUrl),
          ),
          const SizedBox(height: 20.0),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Age: $age',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(
            'Contact: $contactNumber',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(
            'Gender: $gender',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 30.0),
          ElevatedButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            label: const Text('logout'),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
