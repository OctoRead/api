import 'package:octoread_api/octoread_api.dart';

Future main() async {
  final instances = Platform.environment["ENV"] == "production"
      ? Platform.numberOfProcessors ~/ 2
      : 1;

  final app = Application<ApiChannel>()
      ..options.configurationFilePath = "config.yaml";
  await app.start(numberOfInstances: instances > 0 ? instances : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}