import 'package:flutter/material.dart';
import 'package:youtube_u/custom_widgets/custom_text.dart';

import 'screens/nav_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: NavScreen(),
    );
  }
}
