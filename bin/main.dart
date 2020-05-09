import 'package:octoread_api/octoread_api.dart';
import 'package:octoread_engine/octoread_engine.dart';

Future main() async {
  final instances = Platform.environment["ENV"] == "production"
      ? Platform.numberOfProcessors ~/ 2
      : 1;

  final config = ApplicationConfig("config.yaml");
  final app = Application<ApiChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.address = config.listeners?.http?.host ?? '127.0.0.1'
      ..options.port = config.listeners?.http?.port ?? 10001;
  await app.start(numberOfInstances: instances > 0 ? instances : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}