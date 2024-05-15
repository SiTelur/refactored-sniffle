import 'package:biemart/config/resouceses/data_state/data_state.dart';
import 'package:biemart/features/home/domain/entity/category.dart';
import 'package:biemart/features/home/domain/use_case/get_category.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoryUseCase useCase;
  CategoryBloc(this.useCase) : super(CategoryState.initial()) {
    on<GetCategoryFetch>(_getCategoryFetch);
  }

  void _getCategoryFetch(
      GetCategoryFetch event, Emitter<CategoryState> emit) async {
    emit(CategoryState.loading());

    final data = await useCase();

    if (data is DataSuccess && data.data != null) {
      emit(state.copyWith(status: Status.loaded, data: data.data));
    }

    if (data is DataFailed) {
      emit(state.copyWith(status: Status.failure, data: []));
    }
  }
}
