import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_sizes.dart';
import '../core/app_spacing.dart';

String coinSymbol(String id) {
  switch (id) {
    case 'btc':
      return 'BTC';
    case 'eth':
      return 'ETH';
    default:
      return 'SOL';
  }
}

class Day2HeroPage extends StatelessWidget {
  const Day2HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final coins = [
      const Coin(
        id: 'btc',
        name: 'Bitcoin',
        price: '\$104,000',
        description: 'First cryptocurrency and the largest by market capitalization.',
        color: AppColors.bitcoin,
      ),
      const Coin(
        id: 'eth',
        name: 'Ethereum',
        price: '\$3,500',
        description: 'Smart-contract platform powering thousands of applications.',
        color: AppColors.ethereum,
      ),
      const Coin(
        id: 'sol',
        name: 'Solana',
        price: '\$180',
        description: 'High-performance blockchain focused on speed and scalability.',
        color: AppColors.solana,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 2 — Hero Transitions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.s12),
              ),
              child: const Text(
                'Hero Transitions\n\nHero связывает один и тот же элемент между двумя экранами. Flutter автоматически анимирует переход между ними.',
              ),
            ),
            const SizedBox(height: AppSpacing.s16),
            Expanded(
              child: ListView.separated(
                itemCount: coins.length,
                separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.s12),
                itemBuilder: (context, index) {
                  final coin = coins[index];

                  return Card(
                    child: ListTile(
                      leading: Hero(
                        tag: coin.id,
                        flightShuttleBuilder: (
                          flightContext,
                          animation,
                          flightDirection,
                          fromHeroContext,
                          toHeroContext,
                        ) {
                          return FadeTransition(
                            opacity: animation,
                            child: toHeroContext.widget,
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: coin.color,
                          child: Text(coinSymbol(coin.id)),
                        ),
                      ),
                      title: Text(coin.name),
                      subtitle: Text(coin.price),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CoinDetailPage(coin: coin),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Coin {
  final String id;
  final String name;
  final String price;
  final String description;
  final Color color;

  const Coin({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.color,
  });
}

class CoinDetailPage extends StatelessWidget {
  final Coin coin;

  const CoinDetailPage({
    super.key,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coin.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSpacing.s24),
            Hero(
              tag: coin.id,
              child: CircleAvatar(
                radius: AppSizes.xl / 2,
                backgroundColor: coin.color,
                child: Text(
                  coinSymbol(coin.id),
                  style: const TextStyle(fontSize: AppSizes.sm),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.s24),
            Text(
              coin.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.s8),
            Text(
              coin.price,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.s24),
            Center(
              child: Text(
                coin.description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}