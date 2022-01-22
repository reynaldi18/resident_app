import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

import 'login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
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
                  SizedBox(
                    height: SDP.sdp(312.0),
                    width: SDP.sdp(312.0),
                    child: Stack(
                      children: [
                        Image.asset(bgLogin),
                        vm.isMessageFailed
                            ? Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: SDP.sdp(39.0),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: SDP.sdp(26.0),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      SDP.sdp(10.0),
                                    ),
                                    color: BaseColors.warning,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: SDP.sdp(14.0),
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.close_rounded,
                                              color: Colors.white,
                                              size: SDP.sdp(13.0),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              vm.messageFailed ?? '',
                                              style: whiteRegularTextStyle
                                                  .copyWith(
                                                fontSize: SDP.sdp(headline6),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  verticalSpace(SDP.sdp(12.0)),
                  Form(
                    key: vm.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KTextField(
                          isDense: true,
                          maxLines: 1,
                          borderRadius: SDP.sdp(smallRadius),
                          controller: vm.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          placeholder: Strings.hintEmail,
                          placeholderStyle: hintRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(hint),
                          ),
                          prefixIcon: SvgPicture.asset(
                            iconAccount,
                            width: SDP.sdp(24.0),
                          ),
                          validator: Validator.emailValidator,
                        ),
                        verticalSpace(SDP.sdp(10.0)),
                        KTextField(
                          isDense: true,
                          maxLines: 1,
                          borderRadius: SDP.sdp(smallRadius),
                          textInputAction: TextInputAction.go,
                          controller: vm.passwordController,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          placeholder: Strings.hintPassword,
                          onFieldSubmitted: (val) => vm.validate(),
                          placeholderStyle: hintRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(hint),
                          ),
                          prefixIcon: SvgPicture.asset(
                            iconPassword,
                            width: SDP.sdp(24.0),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                vm.obscure = !vm.obscure;
                              });
                            },
                            icon: Icon(
                              vm.obscure
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              size: SDP.sdp(16.0),
                              color:
                                  vm.obscure ? BaseColors.grey : Colors.black,
                            ),
                          ),
                          obscure: vm.obscure,
                          validator: Validator.passwordValidator,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(SDP.sdp(12.0)),
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
                          Strings.actionLogin,
                          style: whiteBoldTextStyle.copyWith(
                            fontSize: SDP.sdp(headline4),
                          ),
                        ),
                      ),
                      onPressed: () => vm.validate(),
                    ),
                  ),
                  verticalSpace(SDP.sdp(defaultPadding)),
                  InkWell(
                    onTap: () => vm.showRegis(),
                    child: Text(
                      Strings.labelRegister,
                      style: mainSemiBoldTextStyle.copyWith(
                        fontSize: SDP.sdp(headline5),
                      ),
                    ),
                  ),
                  verticalSpace(SDP.sdp(defaultPadding)),
                  InkWell(
                    onTap: () => vm.showForgot(),
                    child: Text(
                      Strings.labelForgotPassword,
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
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
