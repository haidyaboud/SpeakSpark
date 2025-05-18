import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobileproject/Pages/MyThemes.dart';
import 'package:mobileproject/Pages/course_screen.dart';
import 'package:mobileproject/Pages/message_screen.dart';
import 'package:mobileproject/Pages/account_screen.dart';
import 'package:mobileproject/Pages/phrases_screen.dart';
import 'package:mobileproject/Pages/home.dart';
import 'package:mobileproject/Pages/themeprovider.dart';
import 'package:mobileproject/Pages/welcome1.dart';
import 'package:mobileproject/Pages/verifyphone.dart';
import 'Pages/login.dart';
import 'Pages/phonescreen.dart';
import 'Pages/signup.dart';
import 'Pages/success.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Japanese Learning App',
      debugShowCheckedModeBanner: false,  // <-- Remove debug banner
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: const Welcome1(), // <-- Set Welcome1 as the initial screen
      routes: {
        '/home': (context) => const JapaneseLearningScreen(),
        '/phrases': (context) => const PhrasesScreen(),
        '/verifyphone': (context) => const VerifyPhoneScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/phonescreen': (context) => const PhoneInputScreen(),
        '/success': (context) => SuccessScreen(),
      },
    );
  }
}

class JapaneseLearningScreen extends StatefulWidget {
  const JapaneseLearningScreen({super.key});

  @override
  _JapaneseLearningScreenState createState() => _JapaneseLearningScreenState();
}

class _JapaneseLearningScreenState extends State<JapaneseLearningScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    CourseScreen(),
    MessageScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: theme.primaryColor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi, Zuzy',
              style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              "Let's start learning",
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: theme.iconTheme.color,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: theme.colorScheme.onPrimary,
              backgroundImage: const AssetImage('assets/images/Haidyy.jpg'),
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Course'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.primaryColor.withOpacity(0.5),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}