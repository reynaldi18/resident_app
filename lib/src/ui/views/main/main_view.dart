import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resident_app/src/helpers/scalable_dp_helper.dart';
import 'package:resident_app/src/ui/shared/colors.dart';
import 'package:resident_app/src/ui/shared/dimens.dart';
import 'package:resident_app/src/ui/shared/images.dart';
import 'package:resident_app/src/ui/shared/strings.dart';
import 'package:resident_app/src/ui/shared/styles.dart';
import 'package:resident_app/src/ui/shared/ui_helpers.dart';
import 'package:resident_app/src/ui/views/home/home_view.dart';
import 'package:resident_app/src/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: InkWell(
            onTap: () => vm.emergencyCall(),
            child: Container(
              width: SDP.sdp(112.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SDP.sdp(34.0)),
                gradient: const LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xFF4682FA),
                    Color(0xFF78A5FF),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(SDP.sdp(13.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.call,
                      size: SDP.sdp(14.0),
                      color: Colors.white,
                    ),
                    horizontalSpace(SDP.sdp(4.0)),
                    Text(
                      'Emergency',
                      style: whiteSemiBoldTextStyle.copyWith(
                        fontSize: SDP.sdp(headline5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: vm.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          child: getViewForIndex(vm.currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: vm.currentIndex,
          selectedItemColor: BaseColors.primary,
          unselectedItemColor: BaseColors.unselected,
          selectedFontSize: SDP.sdp(12.0),
          unselectedFontSize: SDP.sdp(12.0),
          selectedLabelStyle: primarySemiBoldTextStyle,
          unselectedLabelStyle: greySemiBoldTextStyle.copyWith(
            color: BaseColors.unselected,
          ),
          onTap: vm.setIndex,
          items: [
            BottomNavigationBarItem(
              label: Strings.labelHome,
              icon: Padding(
                padding: EdgeInsets.all(SDP.sdp(iconNavPadding)),
                child: SvgPicture.asset(
                  iconHome,
                  width: SDP.sdp(iconNav),
                  color: BaseColors.unselected,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.all(SDP.sdp(iconNavPadding)),
                child: SvgPicture.asset(
                  iconHome,
                  width: SDP.sdp(iconNav),
                  color: BaseColors.primary,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: Strings.labelProfile,
              icon: Padding(
                padding: EdgeInsets.all(SDP.sdp(iconNavPadding)),
                child: SvgPicture.asset(
                  iconProfile,
                  width: SDP.sdp(iconNav),
                  color: BaseColors.unselected,
                ),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.all(SDP.sdp(iconNavPadding)),
                child: SvgPicture.asset(
                  iconProfile,
                  width: SDP.sdp(iconNav),
                  color: BaseColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }
}
