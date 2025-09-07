// Modelo que representa un lenguaje de programación
class Language {
  final String nombre;
  final String descripcion;
  final String imagen;
  final String? urlDocumentacion;

  const Language({
    required this.nombre,
    required this.descripcion,
    required this.imagen,
    this.urlDocumentacion,
  });
}

// Lista base de lenguajes (podría venir de un servicio en el futuro)
const languagesData = <Language>[
  Language(
    nombre: 'Dart',
    descripcion: 'Lenguaje de Flutter',
    imagen: 'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
    urlDocumentacion: 'https://dart.dev',
  ),
  Language(
    nombre: 'Python',
    descripcion: 'Popular en ciencia de datos',
    imagen: 'assets/imagenes/python.png',
    urlDocumentacion: 'https://www.python.org/doc/',
  ),
  Language(
    nombre: 'JavaScript',
    descripcion: 'Lenguaje de la web',
    imagen:
        'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png',
    urlDocumentacion: 'https://developer.mozilla.org/docs/Web/JavaScript',
  ),
  Language(
    nombre: 'Java',
    descripcion: 'Muy usado en empresas',
    imagen: 'assets/imagenes/java.svg',
    urlDocumentacion: 'https://docs.oracle.com/en/java/',
  ),
  Language(
    nombre: 'C#',
    descripcion: 'Lenguaje de Microsoft',
    imagen:
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Csharp_Logo.png',
    urlDocumentacion: 'https://learn.microsoft.com/dotnet/csharp/',
  ),
  Language(
    nombre: 'C++',
    descripcion: 'Lenguaje de sistemas',
    imagen: 'assets/imagenes/c++.svg',
    urlDocumentacion: 'https://isocpp.org/std/the-standard',
  ),
  Language(
    nombre: 'Go',
    descripcion: 'Lenguaje de Google',
    imagen: 'assets/imagenes/go.jpg',
    urlDocumentacion: 'https://go.dev/doc/',
  ),
  Language(
    nombre: 'Kotlin',
    descripcion: 'Lenguaje para Android',
    imagen:
        'https://upload.wikimedia.org/wikipedia/commons/7/74/Kotlin_Icon.png',
    urlDocumentacion: 'https://kotlinlang.org/docs/home.html',
  ),
  Language(
    nombre: 'Swift',
    descripcion: 'Lenguaje de Apple',
    imagen:
        'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/swift/swift-original.png',
    urlDocumentacion: 'https://www.swift.org/documentation/',
  ),
  Language(
    nombre: 'Ruby',
    descripcion: 'Lenguaje para web',
    imagen: 'assets/imagenes/ruby.jpg',
    urlDocumentacion: 'https://www.ruby-lang.org/en/documentation/',
  ),
];
