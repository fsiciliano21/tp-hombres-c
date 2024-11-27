import 'package:flutter/material.dart';
import 'package:genshin/presentation/screens/mapas/mondstadt.dart';
import 'package:genshin/presentation/screens/mapas/liyue.dart';
import 'package:genshin/presentation/screens/mapas/inazuma.dart';
import 'package:genshin/presentation/screens/mapas/sumeru.dart';
import 'package:genshin/presentation/screens/mapas/fontaine.dart';
import 'package:genshin/presentation/screens/mapas/natlan.dart';

class MapaInteractivoView extends StatefulWidget {
  const MapaInteractivoView({super.key});

  @override
  State<MapaInteractivoView> createState() => _MapaInteractivoViewState();
}

class _MapaInteractivoViewState extends State<MapaInteractivoView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa Interactivo'),
        backgroundColor: const Color(0xFFEDD9B7),   
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Una columna
          childAspectRatio: 16 / 9, // Relación de aspecto para rectángulos
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          final List<Map<String, dynamic>> mapas = [
            {'image': 'assets/images/mapas/mondstadt.jpeg', 'screen': Mondstadt()},
            {'image': 'assets/images/mapas/liyue.jpg', 'screen': Liyue()},
            {'image': 'assets/images/mapas/inazuma.jpg', 'screen': Inazuma()},
            {'image': 'assets/images/mapas/sumeru.jpeg', 'screen': Sumeru()},
            {'image': 'assets/images/mapas/fonteine.jpg', 'screen': Fontaine()},
            {'image': 'assets/images/mapas/natlan.png', 'screen': Natlan()},
          ];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mapas[index]['screen']),
              );
            },
            child: Image.asset(
              mapas[index]['image'],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}