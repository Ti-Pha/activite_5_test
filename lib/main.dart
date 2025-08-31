import 'package:flutter/material.dart';

void main() {
  runApp(MonApplication());
}

class Etudiant {
  final String nom;
  final double moyenne;
//Ajout d'un constructeur avec des paramètres nommés et requis
  Etudiant({required this.nom, required this.moyenne});
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[700],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: PageAccueil(),
      routes: {'/details': (context) => DetailPage()},
    );
  }
}

class PageAccueil extends StatelessWidget {
  final List<Etudiant> etudiants = [
    Etudiant(nom: 'Micka', moyenne: 17.25),
    Etudiant(nom: 'Wens', moyenne: 16.5),
    Etudiant(nom: 'Jenny', moyenne: 11.75),
    Etudiant(nom: 'Mirlanda', moyenne: 12.75),
    Etudiant(nom: 'Sarah', moyenne: 13.5),
  ];

  PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des étudiants'),
      ),
      // Correction: Ajout du widget Column manquant
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Liste des étudiants et de leurs moyennes :',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: etudiants.length,
              itemBuilder: (BuildContext context, int index) {
                final etudiant = etudiants[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: ListTile(
                    title: Text('Nom: ${etudiant.nom}'),
                    subtitle: Text('Moyenne: ${etudiant.moyenne}'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: etudiant,
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Calculer la moyenne de la classe'),
              onPressed: () {
                final average = calculateMoyenne(etudiants);
                moyenneAlertDialog(context, average);
              },
            ),
          ),
        ],
      ),
    );
  }

// Correction: Suppression de la virgule en trop et correction de la syntaxe
  void moyenneAlertDialog(BuildContext context, double average) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Moyenne des étudiants'),
          content: Text(
            'La moyenne des étudiants est: ${average.toStringAsFixed(2)}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

// Correction: Réécriture complète de la fonction calculateMoyenne
double calculateMoyenne(List<Etudiant> etudiants) {
  if (etudiants.isEmpty) {
    return 0.0;
  }
  double total = 0.0;
  for (var etudiant in etudiants) {
    total += etudiant.moyenne;
  }
  return total / etudiants.length;
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});
// Correction: Remplacement du | par . et utilisation de settings.arguments
  @override
  Widget build(BuildContext context) {
    final etudiant = ModalRoute.of(context)!.settings.arguments as Etudiant;
    return Scaffold(
      appBar: AppBar(title: Text('Détails de l\'étudiant')),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Nom de l\'étudiant: ${etudiant.nom}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  'Moyenne: ${etudiant.moyenne}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
