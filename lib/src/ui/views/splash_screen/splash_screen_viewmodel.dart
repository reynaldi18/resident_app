import 'dart:async';

import 'package:resident_app/src/app/app.router.dart';
import 'package:resident_app/src/core/core_view_model.dart';
import 'package:resident_app/src/helpers/http_helper.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends FutureViewModel with CoreViewModel {
  final _duration = const Duration(seconds: 2);

  @override
  Future futureToRun() => versionCheck();

  Future versionCheck() async {
    String? token = HttpHelper().getToken();

    if (token != null) {
      Timer(_duration, showDashboard);
    } else {
      Timer(_duration, showLogin);
    }
  }

  void showLogin() => navigationService.replaceWith(Routes.loginView);

  void showDashboard() => navigationService.replaceWith(Routes.mainView);
}
