import 'package:bloc_pattern/core/extensions/image_path.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends AppBar {
  final String? textTitle;
  final Widget? leading;

  CustomAppBar({
    Key? key,
    this.textTitle,
    this.leading,
  }) : super(key: key);

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: widget.leading,
      title: Image.asset(
        'app_icon'.toPng,
        height: 27.h,
      ),
    );
  }
}
