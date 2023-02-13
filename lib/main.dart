import 'package:flutter/material.dart';
import 'package:mobile_chatgpt/generated/generated.dart';

void main() {
  runApp(MaterialApp(
    title: 'Mobile ChatGPt',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: SizedBox(child: Assets.images.aboutIcon.svg()),
    );
  }
}
