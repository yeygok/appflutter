import 'package:flutter/material.dart';
import '../models/language.dart';

// Item de lista para mostrar un lenguaje
class LanguageListTile extends StatelessWidget {
  final Language language;
  const LanguageListTile({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(language.imagen),
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
              child: Image.network(
                language.imagen,
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
