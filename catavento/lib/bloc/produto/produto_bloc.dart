import 'dart:io';

import 'package:catavento/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'produto_event.dart';
part 'produto_state.dart';

class ProdutoBloc extends Bloc<ProdutoEvent, ProdutoState> {
  final _supabase = Supabase.instance.client;
  DatabaseResponse _currentData = [];
  ProdutoEvent get initialState => ProdutoLoading();

  ProdutoBloc() : super(ProdutoLoadingState([], {})) {
    on<ProdutoFilter>(_onFilter);

    on<ProdutoLoading>(_onLoading);

    on<ProdutoCreate>(_onCreate);

    on<ProdutoDelete>(_onDelete);

    on<ProdutoUpdate>(_onUpdate);
  }

  void _onFilter(ProdutoFilter event, Emitter<ProdutoState> emit) {
    final column = event.column;
    var value = event.value;
    DatabaseResponse newData = [];

    if (value != "") {
      value = value.toLowerCase();

      for (var data in _currentData) {
        if (data[column] != null) {
          var string = data[column] as String;
          string = string.toLowerCase();

          if (string.contains(value)) {
            newData.add(data);
          }
        }
      }
    }

    final metaData = _countProdutos();

    if (newData.isEmpty) {
      emit(ProdutoFilterState(_currentData, metaData));
    } else {
      emit(ProdutoFilterState(newData, metaData));
    }
  }

  void _onLoading(ProdutoLoading event, Emitter<ProdutoState> emit) async {
    final response = await _supabase.from('produtos').select();
    _currentData = response;
    final metaData = _countProdutos();
    emit(ProdutoLoadingState(_currentData, metaData));
  }

  void _onCreate(ProdutoCreate event, Emitter<ProdutoState> emit) async {
    final produto = {
      'id': event.codigo,
      'nome_produto': event.nomeProduto,
      'descricao_padrao': event.descricaoPadrao,
    };

    if (event.imagemProduto != null && event.imagemProduto!.existsSync()) {
      produto['image_url'] = await _uploadImage(
        event.imagemProduto!,
        event.codigo,
      );
    }
    if (produto['nome_produto']!.isNotEmpty && produto['id']!.isNotEmpty) {
      try {
        final response =
            await _supabase.from('produtos').insert(produto).select();

        if (response.isNotEmpty) {
          _currentData.add(response[0]);

          final metaData = _countProdutos();

          emit(ProdutoCreateState(_currentData, metaData));
        } else {
          final metaData = _countProdutos();

          emit(ProdutoErrorState(
            _currentData,
            metaData,
            "Erro ao adicionar produto",
          ));
        }
      } catch (e) {
        final metaData = _countProdutos();

        emit(ProdutoErrorState(
          _currentData,
          metaData,
          "Erro ao adicionar produto - $e",
        ));
      }
    }
  }

  void _onDelete(ProdutoDelete event, Emitter<ProdutoState> emit) async {
    final produto = _currentData.firstWhere(
      (test) => test['id'] == event.id,
      orElse: () => {},
    );

    late final String? imagem;

    if (produto['image_url'] != null) {
      final imagemUrl = produto['image_url'];
      imagem = imagemUrl.split('/').last;
    } else {
      imagem = null;
    }

    if (produto.isNotEmpty) {
      try {
        final response = await _supabase
            .from('produtos')
            .delete()
            .eq('id', event.id)
            .select();

        if (response.isNotEmpty) {
          _currentData.removeWhere((produto) => produto['id'] == event.id);
          if (imagem != null) {
            await _supabase.storage.from('imagens').remove([imagem]);
          }
          final metaData = _countProdutos();
          emit(ProdutoDeleteState(_currentData, metaData));
        } else {
          final metaData = _countProdutos();

          emit(ProdutoErrorState(
            _currentData,
            metaData,
            "Produto não encontrado",
          ));
        }
      } catch (e) {
        final metaData = _countProdutos();

        emit(ProdutoErrorState(
          _currentData,
          metaData,
          "Erro ao deletar produto - $e",
        ));
      }
    }
  }

  void _onUpdate(ProdutoUpdate event, Emitter<ProdutoState> emit) async {
    final produtoAtualizado = {};

    if (event.nomeProduto.isNotEmpty) {
      produtoAtualizado['nome_produto'] = event.nomeProduto;
    }

    if (event.descricaoProduto.isNotEmpty) {
      produtoAtualizado['descricao_padrao'] = event.descricaoProduto;
    }

    if (event.imagemProduto != null) {
      final filePath = await _uploadImage(event.imagemProduto!, event.codigo);
      produtoAtualizado['image_url'] = filePath;
    }

    try {
      final response = await _supabase
          .from('produtos')
          .update(produtoAtualizado)
          .eq('id', event.codigo)
          .select();

      if (response.isNotEmpty) {
        _currentData = _currentData.map((produto) {
          if (produto['id'] == event.codigo) {
            return response[0];
          }
          return produto;
        }).toList();

        final metaData = _countProdutos();
        emit(ProdutoUpdateState(_currentData, metaData));
      } else {
        final metaData = _countProdutos();

        emit(ProdutoErrorState(
          _currentData,
          metaData,
          "Erro ao atualizar produto",
        ));
      }
    } catch (e) {
      final metaData = _countProdutos();

      emit(ProdutoErrorState(
        _currentData,
        metaData,
        "Erro ao atualizar produto - $e",
      ));
    }
  }

  Future<String> _uploadImage(File image, String codigo) async {
    try {
      final imageName = '${DateTime.now().millisecondsSinceEpoch}_$codigo';
      final response =
          await _supabase.storage.from('imagens').upload(imageName, image);

      if (response.isNotEmpty) {
        final publicUrl =
            _supabase.storage.from('imagens').getPublicUrl(imageName);
        return publicUrl;
      } else {
        throw Exception('Erro ao fazer upload da imagem: $response');
      }
    } catch (e) {
      throw Exception('Erro ao fazer upload da imagem: $e');
    }
  }

  Map<String, int> _countProdutos() {
    int numProdutos = _currentData.length;
    final metaData = {"total": numProdutos};
    return metaData;
  }

  String? getImageUrl(String? id) {
    if (id == null) {
      return null;
    } else {
      final produto = _currentData.firstWhere(
        (data) => data['id'] == id,
        orElse: () => {},
      );
      if (produto.isNotEmpty && produto['image_url'] != null) {
        return produto['image_url'];
      } else {
        return null;
      }
    }
  }
}
