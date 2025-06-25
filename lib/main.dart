import 'package:croco/providers/news_provider.dart';
import 'package:croco/screens/News.dart';
import 'package:croco/screens/early.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider (create: (_) => NewsProvider()),
      ],
      child: const News(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const News(), 
    );
  }
}