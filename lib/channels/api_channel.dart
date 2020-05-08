import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

import 'package:octoread_engine/octoread_engine.dart';

import '../utils/app_info.dart';

class ApiChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = ApplicationConfig(options.configurationFilePath);
    options.port = config.listeners?.http?.port ?? 10001;
    options.address = config.listeners?.http?.host ?? '127.0.0.1';
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
        .route("/")
        .linkFunction((request) => Response.ok(AppInfo.toMap()));

    return router;
  }
}