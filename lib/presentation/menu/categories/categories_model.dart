class CategoryModel {
  String id;
  String name;
  String icon;
  String color;
  bool isDefault;
  int usage;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.isDefault = true,
    this.usage = 0,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        color: json['color'],
        isDefault: json['isDefault'] ?? true,
        usage: json['usage'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'color': color,
        'isDefault': isDefault,
        'usage': usage,
      };
}
