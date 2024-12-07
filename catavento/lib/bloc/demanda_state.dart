part of "demanda_bloc.dart";

sealed class DemandaState {
  final DatabaseResponse databaseResponse;
  final DatabaseResponse data;

  // Change to named parameters
  const DemandaState({required this.databaseResponse, this.data = const []});
}


class CreateState extends DemandaState {
  CreateState(DatabaseResponse databaseResponse) : super(databaseResponse: databaseResponse);
}

class DeleteState extends DemandaState {
  DeleteState(DatabaseResponse databaseResponse) : super(databaseResponse: databaseResponse);
}

class LoadingState extends DemandaState {
  LoadingState(DatabaseResponse databaseResponse) : super(databaseResponse: databaseResponse);
}

class FilterState extends DemandaState {
  FilterState(DatabaseResponse databaseResponse) : super(databaseResponse: databaseResponse);
}



class PhotoSelectedState extends DemandaState {
  final File? fotoSelecionada;

  // Provide a default empty response for databaseResponse if not provided
  PhotoSelectedState(this.fotoSelecionada, {DatabaseResponse databaseResponse = const []})
      : super(databaseResponse: databaseResponse);
}

class PhotoUploadedState extends DemandaState {
  final String fotoUrl;
  
  PhotoUploadedState(this.fotoUrl, {DatabaseResponse databaseResponse = const []}) 
      : super(databaseResponse:databaseResponse); // Pass databaseResponse to super constructor
}

class PhotoSelectionErrorState extends DemandaState {
  final String message;
  
  PhotoSelectionErrorState(this.message, {DatabaseResponse databaseResponse = const []})
      : super(databaseResponse: databaseResponse); // Pass databaseResponse to super constructor
}

class PhotoUploadErrorState extends DemandaState {
  final String error;
  
  PhotoUploadErrorState(this.error, {DatabaseResponse databaseResponse = const []})
      : super(databaseResponse: databaseResponse);
}

class PhotoUploadSuccessState extends DemandaState {
  final String publicUrl; // This will hold the URL of the uploaded image

  PhotoUploadSuccessState(this.publicUrl, {DatabaseResponse
  databaseResponse = const[]}):super(databaseResponse: databaseResponse);
}
