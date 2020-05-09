import 'dart:io';
import 'package:yaml/yaml.dart';

class AppInfo {
  static YamlMap get spec {
    return loadYaml(File('pubspec.yaml').readAsStringSync()) as YamlMap;
  }

  static Map<String, dynamic> get info {
    final info = {
      "name": spec["name"],
      "version": spec["version"]
    };
    if (Platform.environment['ENV'] != 'production') {
      info["spec"] = spec.value;
    }
    return info;
  }

  static Map toMap() {
    return info;
  }
}