import 'package:flutter/material.dart';
import 'package:youtube_u/custom_widgets/custom_text.dart';
import 'package:youtube_u/screens/home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  // for knowing which navigationbar we are
  int _selectedIndex = 0;
  final _screens = [
    HomeScreen(),
    const Scaffold(
      body: Center(
        child: CrText(text: 'Explore'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: CrText(text: 'Add'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: CrText(text: 'Subscription'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: CrText(text: 'Library'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map(
              (i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _selectedIndex != i,
                  child: screen,
                ),
              ),
            )
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
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
