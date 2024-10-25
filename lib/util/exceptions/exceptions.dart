import 'package:dio/dio.dart';

String _message(String? message) => message != null ? '\n\n$message' : '';

class NoInternetConnectionException implements Exception {
  String? message;

  NoInternetConnectionException({this.message});

  @override
  String toString() {
    return 'Sem conexão com a internet.${_message(message)}';
  }
}

class ServerConnectionException implements Exception {
  String? message;
  DioExceptionType? dioErrorType;

  ServerConnectionException({this.message, this.dioErrorType});

  @override
  String toString() {
    return 'Falha na conexão com o servidor. Por favor, verifique sua conexão com internet e tente novamente.\nCaso o problema persista, entre em contato com um administrador.${_message(message)}';
  }
}

class ServerErrorException implements Exception {
  String? message;

  ServerErrorException({required this.message});

  @override
  String toString() {
    return message ??
        'Falha no servidor. Por favor, verifique sua conexão com internet e tente novamente.\nCaso o problema persista, entre em contato com um administrador.';
  }
}

class UserReadException implements Exception {
  String? message;

  UserReadException({this.message});

  @override
  String toString() {
    return 'Falha ao ler os dados do usuário.${_message(message)}';
  }
}

class FotoUploadException implements Exception {
  String id;
  String path;
  String? message;

  FotoUploadException({
    required this.id,
    required this.path,
    this.message,
  });

  @override
  String toString() {
    return 'Falha no upload da foto.\n\n[ID]: $id\n[PATH]: $path${_message(message)}';
  }
}

class RemoteException implements Exception {
  int? remoteId;
  String? message;

  RemoteException({this.remoteId, this.message});

  @override
  String toString() {
    return message ?? 'Erro desconhecido.';
  }
}

class NoDataForSyncException implements Exception {
  String? message;

  NoDataForSyncException({this.message});
}
