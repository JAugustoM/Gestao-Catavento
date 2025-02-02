import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../mocks/mock_produto_bloc/mock_produto_bloc.dart';

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

  group('ProdutoBloc', () {
    late ProdutoBloc bloc;

    setUp(() {
      bloc = ProdutoBloc(supabase);
    });

    final produto = {
      'id': 'PF1',
      'nome_produto': 'Produto 1',
      'descricao_padrao': 'Bolo Fake',
      'image_url': 'https://mock.supabase.co/imagens/PF1.jpeg',
    };

    blocTest(
      'ProdutoBlocLoading',
      build: () => bloc,
      act: (bloc) => bloc.add(ProdutoLoading()),
      setUp: () async {
        await supabase.from('produtos').insert(produto);
      },
      expect: () => [
        ProdutoLoadingState([produto], {'total': 1})
      ],
    );

    final imagem =
        File('${Directory.current.path}/test/files/imagem_test.jpeg');

    blocTest(
      'ProdutoBlocCreate',
      build: () => bloc,
      act: (bloc) => bloc.add(ProdutoCreate(
        nomeProduto: 'Produto 1',
        codigo: 'PF1',
        descricaoPadrao: 'Bolo Fake',
        imagemProduto: imagem,
      )),
      setUp: () async {},
      expect: () => [
        ProdutoCreateState([produto], {'total': 1})
      ],
    );

    final produto2 = {
      'id': 'PF1',
      'nome_produto': 'Produto 1',
      'descricao_padrao': 'Bolo Fake',
      'image_url': null,
    };

    blocTest(
      'ProdutoBlocDelete',
      build: () => bloc,
      act: (bloc) => bloc.add(ProdutoDelete('PF1')),
      setUp: () async {
        await supabase.from('produtos').insert(produto2);
        bloc.currentData = [produto2];
      },
      expect: () => [
        ProdutoDeleteState([], {'total': 0})
      ],
    );

    final produto3 = {
      'id': 'PF1',
      'nome_produto': 'Produto 2',
      'descricao_padrao': 'Bolo Fake Lilo',
      'image_url': null,
    };

    blocTest(
      'ProdutoBlocUpdate',
      build: () => bloc,
      act: (bloc) => bloc.add(ProdutoUpdate(
        nomeProduto: 'Produto 2',
        codigo: 'PF1',
        descricaoProduto: 'Bolo Fake Lilo',
        imagemProduto: null,
      )),
      setUp: () async {
        await supabase.from('produtos').insert(produto2);
        bloc.currentData = [produto2];
      },
      expect: () => [
        ProdutoUpdateState([produto3], {'total': 1})
      ],
    );

    blocTest(
      'ProdutoBlocFilter',
      build: () => bloc,
      act: (bloc) => bloc.add(ProdutoFilter('nome_produto', 'Produto 2')),
      setUp: () async {
        await supabase.from('produtos').insert(produto2);
        bloc.currentData = [produto2, produto3];
      },
      expect: () => [
        ProdutoFilterState([produto3], {'total': 2})
      ],
    );
  });
}
