import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../mocks/mock_demanda_bloc/mock_demanda_bloc.dart';

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

  group('DemandaBloc', () {
    final fakeData = [
      {
        "id": 1,
        "nome_demanda": "Bolo Teste 1",
        "descricao": "Bolo para teste",
        "produto_id": "BT1",
        "data_adicao": "2025-01-26 21:04:19",
        "status": "Pendente",
        "status_aplique": 0,
        "status_cobertura": 0,
        "status_montagem": 0,
        "loja": "Site",
        "prazo": null,
      },
    ];
    final fakeMetaData = {
      'completo': 0,
      'espera': 1,
      'fabricacao': 0,
      'total': 1,
      'restantes': 1,
    };
    late DemandaBloc demandaBloc;
    setUp(() async {
      demandaBloc = DemandaBloc(supabase);
    });
    blocTest(
      "Estado inicial vazio",
      build: () => demandaBloc,
      act: (bloc) => bloc.add(DemandaLoading()),
      expect: () => [
        DemandaLoadingState([], {
          "completo": 0,
          "espera": 0,
          "fabricacao": 0,
          "total": 0,
          "restantes": 0,
        })
      ],
    );

    blocTest(
      "Teste do evento BlocLoading",
      build: () => demandaBloc,
      setUp: () async {
        await supabase.from('demandas').insert(fakeData);
      },
      act: (bloc) => bloc.add(DemandaLoading()),
      expect: () => [DemandaLoadingState(fakeData, fakeMetaData)],
    );

    final dataString = "2025-01-30 12:00:00";
    final demandaDataString = '30/01/25';
    final response = [
      {
        'id': 1,
        'nome_demanda': "Bolo teste",
        'descricao': "Bolo normal",
        'status': "Pendente",
        'status_cobertura': 0,
        'status_aplique': 0,
        'status_montagem': 0,
        'loja': 'Não especificada',
        'data_adicao': dataString,
        'prazo': dataString,
      },
    ];

    blocTest(
      "Teste do evento DemandaCreate",
      build: () => demandaBloc,
      setUp: () async {
        await supabase.from('produtos').insert(
          {
            'id': 'BF2T2',
            'nome_produto': "Bolo teste",
            'descricao_padrao': "Bolo para teste",
            'image_url': null,
          },
        );
      },
      act: (bloc) => bloc.add(DemandaCreate(
        nomeDemanda: "Bolo teste",
        codigo: "",
        descricao: "",
        data: demandaDataString,
      )),
      expect: () => [DemandaCreateState(response, fakeMetaData)],
    );

    final dados = [
      {
        "id": 1,
        "nome_demanda": "Bolo Teste 1",
        "descricao": "Bolo para teste",
        "produto_id": "BT1",
        "data_adicao": "2025-01-26 21:04:19",
        "status": "Pendente",
        "status_aplique": 0,
        "status_cobertura": 0,
        "status_montagem": 0,
        "loja": "Site",
        "prazo": null,
      },
      {
        "id": 2,
        "nome_demanda": "Bolo Teste 2",
        "descricao": "Bolo para teste",
        "produto_id": "BT1",
        "data_adicao": "2025-01-26 21:04:19",
        "status": "Pendente",
        "status_aplique": 0,
        "status_cobertura": 0,
        "status_montagem": 0,
        "loja": "Elo7",
        "prazo": null,
      },
    ];

    blocTest(
      "Teste do evento DemandaFilter",
      build: () => demandaBloc,
      setUp: () async {
        demandaBloc.currentData = dados;
      },
      act: (bloc) => bloc.add(DemandaFilter("loja", "Site")),
      expect: () => [
        DemandaFilterState([
          {
            "id": 1,
            "nome_demanda": "Bolo Teste 1",
            "descricao": "Bolo para teste",
            "produto_id": "BT1",
            "data_adicao": "2025-01-26 21:04:19",
            "status": "Pendente",
            "status_aplique": 0,
            "status_cobertura": 0,
            "status_montagem": 0,
            "loja": "Site",
            "prazo": null,
          },
        ], {
          "completo": 0,
          "espera": 2,
          "fabricacao": 0,
          "total": 2,
          "restantes": 2,
        })
      ],
    );

    final response2 = [
      {
        'id': 1,
        'nome_demanda': "Bolão de teste",
        'descricao': "Bolo normal",
        'status': "Pendente",
        'status_cobertura': 0,
        'status_aplique': 0,
        'status_montagem': 0,
        'loja': 'Não especificada',
        'data_adicao': dataString,
        'prazo': dataString,
      },
    ];

    blocTest(
      "Teste do evento DemandaUpdate",
      build: () => demandaBloc,
      setUp: () async {
        await supabase.from('produtos').insert(
          {
            'id': 'BF2T2',
            'nome_produto': "Bolo teste",
            'descricao_padrao': "Bolo para teste",
            'image_url': null,
          },
        );

        await supabase.from('demandas').insert(response);
        demandaBloc.currentData = response;
      },
      act: (bloc) {
        bloc.add(DemandaUpdate(
          id: 1,
          nomeDemanda: "Bolão de teste",
          codigo: "",
          descricao: "",
          data: "",
          prazo: "",
        ));
      },
      expect: () => [
        DemandaUpdateState(
          response2,
          fakeMetaData,
        ),
      ],
    );

    blocTest(
      "Teste do evento DemandaDelete",
      build: () => demandaBloc,
      setUp: () async {
        demandaBloc.currentData = dados;
        await supabase.from('demandas').insert(dados);
      },
      act: (bloc) => bloc.add(DemandaDelete(1)),
      expect: () => [
        DemandaDeleteState([
          {
            "id": 2,
            "nome_demanda": "Bolo Teste 2",
            "descricao": "Bolo para teste",
            "produto_id": "BT1",
            "data_adicao": "2025-01-26 21:04:19",
            "status": "Pendente",
            "status_aplique": 0,
            "status_cobertura": 0,
            "status_montagem": 0,
            "loja": "Elo7",
            "prazo": null,
          }
        ], {
          "completo": 0,
          "espera": 1,
          "fabricacao": 0,
          "total": 1,
          "restantes": 1,
        })
      ],
    );
  });
}
