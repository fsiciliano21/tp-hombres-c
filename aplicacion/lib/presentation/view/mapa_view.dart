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
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mondstadt()),
                );
              },
              child: SizedBox(
                height: 90,
                width: 400,
                child: Image.asset(
                  'assets/images/mapas/mondstadt.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Liyue()),
                );
              },
              child: SizedBox(
                height: 90,
                width: 400,
                child: Image.asset(
                  'assets/images/mapas/liyue.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inazuma()),
                );
              },
              child: SizedBox(
                height: 90,
                width: 400,
                child: Image.asset(
                  'assets/images/mapas/inazuma.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sumeru()),
                );
              },
              child: SizedBox(
                height: 90,
                width: 400,
                child: Image.asset(
                  'assets/images/mapas/sumeru.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fontaine()),
                );
              },
              child: SizedBox(
                height: 90,
                width: 400,
                child: Image.asset(
                  'assets/images/mapas/fonteine.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Natlan()),
                );
              },
              child: SizedBox(
                height: 90,
                width: 400,
                child: Image.asset(
                  'assets/images/mapas/natlan.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}