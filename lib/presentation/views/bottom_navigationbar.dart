import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'subscription_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const SubscriptionScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF1F1F1F),
    ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.home), label: 'Home'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.bookmark), label: 'Subscribe'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.search), label: 'Search'),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.user), label: 'Profile'),
          ],
          selectedItemColor: const Color(0xFFBB86FC),
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}