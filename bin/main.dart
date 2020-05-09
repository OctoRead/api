import 'dart:io';
import 'dart:async';
import 'package:octoread_api/app.dart';

Future main() async {
  final app = createAppInstance();

  final instances = Platform.environment["ENV"] == "production"
      ? Platform.numberOfProcessors ~/ 2 : 1;

  await app.start(numberOfInstances: instances > 0 ? instances : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}