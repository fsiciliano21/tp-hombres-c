import 'package:flutter/material.dart';

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
            SizedBox(
              height: 90,
              width: 400,
              child: Image.asset(
                'assets/images/mapas/mondstadt.jpeg',
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(
              height: 90,
              width: 400,
              child: Image(image: 
                AssetImage('assets/images/mapas/liyue.jpg'),
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(
              height: 90,
              width: 400,
              child: Image.asset(
                'assets/images/mapas/inazuma.jpg',
                fit: BoxFit.cover,
              ),
            ),
            
            SizedBox(
              height: 90,
              width: 400,
              child: Image.asset(
                'assets/images/mapas/sumeru.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            
            SizedBox(
              height: 90,
              width: 400,
              child: Image.asset(
                'assets/images/mapas/fonteine.jpg',
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(
              height: 90,
              width: 400,
              child: Image.asset(
                'assets/images/mapas/natlan.png',
                fit: BoxFit.cover,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}