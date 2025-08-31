import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:activite_5_test/main.dart';

void main() {
  testWidgets('PageAccueil affiche la liste des étudiants et le bouton', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: PageAccueil()));
    expect(find.text('Liste des étudiants'), findsOneWidget);
    expect(find.text('Nom: Micka'), findsOneWidget);
    expect(find.text('Nom: Wens'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Calculer la moyenne de la classe'), findsOneWidget);
  });
}
