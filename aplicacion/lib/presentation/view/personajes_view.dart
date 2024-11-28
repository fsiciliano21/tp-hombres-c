import 'package:flutter/material.dart';
import 'package:genshin/presentation/screens/add_personajes.dart';

class PersonajesView extends StatefulWidget {
  const PersonajesView({super.key});

  @override
  State<PersonajesView> createState() => _PersonajesViewState();
}

class _PersonajesViewState extends State<PersonajesView> {
  final List<Map<String, String>> personajes = [
    {'nombre': 'Personaje 1', 'edad': '20', 'nacion': 'Mondstadt', 'elemento': 'Ameno'},
    {'nombre': 'Personaje 2', 'edad': '25', 'nacion': 'Liyue', 'elemento': 'Pyro'},
    {'nombre': 'Personaje 3', 'edad': '30', 'nacion': 'Inazuma', 'elemento': 'Electro'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
        backgroundColor: const Color(0xFFEDD9B7),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: personajes.length,
        itemBuilder: (context, index) {
          final personaje = personajes[index];
          return ListTile(
            title: Text(
              personaje['nombre']!,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Edad: ${personaje['edad']}, Nación: ${personaje['nacion']}, Elemento: ${personaje['elemento']}',
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPersonajes()),
          );
          if (result != null && result is Map<String, String>) {
            setState(() {
              personajes.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFFEDD9B7),
      ),
    );
  }
}