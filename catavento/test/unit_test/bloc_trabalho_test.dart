import 'package:bloc_test/bloc_test.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_trabalho_bloc/mock_trabalho_bloc.dart';

void main() async {
  late final SupabaseClient supabase;
  late final MockSupabaseHttpClient httpClient;

  setUpAll(() async {
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

  group('Bloc Trabalho Test', () {
    late TrabalhoBloc trabalhoBloc;

    setUp(() async {
      trabalhoBloc = TrabalhoBloc(supabase);
      await supabase.from('usuarios').insert({
        'email': 'email@gmail.com',
        'setor': 'Aplique',
        'nome': 'João',
        'tipo': 'padrao',
        'usuario': 'João',
      });
    });

    final trabalho = {
      'demanda_id': 1,
      'usuario_email': 'email@gmail.com',
      'data_inicio': null,
      'data_finalizacao': null,
    };

    final demanda = {
      'id': 1,
      'nome_demanda': "Bolo Fake",
      'status': "Pendente",
      'status_cobertura': 0,
      'status_aplique': 0,
      'status_montagem': 0,
      'data_adicao': "2025-02-04T12:00:00",
    };

    blocTest(
      "TrabalhoLoading",
      build: () => trabalhoBloc,
      setUp: () async {
        await supabase.from('trabalho').insert(trabalho);
        await supabase.from('demandas').insert(demanda);
      },
      act: (bloc) => bloc.add(TrabalhoLoading(
        email: "email@gmail.com",
        setor: "aplique",
      )),
      expect: () => [
        TrabalhoLoadingState(
          [trabalho],
          [demanda],
          {'total': 1, 'completo': 0, 'faltam': 1},
        )
      ],
      tearDown: () async =>
          await supabase.from('demandas').delete().eq('id', 1),
    );

    blocTest(
      "TrabalhoGet",
      build: () => trabalhoBloc,
      setUp: () async {
        await supabase.from('demandas').insert(demanda);
      },
      act: (bloc) => bloc.add(TrabalhoGet(
        email: "email@gmail.com",
        setor: "aplique",
      )),
      expect: () => [
        TrabalhoGetState(
          [
            {'demanda_id': 1, 'usuario_email': "email@gmail.com"}
          ],
          [demanda],
          {'total': 1, 'completo': 0, 'faltam': 1},
        )
      ],
      tearDown: () async {
        await supabase.from('demandas').delete().eq('id', 1);
      },
    );

    final demanda2 = {
      'id': 1,
      'nome_demanda': "Bolo Fake",
      'status': "Em fabricação",
      'status_cobertura': 0,
      'status_aplique': 1,
      'status_montagem': 0,
      'data_adicao': "2025-02-04T12:00:00",
    };

    blocTest(
      "TrabalhoInit",
      build: () => trabalhoBloc,
      setUp: () async {
        trabalhoBloc.currentData = [trabalho];
        trabalhoBloc.demandas = [demanda];
        await supabase.from('demandas').insert(demanda);
      },
      act: (bloc) => bloc.add(TrabalhoInit(
        email: "email@gmail.com",
        setor: "aplique",
      )),
      expect: () => [
        TrabalhoInitState(
          [trabalho],
          [demanda2],
          {'total': 1, 'completo': 0, 'faltam': 1},
        )
      ],
      tearDown: () async {
        await supabase.from('demandas').delete().eq('id', 1);
        await supabase.from('trabalho').delete().eq('demanda_id', 1);
      },
    );

    final trabalho2 = {
      'demanda_id': 1,
      'usuario_email': 'email@gmail.com',
      'data_inicio': '2025-02-04T12:00:00',
      'data_finalizacao': null,
    };

    blocTest(
      "TrabalhoFinish",
      build: () => trabalhoBloc,
      setUp: () async {
        trabalhoBloc.currentData = [trabalho2];
        trabalhoBloc.demandas = [demanda2];
        await supabase.from('demandas').insert(demanda2);
        await supabase.from('trabalho').insert(trabalho2);
      },
      act: (bloc) => bloc.add(TrabalhoFinish(
        email: "email@gmail.com",
        setor: "aplique",
      )),
      expect: () => [
        TrabalhoFinishState(
          [],
          [],
          {'total': 1, 'completo': 1, 'faltam': 0},
        )
      ],
      tearDown: () async {
        await supabase.from('demandas').delete().eq('id', 1);
        await supabase.from('trabalho').delete().eq('demanda_id', 1);
      },
    );
  });
}
