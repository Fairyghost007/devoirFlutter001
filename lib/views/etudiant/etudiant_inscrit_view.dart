import 'package:devoir1/models/Etudiant.dart';
import 'package:devoir1/services/api_service.dart';
import 'package:devoir1/views/widgets/layout.dart';
import 'package:flutter/material.dart';

class EtudiantInscritPage extends StatefulWidget {
  final ApiService service;
  const EtudiantInscritPage({super.key, required this.service});

  @override
  State<EtudiantInscritPage> createState() => _EtudiantInscritPageState();
}

class _EtudiantInscritPageState extends State<EtudiantInscritPage> {
  late Future<List<Etudiant>> _futureEtudiants;

  void _refresh() {
  setState(() {
    try {
      _futureEtudiants = widget.service.findAllInscrits();
    } catch (e) {
      print("Error loading etudiants: $e");
    }
  });
}

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      contentPage: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<Etudiant>>(
                future: _futureEtudiants,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } 
                  // else if (snapshot.hasError) {
                  //   return const Center(child: Text("Erreur de chargement..."));
                  // } 
                  else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("Aucun étudiant inscrit"));
                  }
                  final etudiants = snapshot.data!;
                  return ListView.builder(
                    itemCount: etudiants.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final etu = etudiants[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        child: ListTile(
                          title: Text("${etu.prenom} ${etu.nom}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Classe : ${etu.classe}"),
                              Text("Matricule : ${etu.matricule}"),
                              Text("Email : ${etu.email}"),
                            ],
                          ),
                          isThreeLine: true,
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
