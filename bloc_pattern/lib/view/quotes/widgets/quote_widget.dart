import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:bloc_pattern/core/components/button/custom_button.dart';
import 'package:bloc_pattern/core/components/text/custom_text.dart';
import 'package:bloc_pattern/core/constants/app_constants.dart';
import 'package:bloc_pattern/core/extensions/empty_padding.dart';
import 'package:bloc_pattern/view/quotes/models/quote_model.dart';
import '../bloc/quote_bloc.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({Key? key, required this.quoteModel}) : super(key: key);

  final QuoteModel quoteModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 3,
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  AppConstants.green,
                  AppConstants.orange,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomText(
                    " '${quoteModel.content}' ",
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  3.h.ph,
                  CustomText(
                    " - ${quoteModel.author}",
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  5.h.ph,
                  CustomText(
                    'tags: ${quoteModel.tags}',
                    textStyle: TextStyle(fontSize: 11.sp),
                  ),
                  3.h.ph,
                  CustomButton(
                    press: () => context.read<QuoteBloc>().add(FetchQuotes()),
                    buttonText: 'Load a new quote',
                    width: 50.w,
                    height: 6.5.h,
                    buttonColor: AppConstants.darkBrown,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
