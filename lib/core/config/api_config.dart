class ApiConfig {
  const ApiConfig._({
    required this.serverHost,
    required this.serverPort,
    required this.appName,
    required this.version,
    this.useTls = false,
  });

  factory ApiConfig.dev({
    String serverHost = '192.168.0.116',
    int serverPort = 8000,
  }) => ApiConfig._(
    serverHost: serverHost,
    serverPort: serverPort,
    appName: 'ChatPet',
    version: '1.0.0',
  );

  factory ApiConfig.prod() => const ApiConfig._(
    serverHost: 'chat-backend-9n4f.onrender.com',
    serverPort: 443,
    appName: 'ChatPet',
    version: '1.0.0',
    useTls: true,
  );

  final String serverHost;
  final int serverPort;
  final String appName;
  final String version;
  final bool useTls;

  String get baseUrl => Uri(
    scheme: useTls ? 'https' : 'http',
    host: serverHost,
    port: serverPort,
    path: '/',
  ).toString();

  String get wsUrl => Uri(
    scheme: useTls ? 'wss' : 'ws',
    host: serverHost,
    port: serverPort,
    path: '/',
  ).toString();

  static ApiConfig _current = ApiConfig.prod();
  static bool _selected = false;

  static ApiConfig get current => _current;

  /// Must be called before creating dependencies or network clients.
  static void select(ApiConfig config) {
    if (_selected) {
      throw StateError('Restart the app to select a different server.');
    }
    _current = config;
    _selected = true;
  }
}
