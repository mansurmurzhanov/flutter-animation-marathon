import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_durations.dart';
import '../core/app_sizes.dart';
import '../core/app_spacing.dart';

class Day4ControllerPage extends StatefulWidget {
  const Day4ControllerPage({super.key});

  @override
  State<Day4ControllerPage> createState() => _Day4ControllerPageState();
}

class _Day4ControllerPageState extends State<Day4ControllerPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  bool _isRunning = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: AppDurations.slow);

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _pauseAnimation() {
    _controller.stop();

    setState(() {
      _isRunning = false;
    });
  }

  void _resumeAnimation() {
    _controller.repeat(reverse: true);

    setState(() {
      _isRunning = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 4 — AnimationController')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSpacing.s8),
                  Text(
                    'AnimationController\n\n'
                    'Даёт полный контроль '
                    'над анимацией. '
                    'Вы сами управляете запуском, '
                    'остановкой и повторением.',
                  ),
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.s24),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'AnimationController',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s12),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Пульсирующее сердце создаётся\n'
                        'с помощью AnimationController.',
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s24),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: child,
                        );
                      },
                      child: const Icon(
                        Icons.favorite,
                        color: AppColors.danger,
                        size: AppSizes.heartDemoSize,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s24),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Text(
                          'Scale: ${_scaleAnimation.value.toStringAsFixed(2)}x',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Text(
                      'Status: ${_isRunning ? 'Running' : 'Paused'}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledButton(
                          onPressed: _isRunning ? _pauseAnimation : null,
                          child: const Text('Pause'),
                        ),
                        const SizedBox(width: AppSpacing.s12),
                        FilledButton(
                          onPressed: !_isRunning ? _resumeAnimation : null,
                          child: const Text('Resume'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
