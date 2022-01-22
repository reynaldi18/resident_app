import 'package:resident_app/src/app/app.locator.dart';
import 'package:resident_app/src/models/user.dart';
import 'package:resident_app/src/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MainViewModel extends IndexTrackingViewModel {
  final _userService = locator<UserService>();
  User? user;

  void emergencyCall() async {
    user = await _userService.getUser();
    launch('tel://${user?.client?.clientPhone}');
  }
}
