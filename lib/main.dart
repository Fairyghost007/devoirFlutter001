import 'package:devoir1/services/api_service.dart';
import 'package:devoir1/views/etudiant/etudiant_inscrit_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    return MaterialApp(
      title: 'Ges Etudiants',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes:{
        '/': (context) =>  EtudiantInscritPage( service: ApiService()),
      }
    );
  }
}
