class OperationResult {
  final int? httpCode;

  final String? message;

  final StatusHttps statusHttps;

  final Object? data;

  OperationResult(this.data,
      {this.httpCode, this.message, required this.statusHttps});

  static StatusHttps translateStatusHttps(int? code) {
    switch (code) {
      case 200:
        return StatusHttps.ok;

      case 401 || 403:
        return StatusHttps.unauthorized;

      case 300:
        return StatusHttps.faildRequest;

      default:
        return StatusHttps.badRequest;
    }
  }
}

enum StatusHttps {
  ok,
  unauthorized,
  badRequest,
  faildRequest,
}
