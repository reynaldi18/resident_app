import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'colors.dart';

// TextStyle
TextStyle primaryRegularTextStyle = const TextStyle(
  fontFamily: 'NunitoSans',
  color: BaseColors.primary,
);

TextStyle primarySemiBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansSemiBold',
  color: BaseColors.primary,
);

TextStyle primaryBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansBold',
  color: BaseColors.primary,
);

TextStyle mainRegularTextStyle = const TextStyle(
  fontFamily: 'NunitoSans',
  color: BaseColors.main,
);

TextStyle mainSemiBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansSemiBold',
  color: BaseColors.main,
);

TextStyle mainBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansBold',
  color: BaseColors.main,
);

TextStyle blackRegularTextStyle = const TextStyle(
  fontFamily: 'NunitoSans',
  color: BaseColors.black,
);

TextStyle blackSemiBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansSemiBold',
  color: BaseColors.black,
);

TextStyle blackBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansBold',
  color: BaseColors.black,
);

TextStyle whiteRegularTextStyle = const TextStyle(
  fontFamily: 'NunitoSans',
  color: Colors.white,
);

TextStyle whiteSemiBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansSemiBold',
  color: Colors.white,
);

TextStyle whiteBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansBold',
  color: Colors.white,
);

TextStyle greyRegularTextStyle = const TextStyle(
  fontFamily: 'NunitoSans',
  color: BaseColors.grey,
);

TextStyle greySemiBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansSemiBold',
  color: BaseColors.grey,
);

TextStyle greyBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansBold',
  color: BaseColors.grey,
);

TextStyle hintRegularTextStyle = const TextStyle(
  fontFamily: 'NunitoSans',
  color: BaseColors.hint,
);

TextStyle hintSemiBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansSemiBold',
  color: BaseColors.hint,
);

TextStyle hintBoldTextStyle = const TextStyle(
  fontFamily: 'NunitoSansBold',
  color: BaseColors.grey,
);

BoxShadow shadow = const BoxShadow(
  color: Colors.black12,
  blurRadius: 3,
  offset: Offset(0, 5),
);

const loadingSpin = SpinKitFadingCircle(
  color: BaseColors.primary,
  size: 46.0,
);
