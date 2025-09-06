import 'package:flutter/material.dart';
import '../models/language.dart';
import '../widgets/language_widgets.dart';

// Pantalla principal con Drawer y navegación
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Índice para controlar la vista seleccionada en el Drawer
  int _selectedDrawerIndex = 0;

  // Lista de lenguajes basada en el modelo
  final List<Language> lenguajes = languagesData;

  // Cambia la vista según la opción seleccionada en el Drawer
  void _onSelectDrawerItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
      Navigator.pop(context);
    });
  }

  // Muestra un mensaje en la parte inferior de la pantalla
  void _showMessage(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lenguajes de Programación'),
        backgroundColor: Colors.blue,
        actions: [
          // Botón de información
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Información',
            onPressed: () => _showMessage('App creada por yeygok'),
          ),
          // Botón de favoritos
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: 'Favoritos',
            onPressed: () => _showMessage('¡Gracias por usar la app!'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Encabezado del Drawer
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Opciones',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            // Opción para ver la lista
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Ver lista'),
              selected: _selectedDrawerIndex == 0,
              onTap: () => _onSelectDrawerItem(0),
            ),
            // Opción para ver CardView
            ListTile(
              leading: const Icon(Icons.view_module),
              title: const Text('Ver CardView'),
              selected: _selectedDrawerIndex == 1,
              onTap: () => _onSelectDrawerItem(1),
            ),
          ],
        ),
      ),
      // Cambia la vista según la opción seleccionada
      body:
          _selectedDrawerIndex == 0 ? _buildListaLenguajes() : _buildCardView(),
    );
  }

  // Construye la lista de lenguajes en formato ListView
  Widget _buildListaLenguajes() => ListView.builder(
        itemCount: lenguajes.length,
        itemBuilder: (context, index) =>
            LanguageListTile(language: lenguajes[index]),
      );

  // Construye la vista tipo CardView con los lenguajes
  Widget _buildCardView() => GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: lenguajes.length,
        itemBuilder: (context, index) =>
            LanguageCard(language: lenguajes[index]),
      );
}
