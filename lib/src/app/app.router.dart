// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/empty_house/empty_house_sent_view.dart';
import '../ui/views/empty_house/empty_house_view.dart';
import '../ui/views/forgot/forgot_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/regis/regis_data_view.dart';
import '../ui/views/regis/regis_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String loginView = '/login-view';
  static const String regisView = '/regis-view';
  static const String regisDataView = '/regis-data-view';
  static const String forgotView = '/forgot-view';
  static const String mainView = '/main-view';
  static const String emptyHouseView = '/empty-house-view';
  static const String emptyHouseSentView = '/empty-house-sent-view';
  static const all = <String>{
    splashScreenView,
    loginView,
    regisView,
    regisDataView,
    forgotView,
    mainView,
    emptyHouseView,
    emptyHouseSentView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.regisView, page: RegisView),
    RouteDef(Routes.regisDataView, page: RegisDataView),
    RouteDef(Routes.forgotView, page: ForgotView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.emptyHouseView, page: EmptyHouseView),
    RouteDef(Routes.emptyHouseSentView, page: EmptyHouseSentView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreenView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    RegisView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RegisView(),
        settings: data,
      );
    },
    RegisDataView: (data) {
      var args = data.getArgs<RegisDataViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisDataView(
          key: args.key,
          clientId: args.clientId,
          clusterId: args.clusterId,
        ),
        settings: data,
      );
    },
    ForgotView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ForgotView(),
        settings: data,
      );
    },
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    EmptyHouseView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EmptyHouseView(),
        settings: data,
      );
    },
    EmptyHouseSentView: (data) {
      var args = data.getArgs<EmptyHouseSentViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EmptyHouseSentView(
          key: args.key,
          fromDate: args.fromDate,
          untilDate: args.untilDate,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RegisDataView arguments holder class
class RegisDataViewArguments {
  final Key? key;
  final String clientId;
  final String clusterId;
  RegisDataViewArguments(
      {this.key, required this.clientId, required this.clusterId});
}

/// EmptyHouseSentView arguments holder class
class EmptyHouseSentViewArguments {
  final Key? key;
  final String fromDate;
  final String untilDate;
  EmptyHouseSentViewArguments(
      {this.key, required this.fromDate, required this.untilDate});
}
