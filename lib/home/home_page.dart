import 'package:flutter/material.dart';
import '../core/app_spacing.dart';

import '../days/day_1_implicit.dart';
import '../days/day_2_hero.dart';
import '../days/day_3_curves.dart';
import '../days/day_4_controller.dart';
import '../days/day_5_switcher.dart';
import '../days/day_6_custom_paint.dart';
import '../days/day_7_lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'Day 1 — Implicit Animations',
      'Day 2 — Hero Transitions',
      'Day 3 — Tween + Curves',
      'Day 4 — AnimationController',
      'Day 5 — AnimatedSwitcher + AnimatedList',
      'Day 6 — CustomPainter',
      'Day 7 — Lottie',
    ];

    final pages = [
      const Day1ImplicitPage(),
      const Day2HeroPage(),
      const Day3CurvesPage(),
      const Day4ControllerPage(),
      const Day5SwitcherPage(),
      const Day6CustomPaintPage(),
      const Day7LottiePage(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Animation Marathon')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(AppSpacing.s12),
            child: ListTile(
              title: Text(items[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => pages[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
