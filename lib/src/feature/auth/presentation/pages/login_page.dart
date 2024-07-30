import 'package:car_sales/src/core/routes/app_route_name.dart';
import 'package:car_sales/src/core/style/colors.dart';
import 'package:car_sales/src/core/widget/text_widget.dart';
import 'package:car_sales/src/feature/auth/presentation/widgets/auth_bottom_text_widget.dart';
import 'package:car_sales/src/feature/auth/presentation/widgets/auth_logo_widget.dart';
import 'package:car_sales/src/feature/auth/presentation/widgets/password_textfield_widget.dart';
import 'package:car_sales/src/feature/auth/presentation/widgets/username_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../riverpod.dart';
import '../../../../core/widget/new_text_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authVMController);
    final con = ref.read(authVMController.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AuthLogoWidget(),
              SizedBox(height: 70.h),
              const ShimmerTextWidget("Login", fontSize: 25, fontWeight: FontWeight.w600),
              const ShimmerTextWidget("Welcome to CarStore", fontSize: 20, fontWeight: FontWeight.w400),

              SizedBox(height: 50.h),

              /// UserName Text Field
              UsernameTextfieldWidget(
                controller: con.userNameController,
                labelText: "username",
                onChanged: (value) {},
                onSubmitted: (value) {},
                onEditingComplete: () {},
              ),

              SizedBox(height: 20.h),

              PasswordTextfieldWidget(
                controller: con.passwordController,
                labelText: "password",
                obscureText: con.obscureText,
                onChanged: (value) {},
                onSubmitted: (value) {},
                onEditingComplete: () {},
              ),

              SizedBox(height: 20.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: const ShimmerTextWidget(
                      "Forget Password?",
                      shimmerBaseColor: CupertinoColors.activeGreen,
                      fontWeight: FontWeight.w400,
                    ),
                    onTap: () {},
                  )
                ],
              ),

              SizedBox(height: 20.h),

              MaterialButton(
                height: 50.h,
                minWidth: double.infinity,
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  context.go(AppRouteName.homePage);
                },
                child: const TextWidget(
                  "Login",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 50.h),

              AuthBottomTextWidget(
                text1: "Don’t have an account?",
                text2: " Sign Up",
                onPressed: () {
                  context.go("${AppRouteName.loginPage}/${AppRouteName.registerPage}");
                },
              ),

              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
