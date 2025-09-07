import 'package:flutter/material.dart';
import '../models/language.dart';
import 'package:url_launcher/url_launcher.dart';

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
class LanguageCard extends StatefulWidget {
  final Language language;
  const LanguageCard({super.key, required this.language});

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {
  bool _hover = false;

  Future<void> _openDocs() async {
    final url = widget.language.urlDocumentacion;
    if (url == null) return;
    final uri = Uri.tryParse(url);
    if (uri == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('URL inválida')),
        );
      }
      return;
    }
    final ok = await canLaunchUrl(uri)
        ? await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
            webOnlyWindowName: '_blank',
          )
        : false;
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo abrir la documentación')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final elev = _hover ? 8.0 : 4.0;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale(
        scale: _hover ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: GestureDetector(
          onTap: _openDocs,
          child: Card(
            elevation: elev,
            shadowColor: Colors.black26,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(14)),
                    child: buildLanguageImage(widget.language.imagen,
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.language.nombre,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          if (widget.language.urlDocumentacion != null)
                            const Icon(Icons.open_in_new,
                                size: 16, color: Colors.blueGrey),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.language.descripcion,
                        style: const TextStyle(fontSize: 13),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
