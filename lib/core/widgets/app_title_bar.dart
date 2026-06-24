import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/appBar_back_button.dart';

class AppTitleBar extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showBackButton;

  const AppTitleBar({
    super.key,
    required this.title,
    required this.child,
    required this.showBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Pink header
        Container(
          height: 150,
          width: double.infinity,
          color: const Color(0xFFF6B7C4),
          child: SafeArea(
            child: showBackButton
                ? Align(
                    alignment: Alignment.topLeft,
                    child: AppbarBackButton(
                      buttonAction: () => Navigator.pop(context),
                      buttonName: "Back",
                    ),
                  )
                : const SizedBox(),
          ),
        ),

        // White card overlaps header
        Expanded(
          child: Transform.translate(
            offset: const Offset(0, -40),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.backgroundBG,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyles.heading1Semi.copyWith(
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
