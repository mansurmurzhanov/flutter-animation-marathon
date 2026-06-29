import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/app_colors.dart';
import '../core/app_durations.dart';
import '../core/app_spacing.dart';

class Day7LottiePage extends StatefulWidget {
  const Day7LottiePage({super.key});

  @override
  State<Day7LottiePage> createState() => _Day7LottiePageState();
}

class _Day7LottiePageState extends State<Day7LottiePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.progress,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 7 — Lottie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.s16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lottie + AnimationController',
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  const Text(
                    'Lottie позволяет использовать готовые векторные анимации. '
                    'AnimationController управляет воспроизведением, поэтому '
                    'анимацию можно запускать программно повторно.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.s24),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 220,
                  height: 220,
                  child: Lottie.asset(
                    'assets/lottie/Success.json',
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text('Failed to load Lottie animation'),
                      );
                    },
                    controller: _controller,
                    fit: BoxFit.contain,
                    onLoaded: (composition) {
                      _controller.duration = composition.duration;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.s16),
            FilledButton(
              onPressed: () {
                _controller
                  ..reset()
                  ..forward();
              },
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}