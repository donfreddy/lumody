class Mood {
  final String id;
  final String name;
  final String icon;
  final String color;

  Mood({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  factory Mood.fromJson(Map<String, dynamic> json) {
    return Mood(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'color': color,
    };
  }
}