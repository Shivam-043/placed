
import 'package:flutter/material.dart';
import 'package:placed/utils/widgets/spacing/spacing.dart';

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
      body: Column(
        children: <Widget>[
          20.verticalSpace,
          Icon()
        ],
      )
    );
  }
}
