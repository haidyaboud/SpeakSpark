import 'package:flutter/material.dart';

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Common Phrases'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            title: Text('こんにちは (Konnichiwa)'),
            subtitle: Text('Hello / Good afternoon'),
          ),
          ListTile(
            title: Text('ありがとう (Arigatou)'),
            subtitle: Text('Thank you'),
          ),
          ListTile(
            title: Text('すみません (Sumimasen)'),
            subtitle: Text('Excuse me / Sorry'),
          ),
          ListTile(
            title: Text('おはようございます (Ohayou gozaimasu)'),
            subtitle: Text('Good morning'),
          ),
          ListTile(
            title: Text('さようなら (Sayounara)'),
            subtitle: Text('Goodbye'),
          ),
        ],
      ),
    );
  }
}