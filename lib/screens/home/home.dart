import 'package:daily_vital/models/appuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userName = '';
  String dayTime = 'Day';
  String todayDate = '';

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
    if (hour < 12) {
      dayTime = 'morning';
    } else if (hour < 17) {
      dayTime = 'afternoon';
    } else {
      dayTime = 'evening';
    }
  }

  void setTodayDate() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, MMMM d');
    setState(() {
      todayDate = formatter.format(now);
    });
  }

  @override
  void initState() {
    super.initState();
    setDayTimeGreeting();
    setTodayDate();
    final user = Provider.of<AppUser>(context, listen: false);
    fetchUserName(user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todayDate,
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xFF003B36),
            ),
          ),
          Text(
            'Good $dayTime, $userName',
            style: const TextStyle(
              fontSize: 24.0,
              color: Color(0xFF003B36),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage('assets/intro.png'),
                fit: BoxFit.cover,
                // colorFilter: ColorFilter.mode(
                //   Colors.blue.withOpacity(0.3),
                //   BlendMode.srcOver,
                // ),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Scan your prescription to set reminders for your medications. This ensures you never miss a dose.',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My schedule',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 120.0,
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF008F77),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(children: [
                        const Text(
                          '11:00',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '2 pills',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[200],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(
                            Icons.done_rounded,
                            color: Colors.grey[700],
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 120.0,
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF008F77),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(children: [
                        const Text(
                          '11:00',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '2 pills',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[200],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(
                            Icons.done_rounded,
                            color: Colors.grey[700],
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 120.0,
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF008F77),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(children: [
                        const Text(
                          '11:00',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '2 pills',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[200],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(
                            Icons.done_rounded,
                            color: Colors.grey[700],
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 120.0,
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF008F77),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(children: [
                        const Text(
                          '11:00',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '2 pills',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[200],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Icon(
                            Icons.done_rounded,
                            color: Colors.grey[700],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF003B36))
                  ),
                  onPressed: () {},
                  child: const Text(
                    'See full',
                    style: TextStyle(
                      color: Color(0xFF003B36),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
