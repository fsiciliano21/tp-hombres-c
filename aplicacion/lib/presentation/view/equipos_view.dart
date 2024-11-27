import 'package:flutter/material.dart';

class EquiposView extends StatefulWidget {
  const EquiposView({super.key});

  @override
  State<EquiposView> createState() => _EquiposViewState();
}

class _EquiposViewState extends State<EquiposView> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipos'),
        backgroundColor: const Color(0xFFEDD9B7),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),

    );
  }
}