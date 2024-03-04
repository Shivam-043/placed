
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = '/';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlaceIt'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
