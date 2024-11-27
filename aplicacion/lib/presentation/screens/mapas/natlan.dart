import 'package:flutter/material.dart';

class Natlan extends StatefulWidget {
  const Natlan({super.key});

  @override
  State<Natlan> createState() => _NatlanState();
}

class _NatlanState extends State<Natlan> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Natlan'),
        backgroundColor: Colors.red,
      ),

    );
  }
}