import 'package:biemart/config/resouceses/data_state/data_state.dart';
import 'package:biemart/features/home/data/data_source/remote/remote.dart';
import 'package:biemart/features/home/domain/entity/category.dart';
import 'package:biemart/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _dataSource;

  HomeRepositoryImpl(this._dataSource);

  @override
  Future<DataState<List<CategoryEntity>>> getCategory() async {
    try {
      final data = await _dataSource.getCategory();
      return DataSuccess(data);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
