class ApiConfig {
  const ApiConfig._({
    required this.serverHost,
    required this.serverPort,
    required this.appName,
    required this.version,
  });

  factory ApiConfig.dev({
    String serverHost = '192.168.0.116',
    // String serverHost = '10.0.2.2',
    int serverPort = 8000,
  }) => ApiConfig._(
    serverHost: serverHost,
    serverPort: serverPort,
    appName: 'ChatPet',
    version: '1.0.0',
  );

  final String serverHost;
  final int serverPort;
  final String appName;
  final String version;

  // static const String baseUrl = 'http://192.168.0.116:8000/';

  String get baseUrl => 'http://$serverHost:$serverPort/';

  String get wsUrl => 'ws://$serverHost:$serverPort/';

  static final ApiConfig _current = _createDefaultConfig();

  static ApiConfig get current => _current;

  //todo Prod
  static ApiConfig _createDefaultConfig() {
    return ApiConfig.dev();
  }
}
