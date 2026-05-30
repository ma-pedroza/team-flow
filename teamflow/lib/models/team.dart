class Team {
  final int? id;
  final String name;
  final String area;
  final String description;
  final int colorValue;

  Team({
    this.id,
    required this.name,
    required this.area,
    required this.description,
    required this.colorValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'area': area,
      'description': description,
      'colorValue': colorValue,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'],
      name: map['name'],
      area: map['area'],
      description: map['description'],
      colorValue: map['colorValue'],
    );
  }
}
