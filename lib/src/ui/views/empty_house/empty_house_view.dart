import 'package:flutter/material.dart';
import 'package:resident_app/src/constant/config.dart';
import 'package:resident_app/src/helpers/date_time_format.dart';
import 'package:resident_app/src/helpers/scalable_dp_helper.dart';
import 'package:resident_app/src/helpers/validator/validator.dart';
import 'package:resident_app/src/ui/shared/colors.dart';
import 'package:resident_app/src/ui/shared/dimens.dart';
import 'package:resident_app/src/ui/shared/strings.dart';
import 'package:resident_app/src/ui/shared/styles.dart';
import 'package:resident_app/src/ui/shared/ui_helpers.dart';
import 'package:resident_app/src/ui/widgets/chip.dart';
import 'package:resident_app/src/ui/widgets/textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'empty_house_viewmodel.dart';

class EmptyHouseView extends StatefulWidget {
  const EmptyHouseView({Key? key}) : super(key: key);

  @override
  State<EmptyHouseView> createState() => _EmptyHouseViewState();
}

class _EmptyHouseViewState extends State<EmptyHouseView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<EmptyHouseViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: BaseColors.background,
          toolbarHeight: SDP.sdp(82.0),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: BaseColors.black,
              size: SDP.sdp(18.0),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.labelReportEmptyHouse,
                style: blackBoldTextStyle.copyWith(
                  fontSize: SDP.sdp(headline3),
                ),
              ),
              verticalSpace(SDP.sdp(6.0)),
              Text(
                vm.dateNow,
                style: blackRegularTextStyle.copyWith(
                  fontSize: SDP.sdp(headline5),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(SDP.sdp(padding)),
          child: Column(
            children: [
              Form(
                key: vm.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDatePicker(context, vm, true);
                      },
                      child: Container(
                        width: screenWidth(context),
                        height: SDP.sdp(44.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: BaseColors.grey,
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
                            vm.fromDateController.text.isNotEmpty
                                ? Text(
                                    FormatDate().formatDate(
                                      vm.fromDateController.text,
                                      context: context,
                                      format: Config.dateFormat,
                                    ),
                                    style: hintRegularTextStyle.copyWith(
                                      fontSize: SDP.sdp(hint),
                                    ),
                                  )
                                : Text(
                                    'Dari tanggal',
                                    style: hintRegularTextStyle.copyWith(
                                      fontSize: SDP.sdp(hint),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(SDP.sdp(14.0)),
                    GestureDetector(
                      onTap: () {
                        showDatePicker(context, vm, false);
                      },
                      child: Container(
                        width: screenWidth(context),
                        height: SDP.sdp(44.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: BaseColors.grey,
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
                            vm.untilDateController.text.isNotEmpty
                                ? Text(
                                    FormatDate().formatDate(
                                      vm.untilDateController.text,
                                      context: context,
                                      format: Config.dateFormat,
                                    ),
                                    style: hintRegularTextStyle.copyWith(
                                      fontSize: SDP.sdp(hint),
                                    ),
                                  )
                                : Text(
                                    'Sampai tanggal',
                                    style: hintRegularTextStyle.copyWith(
                                      fontSize: SDP.sdp(hint),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(SDP.sdp(14.0)),
                    KTextField(
                      isDense: true,
                      maxLines: null,
                      minLines: 6,
                      borderRadius: SDP.sdp(smallRadius),
                      borderColor: BaseColors.grey,
                      controller: vm.noteDateController,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      backgroundColor: Colors.white.withOpacity(0.8),
                      placeholder: Strings.hintNote,
                      placeholderStyle: hintRegularTextStyle.copyWith(
                        fontSize: SDP.sdp(headline5),
                      ),
                      validator: Validator.requiredValidator,
                    ),
                  ],
                ),
              ),
              verticalSpace(SDP.sdp(bigPadding)),
              SizedBox(
                width: double.infinity,
                height: SDP.sdp(50.0),
                child: KChip(
                  isLoading: vm.isBusy,
                  isDisabled: vm.isBusy,
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
                      Strings.actionBook,
                      style: whiteBoldTextStyle.copyWith(
                        fontSize: SDP.sdp(headline4),
                      ),
                    ),
                  ),
                  onPressed: () => vm.validate(context),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => EmptyHouseViewModel(),
    );
  }

  showDatePicker(
    BuildContext context,
    EmptyHouseViewModel vm,
    bool isFrom,
  ) {
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
                  isFrom
                      ? vm.setFromDate(val.toString())
                      : vm.setUntilDate(val.toString());
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
