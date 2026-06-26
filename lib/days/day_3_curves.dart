import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_durations.dart';
import '../core/app_spacing.dart';
import '../core/app_sizes.dart';

class Day3CurvesPage extends StatefulWidget {
  const Day3CurvesPage({super.key});

  @override
  State<Day3CurvesPage> createState() => _Day3CurvesPageState();
}

class _Day3CurvesPageState extends State<Day3CurvesPage> {
  int _animationKey = 0;

  void _replayAnimation() {
    setState(() {
      _animationKey++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 3 — Tween + Curves')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.s12),
              ),
              child: const Text(
                'TweenAnimationBuilder\n\n'
                'Позволяет анимировать значения без AnimationController. Curves меняют характер движения и сильно влияют на восприятие интерфейса.',
              ),
            ),
            const SizedBox(height: AppSpacing.s24),
            Center(
              child: ElevatedButton(
                onPressed: _replayAnimation,
                child: const Text('Replay Animation'),
              ),
            ),
            const SizedBox(height: AppSpacing.s16),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GridView.count(
                      crossAxisCount: 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: AppSpacing.s16,
                      childAspectRatio: 2.6,
                      children: [
                        _CurveCard(
                          key: ValueKey('linear_$_animationKey'),
                          title: 'Linear',
                          description: 'Равномерное движение.',
                          curve: Curves.linear,
                          color: AppColors.primary,
                        ),
                        _CurveCard(
                          key: ValueKey('easein_$_animationKey'),
                          title: 'EaseIn',
                          description:
                              'Медленный старт и постепенное ускорение.',
                          curve: Curves.easeIn,
                          color: AppColors.success,
                        ),
                        _CurveCard(
                          key: ValueKey('elastic_$_animationKey'),
                          title: 'ElasticOut',
                          description: 'Пружинящий эффект с перелётом цели.',
                          curve: Curves.elasticOut,
                          color: AppColors.warning,
                        ),
                        _CurveCard(
                          key: ValueKey('bounce_$_animationKey'),
                          title: 'BounceOut',
                          description: 'Эффект отскока при завершении.',
                          curve: Curves.bounceOut,
                          color: AppColors.danger,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurveCard extends StatelessWidget {
  const _CurveCard({
    super.key,
    required this.title,
    required this.description,
    required this.curve,
    required this.color,
  });

  final String title;
  final String description;
  final Curve curve;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.cardHeight,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: AppSpacing.s4),
              Text(description),
              const Spacer(),
              SizedBox(
                height: AppSizes.iconContainerHeight,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxDistance =
                        constraints.maxWidth - AppSizes.heartTravelPadding;

                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: maxDistance),
                      duration: AppDurations.slow,
                      curve: curve,
                      builder: (context, value, child) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Transform.translate(
                            offset: Offset(value, 0),
                            child: child,
                          ),
                        );
                      },
                      child: Icon(
                        Icons.favorite,
                        size: AppSizes.heartSize,
                        color: color,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
