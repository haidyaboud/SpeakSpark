import 'package:flutter/material.dart';

class Welcome1 extends StatefulWidget {
  const Welcome1({super.key});

  @override
  State<Welcome1> createState() => _Welcome1State();
}

class _Welcome1State extends State<Welcome1> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      buildPage(
                        context,
                        "assets/images/illustration.png",
                        "Free Japanese Courses",
                        "Explore Now",
                        "Free courses for you to find",
                        "your way to learning",
                      ),
                      buildPage(
                        context,
                        "assets/images/illustration2.png",
                        "Quick & Easy Learning",
                        "Learning",
                        "Continue your learning",
                        "with us today",
                      ),
                      buildPage(
                        context,
                        "assets/images/illustration5-.png",
                        "Custom Study Plan",
                        "Plan Your Way",
                        "Start Learning Japanese",
                        "our platform",
                      ),
                      buildPage(
                        context,
                        "assets/images/illustration3-.png",
                        "Learn Japanese",
                        "Now",
                        "Join our platform and dive",
                        "into Japanese today!",
                        showButtons: true,
                      ),
                    ],
                  ),
                  if (_currentPage != 3)
                    Positioned(
                      top: 10,
                      right: 20,
                      child: TextButton(
                        onPressed: () {
                          _pageController.jumpToPage(3);
                        },
                        child: Text(
                          "Skip",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) => buildDot(index)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );

  }

  Widget buildPage(
      BuildContext context,
      String image,
      String title1,
      String title2,
      String subtitle1,
      String subtitle2, {
        bool showButtons = false,
      }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Image.asset(image),
        ),
        const SizedBox(height: 20),
        Text(
          title1,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          title2,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        Text(
          subtitle1,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          subtitle2,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        if (showButtons) ...[
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Sign up'),
              ),
              const SizedBox(width: 20),
              OutlinedButton(
                onPressed: () {

                },
                child: const Text('Log in'),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: _currentPage == index ? 20 : 5,
      height: 5,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Theme.of(context).colorScheme.primary
            : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}