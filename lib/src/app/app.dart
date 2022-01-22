import 'package:resident_app/src/services/auth_service.dart';
import 'package:resident_app/src/services/home_service.dart';
import 'package:resident_app/src/services/user_service.dart';
import 'package:resident_app/src/ui/views/empty_house/empty_house_sent_view.dart';
import 'package:resident_app/src/ui/views/empty_house/empty_house_view.dart';
import 'package:resident_app/src/ui/views/forgot/forgot_view.dart';
import 'package:resident_app/src/ui/views/login/login_view.dart';
import 'package:resident_app/src/ui/views/main/main_view.dart';
import 'package:resident_app/src/ui/views/regis/regis_data_view.dart';
import 'package:resident_app/src/ui/views/regis/regis_view.dart';
import 'package:resident_app/src/ui/views/splash_screen/splash_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisView),
    MaterialRoute(page: RegisDataView),
    MaterialRoute(page: ForgotView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: EmptyHouseView),
    MaterialRoute(page: EmptyHouseSentView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: HomeService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
  /** flutter pub run build_runner build --delete-conflicting-outputs */
}
