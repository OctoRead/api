import 'package:yaml/yaml.dart';

import 'octoread_api.dart';

class HttpConfig {
  HttpConfig(Map<String,String> config) {
    host = config['host'] ?? "127.0.0.1";
    port = config['port'] ?? "10001";
  }

  String host;
  String port;
}

class Listeners {
  Listeners(Map<String,Map<String,String>> listeners) {
    http = HttpConfig(listeners['http']);
  }

  HttpConfig http;
}

class DatabaseConfig {
  DatabaseConfig(Map<String,String> config) {
    url = config['url'];
  }

  String url;
}

class ApplicationConfig extends Configuration {
  ApplicationConfig(String fileName) : super.fromFile(File(fileName));

  @requiredConfiguration
  Listeners listeners;

  @requiredConfiguration
  DatabaseConfig database;
}