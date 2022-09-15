import 'dart:io';
import 'package:bloc_pattern/core/components/text/custom_text.dart';
import 'package:bloc_pattern/core/constants/app_constants.dart';
import 'package:bloc_pattern/core/extensions/empty_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc_pattern/core/components/appbar/appbar.dart';
import 'package:bloc_pattern/view/quotes/bloc/quote_bloc.dart';
import 'package:bloc_pattern/view/quotes/widgets/quote_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../core/init/provider/page_controller.dart';
import 'widgets/categories.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late QuoteBloc quoteBloc;

  @override
  void initState() {
    super.initState();
    quoteBloc = QuoteBloc();
    quoteBloc.add(FetchQuotes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.white,
      appBar: CustomAppBar(
        textTitle: 'Quotes',
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: Platform.isIOS
              ? const Icon(Icons.arrow_back_ios, color: AppConstants.black)
              : const Icon(Icons.arrow_back, color: AppConstants.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            3.h.ph,
            Consumer<CurrentPage>(
              builder: (context, value, child) => const Categorylist(),
            ),
            2.h.ph,
            CustomText(
              'We chose this for you;',
              textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            3.h.ph,
            BlocProvider<QuoteBloc>(
              create: (context) => quoteBloc,
              child: BlocBuilder<QuoteBloc, QuoteState>(
                builder: (context, state) {
                  if (state is QuoteLoading) {
                    return Platform.isIOS
                        ? const Center(child: CupertinoActivityIndicator())
                        : const Center(child: CircularProgressIndicator());
                  } else if (state is QuoteLoaded) {
                    return QuoteWidget(
                      quoteModel: state.quoteModel,
                    );
                  } else if (state is QuoteError) {
                    return Text(
                      state.message,
                      style: const TextStyle(
                          fontSize: 16, color: AppConstants.red),
                    );
                  } else {
                    return Platform.isIOS
                        ? const Center(child: CupertinoActivityIndicator())
                        : const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
