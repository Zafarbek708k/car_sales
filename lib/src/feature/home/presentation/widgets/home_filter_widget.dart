import 'package:flutter/material.dart';

import '../../../auth/presentation/widgets/custom_textfield_widget.dart';

class HomeFilterWidget extends StatelessWidget {
  const HomeFilterWidget({super.key, required this.controller, required this.onPressed});
  final TextEditingController controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: CustomTextFieldWidget(
            controller: controller,
            // controller: homeVmController.searchController,
            labelText: "Search for Honda Pilot 7-Passenger",
            icon: const Icon(Icons.search),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: onPressed,
            icon: const ImageIcon(
              AssetImage("assets/images/search_left_icon.png"),
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
