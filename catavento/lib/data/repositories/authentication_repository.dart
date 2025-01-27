import 'package:catavento/domain/repositories/authentication/i_authentication_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: IAuthenticationRepository)
class AuthenticationRepository implements IAuthenticationRepository {
  // final GoTrueClient _supabaseAuth;
  final SupabaseClient _supabase;
  static const String _redirectUrl = 'br.com.fehu://signup-callback';

  AuthenticationRepository(this._supabase);

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final supabaseResponse = await _supabase.auth
        .signInWithPassword(password: password, email: email);
    return supabaseResponse.user;
    // return _supabase.auth.currentUser;
  }

  @override
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final supabaseResponse = await _supabase.auth.signUp(
        password: password, email: email, emailRedirectTo: _redirectUrl);
    return supabaseResponse.user;
    // return _supabase.auth.currentUser;
  }

  @override
  Future<bool> signOut() async {
    final session = _supabase.auth.currentSession;

    if (session != null) {
      await _supabase.auth.signOut();
      return true;
    }
    return false;
  }

  @override
  Future<User?> getCurrentUser() async => _supabase.auth.currentUser;
}
