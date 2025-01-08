import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _supabase = Supabase.instance.client;
  User? _user;
  Map<String, dynamic> _userData = {};

  AuthEvent get initialState => AuthLoading();

  AuthBloc() : super(AuthSignInState({}, true)) {
    on<AuthSignIn>(_onSignIn);

    on<AuthSignOut>(_onSignOut);

    on<AuthLoading>(_onLoading);
  }

  void _onSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: event.email,
        password: event.password,
      );

      if (response.user != null) {
        _user = response.user!;
        final data =
            await _supabase.from('usuarios').select().eq('email', event.email);
        _userData = data.first;

        emit(AuthSignInState(_userData, false));
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
        _user = user;
        final data = await _supabase
            .from('usuarios')
            .select()
            .eq('email', _user!.email!);
        _userData = data.first;

        emit(AuthSignInState(_userData, true));
      }
    } catch (e) {
      emit(AuthErrorState("Erro ao autenticar usuário - $e"));
    }
  }
}
