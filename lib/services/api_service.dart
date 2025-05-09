import 'dart:convert';
import 'package:devoir1/models/Etudiant.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final http.Client _client;

  ApiService({this.baseUrl = "http://10.0.2.2:3000", http.Client? client})
    : _client = client ?? http.Client();

  Future<List<Etudiant>> findAllInscrits() async {
    final response = await _client.get(
      Uri.parse("$baseUrl/inscription"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> datas = json.decode(response.body);
      var data = datas.map((data) => Etudiant.fromJson(data)).toList();
      print(data); 
      return data;
    } else {
      throw Exception("Erreur lors du chargement des inscriptions");
    }
  }

  Future<List<Etudiant>> findInscritsByClasse(String classe) async {
    final response = await _client.get(
      Uri.parse("$baseUrl/inscription?classe=$classe"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> datas = json.decode(response.body);
      return datas.map((data) => Etudiant.fromJson(data)).toList();
    } else {
      throw Exception("Erreur lors du filtrage par classe");
    }
  }
}
