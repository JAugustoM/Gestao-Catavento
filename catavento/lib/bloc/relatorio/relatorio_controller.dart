import 'package:catavento/bloc/relatorio/relatorio_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RelatorioController {
  final _client = Supabase.instance.client;
  final RelatorioBloc _bloc;
  late final RealtimeChannel _channel;

  RelatorioController(this._bloc);

  void initialize() async {
    _channel = _client
        .channel('public:demandas')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'demandas',
          callback: (payload) {
            _bloc.add(RelatorioLoad());
          },
        )
        .subscribe();
  }

  Future<void> finalize() async {
    await _client.removeChannel(_channel);
  }
}
