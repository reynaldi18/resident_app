import 'package:flutter/material.dart';
import 'package:resident_app/src/helpers/scalable_dp_helper.dart';
import 'package:resident_app/src/models/client.dart';
import 'package:resident_app/src/models/cluster.dart';
import 'package:resident_app/src/ui/shared/colors.dart';
import 'package:resident_app/src/ui/shared/dimens.dart';
import 'package:resident_app/src/ui/shared/images.dart';
import 'package:resident_app/src/ui/shared/strings.dart';
import 'package:resident_app/src/ui/shared/styles.dart';
import 'package:resident_app/src/ui/shared/ui_helpers.dart';
import 'package:resident_app/src/ui/widgets/chip.dart';
import 'package:stacked/stacked.dart';

import 'regis_viewmodel.dart';

class RegisView extends StatefulWidget {
  const RegisView({Key? key}) : super(key: key);

  @override
  State<RegisView> createState() => _RegisViewState();
}

class _RegisViewState extends State<RegisView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<RegisViewModel>.reactive(
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
                    child: Image.asset(bgLogin),
                  ),
                  verticalSpace(SDP.sdp(12.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(SDP.sdp(smallRadius)),
                            color: Colors.white),
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SDP.sdp(14.0),
                            ),
                            child: DropdownButton<Client>(
                              value: vm.clientValue,
                              style: primaryBoldTextStyle.copyWith(
                                fontSize: SDP.sdp(headline4),
                                color: BaseColors.main,
                              ),
                              items: vm.client?.map<DropdownMenuItem<Client>>(
                                  (Client value) {
                                return DropdownMenuItem<Client>(
                                  alignment: Alignment.center,
                                  value: value,
                                  child: Text(
                                    value.clientName ?? '',
                                    style: blackRegularTextStyle.copyWith(
                                        fontSize: SDP.sdp(headline5)),
                                  ),
                                );
                              }).toList(),
                              hint: Text(
                                vm.clientName == null
                                    ? 'Pilih Perumahan'
                                    : vm.clientName ?? '',
                                style: greyRegularTextStyle.copyWith(
                                  fontSize: SDP.sdp(headline5),
                                  color: vm.clientName == null
                                      ? BaseColors.borderUpload
                                      : Colors.black,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  vm.clientIdValue = value?.clientId;
                                  vm.clientName = value?.clientName;
                                  vm.cluster = value?.clusters;
                                  vm.clusterIdValue = null;
                                  vm.clusterValue = null;
                                  vm.clusterName = null;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(SDP.sdp(10.0)),
                      Container(
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(SDP.sdp(smallRadius)),
                            color: Colors.white),
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SDP.sdp(14.0),
                            ),
                            child: DropdownButton<Cluster>(
                              value: vm.clusterValue,
                              style: primaryBoldTextStyle.copyWith(
                                fontSize: SDP.sdp(headline4),
                                color: BaseColors.main,
                              ),
                              items: vm.cluster?.map<DropdownMenuItem<Cluster>>(
                                  (Cluster value) {
                                return DropdownMenuItem<Cluster>(
                                  alignment: Alignment.center,
                                  value: value,
                                  child: Text(
                                    value.clusterName ?? '',
                                    style: blackRegularTextStyle.copyWith(
                                        fontSize: SDP.sdp(headline5)),
                                  ),
                                );
                              }).toList(),
                              hint: Text(
                                vm.clusterName == null
                                    ? 'Cluster'
                                    : vm.clusterName ?? '',
                                style: greyRegularTextStyle.copyWith(
                                  fontSize: SDP.sdp(headline5),
                                  color: vm.clusterName == null
                                      ? BaseColors.borderUpload
                                      : Colors.black,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  vm.clusterIdValue = value?.clusterId;
                                  vm.clusterName = value?.clusterName;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          Strings.actionNext,
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
      viewModelBuilder: () => RegisViewModel(),
    );
  }
}
