import 'package:bloc_pattern/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/text/custom_text.dart';
import '../../../core/init/provider/page_controller.dart';

class Categorylist extends StatefulWidget {
  const Categorylist({Key? key}) : super(key: key);

  @override
  _CategorylistState createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  int selectedCategory = 0;
  List<String> categories = [
    "Quotes",
    "Top Rated",
    "Most Commended",
    "Most Shared",
    "Writers",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: GestureDetector(
        onTap: () {
          selectedCategory = index;
          context.read<CurrentPage>().setCurrentCategory(selectedCategory);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomText(
              categories[index],
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: context.watch<CurrentPage>().currentCategory == index
                    ? AppConstants.black
                    : AppConstants.grey,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.watch<CurrentPage>().currentCategory == index
                    ? AppConstants.orange
                    : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
