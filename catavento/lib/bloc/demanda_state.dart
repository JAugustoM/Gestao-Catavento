part of "demanda_bloc.dart";

sealed class DemandaState {
  final DatabaseResponse databaseResponse;
  final Map<String, int> metaData;

  const DemandaState(this.databaseResponse, this.metaData);
}

class CreateState extends DemandaState {
  CreateState(super.databaseResponse, super.metaData);
}

class DeleteState extends DemandaState {
  DeleteState(super.databaseResponse, super.metaData);
}

class UpdateState extends DemandaState {
  UpdateState(super.databaseResponse, super.metaData);
}

class LoadingState extends DemandaState {
  LoadingState(super.databaseResponse, super.metaData);
}

class FilterState extends DemandaState {
  FilterState(super.databaseResponse, super.metaData);
}

class PhotoSelectedState extends DemandaState {
  final File? fotoSelecionada;

  PhotoSelectedState(
    super.databaseResponse,
    super.metaData,
    this.fotoSelecionada,
  );
}

class PhotoUploadedState extends DemandaState {
  final String fotoUrl;

  PhotoUploadedState(
    super.databaseResponse,
    super.metaData,
    this.fotoUrl,
  );
}

class PhotoSelectionErrorState extends DemandaState {
  final String message;

  PhotoSelectionErrorState(
    super.databaseResponse,
    super.metaData,
    this.message,
  );
}

class PhotoUploadErrorState extends DemandaState {
  final String error;

  PhotoUploadErrorState(
    super.databaseResponse,
    super.metaData,
    this.error,
  );
}

class PhotoUploadSuccessState extends DemandaState {
  final String publicUrl;

  PhotoUploadSuccessState(
    super.databaseResponse,
    super.metaData,
    this.publicUrl,
  );
}
