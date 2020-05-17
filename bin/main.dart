import 'dart:io';
import 'dart:async';
import 'package:octoread_api/app.dart';

Future main() async {
  final app = createAppInstance();

  switch(Platform.environment["ENV"]) {
    case "local" :
      await app.startOnCurrentIsolate();
      break;

    default:
      final instances = (Platform.numberOfProcessors ~/ 2).ceil();
      await app.start(numberOfInstances: instances);
  }


  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}