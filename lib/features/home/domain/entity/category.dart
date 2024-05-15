import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int category_id;
  final String name;
  final String? description;
  const CategoryEntity({
    required this.category_id,
    required this.name,
    this.description,
  });

  @override
  List<Object?> get props => [category_id, name, description];
}
