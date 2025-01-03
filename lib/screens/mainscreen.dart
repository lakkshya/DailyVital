import 'package:daily_vital/screens/home/home.dart';
import 'package:daily_vital/screens/profile/profile.dart';
import 'package:daily_vital/screens/scan/scanner.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  final int index;
  const MainScreen({super.key, required this.index});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  final List<Widget> _screens = [
    const Home(),
    const Profile() 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF003B36),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Scanner()),
            );
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xfff0ead2),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _onItemTapped(0);
                      },
                      minWidth: 40.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: _currentIndex == 0 ?const Color(0xFF003B36) : const Color.fromARGB(255, 141, 161, 159),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: _currentIndex == 0 ? const Color(0xFF003B36) : const Color.fromARGB(255, 141, 161, 159),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _onItemTapped(1);
                      },
                      minWidth: 40.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: _currentIndex == 1 ? const Color(0xFF003B36) : const Color.fromARGB(255, 141, 161, 159),
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: _currentIndex == 1 ? const Color(0xFF003B36) : const Color.fromARGB(255, 141, 161, 159),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
