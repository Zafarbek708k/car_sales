import 'package:car_sales/src/core/style/colors.dart';
import 'package:car_sales/src/core/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedOnContainerWidget extends StatelessWidget {
  const FeaturedOnContainerWidget({super.key,});


  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final ItemModel oneItem = items[index];
        return Stack(
          children: [
            Container(
              width: 340.h, // Set the desired width
              height: 200, // Set the desired height
              decoration: BoxDecoration(
                color: AppColors.primaryColor, // Set the background color
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(oneItem.image),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(8),
              child: TextWidget(
                oneItem.text,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            // The "Featured" badge positioned at the top left
            Positioned(
              top: 10,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Featured',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ItemModel {
  final String image;
  final String text;

  ItemModel(this.image, this.text);
}

List<ItemModel> items = [
  ItemModel("assets/images/bugatti.png", "Bugatti"),
  ItemModel("assets/images/hyundai.png", "Hyundai"),
  ItemModel("assets/images/mers.png", "Mers"),
  ItemModel("assets/images/rolls_royce.png", "Rolls Royce"),
];