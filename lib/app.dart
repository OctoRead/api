import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:octoread_engine/octoread_engine.dart';

import 'routing/routing.dart';

class OctoreadApiChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    return AppRouter();
  }
}

Application createAppInstance() {
  const configFilePath = "config.yaml";
  final config = ApplicationConfig(configFilePath);

  return Application<OctoreadApiChannel>()
    ..options.configurationFilePath = configFilePath
    ..options.address = config.listeners?.http?.host ?? '127.0.0.1'
    ..options.port = config.listeners?.http?.port ?? 10001;
}
