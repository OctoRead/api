import 'octoread_api.dart';
import 'application_config.dart';

class ApiChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = ApplicationConfig(options.configurationFilePath);
    print(config);
  }

  @override
  Controller get entryPoint {
    final router = new Router();

    router
        .route("/")
        .linkFunction((request) async {
          return Response.ok({
            "package": "octoread_api",
            "name": "api-service",
            "version": "0.0.1"
          });
        });

    return router;
  }
}