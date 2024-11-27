import 'package:flutter/material.dart';

class Inazuma extends StatefulWidget {
  const Inazuma({super.key});

  @override
  State<Inazuma> createState() => _InazumaState();
}

class _InazumaState extends State<Inazuma> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inazuma'),
        backgroundColor: const Color(0xFFEDD9B7),
      ),

    );
  }
}