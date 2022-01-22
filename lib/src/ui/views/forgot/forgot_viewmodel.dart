import 'package:flutter/material.dart';
import 'package:resident_app/src/core/core_view_model.dart';
import 'package:stacked/stacked.dart';

class ForgotViewModel extends BaseViewModel with CoreViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController nikController = TextEditingController();

  setBirthDateTo(val) {
    birthDateController.text = val;
    notifyListeners();
  }

  void validate(BuildContext context) async {
    if (birthDateController.text.isNotEmpty) {
      if (formKey.currentState?.validate() ?? false) print('validation');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap tentukan tanggal lahir'),
        ),
      );
    }
    notifyListeners();
  }
}
