import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:resident_app/src/helpers/scalable_dp_helper.dart';
import 'package:resident_app/src/helpers/validator/custom.dart';
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

import 'regis_data_viewmodel.dart';

class RegisDataView extends StatefulWidget {
  final String clientId;
  final String clusterId;

  const RegisDataView({
    Key? key,
    required this.clientId,
    required this.clusterId,
  }) : super(key: key);

  @override
  State<RegisDataView> createState() => _RegisDataViewState();
}

class _RegisDataViewState extends State<RegisDataView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<RegisDataViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SDP.sdp(defaultPadding),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpace(SDP.sdp(padding)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => vm.back(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: SDP.sdp(18.0),
                          color: BaseColors.black,
                        ),
                      ),
                      Text(
                        Strings.labelBack,
                        style: blackRegularTextStyle.copyWith(
                          fontSize: SDP.sdp(headline3),
                        ),
                      )
                    ],
                  ),
                  verticalSpace(SDP.sdp(74.0)),
                  SizedBox(
                    height: SDP.sdp(67.0),
                    child: Image.asset(logoText),
                  ),
                  verticalSpace(SDP.sdp(80.0)),
                  Form(
                    key: vm.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        KTextField(
                          isDense: true,
                          borderRadius: SDP.sdp(smallRadius),
                          controller: vm.nameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          placeholder: Strings.hintFullName,
                          placeholderStyle: hintRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(hint),
                          ),
                          validator: Validator.requiredValidator,
                        ),
                        verticalSpace(SDP.sdp(10.0)),
                        KTextField(
                          isDense: true,
                          borderRadius: SDP.sdp(smallRadius),
                          controller: vm.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          placeholder: Strings.hintEmail,
                          placeholderStyle: hintRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(hint),
                          ),
                          validator: Validator.emailValidator,
                        ),
                        verticalSpace(SDP.sdp(10.0)),
                        KTextField(
                          isDense: true,
                          borderRadius: SDP.sdp(smallRadius),
                          controller: vm.phoneController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          placeholder: Strings.hintPhone,
                          placeholderStyle: hintRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(hint),
                          ),
                          validator: Validator.phoneValidation,
                        ),
                        verticalSpace(SDP.sdp(10.0)),
                        KTextField(
                          isDense: true,
                          borderRadius: SDP.sdp(smallRadius),
                          controller: vm.addressController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          placeholder: Strings.hintAddress,
                          placeholderStyle: hintRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(hint),
                          ),
                          validator: Validator.requiredValidator,
                        ),
                        verticalSpace(SDP.sdp(10.0)),
                        KTextField(
                          isDense: true,
                          maxLines: 1,
                          borderRadius: SDP.sdp(smallRadius),
                          textInputAction: TextInputAction.next,
                          controller: vm.passwordController,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          placeholder: Strings.hintPassword,
                          onFieldSubmitted: (val) => vm.validate(),
                          placeholderStyle: hintRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(hint),
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
                        verticalSpace(SDP.sdp(10.0)),
                        KTextField(
                          isDense: true,
                          maxLines: 1,
                          borderRadius: SDP.sdp(smallRadius),
                          textInputAction: TextInputAction.done,
                          controller: vm.rePasswordController,
                          backgroundColor: Colors.white.withOpacity(0.8),
                          placeholder: Strings.hintRePassword,
                          onFieldSubmitted: (val) => vm.validate(),
                          placeholderStyle: hintRegularTextStyle.copyWith(
                            fontSize: SDP.sdp(hint),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                vm.reObscure = !vm.reObscure;
                              });
                            },
                            icon: Icon(
                              vm.reObscure
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              size: SDP.sdp(16.0),
                              color:
                                  vm.reObscure ? BaseColors.grey : Colors.black,
                            ),
                          ),
                          obscure: vm.reObscure,
                          validator: MultiValidator(
                            [
                              Validator.requiredValidator,
                              ConfirmationPassword(
                                errorText: 'Password tidak cocok',
                                password: vm.passwordController.text,
                              )
                            ],
                          ),
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
                          Strings.actionRegister,
                          style: whiteBoldTextStyle.copyWith(
                            fontSize: SDP.sdp(headline4),
                          ),
                        ),
                      ),
                      onPressed: () => vm.validate(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => RegisDataViewModel(
        clientId: widget.clientId,
        clusterId: widget.clusterId,
      ),
    );
  }
}
