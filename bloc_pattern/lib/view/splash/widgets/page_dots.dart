import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/init/provider/page_controller.dart';

AnimatedContainer buildPageDots(BuildContext context, int index) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: EdgeInsets.only(right: 1.w),
    height: 1.5.w,
    width: context.watch<CurrentPage>().currentPage == index ? 6.w : 2.w,
    decoration: BoxDecoration(
      color: context.watch<CurrentPage>().currentPage == index
          ? AppConstants.orange
          : AppConstants.grey,
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
