part of 'mock_demanda_bloc.dart';

sealed class DemandaEvent {
  const DemandaEvent();
}

class DemandaFilter extends DemandaEvent {
  final String column;
  final String value;

  const DemandaFilter(this.column, this.value);
}

class DemandaCreate extends DemandaEvent {
  final String nomeDemanda;
  final String codigo;
  final String descricao;
  final String status;
  final File? foto;
  final String? data;
  final String? prazo;

  const DemandaCreate({
    required this.nomeDemanda,
    required this.codigo,
    required this.descricao,
    this.status = "0",
    this.foto,
    this.data,
    this.prazo,
  });
}

class DemandaDelete extends DemandaEvent {
  final int id;

  const DemandaDelete(this.id);
}

class DemandaUpdate extends DemandaEvent {
  final int id;
  final String nomeDemanda;
  final String codigo;
  final String descricao;
  final String? data;
  final String? prazo;

  const DemandaUpdate({
    required this.id,
    required this.nomeDemanda,
    required this.codigo,
    required this.descricao,
    required this.data,
    required this.prazo,
  });
}

class DemandaLoading extends DemandaEvent {}
