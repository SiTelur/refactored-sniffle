import 'dart:convert';

import 'package:biemart/features/home/domain/entity/category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel(
      {required super.category_id, required super.name, super.description});

  CategoryModel copyWith({
    int? category_id,
    String? name,
    String? description,
  }) {
    return CategoryModel(
      category_id: category_id ?? this.category_id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category_id': category_id,
      'name': name,
      'description': description,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      category_id: map['category_id'] as int,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
