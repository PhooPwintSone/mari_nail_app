import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/features/home/presentation/providers/home_provider.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/services/services_item.dart';
import 'package:provider/provider.dart';

class ServiesCategories extends StatelessWidget {
  const ServiesCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // first Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Services',
                style: TextStyles.heading2Medium.copyWith(
                  color: AppColors.primary,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<HomeProvider>().changeIndex(1);
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.secondary,
                    decorationThickness: 1,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
            ],
          ),

          //second row
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 30),

                    ServiceItem(
                      backgroundColor: const Color(0xffC2185B),
                      imagePath: 'assets/images/manicure edit.png',
                      title: 'Manicure',
                      onTap: () {
                        print('Manicure');
                      },
                    ),
                    const SizedBox(width: 30),
                    ServiceItem(
                      backgroundColor: const Color(0xff915F6D),
                      imagePath: 'assets/images/pedicure.png',
                      title: 'Pedicure',
                      onTap: () {
                        print('Pedicure');
                      },
                    ),
                    const SizedBox(width: 30),

                    ServiceItem(
                      backgroundColor: const Color(0xffB43910),
                      imagePath: 'assets/images/nail polish.png',
                      title: 'Nail Polish',
                      onTap: () {
                        print('Nail Polish');
                      },
                    ),
                    const SizedBox(width: 30),

                    ServiceItem(
                      backgroundColor: const Color(0xff8F3B3B),
                      imagePath: 'assets/images/nail extension.png',
                      title: 'Nail\nExtension',
                      onTap: () {
                        print('Nail Extension');
                      },
                    ),
                    const SizedBox(width: 30),

                    ServiceItem(
                      backgroundColor: const Color(0xffC2185B),
                      imagePath: 'assets/images/treatement remove.png',
                      title: 'Treatement\nRemove',
                      onTap: () {
                        print('Treatement Remove');
                      },
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
