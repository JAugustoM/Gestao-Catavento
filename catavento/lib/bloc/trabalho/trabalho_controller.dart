import 'package:catavento/bloc/trabalho/trabalho_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TrabalhoController {
  final _client = Supabase.instance.client;
  final TrabalhoBloc _bloc;
  late final RealtimeChannel _channel;

  TrabalhoController(this._bloc);

  void initialize() async {
    _channel = _client
        .channel('public:trabalho')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'trabalho',
          callback: (payload) {
            _bloc.add(TrabalhoAdmin());
          },
        )
        .subscribe();
  }

  Future<void> finalize() async {
    await _client.removeChannel(_channel);
  }
}
