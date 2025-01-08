import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _supabase = Supabase.instance.client;
  Map<String, dynamic> _userData = {};
  String? _email;
  String? _password;

  AuthEvent get initialState => AuthLoading();

  AuthBloc() : super(AuthSignInState({})) {
    on<AuthSignIn>(_onSignIn);

    on<AuthSignOut>(_onSignOut);

    on<AuthLoading>(_onLoading);

    on<AuthReauthenticate>(_onReauthenticate);
  }

  void _onSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: event.email,
        password: event.password,
      );

      if (response.user != null) {
        final data =
            await _supabase.from('usuarios').select().eq('email', event.email);
        _userData = data.first;

        _email = event.email;
        _password = event.password;

        emit(AuthSignInState(_userData));
      } else {
        emit(AuthErrorState("Erro ao autenticar usuário"));
      }
    } catch (e) {
      emit(AuthErrorState("Erro ao autenticar usuário - $e"));
    }
  }

  void _onSignOut(AuthSignOut event, Emitter<AuthState> emit) async {
    try {
      final session = _supabase.auth.currentSession;

      if (session != null) {
        await _supabase.auth.signOut();
      }
      emit(AuthSignOutState());
    } catch (e) {
      emit(AuthErrorState("Erro ao sair da conta - $e"));
    }
  }

  void _onLoading(AuthLoading event, Emitter<AuthState> emit) async {
    try {
      final user = _supabase.auth.currentUser;
      if (user != null) {
        _email = user.email;

        emit(AuthLoadingState(_email));
      }
    } catch (e) {
      emit(AuthErrorState("Erro ao autenticar usuário - $e"));
    }
  }

  void _onReauthenticate(
      AuthReauthenticate event, Emitter<AuthState> emit) async {
    try {
      await _supabase.auth.signInWithPassword(
        email: _email!,
        password: _password!,
      );
    } catch (e) {
      emit(AuthErrorState("Erro ao autenticar usuário - $e"));
    }
  }

  String? get email => _email;

  Map<String, dynamic> get userData => _userData;
}
