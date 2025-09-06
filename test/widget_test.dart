// Prueba básica de widget en Flutter.
//
// Para interactuar con un widget en tu prueba, utiliza el WidgetTester
// de flutter_test. Por ejemplo, puedes simular toques y desplazamientos.
// También puedes usar WidgetTester para encontrar widgets hijos en el árbol,
// leer textos y verificar los valores de las propiedades de los widgets.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterapp/main.dart';

void main() {
  testWidgets('Prueba de incremento del contador', (WidgetTester tester) async {
    // Construye la app y genera un frame.
    await tester.pumpWidget(const LenguajesApp());

    // Verifica que el contador inicia en 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Toca el ícono de "+" y genera un nuevo frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica que el contador haya incrementado.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
