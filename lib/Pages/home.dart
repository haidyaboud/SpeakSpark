import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.scaffoldBackgroundColor,
            theme.brightness == Brightness.light
                ? const Color(0xFFE6E6FA)
                : const Color(0xFF1A252F),
          ],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMainCard(
                      context,
                      title: 'What do you want to learn today?',
                      buttonText: 'Get Started',
                      imagePath: 'assets/images/illustrationmain.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/phrases');
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildMainCard(
                      context,
                      title: 'Explore Japanese culture today!',
                      buttonText: 'Start Exploring',
                      imagePath: 'assets/images/illustrationcard.png',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            _buildCategoryCard(
              context,
              title: 'Family Members',
              image: 'assets/images/family.png',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _buildCategoryCard(
              context,
              title: 'Colors',
              image: 'assets/images/color-wheel.png',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _buildCategoryCard(
              context,
              title: 'Numbers',
              image: 'assets/images/numbers.png',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _buildCategoryCard(
              context,
              title: 'Phrases',
              image: 'assets/images/audiobook.png',
              onTap: () {
                Navigator.pushNamed(context, '/phrases');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCard(BuildContext context,
      {required String title,
        required String buttonText,
        required String imagePath,
        required VoidCallback onTap}) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SizedBox(
      width: 320,
      height: 220,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: Text(
                          buttonText,
                          style: TextStyle(color: theme.colorScheme.onPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Image.asset(
                  imagePath,
                  height: 150,
                  width: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 150,
                      width: 100,
                      color: theme.colorScheme.primary.withOpacity(0.3),
                      child: Icon(Icons.broken_image,
                          size: 50, color: theme.iconTheme.color),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context,
      {required String title, required String image, required VoidCallback onTap}) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.cardColor,
          ),
          child: Row(
            children: [
              Image.asset(image, height: 60, width: 60),
              const SizedBox(width: 16),
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}