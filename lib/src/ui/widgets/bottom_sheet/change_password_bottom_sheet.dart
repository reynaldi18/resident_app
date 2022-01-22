import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:resident_app/src/ui/views/profile/profile_viewmodel.dart';

import '../chip.dart';
import '../textfield.dart';

class ChangePasswordBottomSheet extends StatefulWidget {
  final ProfileViewModel vm;

  const ChangePasswordBottomSheet({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  State<ChangePasswordBottomSheet> createState() =>
      _ChangePasswordBottomSheetState();
}

class _ChangePasswordBottomSheetState extends State<ChangePasswordBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
          width: screenWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.labelChangePassword,
                style: blackBoldTextStyle.copyWith(
                  fontSize: SDP.sdp(headline3),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  widget.vm.oldPasswordController.clear();
                  widget.vm.newPasswordController.clear();
                  widget.vm.reNewPasswordController.clear();
                },
                child: Text(
                  Strings.labelClose,
                  style: primaryBoldTextStyle.copyWith(
                    fontSize: SDP.sdp(headline4),
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(SDP.sdp(28.0)),
        Form(
          key: widget.vm.formChangePasswordKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                child: KTextField(
                  isDense: true,
                  maxLines: 1,
                  borderRadius: SDP.sdp(smallRadius),
                  textInputAction: TextInputAction.next,
                  controller: widget.vm.oldPasswordController,
                  backgroundColor: Colors.white.withOpacity(0.8),
                  placeholder: Strings.hintOldPassword,
                  onFieldSubmitted: (val) => widget.vm.validate(),
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
                        widget.vm.oldObscure = !widget.vm.oldObscure;
                      });
                    },
                    icon: Icon(
                      widget.vm.oldObscure
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      size: SDP.sdp(16.0),
                      color:
                          widget.vm.oldObscure ? BaseColors.grey : Colors.black,
                    ),
                  ),
                  obscure: widget.vm.oldObscure,
                  validator: Validator.passwordValidator,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: SDP.sdp(26.0)),
                child: Divider(
                  color: BaseColors.divider,
                  height: SDP.sdp(1.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                child: KTextField(
                  isDense: true,
                  maxLines: 1,
                  borderRadius: SDP.sdp(smallRadius),
                  textInputAction: TextInputAction.next,
                  controller: widget.vm.newPasswordController,
                  backgroundColor: Colors.white.withOpacity(0.8),
                  placeholder: Strings.hintNewPassword,
                  onFieldSubmitted: (val) => widget.vm.validate(),
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
                        widget.vm.newObscure = !widget.vm.newObscure;
                      });
                    },
                    icon: Icon(
                      widget.vm.newObscure
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      size: SDP.sdp(16.0),
                      color:
                          widget.vm.newObscure ? BaseColors.grey : Colors.black,
                    ),
                  ),
                  obscure: widget.vm.newObscure,
                  validator: Validator.passwordValidator,
                ),
              ),
              verticalSpace(SDP.sdp(14.0)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
                child: KTextField(
                  isDense: true,
                  maxLines: 1,
                  borderRadius: SDP.sdp(smallRadius),
                  textInputAction: TextInputAction.done,
                  controller: widget.vm.reNewPasswordController,
                  backgroundColor: Colors.white.withOpacity(0.8),
                  placeholder: Strings.hintReNewPassword,
                  onFieldSubmitted: (val) => widget.vm.validate(),
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
                        widget.vm.reNewObscure = !widget.vm.reNewObscure;
                      });
                    },
                    icon: Icon(
                      widget.vm.reNewObscure
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      size: SDP.sdp(16.0),
                      color: widget.vm.reNewObscure
                          ? BaseColors.grey
                          : Colors.black,
                    ),
                  ),
                  obscure: widget.vm.reNewObscure,
                  validator: MultiValidator(
                    [
                      Validator.requiredValidator,
                      ConfirmationPassword(
                        errorText: 'Password tidak cocok',
                        password: widget.vm.newPasswordController.text,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(SDP.sdp(smallPadding)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SDP.sdp(padding)),
          child: SizedBox(
            width: double.infinity,
            height: SDP.sdp(50.0),
            child: KChip(
              isLoading: widget.vm.isChangePassword,
              isDisabled: widget.vm.isChangePassword,
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
                  Strings.actionChangePassword,
                  style: whiteBoldTextStyle.copyWith(
                    fontSize: SDP.sdp(headline4),
                  ),
                ),
              ),
              onPressed: () => widget.vm.validateChangePassword(context),
            ),
          ),
        ),
      ],
    );
  }
}
