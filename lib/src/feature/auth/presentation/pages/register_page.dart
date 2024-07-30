import 'package:car_sales/src/feature/auth/presentation/widgets/custom_textfield_widget.dart';
import 'package:car_sales/src/feature/auth/presentation/widgets/register_every_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../riverpod.dart';
import '../../../../core/routes/app_route_name.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/widget/new_text_widget.dart';
import '../../../../core/widget/text_widget.dart';
import '../widgets/auth_bottom_text_widget.dart';
import '../widgets/auth_logo_widget.dart';
import '../widgets/password_textfield_widget.dart';
import '../widgets/username_textfield_widget.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authVMController);
    final con = ref.read(authVMController.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25.h),
              const AuthLogoWidget(),

              SizedBox(height: 20.h),
              const ShimmerTextWidget("Sign Up", fontSize: 25, fontWeight: FontWeight.w600),
              const ShimmerTextWidget("Find your dream car!", fontSize: 20, fontWeight: FontWeight.w400),

              SizedBox(height: 25.h),

              /// UserName Text Field
              UsernameTextfieldWidget(
                controller: con.userNameController,
                labelText: "username",
                onChanged: (value) {},
                onSubmitted: (value) {},
                onEditingComplete: () {},
              ),
              SizedBox(height: 10.h),
              /// email
              CustomTextFieldWidget(controller: con.emailController, labelText: "Email address", icon: const Icon(Icons.mail_lock_outlined)),
              SizedBox(height: 10.h),
              /// phone Number
              CustomTextFieldWidget(controller: con.phoneNumberController, labelText: "Phone Number", icon: const Icon(Icons.phone)),
              SizedBox(height: 10.h),
              ///password
              PasswordTextfieldWidget(
                controller: con.passwordController,
                labelText: "password",
                obscureText: con.obscureText,
                onChanged: (value) {},
                onSubmitted: (value) {},
                onEditingComplete: () {},
              ),

              SizedBox(height: 40.h),

              MaterialButton(
                height: 50.h,
                minWidth: double.infinity,
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  context.go(AppRouteName.homePage);
                },
                child: const TextWidget(
                  "Register",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 20.h),

               const Row(
                 children: [
                   Expanded(child: Divider()),
                   TextWidget("  Or  ", textColor: Colors.black,),
                   Expanded(child: Divider()),
                 ],
               ),

              SizedBox(height: 10.h),

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   RegisterEveryButton(onPressed: (){}, imageName: "assets/images/facebook.svg"),
                   RegisterEveryButton(onPressed: (){}, imageName: "assets/images/instagram.svg"),
                   RegisterEveryButton(onPressed: (){}, imageName: "assets/images/youtube.svg"),

                 ],
               ),

              SizedBox(height: 10.h),

               AuthBottomTextWidget(text1: "Already have an account?", text2: " Sign in",  onPressed: () {
                context.go(AppRouteName.loginPage);
              }),

              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
