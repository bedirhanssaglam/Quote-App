import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:bloc_pattern/core/components/appbar/appbar.dart';
import 'package:bloc_pattern/core/extensions/image_path.dart';
import 'package:bloc_pattern/core/components/button/custom_button.dart';
import 'package:bloc_pattern/core/constants/app_constants.dart';
import 'package:bloc_pattern/core/extensions/empty_padding.dart';
import 'package:bloc_pattern/core/init/navigation/app_router.dart';
import '../../core/constants/splash_data.dart';
import '../../core/init/provider/page_controller.dart';
import 'widgets/page_dots.dart';
import 'widgets/splash_header.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      backgroundColor: AppConstants.white,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('menu'.toSvg),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Consumer<CurrentPage>(
                  builder: (context, value, child) {
                    return PageView.builder(
                      controller: pageController,
                      onPageChanged: (value) {
                        context.read<CurrentPage>().setCurrentPage(value);
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) => SplashHeader(
                        image: splashData[index]["image"],
                        text: splashData[index]['text'],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Consumer<CurrentPage>(
                      builder: (context, value, child) {
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                splashData.length,
                                (index) {
                                  return buildPageDots(context, index);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    15.h.ph,
                    CustomButton(
                      height: 6.5.h,
                      width: 85.w,
                      buttonText: 'Continue',
                      textColor: AppConstants.white,
                      press: () {
                        context.router.navigate(const QuoteRoute());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
