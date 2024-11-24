import 'package:flutter/material.dart';

class PersonajesView extends StatefulWidget {
  const PersonajesView({super.key});

  @override
  State<PersonajesView> createState() => _PersonajesViewState();
}

class _PersonajesViewState extends State<PersonajesView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Personajes: $count'),
          FilledButton.tonal(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}