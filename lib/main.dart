import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(const AnimationMarathonApp());
}

class AnimationMarathonApp extends StatelessWidget {
  const AnimationMarathonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Marathon',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}