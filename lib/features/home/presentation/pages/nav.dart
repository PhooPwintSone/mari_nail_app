import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/features/history/presentation/pages/history_page.dart';
import 'package:mari_nail_app/features/home/presentation/pages/home_page.dart';
import 'package:mari_nail_app/features/profile/presentation/pages/profile_page.dart';
import 'package:mari_nail_app/features/services/presentation/pages/services_page.dart';

import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomePage(),
      ServicesPage(),
      HistoryPage(),
      ProfilePage(),
    ];
    return Scaffold(
      body: pages[currentindex],

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: const BoxDecoration(color: AppColors.backgroundBG),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            final isSelected = currentindex == index;

            final items = [
              (Icons.home, " Home "),
              (PhosphorIcons.notepadFill, "Services"),
              (Icons.history, " History "),
              (Icons.person, " Profile "),
            ];

            return GestureDetector(
              onTap: () {
                setState(() {
                  currentindex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: const Offset(-2, -1),
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      items[index].$1,
                      color: isSelected
                          ? AppColors.backgroundBG
                          : AppColors.primary,
                    ),

                    const SizedBox(height: 4),

                    AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        items[index].$2,
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.backgroundBG
                              : AppColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
