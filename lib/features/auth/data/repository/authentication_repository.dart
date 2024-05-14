import 'package:biemart/features/auth/domain/repository/i_authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final GoTrueClient _supabaseAuth;
  static const String _redirectUrl =
      'https://vfwdwdelsjrbuowuhsig.supabase.co/auth/v1/callback';

  AuthenticationRepository(this._supabaseAuth);

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await _supabaseAuth.signInWithPassword(password: password, email: email);

  @override
  Future<void> signUpWithEmailAndPassword(
          {required String email,
          required String password,
          required String name,
          required String phoneNumber}) async =>
      await _supabaseAuth.signUp(
          password: password,
          email: email,
          emailRedirectTo: _redirectUrl,
          data: {'name': name, 'phone': phoneNumber, 'role': 'user'});

  @override
  Future<void> signOut() async => await _supabaseAuth.signOut();

  @override
  Stream<User?> getCurrentUser() =>
      _supabaseAuth.onAuthStateChange.map((event) => event.session?.user);

  @override
  User? getSignedInUser() => _supabaseAuth.currentUser;
}
