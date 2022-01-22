import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resident_app/src/app/app.locator.dart';
import 'package:resident_app/src/constant/config.dart';
import 'package:resident_app/src/helpers/shared_preferences_helper.dart';
import 'package:resident_app/src/injector/injector.dart';
import 'package:stacked_services/stacked_services.dart';

class CoreViewModel {
  final navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();
  final SharedPreferencesHelper sharedPreferencesHelper =
      locatorLocal<SharedPreferencesHelper>();
  BuildContext? currentContext = StackedService.navigatorKey?.currentContext;

  String formattedDate =
      DateFormat(Config.dayDateFormat).format(DateTime.now());
  String dateNow = DateFormat(Config.dateFormat).format(DateTime.now());

  void back() => navigationService.back();
}
