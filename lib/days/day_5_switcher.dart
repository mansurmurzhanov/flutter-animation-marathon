import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_durations.dart';
import '../core/app_spacing.dart';

class Day5SwitcherPage extends StatefulWidget {
  const Day5SwitcherPage({super.key});

  @override
  State<Day5SwitcherPage> createState() => _Day5SwitcherPageState();
}

class _Day5SwitcherPageState extends State<Day5SwitcherPage> {
  bool _isGrid = false;

  static const _items = [
    'Flutter',
    'Dart',
    'Animations',
    'Widgets',
    'Hero',
    'Curves',
  ];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  late final List<String> _animatedItems;

  int _nextItem = _items.length + 1;

  @override
  void initState() {
    super.initState();

    _animatedItems = List<String>.from(_items);
  }

  void _addItem() {
    final index = _animatedItems.length;
    final item = 'Item $_nextItem';

    setState(() {
      _animatedItems.add(item);
    });

    if (!_isGrid) {
      _listKey.currentState?.insertItem(index, duration: AppDurations.medium);
    }

    _nextItem++;
  }

  void _removeItem(int index) {
    final removedItem = _animatedItems.removeAt(index);

    _listKey.currentState?.removeItem(
      index,
      (context, animation) =>
          _buildAnimatedListItem(removedItem, animation, index),
      duration: AppDurations.medium,
    );
  }

  Widget _buildAnimatedListItem(
    String item,
    Animation<double> animation,
    int index,
  ) {
    final offsetAnimation = Tween<Offset>(
      begin: const Offset(-0.25, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

    return SlideTransition(
      position: offsetAnimation,
      child: FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: Card(
            margin: const EdgeInsets.only(bottom: AppSpacing.s12),
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(item),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => _removeItem(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedList() {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _animatedItems.length,
      itemBuilder: (context, index, animation) {
        return _buildAnimatedListItem(_animatedItems[index], animation, index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 5 — AnimatedSwitcher')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.s12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AnimatedSwitcher'),
                  SizedBox(height: AppSpacing.s8),
                  Text(
                    'Автоматически анимирует замену '
                    'одного виджета другим. '
                    'Переключите режим отображения, чтобы увидеть '
                    'кастомную анимацию между ListView и GridView.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.s24),

            Row(
              children: [
                _isGrid
                    ? OutlinedButton(
                        onPressed: () {
                          setState(() => _isGrid = false);
                        },
                        child: const Text('List'),
                      )
                    : FilledButton(
                        onPressed: () {
                          setState(() => _isGrid = false);
                        },
                        child: const Text('List'),
                      ),

                const SizedBox(width: AppSpacing.s12),

                _isGrid
                    ? FilledButton(
                        onPressed: () {
                          setState(() => _isGrid = true);
                        },
                        child: const Text('Grid'),
                      )
                    : OutlinedButton(
                        onPressed: () {
                          setState(() => _isGrid = true);
                        },
                        child: const Text('Grid'),
                      ),

                const Spacer(),

                FilledButton.icon(
                  onPressed: _addItem,
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.s24),

            Expanded(
              flex: 2,
              child: AnimatedSwitcher(
                duration: AppDurations.medium,
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween<double>(
                        begin: .92,
                        end: 1,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                layoutBuilder: (currentChild, previousChildren) {
                  return Stack(
                    children: [
                      ...previousChildren,
                      ...[currentChild].whereType<Widget>(),
                    ],
                  );
                },
                child: _isGrid ? _buildGridView() : _buildAnimatedList(),
              ),
            ),
            const SizedBox(height: AppSpacing.s24),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      key: const ValueKey('grid'),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.s12,
        crossAxisSpacing: AppSpacing.s12,
      ),
      itemCount: _animatedItems.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<double>(
          key: ValueKey(_animatedItems[index]),
          tween: Tween(begin: 0.0, end: 1.0),
          duration: AppDurations.medium,
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Transform.scale(
              scale: 0.9 + (0.1 * value),
              child: Opacity(
                opacity: value,
                child: child,
              ),
            );
          },
          child: Card(
            child: Stack(
              children: [
                Center(
                  child: Text(
                    _animatedItems[index],
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      setState(() {
                        _animatedItems.removeAt(index);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
