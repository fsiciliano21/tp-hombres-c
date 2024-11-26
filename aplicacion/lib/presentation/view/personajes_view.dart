import 'package:flutter/material.dart';

class PersonajesView extends StatefulWidget {
  const PersonajesView({super.key});

  @override
  State<PersonajesView> createState() => _PersonajesViewState();
}

class _PersonajesViewState extends State<PersonajesView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
        backgroundColor: Colors.red,
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