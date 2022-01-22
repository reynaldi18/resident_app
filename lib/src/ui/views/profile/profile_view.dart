import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resident_app/src/constant/config.dart';
import 'package:resident_app/src/helpers/scalable_dp_helper.dart';
import 'package:resident_app/src/helpers/validator/validator.dart';
import 'package:resident_app/src/ui/shared/colors.dart';
import 'package:resident_app/src/ui/shared/dimens.dart';
import 'package:resident_app/src/ui/shared/strings.dart';
import 'package:resident_app/src/ui/shared/styles.dart';
import 'package:resident_app/src/ui/shared/ui_helpers.dart';
import 'package:resident_app/src/ui/widgets/bottom_sheet/change_password_bottom_sheet.dart';
import 'package:resident_app/src/ui/widgets/chip.dart';
import 'package:resident_app/src/ui/widgets/close_button.dart';
import 'package:resident_app/src/ui/widgets/textfield.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight(context),
            child: vm.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SDP.sdp(159 + 27),
                        child: Stack(
                          children: [
                            Container(
                              height: SDP.sdp(159),
                              color: BaseColors.background,
                              child: Center(
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: SDP.sdp(defaultPadding),
                                  ),
                                  leading: InkWell(
                                    onTap: vm.isEdit
                                        ? () {
                                            showDialogSelectSource(context, (
                                              double maxWidth,
                                              double maxHeight,
                                              int quality,
                                              ImageSource source,
                                            ) async {
                                              onImageButtonPressed(
                                                context,
                                                source,
                                                vm,
                                              );
                                            });
                                          }
                                        : () {},
                                    child: ClipOval(
                                      child: vm.imagePicked != null
                                          ? Image.file(
                                              vm.imagePicked!,
                                              width: SDP.sdp(40.0),
                                              height: SDP.sdp(40.0),
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              Config.baseUrl +
                                                  (vm.user?.imageLink ?? ''),
                                              width: SDP.sdp(40.0),
                                              height: SDP.sdp(40.0),
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  title: Text(
                                    vm.user?.name ?? '',
                                    style: blackBoldTextStyle.copyWith(
                                      fontSize: SDP.sdp(headline3),
                                    ),
                                  ),
                                  trailing: vm.isEdit
                                      ? TextButton(
                                          onPressed: () => vm.validate(),
                                          child: Text(
                                            Strings.labelSave,
                                            style: primaryBoldTextStyle.copyWith(
                                              fontSize: SDP.sdp(headline4),
                                            ),
                                          ),
                                        )
                                      : TextButton(
                                          onPressed: () => setState(() {
                                            vm.isEdit = true;
                                          }),
                                          child: Text(
                                            Strings.labelEdit,
                                            style: primaryBoldTextStyle.copyWith(
                                              fontSize: SDP.sdp(headline4),
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: screenWidth(context),
                                height: SDP.sdp(54.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(SDP.sdp(34.0)),
                                    topRight: Radius.circular(SDP.sdp(34.0)),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: vm.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SDP.sdp(padding),
                              ),
                              child: Text(
                                "Perumahan".toUpperCase(),
                                style: greyBoldTextStyle.copyWith(
                                  fontSize: SDP.sdp(headline7),
                                ),
                              ),
                            ),
                            verticalSpace(SDP.sdp(4.0)),
                            KTextField(
                              isDense: true,
                              maxLines: 1,
                              enabled: false,
                              borderRadius: SDP.sdp(0.0),
                              borderColor: BaseColors.divider,
                              controller: vm.clientController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              backgroundColor: Colors.white.withOpacity(0.8),
                              placeholderStyle: hintRegularTextStyle.copyWith(
                                fontSize: SDP.sdp(hint),
                              ),
                            ),
                            verticalSpace(SDP.sdp(bigSpace)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SDP.sdp(padding),
                              ),
                              child: Text(
                                "Cluster".toUpperCase(),
                                style: greyBoldTextStyle.copyWith(
                                  fontSize: SDP.sdp(headline7),
                                ),
                              ),
                            ),
                            verticalSpace(SDP.sdp(4.0)),
                            KTextField(
                              isDense: true,
                              maxLines: 1,
                              enabled: false,
                              borderRadius: SDP.sdp(0.0),
                              borderColor: BaseColors.divider,
                              controller: vm.clusterController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              backgroundColor: Colors.white.withOpacity(0.8),
                              placeholderStyle: hintRegularTextStyle.copyWith(
                                fontSize: SDP.sdp(hint),
                              ),
                            ),
                            verticalSpace(SDP.sdp(bigSpace)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SDP.sdp(padding),
                              ),
                              child: Text(
                                Strings.labelPhone.toUpperCase(),
                                style: greyBoldTextStyle.copyWith(
                                  fontSize: SDP.sdp(headline7),
                                ),
                              ),
                            ),
                            verticalSpace(SDP.sdp(4.0)),
                            KTextField(
                              isDense: true,
                              maxLines: 1,
                              enabled: vm.isEdit,
                              borderRadius: SDP.sdp(0.0),
                              borderColor: BaseColors.divider,
                              controller: vm.phoneController,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              backgroundColor: Colors.white.withOpacity(0.8),
                              placeholder: Strings.hintPhone,
                              placeholderStyle: hintRegularTextStyle.copyWith(
                                fontSize: SDP.sdp(hint),
                              ),
                              validator: Validator.phoneValidation,
                            ),
                            verticalSpace(SDP.sdp(bigSpace)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SDP.sdp(padding),
                              ),
                              child: Text(
                                Strings.labelEmail.toUpperCase(),
                                style: greyBoldTextStyle.copyWith(
                                  fontSize: SDP.sdp(headline7),
                                ),
                              ),
                            ),
                            verticalSpace(SDP.sdp(4.0)),
                            KTextField(
                              isDense: true,
                              maxLines: 1,
                              enabled: vm.isEdit,
                              borderRadius: SDP.sdp(0.0),
                              borderColor: BaseColors.divider,
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
                          ],
                        ),
                      ),
                      verticalSpace(SDP.sdp(64.0)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SDP.sdp(padding),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: SDP.sdp(50.0),
                              child: KChip(
                                padding: EdgeInsets.symmetric(
                                  vertical: SDP.sdp(14.0),
                                ),
                                borderRadius: BorderRadius.circular(
                                  SDP.sdp(smallRadius),
                                ),
                                border: Border.all(
                                  color: BaseColors.primary,
                                  width: SDP.sdp(1),
                                ),
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    Strings.actionChangePassword,
                                    style: primaryBoldTextStyle.copyWith(
                                      fontSize: SDP.sdp(headline4),
                                    ),
                                  ),
                                ),
                                onPressed: () => showChangePassword(context, vm),
                              ),
                            ),
                            verticalSpace(SDP.sdp(14.0)),
                            SizedBox(
                              width: double.infinity,
                              height: SDP.sdp(50.0),
                              child: KChip(
                                isLoading: vm.isBusy,
                                isDisabled: vm.isEdit,
                                padding: EdgeInsets.symmetric(
                                  vertical: SDP.sdp(14.0),
                                ),
                                loadingColor: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  SDP.sdp(smallRadius),
                                ),
                                color: BaseColors.divider,
                                child: Center(
                                  child: Text(
                                    Strings.actionLogout,
                                    style: whiteBoldTextStyle.copyWith(
                                      fontSize: SDP.sdp(headline4),
                                      color: BaseColors.greyDark,
                                    ),
                                  ),
                                ),
                                onPressed: () => vm.showLogoutConfirmDialog(
                                  title: Strings.messageLogout,
                                  positiveLabel: Strings.labelYes,
                                  negativeLabel: Strings.labelNo,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }

  showDialogSelectSource(
    BuildContext context,
    OnPickImageCallback onPick,
  ) {
    double? width;
    double? height;
    int? quality;
    ImageSource? source = ImageSource.camera;

    AlertDialog alert = AlertDialog(
      contentPadding: EdgeInsets.symmetric(
        horizontal: SDP.sdp(smallPadding),
        vertical: SDP.sdp(space),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SDP.sdp(16.0)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pilih Sumber',
                style: primaryBoldTextStyle.copyWith(fontSize: headline4),
              ),
              const CloseActionButton(),
            ],
          ),
          const Divider(color: BaseColors.primary),
          ListTile(
            contentPadding: const EdgeInsets.all(0.0),
            onTap: () {
              source = ImageSource.camera;
              onPick(
                width ?? SDP.sdp(150.0),
                height ?? SDP.sdp(150.0),
                quality ?? 80,
                source ?? ImageSource.camera,
              );
              Navigator.of(context).pop();
            },
            // leading: SvgPicture.asset(iconCamera),
            title: Text(
              'Pilih dari Kamera',
              style: primaryRegularTextStyle.copyWith(fontSize: headline4),
            ),
          ),
          const Divider(color: BaseColors.divider),
          ListTile(
            contentPadding: const EdgeInsets.all(0.0),
            onTap: () {
              source = ImageSource.gallery;
              onPick(
                width ?? SDP.sdp(150.0),
                height ?? SDP.sdp(150.0),
                quality ?? 80,
                source ?? ImageSource.gallery,
              );
              Navigator.of(context).pop();
            },
            // leading: SvgPicture.asset(iconAlbum),
            title: Text(
              'Pilih dari Galeri',
              style: primaryRegularTextStyle.copyWith(fontSize: headline4),
            ),
          ),
        ],
      ),
    );

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void onImageButtonPressed(
    BuildContext context,
    ImageSource source,
    ProfileViewModel vm,
  ) async {
    try {
      final XFile? pickedFile = await vm.picker.pickImage(source: source);
      final File toFile = File(pickedFile?.path ?? '');
      setState(() {
        vm.imagePicked = toFile;
        imageCache?.clear();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            Strings.messageFailureGetImage,
          ),
        ),
      );
    }
  }

  void showChangePassword(
    BuildContext context,
    ProfileViewModel vm,
  ) {
    showStickyFlexibleBottomSheet<void>(
      minHeight: 0,
      initHeight: 0.7,
      maxHeight: 0.9,
      headerHeight: 26.0,
      context: context,
      isDismissible: false,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      anchors: [.7],
      headerBuilder: (BuildContext context, double offset) {
        return Container();
      },
      bodyBuilder: (BuildContext context, double bottomSheetOffset) {
        return SliverChildListDelegate([ChangePasswordBottomSheet(vm: vm)]);
      },
    );
  }
}

typedef OnPickImageCallback = void Function(
  double maxWidth,
  double maxHeight,
  int quality,
  ImageSource source,
);
