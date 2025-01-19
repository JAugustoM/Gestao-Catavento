import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catavento/domain/repositories/authentication/i_authentication_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository _authenticationRepository;
  final _supabase = Supabase.instance.client;
  Map<String, dynamic> _userData = {};
  String? _email;
  String? _password;
  // StreamSubscription<User?>? _userSubscription;
  AuthLoading get initialState => AuthLoading();

  AuthBloc(this._authenticationRepository) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUpEvent);
    on<SignInEvent>(_onSignInEvent);
    on<SignOutEvent>(_onSignOut);
    on<CheckAuthEvent>(_onCheckAuthEvent);
    on<AuthReauthenticateEvent>(_onReauthenticate);
    // _startUserSubscription();
  }

  Future<void> _onSignUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await _authenticationRepository.signUpWithEmailAndPassword(
          email: event.email, password: event.password);
      final user = await _authenticationRepository.getCurrentUser();

      if (user != null) {
        final data =
            await _supabase.from('usuarios').select().eq('email', event.email);

        if (data.isNotEmpty) {
          _userData = data.first;

          _email = event.email;
          _password = event.password;

          emit(AuthAuthenticated(user));
        } else {
          emit(AuthError("Usuário não encontrado."));
        }
      } else {
        emit(AuthError("Falha ao criar conta. Verifique suas credenciais."));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignInEvent(
      SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await _authenticationRepository.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      final user = await _authenticationRepository.getCurrentUser();

      if (user != null) {
        final data =
            await _supabase.from('usuarios').select().eq('email', event.email);

        if (data.isNotEmpty) {
          _userData = data.first;

          _email = event.email;
          _password = event.password;

          emit(AuthAuthenticated(user));
        } else {
          emit(AuthError("Usuário não encontrado."));
        }
      } else {
        emit(AuthError("Usuário não encontrado."));
      }
    } catch (e) {
      emit(AuthError("Erro ao autenticar usuário - $e"));
    }
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    try {
      final session = await _authenticationRepository.signOut();

      if (session) {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthError("Erro ao sair da conta - $e"));
    }
  }

  Future<void> _onCheckAuthEvent(
      CheckAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authenticationRepository.getCurrentUser();
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthError("Erro ao autenticar usuário - $e"));
    }
  }

  Future<void> _onReauthenticate(
      AuthReauthenticateEvent event, Emitter<AuthState> emit) async {
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
          email: _email!, password: _password!);
    } catch (e) {
      emit(AuthError("Erro ao autenticar usuário - $e"));
    }
  }

  String? get email => _email;

  String? get setor => _userData['setor'];

  Map<String, dynamic> get userData => _userData;
}
