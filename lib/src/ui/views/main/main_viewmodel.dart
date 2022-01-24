import 'package:resident_app/src/app/app.locator.dart';
import 'package:resident_app/src/core/core_res.dart';
import 'package:resident_app/src/models/user.dart';
import 'package:resident_app/src/network/network_exceptions.dart';
import 'package:resident_app/src/network/result_state.dart';
import 'package:resident_app/src/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MainViewModel extends IndexTrackingViewModel {
  final _userService = locator<UserService>();
  User? user;

  Future<ResultState<User>> getContact() async {
    setBusy(true);
    user = await _userService.getUser();
    var result = await _userService.fetchUser();
    setBusy(false);
    return result.when(
      success: (CoreRes<User> data) async {
        emergencyCall(data.data?.first);
        return ResultState.data(data: data.data!.first);
      },
      failure: (NetworkExceptions error, String? message) async {
        return ResultState.error(error: error);
      },
    );
  }

  void emergencyCall(User? userData) async {
    launch('tel://${userData?.client?.clientPhone}');
  }
}
