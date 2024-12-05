import 'package:catavento/bloc/demanda_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DemandaController {
  final client = Supabase.instance.client;
  final DemandaBloc bloc;
  late final RealtimeChannel channel;

  DemandaController(this.bloc);

  void initialize() async {
    await client.removeAllChannels();
    channel = client
        .channel('public:demandas')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'demandas',
          callback: (payload) {
            bloc.add(DemandaLoading());
          },
        )
        .subscribe();
  }

  Future<void> finalize() async {
    await client.removeChannel(channel);
  }
}
