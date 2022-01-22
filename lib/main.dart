import 'package:flutter/material.dart';
import 'package:resident_app/src/helpers/setup/setup_dialog.dart';

import 'src/app/app.locator.dart';
import 'src/injector/injector.dart';
import 'src/my_app.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupInjector();
    setupLocator();
    setupDialog();
    runApp(const MyApp());
  } catch (error, stacktrace) {
    print('$error & $stacktrace');
  }
}