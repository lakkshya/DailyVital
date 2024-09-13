import 'package:daily_vital/models/appuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String userName = '';
  String dayTime = 'Day';

  Future<void> fetchUserName(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        setState(() {
          userName = userDoc['name'].split(' ')[0];
        });
      }
    } catch (e) {
      print('Error fetching user name: $e');
    }
  }

  void setDayTimeGreeting() {
    final hour = DateTime.now().hour;
    if(hour < 12) {
      dayTime = 'morning';
    }
    else if(hour < 17) {
      dayTime = 'afternoon';
    }
    else {
      dayTime = 'evening';
    }
  }

  @override
  void initState() {
    super.initState();
    setDayTimeGreeting();
    final user = Provider.of<AppUser>(context, listen: false);
    fetchUserName(user.uid);
    }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 0.0),
      child: Column(
        children: [
          Text(
            'Good $dayTime, $userName',
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}