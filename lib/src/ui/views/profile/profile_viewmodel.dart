import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resident_app/src/app/app.locator.dart';
import 'package:resident_app/src/app/app.router.dart';
import 'package:resident_app/src/core/core_res.dart';
import 'package:resident_app/src/core/core_view_model.dart';
import 'package:resident_app/src/enum/dialog_type.dart';
import 'package:resident_app/src/models/user.dart';
import 'package:resident_app/src/network/network_exceptions.dart';
import 'package:resident_app/src/network/result_state.dart';
import 'package:resident_app/src/services/auth_service.dart';
import 'package:resident_app/src/services/user_service.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends FutureViewModel with CoreViewModel {
  final _userService = locator<UserService>();
  final _authService = locator<AuthService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formChangePasswordKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController clusterController = TextEditingController();
  final TextEditingController clientController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController reNewPasswordController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  bool oldObscure = true;
  bool newObscure = true;
  bool reNewObscure = true;

  User? user;
  bool isEdit = false;
  bool isChangePassword = false;

  File? imagePicked;

  @override
  Future futureToRun() => getUser();

  Future getUser() async {
    var result = await _userService.getUser();
    user = result;
    emailController.text = result.email ?? '';
    phoneController.text = result.phone ?? '';
    clusterController.text = result.cluster?.clusterName ?? '';
    clientController.text = result.client?.clientName ?? '';
    notifyListeners();
  }

  void validate() async {
    if (emailController.text != user?.email ||
        phoneController.text != user?.phone) {
      if (formKey.currentState?.validate() ?? false) saveEdit();
    }
    if (imagePicked != null) {
      photoEdit();
    } else {
      isEdit = false;
    }
    notifyListeners();
  }

  Future<ResultState> saveEdit() async {
    setBusy(true);
    var result = await _userService.editUser(
      emailController.text,
      phoneController.text,
    );
    setBusy(false);
    return result.when(
      success: (CoreRes data) async {
        isEdit = false;
        await _userService.fetchUser();
        if (imagePicked != null) photoEdit();
        getUser();
        notifyListeners();
        return ResultState.data(data: data.data!);
      },
      failure: (NetworkExceptions error, String? message) async {
        return ResultState.error(error: error);
      },
    );
  }

  Future<ResultState> photoEdit() async {
    setBusy(true);
    var result = await _userService.editPhoto(
      emailController.text,
      imagePicked!,
    );
    setBusy(false);
    return result.when(
      success: (CoreRes data) async {
        isEdit = false;
        await _userService.fetchUser();
        getUser();
        notifyListeners();
        return ResultState.data(data: data.data!);
      },
      failure: (NetworkExceptions error, String? message) async {
        return ResultState.error(error: error);
      },
    );
  }

  Future<bool> showLogoutConfirmDialog({
    String? title,
    String? negativeLabel,
    String? positiveLabel,
  }) async {
    var response = await dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.confirmation,
      title: title,
      mainButtonTitle: positiveLabel,
      secondaryButtonTitle: negativeLabel,
    );
    if (response!.confirmed == true) logout();

    return response.confirmed;
  }

  void logout() {
    sharedPreferencesHelper.clearAll();
    navigationService.replaceWith(Routes.loginView);
  }

  void validateChangePassword(BuildContext context) async {
    if (formChangePasswordKey.currentState?.validate() ?? false) changePassword(context);
    notifyListeners();
  }

  Future<ResultState<CoreRes>> changePassword(BuildContext context) async {
    isChangePassword = true;
    var result = await _authService.changePassword(
      user?.email ?? '',
      oldPasswordController.text,
      newPasswordController.text,
    );
    isChangePassword = false;
    notifyListeners();
    return result.when(
      success: (CoreRes data) async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password berhasil diubah'),
          ),
        );
        oldPasswordController.clear();
        newPasswordController.clear();
        reNewPasswordController.clear();
        oldObscure = true;
        newObscure = true;
        reNewObscure = true;
        back();
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (NetworkExceptions error, String? message) async {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message ?? '')),
        );
        notifyListeners();
        return ResultState.error(error: error);
      },
    );
  }
}
