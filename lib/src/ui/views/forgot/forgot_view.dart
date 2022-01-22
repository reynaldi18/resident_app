import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resident_app/src/constant/config.dart';
import 'package:resident_app/src/helpers/date_time_format.dart';
import 'package:resident_app/src/helpers/scalable_dp_helper.dart';
import 'package:resident_app/src/helpers/validator/validator.dart';
import 'package:resident_app/src/ui/shared/colors.dart';
import 'package:resident_app/src/ui/shared/dimens.dart';
import 'package:resident_app/src/ui/shared/images.dart';
import 'package:resident_app/src/ui/shared/strings.dart';
import 'package:resident_app/src/ui/shared/styles.dart';
import 'package:resident_app/src/ui/shared/ui_helpers.dart';
import 'package:resident_app/src/ui/widgets/chip.dart';
import 'package:resident_app/src/ui/widgets/textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'forgot_viewmodel.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({Key? key}) : super(key: key);

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<ForgotViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.background,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SDP.sdp(defaultPadding),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SDP.sdp(67.0),
                    child: Image.asset(logoText),
                  ),
                  verticalSpace(SDP.sdp(58.0)),
                  SizedBox(
                    height: SDP.sdp(199.0),
                    width: SDP.sdp(199.0),
                    child: SvgPicture.asset(iconPassword),
                  ),
                  verticalSpace(SDP.sdp(47.0)),
                  Text(
                    Strings.messageForgotPasswordDesc,
                    style: blackRegularTextStyle.copyWith(
                      fontSize: SDP.sdp(headline4),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(SDP.sdp(smallPadding)),
                  Form(
                    key: vm.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        KTextField(
                          isDense: true,
                          borderRadius: SDP.sdp(smallRadius),
                          controller: vm.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          placeholder: Strings.hintEmail,
                          placeholderStyle: hintRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(hint),
                          ),
                          validator: Validator.emailValidator,
                        ),
                        verticalSpace(SDP.sdp(10.0)),
                        GestureDetector(
                          onTap: () {
                            showAlertDialog(context, vm);
                          },
                          child: Container(
                            width: screenWidth(context),
                            height: SDP.sdp(44.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(
                                SDP.sdp(smallRadius),
                              ),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: SDP.sdp(smallPadding),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vm.birthDateController.text.isNotEmpty ? Text(
                                  FormatDate().formatDate(
                                    vm.birthDateController.text,
                                    context: context,
                                    format: Config.dateFormat,
                                  ),
                                  style: hintRegularTextStyle.copyWith(
                                    fontSize: SDP.sdp(hint),
                                  ),
                                ) : Text(
                                  'Tanggal Lahir',
                                  style: hintRegularTextStyle.copyWith(
                                    fontSize: SDP.sdp(hint),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpace(SDP.sdp(10.0)),
                        KTextField(
                          isDense: true,
                          borderRadius: SDP.sdp(smallRadius),
                          controller: vm.nikController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (val) => vm.validate(context),
                          backgroundColor: Colors.white.withOpacity(0.8),
                          placeholder: Strings.hintNIK,
                          placeholderStyle: hintRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(hint),
                          ),
                          validator: Validator.requiredValidator,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(SDP.sdp(20.0)),
                  SizedBox(
                    width: double.infinity,
                    height: SDP.sdp(50.0),
                    child: KChip(
                      isLoading: vm.isBusy,
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
                          Strings.actionResetPassword,
                          style: whiteBoldTextStyle.copyWith(
                            fontSize: SDP.sdp(headline4),
                          ),
                        ),
                      ),
                      onPressed: () => vm.validate(context),
                    ),
                  ),
                  verticalSpace(SDP.sdp(defaultPadding)),
                  InkWell(
                    onTap: () => vm.back(),
                    child: Text(
                      Strings.labelLogin,
                      style: mainSemiBoldTextStyle.copyWith(
                        fontSize: SDP.sdp(headline5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ForgotViewModel(),
    );
  }

  showAlertDialog(BuildContext context, ForgotViewModel vm) {
    AlertDialog alert = AlertDialog(
      content: SizedBox(
        width: screenWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SfDateRangePicker(
              onSelectionChanged:
                  (DateRangePickerSelectionChangedArgs value) {},
              showActionButtons: true,
              confirmText: 'Konfirmasi',
              cancelText: 'Batal',
              onCancel: () {
                Navigator.of(context).pop();
              },
              onSubmit: (val) {
                setState(() {
                  vm.setBirthDateTo(val.toString());
                });
                Navigator.of(context).pop();
              },
              selectionColor: BaseColors.primary,
              todayHighlightColor: BaseColors.primary,
              rangeSelectionColor: BaseColors.primary.withOpacity(0.75),
              selectionMode: DateRangePickerSelectionMode.single,
              initialSelectedDate: DateTime.now(),
            ),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
