import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resident_app/src/app/app.locator.dart';
import 'package:resident_app/src/app/app.router.dart';
import 'package:resident_app/src/constant/config.dart';
import 'package:resident_app/src/core/core_res_single.dart';
import 'package:resident_app/src/core/core_view_model.dart';
import 'package:resident_app/src/models/user.dart';
import 'package:resident_app/src/network/network_exceptions.dart';
import 'package:resident_app/src/network/result_state.dart';
import 'package:resident_app/src/services/home_service.dart';
import 'package:resident_app/src/services/user_service.dart';
import 'package:stacked/stacked.dart';

class EmptyHouseViewModel extends BaseViewModel with CoreViewModel {
  final _homeService = locator<HomeService>();
  final _userService = locator<UserService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController untilDateController = TextEditingController();
  final TextEditingController noteDateController = TextEditingController();

  User? user;
  String? fromDate;
  String? untilDate;

  setFromDate(val) {
    fromDate = DateFormat(Config.dateFormatAPI).format(DateTime.parse(val));
    fromDateController.text = val;
    notifyListeners();
  }

  setUntilDate(val) {
    untilDate = DateFormat(Config.dateFormatAPI).format(DateTime.parse(val));
    untilDateController.text = val;
    notifyListeners();
  }

  void validate(BuildContext context) async {
    if (fromDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap tentukan tanggal dari'),
        ),
      );
    } else if (untilDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap tentukan tanggal sampai'),
        ),
      );
    } else {
      if (formKey.currentState?.validate() ?? false) getEmptyHouse();
    }
    notifyListeners();
  }

  Future<ResultState<CoreResSingle>> getEmptyHouse() async {
    user = await _userService.getUser();
    var result = await _homeService.createEmptyHouse(
      user?.cluster?.clusterId.toString() ?? '',
      user?.userId.toString() ?? '',
      fromDate ?? '',
      untilDate ?? '',
      noteDateController.text,
    );
    return result.when(
      success: (CoreResSingle data) async {
        showSuccess();
        notifyListeners();
        return ResultState.data(data: data.data!);
      },
      failure: (NetworkExceptions error, String? message) async {
        return ResultState.error(error: error);
      },
    );
  }

  void showSuccess() => navigationService.navigateTo(
        Routes.emptyHouseSentView,
        arguments: EmptyHouseSentViewArguments(
          fromDate: fromDate ?? '-',
          untilDate: untilDate ?? '-',
        ),
      );
}
