import 'package:car_sales/src/core/style/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/text_widget.dart';

class AuthBottomTextWidget extends StatelessWidget {
  const AuthBottomTextWidget({super.key, this.onPressed, required this.text1, required this.text2});

  final VoidCallback? onPressed;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: TextWidget(
                  text1,
                  textColor: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              WidgetSpan(
                child: TextWidget(
                  text2,
                  textColor: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}