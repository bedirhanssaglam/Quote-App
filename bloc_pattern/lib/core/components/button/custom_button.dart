import 'package:bloc_pattern/core/components/text/custom_text.dart';
import 'package:bloc_pattern/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.press,
    required this.buttonText,
    this.height = 30,
    this.width = 70,
    this.borderRadius = 20,
    this.buttonColor = AppConstants.orange,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 15,
    this.textColor = AppConstants.white,
  }) : super(key: key);

  final VoidCallback press;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? buttonColor;
  final String buttonText;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
          color: buttonColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: Center(
          child: CustomText(
            buttonText,
            textStyle: TextStyle(
                color: textColor, fontWeight: fontWeight, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
