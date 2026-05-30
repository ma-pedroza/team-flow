import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teamflow/models/team.dart';

class AppDatabase {
  static Future<Database> getDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'teamflow.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE teams (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            area TEXT NOT NULL,
            description TEXT NOT NULL,
            colorValue INTEGER NOT NULL
          )
          ''');
      },
    );
  }

  static Future<void> insertTeam(Team team) async {
    final db = await getDatabase();

    await db.insert('teams', team.toMap());
  }

  static Future<List<Team>> getTeams() async {
    final db = await getDatabase();
    final queryResult = await db.query('teams');
    final teams = queryResult.map((line) => Team.fromMap(line)).toList();

    return teams;
  }
}
