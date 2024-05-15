import 'package:biemart/config/resouceses/data_state/data_state.dart';
import 'package:biemart/config/resouceses/use_case/use_case.dart';
import 'package:biemart/features/home/domain/entity/category.dart';
import 'package:biemart/features/home/domain/repository/home_repository.dart';

class GetCategoryUseCase
    implements UseCase<DataState<List<CategoryEntity>>, void> {
  final HomeRepository _repository;

  GetCategoryUseCase(this._repository);
  @override
  Future<DataState<List<CategoryEntity>>> call({void params}) {
    return _repository.getCategory();
  }
}
