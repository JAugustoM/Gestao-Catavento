import 'package:catavento/typedefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'trabalho_event.dart';
part 'trabalho_state.dart';

class TrabalhoBloc extends Bloc<TrabalhoEvent, TrabalhoState> {
  final _supabase = Supabase.instance.client;
  DatabaseResponse _currentData = [];

  TrabalhoEvent get initialState => TrabalhoLoading();

  TrabalhoBloc() : super(TrabalhoLoadingState([], {})) {
    on<TrabalhoLoading>(_onLoading);

    on<TrabalhoInit>(_onInit);

    on<TrabalhoFinish>(_onFinish);
  }

  void _onLoading(TrabalhoLoading event, Emitter<TrabalhoState> emit) {}

  void _onInit(TrabalhoInit event, Emitter<TrabalhoState> emit) {}

  void _onFinish(TrabalhoFinish event, Emitter<TrabalhoState> emit) {}
}
