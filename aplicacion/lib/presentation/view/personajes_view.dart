import 'package:flutter/material.dart';
import 'package:genshin/models/personaje.dart';
import 'package:genshin/presentation/screens/add_personajes.dart';
import 'package:genshin/services/api_service.dart';
import 'package:genshin/login.dart';
import 'package:genshin/presentation/widgets/personaje_list_tile.dart';

class PersonajesView extends StatefulWidget {
  const PersonajesView({super.key});

  @override
  State<PersonajesView> createState() => _PersonajesViewState();
}

class _PersonajesViewState extends State<PersonajesView> {
  late Future<List<Personaje>> futurePersonajes;
  final ApiService apiService = ApiService();
  late String token;

  @override
  void initState() {
    super.initState();
    futurePersonajes = Future.value([]); // Inicializa con un valor predeterminado
    _authenticateAndFetchData();
  }

  Future<void> _authenticateAndFetchData() async {
    try {
      token = await login('test', 'test');
      setState(() {
        futurePersonajes = apiService.fetchPersonajes(token);
      });
    } catch (e) {
      setState(() {
        futurePersonajes = Future.error('Error: $e');
      });
    }
  }

  void _showOptions(BuildContext context, int index, List<Personaje> personajes) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Modificar'),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPersonajes(
                      personaje: personajes[index].toMap(),
                    ),
                  ),
                );
                if (result != null && result is Map<String, String>) {
                  setState(() {
                    personajes[index] = Personaje.fromJson(result);
                  });
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Eliminar'),
              onTap: () {
                setState(() {
                  personajes.removeAt(index);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

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
      body: FutureBuilder<List<Personaje>>(
        future: futurePersonajes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay personajes disponibles'));
          } else {
            final personajes = snapshot.data!;
            return ListView.builder(
              itemCount: personajes.length,
              itemBuilder: (context, index) {
                final personaje = personajes[index];
                return PersonajeListTile(
                  personaje: personaje,
                  onLongPress: () => _showOptions(context, index, personajes),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPersonajes()),
          );
          if (result != null && result is String) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(result)),
            );
            setState(() {
              futurePersonajes = apiService.fetchPersonajes(token);
            });
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFFEDD9B7),
      ),
    );
  }
}