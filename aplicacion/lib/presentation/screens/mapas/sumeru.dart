import 'package:flutter/material.dart';

class Sumeru extends StatefulWidget {
  const Sumeru({super.key});

  @override
  State<Sumeru> createState() => _SumeruState();
}

class _SumeruState extends State<Sumeru> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sumeru'),
        backgroundColor: Colors.red,
      ),

    );
  }
}