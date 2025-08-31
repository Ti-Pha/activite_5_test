import 'package:flutter_test/flutter_test.dart';
import 'package:activite_5_test/main.dart';

void main() {
  group('calculateMoyenne', () {
    test('devrait calculer la moyenne pour une liste d\'étudiants', () {
      final List<Etudiant> etudiants = [
        Etudiant(nom: 'Micka', moyenne: 17.25),
        Etudiant(nom: 'Wens', moyenne: 16.5),
        Etudiant(nom: 'Jenny', moyenne: 11.75),
      ];
      final double expectedAverage = (17.25 + 16.5 + 11.75) / 3;
      final double actualAverage = calculateMoyenne(etudiants);
      expect(actualAverage, expectedAverage);
    });

    test('devrait retourner 0.0 pour une liste vide', () {
      final List<Etudiant> etudiants = [];
      final double actualAverage = calculateMoyenne(etudiants);
      expect(actualAverage, 0.0);
    });
  });
}
