import 'package:flutter_test/flutter_test.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../mocks/mock_usuario_bloc/mock_usuario_bloc.dart';

// Criação do Mock do SupabaseClient
class MockSupabaseClient extends Mock implements SupabaseClient {}

void main() {
  late final SupabaseClient supabase;
  late final MockSupabaseHttpClient httpClient;

  setUpAll(() {
    httpClient = MockSupabaseHttpClient();

    supabase = SupabaseClient(
      'https://mock.supabase.co',
      'fakeAnonKey',
      httpClient: MockSupabaseHttpClient(),
    );
  });

  tearDown(() async {
    httpClient.reset();
  });
  tearDownAll(() {
    httpClient.close();
  });

  group('UsuarioBloc', () {
    late UsuarioBloc usuarioBloc;
    setUp(() async {
      usuarioBloc = UsuarioBloc(supabase);
    });

    test('inicializa com o estado UsuarioLoadingState', () {
      expect(usuarioBloc.state, isA<UsuarioLoadingState>());
    });

    final usuario = {
      'nome': "Novo User",
      'usuario': "novo",
      'email': "email@test.com",
      'setor': "Setor A",
      'tipo': "gerente",
      'id': 0
    };

    blocTest<UsuarioBloc, UsuarioState>(
      'emite UsuarioCreateState quando criar um usuário com sucesso',
      build: () => usuarioBloc,
      act: (bloc) => bloc.add(UsuarioCreate('Novo User', 'novo', 'Setor A',
          'email@test.com', 'gerente', 'senha123')),
      expect: () => [
        UsuarioCreateState([usuario], {"total": 1})
      ],
    );

    blocTest<UsuarioBloc, UsuarioState>(
      'emite UsuarioLoadingState quando carregar os usuários',
      build: () => usuarioBloc,
      setUp: () async {},
      act: (bloc) => bloc.add(UsuarioLoading()),
      expect: () => [
        UsuarioLoadingState([usuario], {"total": 1})
      ],
    );

    final usuario2 = {
      'nome': "João",
      'usuario': "novo2",
      'email': "email@test.com",
      'setor': "Setor B",
      'tipo': "funcionario",
      'id': 0
    };

    blocTest<UsuarioBloc, UsuarioState>(
      'emite UsuarioUpdateState quando atualizar um usuário',
      build: () => usuarioBloc,
      setUp: () async {
        usuarioBloc.currentData = [usuario];
      },
      act: (bloc) => bloc.add(UsuarioUpdate(
        'João',
        'Setor B',
        'funcionario',
        'email@test.com',
        'novo2',
        0,
        'senha123',
      )),
      expect: () => [
        UsuarioUpdateState([usuario2], {"total": 1})
      ],
    );

    blocTest<UsuarioBloc, UsuarioState>(
      'emite UsuarioDeleteState quando excluir um usuário',
      build: () => usuarioBloc,
      setUp: () async {
        usuarioBloc.currentData = [usuario2];
      },
      act: (bloc) => bloc.add(UsuarioDelete(0, 'email@test.com')),
      expect: () => [
        UsuarioDeleteState([], {"total": 0})
      ],
    );
  });
}
