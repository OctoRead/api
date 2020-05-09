import 'package:octoread_api/octoread_api.dart';

import '../utils/app_info.dart';

class AppRouter extends Router {
  AppRouter() {
     initDefaultRoutes();
  }

  void initDefaultRoutes() {
    route("/").linkFunction((request) => Response.ok(AppInfo.toMap()));
  }
}
