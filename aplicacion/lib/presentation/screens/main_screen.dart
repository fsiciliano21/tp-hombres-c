
import 'package:genshin/presentation/view/home_view.dart';
import 'package:genshin/presentation/view/mapa_interactivo_view.dart';
import 'package:genshin/presentation/view/personajes_view.dart';
import 'package:genshin/presentation/view/equipos_view.dart';
import 'package:genshin/presentation/view/nosotros_view.dart';
import 'package:flutter/material.dart';



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

    final screens = [ const HomeView(), 
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
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.two_wheeler),
            activeIcon: const Icon(Icons.motorcycle),
            label: 'Home',
            backgroundColor: colors.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined),
            activeIcon: const Icon(Icons.person_3),
            label: 'Personajes',
            backgroundColor: colors.tertiary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined),
            activeIcon: const Icon(Icons.person_add_alt_1),
            label: 'Equipos',
            backgroundColor: colors.tertiary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined),
            activeIcon: const Icon(Icons.person_3),
            label: 'Mapa',
            backgroundColor: colors.tertiary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined),
            activeIcon: const Icon(Icons.person_3),
            label: 'Nosotros',
            backgroundColor: colors.tertiary,
          ),
        ],
      ),
    );
  }
}