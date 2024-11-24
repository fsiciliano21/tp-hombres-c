import 'package:flutter/material.dart';

class MapaInteractivoView extends StatefulWidget {
  const MapaInteractivoView({super.key});

  @override
  State<MapaInteractivoView> createState() => _MapaInteractivoViewState();
}

class _MapaInteractivoViewState extends State<MapaInteractivoView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Mapas $count'),
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