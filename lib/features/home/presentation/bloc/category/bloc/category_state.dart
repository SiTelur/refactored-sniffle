part of 'category_bloc.dart';

enum Status { initial, loading, empty, loaded, failure }

class CategoryState extends Equatable {
  final Status status;
  final List<CategoryEntity> data;

  const CategoryState({required this.status, required this.data});

  factory CategoryState.initial() => const CategoryState(
        status: Status.initial,
        data: [],
      );

  factory CategoryState.loading() =>
      const CategoryState(data: [], status: Status.loading);

  CategoryState copyWith({
    required Status? status,
    required List<CategoryEntity>? data,
  }) =>
      CategoryState(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  @override
  List<Object> get props => [status, data];
}
