import 'package:flutter/material.dart';

class NosotrosView extends StatefulWidget {
  const NosotrosView({super.key});

  @override
  State<NosotrosView> createState() => _NosotrosViewState();
}

class _NosotrosViewState extends State<NosotrosView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nosotros $count'),
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