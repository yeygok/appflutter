import 'package:flutter/material.dart';
import '../models/language.dart';

// Determina si la ruta apunta a un asset local
bool _isLocal(String path) => !path.startsWith('http');

// Widget helper para cargar imagen (asset o red). Nota: SVG local no se renderiza nativamente sin paquete extra.
Widget buildLanguageImage(String path, {BoxFit fit = BoxFit.cover}) {
  if (_isLocal(path)) {
    if (path.toLowerCase().endsWith('.svg')) {
      // Fallback simple para SVG local (mostrar ícono genérico) a menos que se agregue flutter_svg.
      return Container(
        color: Colors.grey.shade200,
        alignment: Alignment.center,
        child: const Icon(Icons.image, color: Colors.grey),
      );
    }
    return Image.asset(path, fit: fit);
  }
  return Image.network(path, fit: fit);
}

// Item de lista para mostrar un lenguaje
class LanguageListTile extends StatelessWidget {
  final Language language;
  const LanguageListTile({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          height: 48,
          width: 48,
          child: buildLanguageImage(language.imagen, fit: BoxFit.cover),
        ),
      ),
      title: Text(language.nombre),
      subtitle: Text(language.descripcion),
    );
  }
}

// Card para vista en grilla
class LanguageCard extends StatelessWidget {
  final Language language;
  const LanguageCard({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: buildLanguageImage(language.imagen, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language.nombre,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  language.descripcion,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
