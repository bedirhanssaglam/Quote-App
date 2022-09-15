import 'package:bloc_pattern/core/extensions/empty_padding.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app_constants.dart';

class SplashHeader extends StatelessWidget {
  const SplashHeader({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);

  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          image!,
          height: 40.h,
          width: 70.w,
        ),
        3.h.ph,
        CustomText(
          text!,
          textAlign: TextAlign.center,
          textStyle: TextStyle(color: AppConstants.black, fontSize: 13.sp),
        ),
      ],
    );
  }
}
