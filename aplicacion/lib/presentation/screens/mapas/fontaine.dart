import 'package:flutter/material.dart';

class Fontaine extends StatefulWidget {
  const Fontaine({super.key});

  @override
  State<Fontaine> createState() => _FontaineState();
}

class _FontaineState extends State<Fontaine> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fontaine'),
        backgroundColor: const Color(0xFFEDD9B7),
      ),

    );
  }
}