import 'package:resident_app/src/app/app.locator.dart';
import 'package:resident_app/src/app/app.router.dart';
import 'package:resident_app/src/core/core_res.dart';
import 'package:resident_app/src/core/core_res_single.dart';
import 'package:resident_app/src/core/core_view_model.dart';
import 'package:resident_app/src/models/absent.dart';
import 'package:resident_app/src/models/house.dart';
import 'package:resident_app/src/models/user.dart';
import 'package:resident_app/src/network/network_exceptions.dart';
import 'package:resident_app/src/network/result_state.dart';
import 'package:resident_app/src/services/home_service.dart';
import 'package:resident_app/src/services/user_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel with CoreViewModel {
  final _userService = locator<UserService>();
  final _homeService = locator<HomeService>();
  User? user;
  House? emptyHouse;
  List<Absent>? securityActive;

  @override
  Future futureToRun() => getUser();

  Future<ResultState<User>> getUser() async {
    var result = await _userService.fetchUser();
    return result.when(
      success: (CoreRes<User> data) async {
        user = data.data?.first;
        notifyListeners();
        getSecurity();
        getEmptyHouse();
        return ResultState.data(data: data.data!.first);
      },
      failure: (NetworkExceptions error, String? message) async {
        return ResultState.error(error: error);
      },
    );
  }

  Future<ResultState<List<Absent>>> getSecurity() async {
    var result = await _homeService.fetchSecurity(
      user?.cluster?.clusterId.toString() ?? '',
    );
    return result.when(
      success: (CoreRes<Absent> data) async {
        securityActive = data.data;
        notifyListeners();
        return ResultState.data(data: data.data!);
      },
      failure: (NetworkExceptions error, String? message) async {
        return ResultState.error(error: error);
      },
    );
  }

  Future<ResultState<House>> getEmptyHouse() async {
    var result = await _homeService.fetchEmptyHouse(
      user?.cluster?.clusterId.toString() ?? '',
      user?.userId.toString() ?? '',
    );
    return result.when(
      success: (CoreResSingle<House> data) async {
        emptyHouse = data.data;
        notifyListeners();
        return ResultState.data(data: data.data!);
      },
      failure: (NetworkExceptions error, String? message) async {
        return ResultState.error(error: error);
      },
    );
  }

  void showReportEmptyHouse() =>
      navigationService.navigateTo(Routes.emptyHouseView);
}
