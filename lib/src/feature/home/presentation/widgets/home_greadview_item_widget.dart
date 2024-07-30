import 'package:flutter/material.dart';

class GridViewItemWidget extends StatelessWidget {
  const GridViewItemWidget({super.key, this.imageName, this.text, this.rsText});
  final String? imageName;
  final String? text;
  final String? rsText;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(imageName ??
                'assets/images/car_splash.png', // Change to your car image path
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  color: Colors.orange,
                  child: const Text(
                    '360 View',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text ?? "null name ", // Replace with dynamic car name
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                 Text(rsText??
                  'Rs. 5,47,823.73', // Replace with dynamic car price
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
