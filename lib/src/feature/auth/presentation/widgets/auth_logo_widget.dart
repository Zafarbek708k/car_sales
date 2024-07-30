import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/widget/new_text_widget.dart';

class AuthLogoWidget extends StatelessWidget {
  const AuthLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      child: Hero(
        tag: const Key('image'),
        child: Container(
            height: 70.h,
            width: 70.h,
            decoration: const ShapeDecoration(
              color: AppColors.primaryColor,
              shape: StarBorder(
                innerRadiusRatio: .9,
                pointRounding: .2,
                points: 8,
              ),
            ),
            child: const Center(child: ShimmerTextWidget("C", shimmerBaseColor: Colors.white,fontSize: 35,fontWeight: FontWeight.bold,))
        ),
      ),
    );
  }
}
