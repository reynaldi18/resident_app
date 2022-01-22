import 'package:flutter/material.dart';
import 'package:resident_app/src/app/app.locator.dart';
import 'package:resident_app/src/app/app.router.dart';
import 'package:resident_app/src/helpers/scalable_dp_helper.dart';
import 'package:resident_app/src/ui/shared/colors.dart';
import 'package:resident_app/src/ui/shared/dimens.dart';
import 'package:resident_app/src/ui/shared/images.dart';
import 'package:resident_app/src/ui/shared/strings.dart';
import 'package:resident_app/src/ui/shared/styles.dart';
import 'package:resident_app/src/ui/shared/ui_helpers.dart';
import 'package:resident_app/src/ui/widgets/chip.dart';
import 'package:stacked_services/stacked_services.dart';

class EmptyHouseSentView extends StatefulWidget {
  final String fromDate;
  final String untilDate;

  const EmptyHouseSentView({
    Key? key,
    required this.fromDate,
    required this.untilDate,
  }) : super(key: key);

  @override
  State<EmptyHouseSentView> createState() => _EmptyHouseSentViewState();
}

class _EmptyHouseSentViewState extends State<EmptyHouseSentView> {
  final _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              BaseColors.background,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(SDP.sdp(21.0)),
                  width: SDP.sdp(200.0),
                  height: SDP.sdp(200.0),
                  child: Image.asset(emptyHouseSent),
                ),
              ),
              verticalSpace(SDP.sdp(75.0)),
              Text(
                Strings.messageReportEmptyHouse,
                style: blackBoldTextStyle.copyWith(
                  fontSize: SDP.sdp(headline3),
                ),
              ),
              verticalSpace(SDP.sdp(27.0)),
              Text(
                Strings.messageProtectEmptyHouse,
                style: blackRegularTextStyle.copyWith(
                  fontSize: SDP.sdp(headline6),
                ),
              ),
              verticalSpace(SDP.sdp(4.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.fromDate,
                    style: mainSemiBoldTextStyle.copyWith(
                      fontSize: SDP.sdp(headline6),
                    ),
                  ),
                  Text(
                    ' s/d ',
                    style: blackRegularTextStyle.copyWith(
                      fontSize: SDP.sdp(headline6),
                    ),
                  ),
                  Text(
                    widget.untilDate,
                    style: mainSemiBoldTextStyle.copyWith(
                      fontSize: SDP.sdp(headline6),
                    ),
                  ),
                ],
              ),
              verticalSpace(SDP.sdp(42.0)),
              SizedBox(
                width: double.infinity,
                height: SDP.sdp(50.0),
                child: KChip(
                  padding: EdgeInsets.symmetric(
                    vertical: SDP.sdp(14.0),
                  ),
                  loadingColor: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SDP.sdp(smallRadius),
                  ),
                  color: BaseColors.main,
                  child: Center(
                    child: Text(
                      Strings.actionBackHome,
                      style: whiteBoldTextStyle.copyWith(
                        fontSize: SDP.sdp(headline4),
                      ),
                    ),
                  ),
                  onPressed: () =>
                      _navigationService.clearTillFirstAndShow(Routes.mainView),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
