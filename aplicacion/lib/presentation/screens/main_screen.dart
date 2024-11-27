import 'package:flutter/material.dart';
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
      const NosotrosView()
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
            icon: ImageIcon(
              AssetImage('assets/images/mapas/home.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/mapas/home.png'),
            ),
            label: '',
            backgroundColor: colors.secondary,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/mapas/personajes.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/mapas/personajes.png'),
            ),
            label: '',
            backgroundColor: colors.secondary,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/mapas/equipos.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/mapas/equipos.png'),
            ),
            label: '',
            backgroundColor: colors.secondary,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/mapas/mapa.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/mapas/mapa.png'),
            ),
            label: '',
            backgroundColor: colors.secondary,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/mapas/nosotros.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/mapas/nosotros.png'),
            ),
            label: '',
            backgroundColor: colors.secondary,
          ),
        ],
      ),
    );
  }
}