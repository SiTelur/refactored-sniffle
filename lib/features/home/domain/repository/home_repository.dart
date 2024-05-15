import 'package:biemart/config/resouceses/data_state/data_state.dart';
import 'package:biemart/features/home/domain/entity/category.dart';

abstract class HomeRepository {
  Future<DataState<List<CategoryEntity>>> getCategory();
}
