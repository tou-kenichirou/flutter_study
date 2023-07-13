sealed class AppException implements Exception {
  AppException(this.code, this.message);

  final String code;
  final String message;

  String details() => message;
}

final class AlreadyExistsException extends AppException {
  AlreadyExistsException()
      : super(
    'already-exists',
    'このニュースは重複しています',
  );
}
