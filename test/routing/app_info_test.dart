import 'package:octoread_api/utils/app_info.dart';
import '../harness/app.dart';

Future main() async {
  final harness = Harness()..install();

  test("GET / returns 200 AppInfo response", () async {
    expectResponse(await harness.agent.get("/"), 200, body: AppInfo.toMap());
  });
}
