import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IAuthenticationRepository {
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber});

  Future<void> signOut();
  Stream<User?> getCurrentUser();
  User? getSignedInUser();
}
