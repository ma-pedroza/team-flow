import 'package:flutter/material.dart';

import '../models/team.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Team> teams = [
    Team(id: 1, name: 'Equipe Front-End', area: 'Desenvolvimento'),
    Team(id: 2, name: 'Equipe Data Science', area: 'Dados'),
    Team(id: 3, name: 'Equipe UX Design', area: 'Design'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TeamFlow')),
      body: const Center(child: Text('Times')),
    );
  }
}
