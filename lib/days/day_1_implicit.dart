import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_spacing.dart';
import '../core/app_sizes.dart';
import '../core/app_durations.dart';

class Day1ImplicitPage extends StatefulWidget {
  const Day1ImplicitPage({super.key});

  @override
  State<Day1ImplicitPage> createState() => _Day1ImplicitPageState();
}

class _Day1ImplicitPageState extends State<Day1ImplicitPage> {
  bool _containerExpanded = false;
  bool _isVisible = true;
  bool _alignRight = false;
  bool _positionMoved = false;
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 1 — Implicit Animations')),
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
                'Implicit Animations\n\nМеняем только конечное состояние виджета. Flutter самостоятельно рассчитывает и проигрывает анимацию перехода. AnimationController не требуется.',
              ),
            ),
            const SizedBox(height: AppSpacing.s24),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AnimatedContainer',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const Text(
                      'Изменяем размер, цвет и скругление. Flutter анимирует переход автоматически.',
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Center(
                      child: AnimatedContainer(
                        duration: AppDurations.medium,
                        width: _containerExpanded ? AppSizes.xl : AppSizes.lg,
                        height: _containerExpanded ? AppSizes.xl : AppSizes.lg,
                        decoration: BoxDecoration(
                          color: _containerExpanded
                              ? AppColors.success
                              : AppColors.primary,
                          borderRadius: BorderRadius.circular(
                            _containerExpanded ? AppSpacing.s32 : AppSpacing.s8,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _containerExpanded = !_containerExpanded;
                          });
                        },
                        child: const Text('Toggle Container'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.s16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AnimatedOpacity',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const Text(
                      'Плавное изменение прозрачности между двумя состояниями.',
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Center(
                      child: AnimatedOpacity(
                        duration: AppDurations.medium,
                        opacity: _isVisible ? 1 : 0.2,
                        child: const FlutterLogo(size: AppSizes.md),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        child: const Text('Toggle Opacity'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.s16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AnimatedAlign',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const Text(
                      'Плавное перемещение виджета между разными Alignment.',
                    ),
                    SizedBox(
                      height: AppSpacing.s40 * 3,
                      child: AnimatedAlign(
                        duration: AppDurations.medium,
                        alignment: _alignRight
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: const CircleAvatar(radius: AppSizes.xs),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _alignRight = !_alignRight;
                          });
                        },
                        child: const Text('Toggle Align'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.s16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AnimatedPositioned',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const Text('Анимация позиции элемента внутри Stack.'),
                    SizedBox(
                      height: AppSpacing.s40 * 3.5,
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: AppDurations.medium,
                            left: _positionMoved ? AppSizes.xl : AppSizes.xs,
                            top: AppSpacing.s40,
                            child: Container(
                              width: AppSizes.sm,
                              height: AppSizes.sm,
                              color: AppColors.warning,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _positionMoved = !_positionMoved;
                          });
                        },
                        child: const Text('Toggle Position'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.s16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AnimatedCrossFade',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const Text(
                      'Плавное переключение между двумя разными виджетами.',
                    ),
                    Center(
                      child: AnimatedCrossFade(
                        duration: AppDurations.medium,
                        firstChild: const FlutterLogo(size: AppSizes.lg),
                        secondChild: const Icon(
                          Icons.favorite,
                          size: AppSizes.lg,
                          color: AppColors.danger,
                        ),
                        crossFadeState: _showFirst
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showFirst = !_showFirst;
                          });
                        },
                        child: const Text('Toggle CrossFade'),
                      ),
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
