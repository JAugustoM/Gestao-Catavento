import 'package:catavento/bloc/demanda_bloc.dart';

typedef CardCallback = Future<void> Function(
    int id, int order, DemandaBloc bloc);
typedef DatabaseResponse = List<Map<String, dynamic>>;
