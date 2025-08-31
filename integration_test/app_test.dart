import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:activite_5_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'l\'application affiche la moyenne de la classe après avoir cliqué sur le bouton',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder buttonFinder = find.byType(ElevatedButton);
      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('La moyenne des étudiants est: 14.35'), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    },
  );
}
