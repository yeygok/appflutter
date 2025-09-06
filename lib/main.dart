import 'package:flutter/material.dart';

void main() {
  runApp(const LenguajesApp());
}

class LenguajesApp extends StatelessWidget {
  const LenguajesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LenguajesApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedDrawerIndex = 0;

  final List<Map<String, String>> lenguajes = [
    {
      'nombre': 'Dart',
      'descripcion': 'Lenguaje de Flutter',
      'imagen':
          'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png'
    },
    {
      'nombre': 'Python',
      'descripcion': 'Popular en ciencia de datos',
      'imagen':
          'https://upload.wikimedia.org/wikipedia/commons/c/c3/Python-logo-notext.svg'
    },
    {
      'nombre': 'JavaScript',
      'descripcion': 'Lenguaje de la web',
      'imagen':
          'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png'
    },
    {
      'nombre': 'Java',
      'descripcion': 'Muy usado en empresas',
      'imagen':
          'https://upload.wikimedia.org/wikipedia/en/3/30/Java_programming_language_logo.svg'
    },
    {
      'nombre': 'C#',
      'descripcion': 'Lenguaje de Microsoft',
      'imagen':
          'https://upload.wikimedia.org/wikipedia/commons/4/4f/Csharp_Logo.png'
    },
    {
      'nombre': 'C++',
      'descripcion': 'Lenguaje de sistemas',
      'imagen':
          'https://upload.wikimedia.org/wikipedia/commons/1/18/ISO_C%2B%2B_Logo.svg'
    },
    {
      'nombre': 'Go',
      'descripcion': 'Lenguaje de Google',
      'imagen':
          'https://upload.wikimedia.org/wikipedia/commons/0/05/Go_Logo_Blue.svg'
    },
    {
      'nombre': 'Kotlin',
      'descripcion': 'Lenguaje para Android',
      'imagen':
          'https://upload.wikimedia.org/wikipedia/commons/7/74/Kotlin_Icon.png'
    },
    {
      'nombre': 'Swift',
      'descripcion': 'Lenguaje de Apple',
      'imagen':
          'https://upload.wikimedia.org/wikipedia/commons/9/9d/Swift_logo.svg'
    },
    {
      'nombre': 'Ruby',
      'descripcion': 'Lenguaje para web',
      'imagen':
          'https://upload.wikimedia.org/wikipedia/commons/7/73/Ruby_logo.svg'
    },
  ];

  void _onSelectDrawerItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
      Navigator.pop(context);
    });
  }

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
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Información',
            onPressed: () => _showMessage('App creada por yeygok'),
          ),
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
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Opciones',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Ver lista'),
              selected: _selectedDrawerIndex == 0,
              onTap: () => _onSelectDrawerItem(0),
            ),
            ListTile(
              leading: const Icon(Icons.view_module),
              title: const Text('Ver CardView'),
              selected: _selectedDrawerIndex == 1,
              onTap: () => _onSelectDrawerItem(1),
            ),
          ],
        ),
      ),
      body:
          _selectedDrawerIndex == 0 ? _buildListaLenguajes() : _buildCardView(),
    );
  }

  Widget _buildListaLenguajes() {
    return ListView.builder(
      itemCount: lenguajes.length,
      itemBuilder: (context, index) {
        final lenguaje = lenguajes[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(lenguaje['imagen']!),
          ),
          title: Text(lenguaje['nombre']!),
          subtitle: Text(lenguaje['descripcion']!),
        );
      },
    );
  }

  Widget _buildCardView() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: lenguajes.length,
      itemBuilder: (context, index) {
        final lenguaje = lenguajes[index];
        return Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    lenguaje['imagen']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lenguaje['nombre']!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lenguaje['descripcion']!,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
