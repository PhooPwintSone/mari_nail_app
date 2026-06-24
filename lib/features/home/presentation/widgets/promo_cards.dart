import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/small_button.dart';
import 'package:mari_nail_app/features/home/data/promotion/promotion_data.dart';

class PromoCards extends StatefulWidget {
  const PromoCards({super.key});

  @override
  State<PromoCards> createState() => _PromoCardsState();
}

class _PromoCardsState extends State<PromoCards> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3.5,
            child: PageView.builder(
              controller: pageController,
              itemCount: promotions.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final promo = promotions[index];

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [AppColors.primary, const Color(0xff956970)],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                promo.title,
                                style: TextStyles.heading1Semi.copyWith(
                                  color: AppColors.backgroundBG,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                promo.subtitle,
                                style: TextStyles.body1Medium.copyWith(
                                  color: const Color(0xffC2185B),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(promo.date),
                              const SizedBox(height: 8),
                              SmallButton(
                                label: 'View now',
                                button2Action: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          child: Image.asset(
                            promo.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          DotsIndicator(
            dotsCount: promotions.length,
            position: currentPage.toDouble(),
            onTap: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },

            decorator: DotsDecorator(
              activeColor: AppColors.primary,
              color: Colors.grey.shade300,
              size: const Size.square(8),
              activeSize: const Size(18, 8),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
