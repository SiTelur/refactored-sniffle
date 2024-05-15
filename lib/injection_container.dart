import 'package:biemart/features/auth/data/repository/authentication_repository.dart';
import 'package:biemart/features/auth/domain/repository/i_authentication_repository.dart';
import 'package:biemart/features/home/data/data_source/remote/remote.dart';
import 'package:biemart/features/home/data/repository/home_repository_impl.dart';
import 'package:biemart/features/home/domain/repository/home_repository.dart';
import 'package:biemart/features/home/domain/use_case/get_category.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDependency() async {
  sl.registerSingleton<SupabaseClient>(Supabase.instance.client);
  sl.registerSingleton(Supabase.instance.client.auth);
  sl.registerSingleton<IAuthenticationRepository>(
      AuthenticationRepository(sl()));

  sl.registerSingleton(HomeRemoteDataSource());
  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl(sl()));
  sl.registerSingleton(GetCategoryUseCase(sl()));
}
