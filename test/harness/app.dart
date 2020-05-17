import 'dart:async';
import 'package:aqueduct_test/aqueduct_test.dart';
import 'package:octoread_api/octoread_api.dart';

export 'dart:async';
export 'package:aqueduct/aqueduct.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:octoread_api/octoread_api.dart';
export 'package:test/test.dart';

/// A testing harness for octoread_api.
///
/// A harness for testing an aqueduct application. Example test file:
///
///         void main() {
///           Harness harness = Harness()..install();
///
///           test("GET /path returns 200", () async {
///             final response = await harness.agent.get("/path");
///             expectResponse(response, 200);
///           });
///         }
///
class Harness extends TestHarness<OctoreadApiChannel> {
  @override
  Future onSetUp() async {

  }

  @override
  Future onTearDown() async {

  }
}
