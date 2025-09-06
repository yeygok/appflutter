import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// Función principal que inicia la aplicación
void main() {
  runApp(const LenguajesApp());
}

// Widget principal de la aplicación
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

