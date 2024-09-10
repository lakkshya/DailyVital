import 'package:daily_vital/screens/home/home.dart';
import 'package:daily_vital/screens/profile/profile.dart';
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
        backgroundColor: const Color.fromARGB(255, 0, 87, 228),
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[50],
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: SizedBox(
          height: 50,
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
                            color: _currentIndex == 0 ?const Color.fromARGB(255, 0, 87, 228) : const Color.fromARGB(255, 119, 157, 219),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: _currentIndex == 0 ? const Color.fromARGB(255, 0, 87, 228) : const Color.fromARGB(255, 119, 157, 219),
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
                            color: _currentIndex == 1 ? const Color.fromARGB(255, 0, 87, 228) : const Color.fromARGB(255, 119, 157, 219),
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: _currentIndex == 1 ? const Color.fromARGB(255, 0, 87, 228) : const Color.fromARGB(255, 119, 157, 219),
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
