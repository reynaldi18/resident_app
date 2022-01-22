import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resident_app/src/helpers/scalable_dp_helper.dart';
import 'package:resident_app/src/ui/shared/colors.dart';
import 'package:resident_app/src/ui/shared/dimens.dart';
import 'package:resident_app/src/ui/shared/images.dart';
import 'package:resident_app/src/ui/shared/styles.dart';
import 'package:resident_app/src/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.white,
        body: vm.isBusy
            ? loadingSpin
            : SingleChildScrollView(
                child: Column(
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
                                title: Text(
                                  vm.user?.cluster?.clusterName ?? '',
                                  style: blackRegularTextStyle.copyWith(
                                    fontSize: SDP.sdp(headline5),
                                  ),
                                ),
                                subtitle: Text(
                                  vm.user?.name ?? '',
                                  style: blackBoldTextStyle.copyWith(
                                    fontSize: SDP.sdp(headline3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SDP.sdp(smallPadding),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: screenWidth(context),
                                height: SDP.sdp(54.0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(SDP.sdp(10.0)),
                                  color: Colors.white,
                                  boxShadow: [shadow],
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: SDP.sdp(24.0),
                                  ),
                                  leading: SvgPicture.asset(
                                    iconHouse,
                                    width: SDP.sdp(24.0),
                                    color: BaseColors.primary,
                                  ),
                                  title: Text(
                                    'Laporkan Rumah Kosong',
                                    style: greySemiBoldTextStyle.copyWith(
                                      fontSize: SDP.sdp(headline5),
                                    ),
                                  ),
                                  trailing: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: SDP.sdp(12.0),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          vm.showReportEmptyHouse(),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            SDP.sdp(smallRadius),
                                          ),
                                        ),
                                        elevation: 0.0,
                                        primary: BaseColors.green,
                                      ),
                                      child: Text(
                                        'Lapor',
                                        style: whiteSemiBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(SDP.sdp(25.0)),
                    vm.emptyHouse == null
                        ? Container()
                        : Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: SDP.sdp(18.0)),
                            child: Container(
                              width: screenWidth(context),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(SDP.sdp(smallRadius)),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Color(0xFF815FE4),
                                    Color(0xFF5E72E4),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(SDP.sdp(14.0)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          EdgeInsets.all(SDP.sdp(0.0)),
                                      leading: SvgPicture.asset(
                                        iconOnBoarding3,
                                        width: SDP.sdp(24.0),
                                      ),
                                      title: Text(
                                        'Rumah Kosong',
                                        style: whiteSemiBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline5),
                                        ),
                                      ),
                                      trailing: SvgPicture.asset(
                                        iconTrash,
                                        width: SDP.sdp(20.0),
                                      ),
                                    ),
                                    verticalSpace(SDP.sdp(16.0)),
                                    Text(
                                      '${vm.emptyHouse?.from} - ${vm.emptyHouse?.until}',
                                      style: whiteSemiBoldTextStyle.copyWith(
                                        fontSize: SDP.sdp(12.0),
                                      ),
                                    ),
                                    verticalSpace(SDP.sdp(12.0)),
                                    Text(
                                      vm.emptyHouse?.desc ?? '-',
                                      style: whiteRegularTextStyle.copyWith(
                                          fontSize: SDP.sdp(12.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    verticalSpace(SDP.sdp(13.0)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SDP.sdp(18.0)),
                      child: Container(
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SDP.sdp(smallRadius)),
                          gradient: const LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color(0xFF1177EF),
                              Color(0xFF2AADFA),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(SDP.sdp(14.0)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    iconOnBoarding1,
                                    width: SDP.sdp(24.0),
                                  ),
                                  horizontalSpace(SDP.sdp(18.0)),
                                  Text(
                                    'Security Aktif',
                                    style: whiteSemiBoldTextStyle.copyWith(
                                      fontSize: SDP.sdp(headline5),
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpace(SDP.sdp(22.0)),
                              Container(
                                width: screenWidth(context),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      SDP.sdp(smallRadius)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: SDP.sdp(14.0),
                                  ),
                                  child: vm.securityActive?.isEmpty == true
                                      ? Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: SDP.sdp(14.0)),
                                          child: Center(
                                            child: Text(
                                              'Tidak ada security yang sedang aktif',
                                              style: blackSemiBoldTextStyle
                                                  .copyWith(
                                                fontSize: SDP.sdp(headline5),
                                              ),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount:
                                              vm.securityActive?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            var item =
                                                vm.securityActive?[index];
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom: SDP.sdp(space),
                                              ),
                                              child: Text(
                                                item?.user?.name ?? '',
                                                style:
                                                    blackSemiBoldTextStyle
                                                        .copyWith(
                                                  fontSize:
                                                      SDP.sdp(headline4),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
