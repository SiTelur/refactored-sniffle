import 'package:biemart/features/auth/data/repository/authentication_repository.dart';
import 'package:biemart/features/auth/domain/repository/i_authentication_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependency() async {
  sl.registerSingleton<IAuthenticationRepository>(
      AuthenticationRepository(sl()));
}
