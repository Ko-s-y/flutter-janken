import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showRobotResult() {
    List<String> hands = ['グー', 'チョキ', 'パー'];
    hands.shuffle();
    String hand = hands.first;

    String imagePath = '';
    if (hand == 'グー') {
      imagePath = 'assets/gu.png';
    } else if (hand == 'チョキ') {
      imagePath = 'assets/choki.png';
    } else if (hand == 'パー') {
      imagePath = 'assets/pa.png';
    } else {
      imagePath = '';
    }
    Image image = Image.asset(imagePath);

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('ロボットくん'),
            content: image,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('閉じる')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showRobotResult();
          },
          child: const Text('じゃんけん'),
        ),
      ),
    );
  }
}
