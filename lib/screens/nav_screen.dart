import 'package:flutter/material.dart';
import 'package:youtube_u/custom_widgets/custom_text.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  // for knowing which navigationbar we are
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Home",
            activeIcon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
            ),
            label: "Explore",
            activeIcon: Icon(
              Icons.explore,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
            ),
            label: "Add",
            activeIcon: Icon(
              Icons.add_circle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            label: "Subscription",
            activeIcon: Icon(
              Icons.subscriptions,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library_outlined,
            ),
            label: "Library",
            activeIcon: Icon(
              Icons.video_library,
            ),
          ),
        ],
      ),
    );
  }
}
