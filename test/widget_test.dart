// Prueba de widget básica para verificar la interfaz de FormularioCorreoUAE.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:programacionu1s4taller4/main.dart';

void main() {
  testWidgets('Verifica la presencia de los elementos del formulario de correo', (WidgetTester tester) async {
    // Construye la aplicación y activa un fotograma.
    await tester.pumpWidget(const FormularioCorreoUAE());

    // Verifica que el título de la AppBar esté presente.
    expect(find.text('Formulario de correo'), findsOneWidget);

    // Verifica que la etiqueta 'Ingresa tu correo' esté presente.
    expect(find.text('Ingresa tu correo'), findsOneWidget);

    // Verifica que el campo de texto TextField esté presente.
    expect(find.byType(TextField), findsOneWidget);

    // Verifica que el botón 'Enviar' esté presente.
    expect(find.widgetWithText(ElevatedButton, 'Enviar'), findsOneWidget);
  });
}
