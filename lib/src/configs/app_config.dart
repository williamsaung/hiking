import '../constants/export_constants.dart';

final baseUrl = Environments.server;

const String sentryUrl = "";

const int refreshTime = 30;

class Environments {
  static late Map<String, dynamic> _config;

  static String _baseUrl = _config[_Config.server];
  static bool _showSelectServer = false;

  static String getBaseUrl() {
    return _baseUrl;
  }

  static bool getShowSelectServer() {
    return _showSelectServer;
  }

  static void setShowSelectServer(bool value) {
    _showSelectServer = value;
  }

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.local:
        _config = _Config.localConstants;
        break;
      case Environment.dev:
        _config = _Config.devConstants;
        break;
      case Environment.uat:
        _config = _Config.uatConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
    _baseUrl = _config[_Config.server];
  }

  static String get server {
    return _config[_Config.server];
  }

  static String get name {
    return _config[_Config.name];
  }

  static Environment get getEnvironment {
    return _config[_Config.environment];
  }
}

class _Config {
  static const String server = 'SERVER';
  static const String name = 'NAME';
  static const String environment = 'ENVIRONMENT';

  static Map<String, dynamic> localConstants = {
    server: '192.168.1.111:8000',
    name: 'local',
    environment: Environment.local,
  };

  static Map<String, dynamic> devConstants = {
    server: '192.168.1.104:8000',
    name: 'dev',
    environment: Environment.dev,
  };

  static Map<String, dynamic> uatConstants = {
    server: 'url',
    name: 'uat',
    environment: Environment.uat,
  };

  static Map<String, dynamic> prodConstants = {
    server: 'url',
    name: 'prod',
    environment: Environment.prod,
  };
}
