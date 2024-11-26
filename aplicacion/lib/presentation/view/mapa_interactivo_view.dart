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
        backgroundColor: Colors.red,     
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 90,
              width: 400,
              child: Placeholder(),
              ),
            SizedBox(
              height: 90,
              width: 400,
              child: Placeholder(),
              ),
            SizedBox(
              height: 90,
              width: 400,
              child: Placeholder(),
              ),
            
            SizedBox(
              height: 90,
              width: 400,
              child: Placeholder(),
              ),
            
            SizedBox(
              height: 90,
              width: 400,
              child: Placeholder(),
              ),
            
            SizedBox(
              height: 90,
              width: 400,
              child: Placeholder(),
              ),
            
            
          ],
        ),
      ),
    );
  }
}