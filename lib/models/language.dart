// Modelo que representa un lenguaje de programación
class Language {
  final String nombre;
  final String descripcion;
  final String imagen;

  const Language({
    required this.nombre,
    required this.descripcion,
    required this.imagen,
  });
}

// Lista base de lenguajes (podría venir de un servicio en el futuro)
const languagesData = <Language>[
  Language(
    nombre: 'Dart',
    descripcion: 'Lenguaje de Flutter',
    imagen: 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
  ),
  Language(
    nombre: 'Python',
    descripcion: 'Popular en ciencia de datos',
    imagen:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.png',
  ),
  Language(
    nombre: 'JavaScript',
    descripcion: 'Lenguaje de la web',
    imagen:
        'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png',
  ),
  Language(
    nombre: 'Java',
    descripcion: 'Muy usado en empresas',
    imagen:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.png',
  ),
  Language(
    nombre: 'C#',
    descripcion: 'Lenguaje de Microsoft',
    imagen:
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Csharp_Logo.png',
  ),
  Language(
    nombre: 'C++',
    descripcion: 'Lenguaje de sistemas',
    imagen:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.png',
  ),
  Language(
    nombre: 'Go',
    descripcion: 'Lenguaje de Google',
    imagen:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/go/go-original.png',
  ),
  Language(
    nombre: 'Kotlin',
    descripcion: 'Lenguaje para Android',
    imagen:
        'https://upload.wikimedia.org/wikipedia/commons/7/74/Kotlin_Icon.png',
  ),
  Language(
    nombre: 'Swift',
    descripcion: 'Lenguaje de Apple',
    imagen:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/swift/swift-original.png',
  ),
  Language(
    nombre: 'Ruby',
    descripcion: 'Lenguaje para web',
    imagen:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ruby/ruby-original.png',
  ),
];
