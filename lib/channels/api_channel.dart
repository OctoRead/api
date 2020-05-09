import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

import '../utils/app_info.dart';

class ApiChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
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