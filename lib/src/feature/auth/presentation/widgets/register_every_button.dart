import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterEveryButton extends StatelessWidget {
  const RegisterEveryButton({super.key, required this.onPressed, required this.imageName});
  final VoidCallback onPressed;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
        onPressed: onPressed,
      child: SvgPicture.asset(imageName),
    );
  }
}
