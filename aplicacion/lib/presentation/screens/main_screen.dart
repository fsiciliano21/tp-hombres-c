import 'package:flutter/material.dart';
import 'package:genshin/presentation/screens/mapas/liyue.dart';
import 'package:genshin/presentation/screens/mapas/mondstadt.dart';
import 'package:genshin/presentation/view/home_view.dart';
import 'package:genshin/presentation/view/mapa_interactivo_view.dart';
import 'package:genshin/presentation/view/personajes_view.dart';
import 'package:genshin/presentation/view/equipos_view.dart';
import 'package:genshin/presentation/view/nosotros_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final screens = [
      const HomeView(),
      const PersonajesView(),
      const EquiposView(),
      const MapaInteractivoView(),
      const Liyue()
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 2,

        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.two_wheeler),
            activeIcon: const Icon(Icons.motorcycle),
            label: '',
            backgroundColor: colors.secondary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined),
            activeIcon: const Icon(Icons.person_3),
            label: '',
            backgroundColor: colors.secondary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined),
            activeIcon: const Icon(Icons.person_add_alt_1),
            label: '',
            backgroundColor: colors.secondary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined),
            activeIcon: const Icon(Icons.person_3),
            label: '',
            backgroundColor: colors.secondary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined),
            activeIcon: const Icon(Icons.person_3),
            label: '',
            backgroundColor: colors.secondary,
          ),
        ],
      ),
    );
  }
}