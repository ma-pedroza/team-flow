import 'package:flutter/material.dart';

import '../models/team.dart';
import '../widgets/team_card.dart';
import '../screens/team_form_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Team> teams = [
    Team(
      id: 1,
      name: 'Equipe Front-End',
      area: 'Desenvolvimento',
      colorValue: 0xFF3F51B5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TeamFlow')),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TeamFormScreen()));
      },
      child: const Icon(Icons.add),),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          final team = teams[index];

          return TeamCard(team: team);
        },
      ),
    );
  }
}
