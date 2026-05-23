abstract interface class TokenProvider {
  Stream<bool> get isAuthorized;

  String? get accessToken;
}
