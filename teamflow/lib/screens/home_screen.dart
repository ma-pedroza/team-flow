import 'package:flutter/material.dart';

import '../models/team.dart';
import '../widgets/team_card.dart';
import '../screens/team_form_screen.dart';
import '../database/database.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Team> teams = [];


  final Team frontendTeam =     Team(
      id: 1,
      name: 'Equipe Front-End',
      area: 'Desenvolvimento',
      description: 'Nada',
      colorValue: 0xFF3F51B5,
    );

    @override 
    void initState() {
      super.initState();
      loadTeams();
    }

    Future<void> loadTeams() async {
      final databaseTeams = await AppDatabase.getTeams();

      setState(() {
        teams = [
          frontendTeam,
          ...databaseTeams,
        ];
      });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TeamFlow')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TeamFormScreen()),
          );

          loadTeams();
        },
        child: const Icon(Icons.add),
      ),
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
