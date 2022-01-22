import 'package:flutter/material.dart';
import 'package:resident_app/src/app/app.locator.dart';
import 'package:resident_app/src/app/app.router.dart';
import 'package:resident_app/src/core/core_res.dart';
import 'package:resident_app/src/core/core_view_model.dart';
import 'package:resident_app/src/network/network_exceptions.dart';
import 'package:resident_app/src/network/result_state.dart';
import 'package:resident_app/src/services/auth_service.dart';
import 'package:resident_app/src/ui/shared/strings.dart';
import 'package:stacked/stacked.dart';

class RegisDataViewModel extends BaseViewModel with CoreViewModel {
  final _authService = locator<AuthService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  final String clientId;
  final String clusterId;

  RegisDataViewModel({
    required this.clientId,
    required this.clusterId,
  });

  bool obscure = true;
  bool reObscure = true;

  void validate() async {
    if (formKey.currentState?.validate() ?? false) regis();
    notifyListeners();
  }

  Future<ResultState<CoreRes>> regis() async {
    setBusy(true);
    var result = await _authService.regis(
      clientId: clientId,
      clusterId: clusterId,
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      address: addressController.text,
      password: passwordController.text,
    );
    setBusy(false);
    return result.when(
      success: (CoreRes data) async {
        ScaffoldMessenger.of(currentContext!).showSnackBar(
          const SnackBar(
            content: Text(Strings.messageRegisSuccess),
          ),
        );
        showLogin();
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (NetworkExceptions error, String? message) async {
        ScaffoldMessenger.of(currentContext!).showSnackBar(
          SnackBar(
            content: Text(message ?? ''),
          ),
        );
        notifyListeners();
        return ResultState.error(error: error);
      },
    );
  }

  void showLogin() => navigationService.replaceWith(Routes.loginView);
}
