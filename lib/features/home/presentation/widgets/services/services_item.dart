import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const ServiceItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(imagePath),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
