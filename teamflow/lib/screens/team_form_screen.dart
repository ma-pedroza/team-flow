import 'package:flutter/material.dart';
import 'package:teamflow/database/database.dart';
import 'package:teamflow/models/team.dart';

class TeamFormScreen extends StatefulWidget {
  const TeamFormScreen({super.key});

  @override
  State<TeamFormScreen> createState() => _TeamFormScreenState();
}

class _TeamFormScreenState extends State<TeamFormScreen> {
  final nameController = TextEditingController();
  final areaController = TextEditingController();
  final descriptionController = TextEditingController();

  int selectedColorValue = 0xFF3F51B5;

  @override
  void dispose() {
    nameController.dispose();
    areaController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  final List<int> teamColors = [
    0xFF3F51B5,
    0xFF00897B,
    0xFFE64A19,
    0xFF7B1FA2,
    0xFFC62828,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar equipe')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Container(
              width: 78,
              height: 78,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigo,
              ),
              child: const Icon(Icons.groups, size: 48, color: Colors.white),
            ),
            Text(
              'Crie seu time',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 50),

            SizedBox(
              width: 300,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nome do time',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: 300,
              child: TextField(
                controller: areaController,
                decoration: InputDecoration(
                  labelText: 'Área',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: 300,
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),
            const Text(
              'Cor do time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: teamColors.map((colorValue) {
                Color borderColor;

                if (selectedColorValue == colorValue) {
                  borderColor = const Color.fromARGB(255, 255, 255, 255);
                } else {
                  borderColor = Colors.transparent;
                }

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColorValue = colorValue;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 06),
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(colorValue),
                      border: Border.all(color: borderColor, width: 3),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 48),

            SizedBox(
              width: 300,
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                  ),
                  onPressed: () async {
                    final team = Team(
                      name: nameController.text,
                      area: areaController.text,
                      description: descriptionController.text,
                      colorValue: selectedColorValue,
                    );

                    await AppDatabase.insertTeam(team);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Equipe criada com sucesso'),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.save, size: 24),
                  label: const Text(
                    'Criar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
