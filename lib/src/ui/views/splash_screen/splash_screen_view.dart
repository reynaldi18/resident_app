import 'package:flutter/material.dart';
import 'package:resident_app/src/helpers/scalable_dp_helper.dart';
import 'package:resident_app/src/ui/shared/colors.dart';
import 'package:resident_app/src/ui/shared/dimens.dart';
import 'package:resident_app/src/ui/shared/images.dart';
import 'package:stacked/stacked.dart';

import 'splash_screen_viewmodel.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<SplashScreenViewModel>.nonReactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.all(SDP.sdp(21.0)),
                width: SDP.sdp(splashIcon),
                height: SDP.sdp(splashIcon),
                child: Image.asset(logo),
              ),
            )
          ],
        ),
      ),
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
