class Etudiant {
  final int id;
  final String nom;
  final String prenom;
  final String classe;
  final String matricule;
  final String email;

  Etudiant({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.classe,
    required this.matricule,
    required this.email,
  });

  factory Etudiant.fromJson(Map<String, dynamic> json) {
    return Etudiant(
      id: int.parse(json["id"]),
      nom: json['nom'],
      prenom: json['prenom'],
      classe: json['classe'],
      matricule: json['matricule'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": "$id",
      "nom": nom,
      "prenom": prenom,
      "classe": classe,
      "matricule": matricule,
      "email": email,
    };
  }
  @override
  String toString() {
    return 'Etudiant{id: $id, nom: $nom, prenom: $prenom, classe: $classe, matricule: $matricule, email: $email}';
  }

}

 