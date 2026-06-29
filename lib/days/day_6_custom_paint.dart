import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_spacing.dart';
import '../core/app_durations.dart';
import '../core/app_sizes.dart';

class Day6CustomPaintPage extends StatefulWidget {
  const Day6CustomPaintPage({super.key});

  @override
  State<Day6CustomPaintPage> createState() => _Day6CustomPaintPageState();
}

class _Day6CustomPaintPageState extends State<Day6CustomPaintPage>
    with SingleTickerProviderStateMixin {
  static const double _ringSize = AppSizes.cardHeight + AppSpacing.s24;
  static const double _strokeWidth = AppSpacing.s12 + 2;

  late final AnimationController _controller;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.progress,
    );

    _progress = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 6 – Custom Paint')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.s12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CustomPaint + AnimationController'),
                  SizedBox(height: AppSpacing.s8),
                  Text(
                    'CustomPainter рисует кольцо прогресса через Canvas, а AnimationController плавно изменяет его заполнение. Такой подход пригодится для создания графиков и других сложных пользовательских элементов.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.s24),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: _ringSize,
                  height: _ringSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _progress,
                        builder: (context, child) {
                          return CustomPaint(
                            size: Size.square(_ringSize),
                            painter: ProgressRingPainter(
                              progress: _progress.value,
                            ),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _progress,
                        builder: (context, child) {
                          return AnimatedDefaultTextStyle(
                            duration: AppDurations.fast,
                            style: (Theme.of(context).textTheme.headlineMedium ?? const TextStyle()).copyWith(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                  fontSize: 34 + (_progress.value * 8),
                                ),
                            child: Text('${(_progress.value * 100).toInt()}%'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FilledButton(
              onPressed: () {
                _controller.forward(from: 0);
              },
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressRingPainter extends CustomPainter {
  const ProgressRingPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - _Day6CustomPaintPageState._strokeWidth) / 2;

    final gradient = SweepGradient(
      startAngle: -math.pi * 0.65,
      endAngle: math.pi * 1.35,
      colors: const [
        AppColors.secondary,
        AppColors.solana,
        AppColors.ethereum,
        AppColors.secondary,
      ],
    );

    final backgroundPaint = Paint()
      ..color = AppColors.surface.withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = _Day6CustomPaintPageState._strokeWidth;

    final progressPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = _Day6CustomPaintPageState._strokeWidth
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawCircle(center, radius, backgroundPaint);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2 * progress,
      false,
      Paint()
        ..color = AppColors.secondary.withValues(alpha: 0.28)
        ..style = PaintingStyle.stroke
        ..strokeWidth = _Day6CustomPaintPageState._strokeWidth + 8
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2 * progress,
      false,
      progressPaint,
    );
    
  }

  @override
  bool shouldRepaint(covariant ProgressRingPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
