import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  Widget contentPage;
  LayoutPage({super.key, required this.contentPage});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text("Liste Etudiant", style: TextStyle(fontSize: 24)),
      ),
      body:widget.contentPage,
    );
  }
}