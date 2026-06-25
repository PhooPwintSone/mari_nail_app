import 'dart:convert';

class ServicesModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final int categoryId;
  final String categoryName;
  final int durationInMinutes;
  final bool enabled;
  final bool package;

  ServicesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.categoryName,
    required this.durationInMinutes,
    required this.enabled,
    required this.package,
  });

  ServicesModel copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    int? categoryId,
    String? categoryName,
    int? durationInMinutes,
    bool? enabled,
    bool? package,
  }) {
    return ServicesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      durationInMinutes: durationInMinutes ?? this.durationInMinutes,
      enabled: enabled ?? this.enabled,
      package: package ?? this.package,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'durationInMinutes': durationInMinutes,
      'enabled': enabled,
      'package': package,
    };
  }

  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      categoryId: map['categoryId'] as int,
      categoryName: map['categoryName'] as String,
      durationInMinutes: map['durationInMinutes'] as int,
      enabled: map['enabled'] as bool,
      package: map['package'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicesModel.fromJson(String source) =>
      ServicesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServicesModel(id: $id, name: $name, description: $description, price: $price, categoryId: $categoryId, categoryName: $categoryName, durationInMinutes: $durationInMinutes, enabled: $enabled, package: $package)';
  }

  @override
  bool operator ==(covariant ServicesModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.categoryId == categoryId &&
        other.categoryName == categoryName &&
        other.durationInMinutes == durationInMinutes &&
        other.enabled == enabled &&
        other.package == package;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        categoryId.hashCode ^
        categoryName.hashCode ^
        durationInMinutes.hashCode ^
        enabled.hashCode ^
        package.hashCode;
  }
}
